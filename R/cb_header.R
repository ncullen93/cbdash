
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
                id = 'left-toggler',
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
                id = 'right-dropdown',
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
cb_header_dropdown <- function(id, title, subtitle = NULL, options, icons = NULL, reactive_title=FALSE) {
    dropdown_options <- list()
    for (i in seq_along(options)) {
        option <- options[i]

        if (is.na(option)) {
            mytag <- tags$div(class = 'dropdown-divider')
        } else {
            mytag <- shiny::actionLink(
                option,
                option
            ) %>%
                tagAppendAttributes(
                    class = 'dropdown-item d-flex align-items-center justify-content-between space-x-1'
                )
            if (!is.null(icons)) {
                mytag <- mytag %>%
                    tagAppendChild(
                        validate_icon(icons[i], fw=TRUE, opacity=25)
                    )
            }
        }
        dropdown_options[[i]] <- mytag
    }
    #dropdown_options <- lapply(
    #    options,
    #    function(option) {
    #        shiny::actionLink(
    #            option,
    #            option
    #        ) %>%
    #            tagAppendAttributes(
    #                class = 'dropdown-item d-flex align-items-center justify-content-between space-x-1'
    #            )
    #    }
    #)

    if (reactive_title) title <- shiny::uiOutput(title)

    if (!is.null(subtitle)) {
        subtitle <- tags$div(
            class = "px-2 py-3 bg-body-light rounded-top",
            tags$h5(
                class = "h6 text-center mb-0",
                subtitle
            )
        )
    }

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
            subtitle,
            tags$div(
                class = "p-2",
                tagList(dropdown_options)
            )
        )
    )
}
