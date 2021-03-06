% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ping.R
\name{ping}
\alias{ping}
\title{Ping a Solr instance}
\usage{
ping(name, wt = "json", verbose = TRUE, raw = FALSE, ...)
}
\arguments{
\item{name}{(character) Name of a collection or core. Required.}

\item{wt}{(character) One of json (default) or xml. If json, uses
\code{\link[jsonlite]{fromJSON}} to parse. If xml, uses
\code{\link[xml2]{read_xml}} to parse}

\item{verbose}{If TRUE (default) the url call used printed to console.}

\item{raw}{(logical) If TRUE, returns raw data in format specified by
\code{wt} param}

\item{...}{curl options passed on to \code{\link[httr]{GET}}}
}
\value{
if \code{wt="xml"} an object of class \code{xml_document}, if
\code{wt="json"} an object of class \code{list}
}
\description{
Ping a Solr instance
}
\details{
You likely may not be able to run this function against many public
Solr services as they hopefully don't expose their admin interface to the
public, but works locally.
}
\examples{
\dontrun{
# start Solr, in your CLI, run: `bin/solr start -e cloud -noprompt`
# after that, if you haven't run `bin/post -c gettingstarted docs/` yet,
# do so

# connect: by default we connect to localhost, port 8983
solr_connect()

# ping the gettingstarted index
ping("gettingstarted")
ping("gettingstarted", wt = "xml")
ping("gettingstarted", verbose = FALSE)
ping("gettingstarted", raw = TRUE)

library("httr")
ping("gettingstarted", wt="xml", config = verbose())
}
}

