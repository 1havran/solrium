\name{solr_stats}
\alias{solr_stats}
\title{Get Solr stats.}
\usage{
solr_stats(q = "*:*", stats.field = NULL, stats.facet = NULL,
  wt = "json", start = 0, rows = 0, key = NULL, url = NULL,
  callopts = list(), raw = FALSE, parsetype = "df")
}
\arguments{
  \item{q}{Query terms, defaults to '*:*', or everything.}

  \item{stats.field}{The number of similar documents to
  return for each result.}

  \item{stats.facet}{You can not facet on multi-valued
  fields.}

  \item{wt}{Data type returned, defaults to 'json'}

  \item{start}{Record to start at, default to beginning.}

  \item{rows}{Number of records to return. Defaults to 10.}

  \item{key}{API key, if needed.}

  \item{url}{URL endpoint.}

  \item{callopts}{Call options passed on to httr::GET}

  \item{raw}{(logical) If TRUE, returns raw data in format
  specified by wt param}

  \item{parsetype}{(character) One of 'list' or 'df'}
}
\value{
XML, JSON, a list, or data.frame
}
\description{
Get Solr stats.
}
\examples{
\dontrun{
url <- 'http://api.plos.org/search'; key = getOption('PlosApiKey')
solr_stats(q='science', stats.field='counter_total_all', url=url, key=key, raw=TRUE)
solr_stats(q='title:"ecology" AND body:"cell"',
   stats.field='counter_total_all,alm_twitterCount', url=url, key=key)
solr_stats(q='ecology', stats.field='counter_total_all,alm_twitterCount',
   stats.facet='journal', url=url, key=key)
solr_stats(q='ecology', stats.field='counter_total_all,alm_twitterCount',
   stats.facet='journal,volume', url=url, key=key)

# Get raw data, then parse later if you feel like it
## json
out <- solr_stats(q='ecology', stats.field='counter_total_all,alm_twitterCount',
   stats.facet='journal,volume', url=url, key=key, raw=TRUE)
library(rjson)
fromJSON(out)
solr_parse(out) # list
solr_parse(out, 'df') # data.frame

## xml
out <- solr_stats(q='ecology', stats.field='counter_total_all,alm_twitterCount',
   stats.facet='journal,volume', url=url, key=key, raw=TRUE, wt="xml")
library(XML)
xmlParse(out)
solr_parse(out) # list
solr_parse(out, 'df') # data.frame

# Get verbose http call information
library(httr)
solr_stats(q='ecology', stats.field='alm_twitterCount', url=url, key=key,
   callopts=verbose())
}
}
\references{
See \url{http://wiki.apache.org/solr/StatsComponent} for
more information on Solr stats.
}
\seealso{
\code{\link{solr_highlight}}, \code{\link{solr_facet}},
\code{\link{solr_search}}, \code{\link{solr_mlt}}
}
