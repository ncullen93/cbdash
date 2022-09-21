
cb_content_heading <- function(title, side_button = NULL) {
    tags$h2(
        class = "content-heading d-flex justify-content-between align-items-center",
        tags$span(title),
        side_button
    )
}

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

cb_project_block_demo <- function() {
    tags$div(
        class = "block block-rounded",
        tags$div(
            class = "block-content block-content-full",
            style = "box-shadow: 0 0 2px #ccc;",
            tags$div(
                class = "row align-items-center",
                tags$div(
                    class = "col-sm-6 py-4",
                    tags$h3(
                        class = "h5 fw-bold mb-2",
                        tags$i(class = "fa fa-circle text-info me-1"),
                        "Example Project"
                    ),
                    tags$p(
                        class = "fs-sm text-muted mb-4",
                        "Last Updated on 15th June, 2030"
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
                    tags$a(
                        class = "btn btn-sm btn-alt-primary me-2 my-1",
                        href = "javascript:void(0)",
                        tags$i(class = "fa fa-eye opacity-50 me-1"),
                        "View"
                    ),
                    tags$a(
                        class = "btn btn-sm btn-alt-warning me-2 my-1",
                        href = "javascript:void(0)",
                        tags$i(class = "fa fa-copy opacity-50 me-1"),
                        "Copy"
                    ),
                    tags$a(
                        class = "btn btn-sm btn-alt-danger me-2 my-1",
                        href = "javascript:void(0)",
                        tags$i(class = "fa fa-archive opacity-50 me-1"),
                        "Archive"
                    )
                )
            )
        )
    )
}

cb_muted_text <- function(...) {
    tags$span(
        class = 'text-muted',
        ...
    )
}

cb_row <- function(...) {
    tags$div(
        class = 'row',
        ...
    )
}

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
cb_col1 <- function(...) { cb_col(1, ...) }
cb_col2 <- function(...) { cb_col(2, ...) }
cb_col3 <- function(...) { cb_col(3, ...) }
cb_col4 <- function(...) { cb_col(4, ...) }
cb_col5 <- function(...) { cb_col(5, ...) }
cb_col6 <- function(...) { cb_col(6, ...) }
cb_col7 <- function(...) { cb_col(7, ...) }
cb_col8 <- function(...) { cb_col(8, ...) }
cb_col9 <- function(...) { cb_col(9, ...) }
cb_col10 <- function(...) { cb_col(10, ...) }
cb_col11 <- function(...) { cb_col(11, ...) }
cb_col12 <- function(...) { cb_col(12, ...) }

