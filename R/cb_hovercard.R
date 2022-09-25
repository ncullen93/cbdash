
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_hovercard <- function(id, title, subtitle, icon = NULL,
                         bg_color = NULL) {

    if (!is.null(icon)) {
        icon <- add_css_class(validate_icon(icon), 'fa-3x text-primary')
    }

    value <- restoreInput(id = id, default = NULL)

    tags$div(
        class = "col-md-6 col-xl-3",
        tags$a(
            id = id,
            class = "block block-rounded block-link-shadow action-button",
            href = '#',
            `data-val` = value,
            tags$div(
                class = "block-content block-content-full text-center",
                style = ifelse(!is.null(bg_color),
                                        sprintf('background-color: %s;',bg_color),
                                        ''),
                tags$div(
                    class = "p-2 mb-1",
                    icon
                ),
                tags$p(
                    class = "fs-lg fw-semibold mb-0",
                    title
                ),
                tags$p(
                    class = "fs-sm fw-medium text-muted mb-0",
                    subtitle
                )
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
cb_hovercard_placeholder <- function(id, title, subtitle, icon = NULL) {
    el <- cb_hovercard(id, title, subtitle, icon)
    print(el)
    el <- htmltools::tagAppendAttributes(
        el,
        style = 'background-color: transparent; border: 3px solid gray;',
        .cssSelector = '.action-button'
    )
    #el <- htmltools::tagAppendAttributes(
    #    el,
    #    style = 'border: 3px dashed gray;',
    #    .cssSelector = '.block-content-full'
    #)
    el
}
