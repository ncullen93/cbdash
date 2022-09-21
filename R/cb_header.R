
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_header <- function(...) {
    tags$header(
        id = "page-header",
        tags$div(
            class = "content-header",
            # LEFT SECTION -- TOGGLER
            tags$div(
                class = "space-x-1",
                tags$button(
                    type = "button",
                    class = "btn btn-sm btn-alt-secondary",
                    `data-toggle` = "layout",
                    `data-action` = "sidebar_toggle",
                    tags$i(class = "fa fa-fw fa-bars")
                )
            ),
            # RIGHT SECTION -- DROPDOWN
            tags$div(
                class = "space-x-1",
                ...
            )
        )
    )
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_header_dropdown <- function(id, title, subtitle, options) {
    dropdown_options <- lapply(
        options,
        function(option) {
            tags$a(
                class = "dropdown-item d-flex align-items-center justify-content-between space-x-1",
                href = "#",
                tags$span(option)
                #tags$i(class = "fa fa-fw fa-user opacity-25")
            )
        }
    )
    tags$div(
        class = "dropdown d-inline-block",
        id = id,
        tags$button(
            type = "button",
            class = "btn btn-sm btn-alt-secondary",
            id = "page-header-user-dropdown",
            `data-bs-toggle` = "dropdown",
            `aria-haspopup` = "true",
            `aria-expanded` = "false",
            tags$i(class = "fa fa-user d-sm-none"),
            tags$span(
                class = "d-none d-sm-inline-block fw-semibold",
                title
            ),
            tags$i(class = "fa fa-angle-down opacity-50 ms-1")
        ),
        tags$div(
            class = "dropdown-menu dropdown-menu-md dropdown-menu-end p-0",
            `aria-labelledby` = "page-header-user-dropdown",
            tags$div(
                class = "px-2 py-3 bg-body-light rounded-top",
                tags$h5(
                    class = "h6 text-center mb-0",
                    subtitle
                )
            ),
            tags$div(
                class = "p-2",
                dropdown_options,
                tags$a(
                    style ='font-weight: 500',
                    class = "dropdown-item d-flex align-items-center justify-content-between space-x-1",
                    href = "#",
                    tags$b('View all')
                    #tags$i(class = "fa fa-fw fa-user opacity-25")
                )
            )
        )
    )
}
