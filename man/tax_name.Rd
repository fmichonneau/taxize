% Generated by roxygen2 (4.0.1): do not edit by hand
\name{tax_name}
\alias{tax_name}
\title{Get taxonomic names for a given rank.}
\usage{
tax_name(query = NULL, get = NULL, db = "itis", pref = "ncbi",
  verbose = TRUE, ...)
}
\arguments{
\item{query}{character; Vector of taxonomic names to query.}

\item{get}{character; The ranks of the taxonomic name to get, see
\code{\link[taxize]{rank_ref}}.}

\item{db}{character; The database to search from: 'itis', 'ncbi' or 'both'.
If 'both' both NCBI and ITIS will be queried. Result will be the union of
both.}

\item{pref}{character; If db = 'both', sets the preference for the union.
Either 'ncbi' or 'itis'.
Currently not implemented - preference is given to ncbi.}

\item{verbose}{logical; If TRUE the actual taxon queried is printed on the
console.}

\item{...}{Other arguments passed to \code{\link[taxize]{get_tsn}} or \code{\link[taxize]{get_uid}}.}
}
\value{
A data.frame with one column for every queried rank.
}
\description{
Retrieve name of queried taxonomic rank of a taxon.
}
\note{
While \code{\link[taxize]{tax_rank}} returns the actual rank of a
taxon,\code{\link[taxize]{tax_name}} searches and returns any specified rank
higher in taxonmy.
}
\examples{
\dontrun{
# A case where itis and ncbi use the same names
tax_name(query = "Helianthus annuus", get = "family", db = "itis")
tax_name(query = "Helianthus annuus", get = "family", db = "ncbi")

# Case where itis and ncbi use different names
tax_name(query = "Helianthus annuus", get = "kingdom", db = "itis")
tax_name(query = "Helianthus annuus", get = "kingdom", db = "ncbi")

# multiple get arguments
tax_name(query = c("Helianthus annuus","Baetis rhodani"), get = c("genus",
"kingdom"), db = "ncbi")
tax_name(query = "xxx", get = c("genus", "kingdom"), db = "itis")

# query both
tax_name(query=c("Helianthus annuus", 'Baetis rhodani'), get=c("genus",
"kingdom"), db="both")
}
}
\seealso{
\code{\link[taxize]{classification}}
}

