
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_page <- function(navbar, header = NULL, body, auth = NULL, dependencies = NULL,
                    theme = c('default', 'corporate', 'earth', 'elegance','flat','pulse')) {

    if (is.null(header)) header <- cb_header()
    use_signin <- !is.null(auth)

    body_tags <- tagList(
        navbar,
        header,
        body
    )

    if (use_signin) {
        body_tags <- firebase::reqSignin(
            body_tags
        )
    }

    body_tags <- tags$div(
        id="page-container",
        class="sidebar-o sidebar-dark enable-page-overlay side-scroll
               page-header-modern  main-content-narrow",
        body_tags
    )

   if (use_signin) {
       body_tags <- tagList(
           auth,
           body_tags
       )
   }

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
