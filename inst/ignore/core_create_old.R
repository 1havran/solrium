#' Create a core
#' 
#' @export
#' 
#' @param name (character) The name of the collection to be created. Required
#' @param numShards (integer) The number of shards to be created as part of the 
#' collection. This is a required parameter when using the 'compositeId' router.
#' @param maxShardsPerNode (integer) When creating collections, the shards and/or replicas 
#' are spread across all available (i.e., live) nodes, and two replicas of the same shard 
#' will never be on the same node. If a node is not live when the CREATE operation is called, 
#' it will not get any parts of the new collection, which could lead to too many replicas 
#' being created on a single live node. Defining maxShardsPerNode sets a limit on the number 
#' of replicas CREATE will spread to each node. If the entire collection can not be fit into 
#' the live nodes, no collection will be created at all. Default: 1
#' @param createNodeSet (logical) Allows defining the nodes to spread the new collection 
#' across. If not provided, the CREATE operation will create shard-replica spread across all 
#' live Solr nodes. The format is a comma-separated list of node_names, such as 
#' localhost:8983_solr, localhost:8984_solr, localhost:8985_solr. Default: \code{NULL}
#' @param collection.configName (character) Defines the name of the configurations (which 
#' must already be stored in ZooKeeper) to use for this collection. If not provided, Solr 
#' will default to the collection name as the configuration name. Default: \code{compositeId}
#' @param replicationFactor (integer) The number of replicas to be created for each shard.
#' Default: 1
#' @param router.name (character) The router name that will be used. The router defines 
#' how documents will be distributed among the shards. The value can be either \code{implicit}, 
#' which uses an internal default hash, or \code{compositeId}, which allows defining the specific 
#' shard to assign documents to. When using the 'implicit' router, the shards parameter is 
#' required. When using the 'compositeId' router, the numShards parameter is required. 
#' For more information, see also the section Document Routing. Default: \code{compositeId}
#' @param shards (character) A comma separated list of shard names, e.g., 
#' shard-x,shard-y,shard-z . This is a required parameter when using the 'implicit' router.
#' @param createNodeSet.shuffle	(logical)	Controls wether or not the shard-replicas created 
#' for this collection will be assigned to the nodes specified by the createNodeSet in a 
#' sequential manner, or if the list of nodes should be shuffled prior to creating individual 
#' replicas.  A 'false' value makes the results of a collection creation predictible and 
#' gives more exact control over the location of the individual shard-replicas, but 'true' 
#' can be a better choice for ensuring replicas are distributed evenly across nodes. Ignored 
#' if createNodeSet is not also specified. Default: \code{TRUE}
#' @param router.field (character) If this field is specified, the router will look at the 
#' value of the field in an input document to compute the hash and identify a shard instead of 
#' looking at the uniqueKey field. If the field specified is null in the document, the document 
#' will be rejected. Please note that RealTime Get or retrieval by id would also require the 
#' parameter _route_ (or shard.keys) to avoid a distributed search.
#' @param autoAddReplicas	(logical)	When set to true, enables auto addition of replicas on 
#' shared file systems. See the section autoAddReplicas Settings for more details on settings 
#' and overrides. Default: \code{FALSE}
#' @param async	(character) Request ID to track this action which will be processed 
#' asynchronously
#' @param instanceDir (character) Path to instance directory
#' @param config (character) Path to config file
#' @param configSet (character) Name of the configset to use for this core. For more 
#' information, see https://cwiki.apache.org/confluence/display/solr/Config+Sets
#' @param schema (character) Path to schema file
#' @param raw (logical) If \code{TRUE}, returns raw data in format specified by 
#' \code{wt} param
#' @param callopts curl options passed on to \code{\link[httr]{GET}}
#' @param ... You can pass in parameters like \code{property.name=value}	to set 
#' core property name to value. See the section Defining core.properties for details on 
#' supported properties and values. 
#' (https://cwiki.apache.org/confluence/display/solr/Defining+core.properties)
#' @examples \dontrun{
#' # start Solr with Schemaless mode via the schemaless eg: bin/solr start -e schemaless
#' # you can create a new core like: bin/solr create -c corename
#' # where <corename> is the name for your core - or creaate as below
#' 
#' # connect
#' solr_connect()
#' 
#' # Create a core
#' config <- system.file("examples", "solrconfig.xml", package = "solr")
#' schema <- system.file("examples", "schema.xml", package = "solr")
#' core_create(name = "helloWorld", config = config, schema = schema)
#' 
#' core_create(name = "helloWorld", configSet = 'basic_config')
#' }
core_create <- function(name, numShards = 2, maxShardsPerNode = 1, 
                        createNodeSet = NULL, collection.configName = NULL, 
                        replicationFactor = 1, router.name = NULL, shards = NULL,
                        createNodeSet.shuffle = TRUE, router.field = NULL,
                        autoAddReplicas = FALSE, async = NULL, 
                        instanceDir = NULL, config = NULL, schema = NULL, 
                        configSet = NULL, raw = FALSE, callopts=list(), ...) {
  
  # message("Not working yet")  
  conn <- solr_settings()
  check_conn(conn)
  args <- sc(list(action = 'CREATE', name = name, numShards = numShards, 
                  replicationFactor = replicationFactor, 
                  maxShardsPerNode = maxShardsPerNode, createNodeSet = asl(createNodeSet), 
                  collection.configName = collection.configName, 
                  router.name = router.name, shards = shards,
                  createNodeSet.shuffle = asl(createNodeSet.shuffle), 
                  router.field = router.field, autoAddReplicas = asl(autoAddReplicas), 
                  async = async, instanceDir = instanceDir, config = config, 
                  schema = schema, wt = 'json'))
  res <- solr_GET(file.path(conn$url, 'solr/admin/cores'), args, callopts, conn$proxy, ...)
  if (raw) {
    return(res)
  } else {
    jsonlite::fromJSON(res)
  }
}

