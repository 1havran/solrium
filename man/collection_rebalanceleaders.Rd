% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collection_rebalanceleaders.R
\name{collection_rebalanceleaders}
\alias{collection_rebalanceleaders}
\title{Rebalance leaders}
\usage{
collection_rebalanceleaders(name, maxAtOnce = NULL, maxWaitSeconds = NULL,
  raw = FALSE, ...)
}
\arguments{
\item{name}{(character) Required. The name of the collection rebalance preferredLeaders on.}

\item{maxAtOnce}{(integer) The maximum number of reassignments to have queue up at once.
Values <=0 are use the default value Integer.MAX_VALUE. When this number is reached, the
process waits for one or more leaders to be successfully assigned before adding more
to the queue.}

\item{maxWaitSeconds}{(integer) Timeout value when waiting for leaders to be reassigned.
NOTE: if maxAtOnce is less than the number of reassignments that will take place,
this is the maximum interval that any single wait for at least one reassignment.
For example, if 10 reassignments are to take place and maxAtOnce is 1 and maxWaitSeconds
is 60, the upper bound on the time that the command may wait is 10 minutes. Default: 60}

\item{raw}{(logical) If \code{TRUE}, returns raw data}

\item{...}{curl options passed on to \code{\link[httr]{GET}}}
}
\description{
Reassign leaders in a collection according to the preferredLeader
property across active nodes
}
\examples{
\dontrun{
solr_connect()

# create collection
collection_create(name = "mycollection2") # bin/solr create -c mycollection2

# balance preferredLeader property
collection_balanceshardunique("mycollection2", property = "preferredLeader")

# balance preferredLeader property
collection_rebalanceleaders("mycollection2")

# examine cluster status
collection_clusterstatus()$cluster$collections$mycollection2
}
}

