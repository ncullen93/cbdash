cb_page <- function(navbar, header = NULL, body, theme = c('none', 'corporate', 'earth',
                                            'elegance','flat','pulse')) {

    if (is.null(header)) header <- cb_header()

    tagList(
        tags$head(
            tags$meta(charset = "utf-8"),
            tags$meta(
                name = "viewport",
                content = "width=device-width, initial-scale=1, viewport-fit=cover"
            ),
            # favicon
            tags$link(
                rel = "shortcut icon",
                href = NULL,
                type="image/x-icon"
            ),
            shinyjs::useShinyjs()
        ),
        add_dependencies(
            tags$body(
                tags$div(
                    id="page-container",
                    class="sidebar-o sidebar-dark enable-page-overlay side-scroll
                           page-header-modern main-content-boxed",
                    navbar,
                    header,
                    body
                )
            ),
            c(
                'cbdash',
                'bootstrap',
                'codebase'
            ),
            theme = theme
        )
    )
}
