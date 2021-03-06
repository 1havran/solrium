% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collection_requeststatus.R
\name{collection_requeststatus}
\alias{collection_requeststatus}
\title{Get request status}
\usage{
collection_requeststatus(requestid, raw = FALSE, ...)
}
\arguments{
\item{requestid}{(character) Required. The user defined request-id for the request.
This can be used to track the status of the submitted asynchronous task. \code{-1}
is a special request id which is used to cleanup the stored states for all of the
already completed/failed tasks.}

\item{raw}{(logical) If \code{TRUE}, returns raw data}

\item{...}{curl options passed on to \code{\link[httr]{GET}}}
}
\description{
Request the status of an already submitted Asynchronous Collection
API call. This call is also used to clear up the stored statuses.
}
\examples{
\dontrun{
solr_connect()

# invalid requestid
collection_requeststatus(requestid = "xxx")

# valid requestid
collection_requeststatus(requestid = "xxx")
res$responseHeader
res$xxx
}
}

