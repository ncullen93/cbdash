
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_card <- function(title, ..., subtitle = NULL, icon = NULL) {
    if (!is.null(subtitle)) subtitle <- tags$small(subtitle)
    if (!is.null(icon)) icon <- validate_icon(icon)

    tags$div(
        class = "block block-rounded",
        style = 'padding: 0;',
        tags$div(
            class = "block-header block-header-default",
            tags$h3(
                class = "block-title",
                icon,
                title,
                subtitle
            )
        ),
        tags$div(
            class = "block-content block-content-full",
            tags$div(
                class = "row align-items-center",
                tags$div(...)
            )
        )
    )
}

#' Title
#'
#' @param title
#' @param cost
#' @param time
#' @param info
#' @param button
#'
#' @return
#' @export
#'
#' @examples
#' cb_upgrade_card('Developer', '$19', 'per month', list(c('2','Projects'),c('10GB Storage')),
#' cb_button('xx','Current Plan'))
cb_upgrade_card <- function(title, cost, time, info, button, active = FALSE) {
    title_icon <- NULL
    if (active) title_icon <- tags$i(class = "fa fa-check")

    info_tags <- lapply(
        info,
        function(x) { tags$p(
            tags$strong(x[1]),
            x[2]
        )}
    )

    tags$a(
        class = "block block-link-pop block-rounded block-bordered text-center",
        tags$div(
            class = "block-header",
            tags$h3(
                class = "block-title fw-semibold",
                title_icon,
                title
            )
        ),
        tags$div(
            class = "block-content bg-body-light",
            tags$div(
                class = "h1 fw-bold text-primary mb-2",
                cost
            ),
            tags$div(
                class = "h5 text-muted",
                time
            )
        ),
        tags$div(
            class = "block-content",
            info_tags
        ),
        tags$div(
            class = "block-content block-content-full",
            button
        )
    )
}



