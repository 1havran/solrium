% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collection_exists.R
\name{collection_exists}
\alias{collection_exists}
\title{Check if a collection exists}
\usage{
collection_exists(name, ...)
}
\arguments{
\item{name}{(character) The name of the core. If not given, all cores.}

\item{...}{curl options passed on to \code{\link[httr]{GET}}}
}
\value{
A single boolean, \code{TRUE} or \code{FALSE}
}
\description{
Check if a collection exists
}
\details{
Simply calls \code{\link{collection_list}} internally
}
\examples{
\dontrun{
# start Solr with Cloud mode via the schemaless eg: bin/solr -e cloud
# you can create a new core like: bin/solr create -c corename
# where <corename> is the name for your core - or creaate as below

# connect
solr_connect()

# exists
collection_exists("gettingstarted")

# doesn't exist
collection_exists("hhhhhh")
}
}

