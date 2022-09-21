#' bootstrap dependencies utils
#'
#' @description This function attaches bootstrap. dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_bootstrap_deps <- function(tag) {
 bootstrap_deps <- htmlDependency(
  name = "bootstrap",
  version = "5.2.1",
  src = c(href = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/"),
  script = c(
   "js/bootstrap.esm.min.js",
   "js/bootstrap.min.js"
  ),
  stylesheet = c(
   "css/bootstrap.min.css",
   "css/bootstrap-grid.min.css",
   "css/bootstrap-reboot.min.css",
   "css/bootstrap-utilities.min.css"
  ),
 )
 tagList(tag, bootstrap_deps)
}
    
