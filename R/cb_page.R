
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_page <- function(navbar, header = NULL, body, dependencies = NULL,
                    use_signin = FALSE, signin_ui = NULL,
                    theme = c('none', 'corporate', 'earth', 'elegance','flat','pulse')) {

    if (is.null(header)) header <- cb_header()


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
                           page-header-modern main-content-boxed",
        body_tags
    )

   # if (is.null(signin_ui)) signin_ui <- firebase::firebaseUIContainer()
   if (use_signin) {
       body_tags <- tagList(
           signin_ui,
           body_tags
       )
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
            shinyjs::useShinyjs(),
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
            ),
            theme = theme
        )
    )
}
