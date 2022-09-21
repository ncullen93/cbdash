#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_body <- function(...) {
    body <- tags$main(
        id = "main-container",
        tags$div(
            class = "content",
            tags$div(
                class = "tab-content",
                ...
            )
        )
    )

    # make first tab active
    body <- tagQuery(
        body
    )$find(
        '.tab-pane'
    )$filter(
        function(x,i) i==1
    )$addClass(
        'active'
    )$allTags()

    body
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_activate_body_page <- function(id) {
    shinyjs::click(paste0('nav-link-',id))
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_body_page <- function(id, ..., modals = NULL) {
    tags$div(
        class = "tab-pane fade show",
        id = id,
        ...,
        tagList(modals)
    )
}
