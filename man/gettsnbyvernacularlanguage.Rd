% Generated by roxygen2 (4.0.1): do not edit by hand
\name{gettsnbyvernacularlanguage}
\alias{gettsnbyvernacularlanguage}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
gettsnbyvernacularlanguage(language = NA, curlopts = list(),
  curl = getCurlHandle())
}
\arguments{
\item{language}{A string containing the language. This is a language string,
not the international language code (character)}

\item{curlopts}{optional additional curl options (debugging tools mostly)}

\item{curl}{If using in a loop, call getCurlHandle() first and pass
the returned value in here (avoids unnecessary footprint)}
}
\description{
Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
gettsnbyvernacularlanguage("french")
}
}
\keyword{internal}

