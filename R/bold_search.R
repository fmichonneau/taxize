#' Search Barcode of Life for taxonomic IDs
#' 
#' @import bold
#' @export
#' @param name (character) One or more scientific names.
#' @param id (integer) One or more BOLD taxonomic identifiers.
#' @param fuzzy (logical) Whether to use fuzzy search or not (default: FALSE).
#' @param dataTypes (character) Specifies the datatypes that will be returned. See Details for 
#' options.
#' @param includeTree (logical) If TRUE (default: FALSE), returns a list containing information
#' for parent taxa as well as the specified taxon.
#' @param response (logical) Note that response is the object that returns from the Curl call,
#' useful for debugging, and getting detailed info on the API call.
#' @param ... Further args passed on to httr::GET, main purpose being curl debugging
#' @details You must provide one of name or id. The other parameters are optional.
#'   	
#' Options for \code{dataTypes} parameter:
#' 
#' \itemize{
#'  \item all returns all data
#'  \item basic returns basic taxon information
#'  \item images returns specimen image. Includes copyright information, image URL, image metadata.
#'  \item stats Returns specimen and sequence statistics. Includes public species count, public BIN 
#'  count, public marker counts, public record count, specimen count, sequenced specimen count, 
#'  barcode specimen count, species count, barcode species count.
#'  \item geo Returns collection site information. Includes country, collection site map.
#'  \item sequencinglabs Returns sequencing labs. Includes lab name, record count.
#'  \item depository Returns specimen depositories. Includes depository name, record count.
#'  \item thirdparty Returns information from third parties. Includes wikipedia summary, wikipedia 
#'  URL, GBIF map.
#' }
#' @references \url{http://webservice.catalogueoflife.org/}
#' @return A list of data.frame's.
#' @examples \dontrun{
#' # A basic example
#' bold_search(name="Apis")
#' bold_search(name="Agapostemon")
#' bold_search(name="Poa")
#' 
#' # Fuzzy search
#' head(bold_search(name="Po", fuzzy=TRUE))
#' head(bold_search(name="Aga", fuzzy=TRUE))
#' 
#' # Many names
#' bold_search(name=c("Apis","Puma concolor"))
#' nms <- names_list('species')
#' bold_search(name=nms)
#' 
#' # An example where there is no data
#' bold_search(id=88899)
#' }

bold_search <- function(name = NULL, id = NULL, fuzzy = FALSE, dataTypes='basic', 
  includeTree=FALSE, response=FALSE, ...)
{
  assert_that(!is.null(name) | !is.null(id))
  type <- if(is.null(name)) "id" else 'name'
  tmp <- switch(type, 
         name = bold_tax_name(name=name, fuzzy=fuzzy, response=response, ...),
         id = bold_tax_id(id=id, dataTypes=dataTypes, includeTree=includeTree, response=response, ...)
  )
  return(tmp)
}

parsecoldata <- function(x){
  vals <- x[c('id','name','rank','name_status','source_database')]
  vals[sapply(vals, is.null)] <- NA
  names(vals) <- c('id','name','rank','name_status','source_database')
  bb <- data.frame(vals, stringsAsFactors=FALSE)
  names(bb)[4:5] <- c('status','source')
  acc <- x$accepted_name
  if(is.null(acc)){
    accdf <- data.frame(acc_id=NA, acc_name=NA, acc_rank=NA, acc_status=NA, acc_source=NA, stringsAsFactors = FALSE)
  } else
  {
    accdf <- data.frame(acc[c('id','name','rank','name_status','source_database')], stringsAsFactors=FALSE)
    names(accdf) <- c('acc_id','acc_name','acc_rank','acc_status','acc_source')
  }
  cbind(bb, accdf)
}
