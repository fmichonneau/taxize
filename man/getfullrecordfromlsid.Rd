% Generated by roxygen2 (4.0.1): do not edit by hand
\name{getfullrecordfromlsid}
\alias{getfullrecordfromlsid}
\title{Returns the full ITIS record for the TSN in the LSID, found by comparing the
		TSN in the search key to the TSN field. Returns an empty result set if
  	there is no match or the TSN is invalid.}
\usage{
getfullrecordfromlsid(lsid = NA, curlopts = list(),
  curl = getCurlHandle(), verbose = TRUE)
}
\arguments{
\item{lsid}{lsid for a taxonomic group (character)}

\item{curlopts}{optional additional curl options (debugging tools mostly)}

\item{curl}{If using in a loop, call getCurlHandle() first and pass
the returned value in here (avoids unnecessary footprint)}

\item{verbose}{Verbosity or not (default TRUE)}
}
\description{
Returns the full ITIS record for the TSN in the LSID, found by comparing the
		TSN in the search key to the TSN field. Returns an empty result set if
  	there is no match or the TSN is invalid.
}
\examples{
\dontrun{
getfullrecordfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
getfullrecordfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:180543", verbose=FALSE)
}
}
\keyword{internal}

