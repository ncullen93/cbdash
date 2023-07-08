
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_page <- function(navbar, header = NULL, body, auth = NULL, dependencies = NULL,
                    theme = c('default', 'corporate', 'earth', 'elegance','flat','pulse'),
                    sidebar_width = 250) {

    if (is.null(header)) header <- cb_header()
    use_signin <- !is.null(auth)

    body_tags <- tagList(
        navbar,
        header,
        body
    )

    body_class <- "sidebar-o sidebar-dark enable-page-overlay side-scroll
                 page-header-modern main-content-narrow"
    if (is_mini(navbar)) body_class <- paste(body_class, 'sidebar-mini')

    body_tags <- tags$div(
        id="page-container",
        class = body_class,
        style = glue::glue('padding-left: {sidebar_width}px !important;'),
        body_tags
    )

    # apps have to run shinyjs::show(id='page-container', asis=T) to unhide main body after auth
    if (use_signin) {
        body_tags <- tagList(
            auth,
            body_tags %>% shinyjs::hidden()
        )
    }

    theme <- match.arg(theme)
    if (theme == 'default') {
        theme <- 'codebase'
    } else {
        theme = sprintf('themes/%s', theme)
    }

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
            # need these tags for the theme selector which is based on the ids
            tags$link(
                rel = "stylesheet",
                id = "css-main",
                href = "codebase5.3/css/codebase.min.css"
            ),
            tags$link(
                rel = "stylesheet",
                id = "css-theme",
                href = paste0("codebase-5.3/css/",theme,".min.css")
            ),
            shinyjs::useShinyjs(),
            waiter::useWaiter(),
            tagList(
                dependencies
            )
        ),
        add_dependencies(
            tags$body(
                body_tags
            ),
            c(
                'cbdash',
                'bootstrap',
                'codebase'
            )
           # theme = theme
        )
    )
}
