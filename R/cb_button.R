
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_button <- function(id,
                      label = NULL,
                      icon = NULL,
                      width = NULL,
                      color = c('primary','secondary','success','info','warning','danger'),
                      size = c('md','sm','lg'),
                      alt = FALSE,
                      disabled = FALSE,
                      icon_right = FALSE,
                      transparent = FALSE
) {

    color <- match.arg(color)
    size <- match.arg(size)

    btn <- shiny::actionButton(
        inputId = id,
        label = label,
        icon = validate_icon(icon),
        width = width
    )

    # make icon fixed width
    if (!is.null(icon)) {
        btn <- htmltools::tagAppendAttributes(
            btn,
            class = 'fa-fw',
            .cssSelector = 'i'
        )

        if (icon_right) {
            btn$children <- tagList(btn$children[[2]], btn$children[[1]])
        }
    }

    # add color
    btn <- replace_css_class(
        btn,
        'btn-default',
        glue::glue('btn-{ ifelse(alt, "alt-", "") }{ color }')
    )

    ## add size
    if (size != 'md') {
        btn <- add_css_class(btn, sprintf('btn-%s', size))
    }

    # add disabled
    if (disabled) {
        btn <- shinyjs::disabled(btn)
    }

    if (transparent)
        btn <- htmltools::tagAppendAttributes(
            btn,
            style = 'background: transparent; border: none;'
        )

    btn
}
