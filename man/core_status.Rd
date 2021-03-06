% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/core_status.R
\name{core_status}
\alias{core_status}
\title{Get core status}
\usage{
core_status(name = NULL, indexInfo = TRUE, raw = FALSE,
  callopts = list())
}
\arguments{
\item{name}{(character) The name of the core. If not given, all cores.}

\item{indexInfo}{(logical)}

\item{raw}{(logical) If \code{TRUE}, returns raw data}

\item{callopts}{curl options passed on to \code{\link[httr]{GET}}}
}
\description{
Get core status
}
\examples{
\dontrun{
# start Solr with Schemaless mode via the schemaless eg: bin/solr start -e schemaless
# you can create a new core like: bin/solr create -c corename
# where <corename> is the name for your core - or creaate as below

# connect
solr_connect()

# Status of all cores
core_status()

# Status of particular cores
core_status("gettingstarted")

# Get index info or not
## Default: TRUE
core_status("gettingstarted", indexInfo = TRUE)
core_status("gettingstarted", indexInfo = FALSE)
}
}

