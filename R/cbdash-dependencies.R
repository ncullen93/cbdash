#' cbdash dependencies utils
#'
#' @description This function attaches cbdash dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom utils packageVersion
#' @importFrom htmltools tagList htmlDependency
#' @export
add_cbdash_deps <- function(tag) {
 cbdash_deps <- htmlDependency(
  name = "cbdash",
  version = "0.0.0.9000",
  src = c(file = "cbdash-0.0.0.9000"),
  script = "js/cbdash.min.js",
  package = "cbdash",
 )
 tagList(tag, cbdash_deps)
}
    
