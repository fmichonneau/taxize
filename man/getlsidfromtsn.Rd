% Generated by roxygen2 (4.0.1): do not edit by hand
\name{getlsidfromtsn}
\alias{getlsidfromtsn}
\title{Gets the unique LSID for the TSN, or an empty result if there is no match.}
\usage{
getlsidfromtsn(tsn = NA, curlopts = list(), curl = getCurlHandle())
}
\arguments{
\item{tsn}{TSN for a taxonomic group (numeric)}

\item{curlopts}{optional additional curl options (debugging tools mostly)}

\item{curl}{If using in a loop, call getCurlHandle() first and pass
the returned value in here (avoids unnecessary footprint)}
}
\description{
Gets the unique LSID for the TSN, or an empty result if there is no match.
}
\examples{
\dontrun{
getlsidfromtsn(tsn = 155166)
}
}
\keyword{internal}

