% Generated by roxygen2 (4.0.1): do not edit by hand
\name{getcredibilityratingfromtsn}
\alias{getcredibilityratingfromtsn}
\title{Get credibility rating from tsn}
\usage{
getcredibilityratingfromtsn(tsn = NA, curlopts = list(),
  curl = getCurlHandle())
}
\arguments{
\item{tsn}{TSN for a taxonomic group (numeric)}

\item{curlopts}{optional additional curl options (debugging tools mostly)}

\item{curl}{If using in a loop, call getCurlHandle() first and pass
the returned value in here (avoids unnecessary footprint)}
}
\description{
Get credibility rating from tsn
}
\examples{
\dontrun{
getcredibilityratingfromtsn(tsn = 526852)
}
}
\keyword{internal}

