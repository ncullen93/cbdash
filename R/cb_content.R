
#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_content_heading <- function(title, side_button = NULL) {
    tags$h2(
        class = "content-heading d-flex justify-content-between align-items-center",
        tags$span(title),
        side_button
    )
}

#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_content_block <- function(title, subtitle, shadow = 5) {
    tags$div(
        class = "block block-rounded",
        style = 'padding: 0;',
        tags$div(
            class = "block-content block-content-full",
            style = glue::glue('box-shadow: 0 0 {shadow}px #ccc;'),
            tags$div(
                class = "py-3 text-center",
                tags$h2(
                    class = "fw-bold mb-2",
                    title
                ),
                tags$h3(
                    class = "fs-base fw-medium text-muted mb-0",
                    subtitle
                )
            )
        )
    )
}

#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_project_block_demo <- function() {
    cb_project_block('Example Project',
                     'This is an example project for you
                     to build on!',
                     date_created = '09/22/2022')
}

#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_project_block <- function(ids,
                             title,
                             description,
                             date_created) {
    tags$div(
        class = "block block-rounded",
        tags$div(
            class = "block-content block-content-full",
            style = "box-shadow: 0 0 2px #ccc;",
            tags$div(
                class = "row align-items-center",
                style = "text-align: left;",
                tags$div(
                    class = "col-sm-6 py-4",
                    tags$h3(
                        class = "h5 fw-bold mb-2",
                        tags$i(class = "fa fa-circle text-info me-1"),
                        title
                    ),
                    tags$p(
                        class = "fs-sm text-muted mb-2",
                        description
                    ),
                    tags$p(
                        class = "fs-sm text-muted mb-4",
                        paste("Last Updated on", date_created)
                    ),
                    tags$p(
                        class = "fs-sm mb-0",
                        tags$a(
                            class = "me-3 mb-0",
                            href = "javascript:void(0)",
                            "Plans: 1"
                        ),
                        tags$a(
                            class = "me-3 mb-0",
                            href = "javascript:void(0)",
                            "Datasets: 2"
                        ),
                        tags$a(
                            class = "me-3 mb-0",
                            href = "javascript:void(0)",
                            "Models: 7"
                        ),
                        tags$a(
                            class = "me-3 mb-0",
                            href = "javascript:void(0)",
                            "Visualizations: 0"
                        )
                    )
                ),
                tags$div(
                    class = "col-sm-6 py-4 text-md-end",
                    shiny::actionLink(
                        inputId = ids[1],
                        class = "btn btn-sm btn-alt-primary me-2 my-1",
                        icon = validate_icon('eye opacity-50 me-1'),
                        'View'
                    ),
                    shiny::actionLink(
                        inputId = ids[2],
                        class = "btn btn-sm btn-alt-danger me-2 my-1",
                        icon = validate_icon('archive opacity-50 me-1'),
                        'Archive'
                    )
                )
            )
        )
    )
}

#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_muted_text <- function(...) {
    tags$span(
        class = 'text-muted',
        ...
    )
}

#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_row <- function(..., mb = 2) {
    class <- 'row'
    if (mb > 0) class <- paste0(class, ' mb-', mb)

    tags$div(
        class = class,
        ...
    )
}

#' Title
#'
#' @param title
#' @param side_button
#'
#' @return
#' @export
#'
#' @examples
cb_col <- function(width, ..., offset = 0) {
    col_class <- sprintf('col-%s', width)
    if (offset != 0) col_class <- sprintf('%s offset-%s',
                                          col_class,
                                          offset)
    tags$div(
        class = col_class,
        ...
    )
}


#' @export
cb_col1 <- function(...) { cb_col(1, ...) }

#' @export
cb_col2 <- function(...) { cb_col(2, ...) }

#' @export
cb_col3 <- function(...) { cb_col(3, ...) }

#' @export
cb_col4 <- function(...) { cb_col(4, ...) }

#' @export
cb_col5 <- function(...) { cb_col(5, ...) }

#' @export
cb_col6 <- function(...) { cb_col(6, ...) }

#' @export
cb_col7 <- function(...) { cb_col(7, ...) }

#' @export
cb_col8 <- function(...) { cb_col(8, ...) }

#' @export
cb_col9 <- function(...) { cb_col(9, ...) }

#' @export
cb_col10 <- function(...) { cb_col(10, ...) }

#' @export
cb_col11 <- function(...) { cb_col(11, ...) }

#' @export
cb_col12 <- function(...) { cb_col(12, ...) }


