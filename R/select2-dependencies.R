#' select2 dependencies utils
#'
#' @description This function attaches select2 dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_select2_deps <- function(tag) {
    select2_deps <- htmlDependency(
        name = "select2",
        version = "4.0.13",
        src = c(href = "https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/"),
        script = c(
            'js/select2.full.min.js'
        ),
        stylesheet = c('css/select2.min.css')
    )
    tagList(tag, select2_deps)
}
