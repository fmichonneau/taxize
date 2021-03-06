#' Get the NameID codes from Tropicos for taxonomic names.
#' 
#' @import plyr RCurl
#' @param sciname (character) One or more scientific name's as a vector or list.
#' @param ask logical; should get_tpsid be run in interactive mode? 
#' If TRUE and more than one ID is found for the species, the user is asked for 
#' input. If FALSE NA is returned for multiple matches.
#' @param verbose logical; If TRUE the actual taxon queried is printed on the console.
#' @param key Your API key; loads from .Rprofile.
#' @param ... Other arguments passed to \code{\link[taxize]{tp_search}}.
#' 
#' @return A vector of unique identifiers. If a taxon is not found NA. 
#' If more than one ID is found the function asks for user input. 
#' 
#' @seealso \code{\link[taxize]{get_tsn}}, \code{\link[taxize]{get_uid}}
#' 
#' @export
#' @author Scott Chamberlain, \email{myrmecocystus@@gmail.com}
#' 
#' @examples \dontrun{
#' get_tpsid(sciname='Poa annua')
#' get_tpsid(sciname='Pinus contorta')
#' 
#' get_tpsid(c("Poa annua", "Pinus contorta"))
#' 
#' # When not found, NA given (howdy is not a species name, and Chrinomus is a fly)
#' get_tpsid("howdy")
#' get_tpsid(c("Chironomus riparius", "howdy"))
#' 
#' # pass to classification function to get a taxonomic hierarchy
#' classification(get_tpsid(sciname='Poa annua'))
#' 
#' # factor class names are converted to character internally
#' spnames <- as.factor(c("Poa annua", "Pinus contorta"))
#' class(spnames)
#' get_tpsid(spnames)
#' 
#' # pass in a list, works fine
#' get_tpsid(list("Poa annua", "Pinus contorta"))
#' }

get_tpsid <- function(sciname, ask = TRUE, verbose = TRUE, key = NULL, ...){
  fun <- function(sciname, ask, verbose) {
    mssg(verbose, "\nRetrieving data for taxon '", sciname, "'\n")
    tmp <- tp_search(name = sciname, key=key, ...)
    
    if(names(tmp)[[1]] == 'error'){
      mssg(verbose, "Not found. Consider checking the spelling or alternate classification")
      id <- NA
    } else
    {  
      df <- tmp[,c('nameid','scientificname','rankabbreviation','nomenclaturestatusname')]
      names(df) <- c('tpsid','name','rank','status')
      id <- df$tpsid
    }
    
    # not found on tropicos
    if(length(id) == 0){
      mssg(verbose, "Not found. Consider checking the spelling or alternate classification")
      id <- NA
    }
    # more than one found on tropicos -> user input
    if(length(id) > 1){
      if(ask){
        rownames(df) <- 1:nrow(df)
        # prompt
        message("\n\n")
        message("\nMore than one tpsid found for taxon '", sciname, "'!\n
          Enter rownumber of taxon (other inputs will return 'NA'):\n")      
        print(df)
        take <- scan(n = 1, quiet = TRUE, what = 'raw')
        
        if(length(take) == 0)
          take <- 'notake'
        if(take %in% seq_len(nrow(df))){
          take <- as.numeric(take)
          message("Input accepted, took tpsid '", as.character(df$tpsid[take]), "'.\n")
          id <- as.character(df$tpsid[take])
        } else {
          id <- NA
          mssg(verbose, "\nReturned 'NA'!\n\n")
        }
      } else{
        id <- NA
      }
    }  
    return(id)
  }
  sciname <- as.character(sciname)
  out <- sapply(sciname, fun, ask, verbose, USE.NAMES = FALSE)
  class(out) <- "tpsid"
  if(!is.na(out[1])){
    urlmake <- na.omit(out)
    attr(out, 'uri') <- 
      sprintf('http://tropicos.org/Name/%s', urlmake)
  }
  return( out )
}