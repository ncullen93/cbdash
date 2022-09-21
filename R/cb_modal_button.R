
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_modal_button <- function(id, label, dialog, hidden = FALSE) {
    btn <- cb_button(id, label)
    btn <- tagAppendAttributes(btn, 'data-bs-toggle' = 'modal', 'data-bs-target' = sprintf('#modal-%s',id))
    if (hidden) btn <- btn %>% shinyjs::hidden()
    tagList(btn, dialog)
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_launch_modal <- function(id) {
    shinyjs::click(id)
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_modal_dialog <- function(id, title = NULL, ...) {
    btn <- cb_button(id, label=NULL)
    btn <- tagAppendAttributes(
        btn,
        'data-bs-toggle' = 'modal',
        'data-bs-target' = sprintf('#modal-%s',id)
    )
    btn <- btn %>% shinyjs::hidden()

    modal <- tags$div(
        class = "modal",
        id = sprintf("modal-%s",id),
        tabindex = "-1",
        role = "dialog",
        `aria-labelledby` = sprintf("modal-%s",id),
        `aria-hidden` = "true",
        tags$div(
            class = "modal-dialog",
            role = "document",
            tags$div(
                class = "modal-content",
                tags$div(
                    class = "block block-rounded shadow-none mb-0",
                    tags$div(
                        class = "block-header block-header-default",
                        tags$h3(
                            class = "block-title",
                            title
                        ),
                        tags$div(
                            class = "block-options",
                            tags$button(
                                type = "button",
                                class = "btn-block-option",
                                id = "close-modal",
                                `data-bs-dismiss` = "modal",
                                `aria-label` = "Close",
                                tags$i(class = "fa fa-times")
                            )
                        )
                    ),
                    # begin content
                    tags$div(
                        class = "block-content fs-sm",
                        ...,
                    ),
                    # end content
                    tags$div(
                        class = "block-content block-content-full block-content-sm text-end border-top",
                        tags$button(
                            type = "button",
                            class = "btn btn-alt-secondary",
                            `data-bs-dismiss` = "modal",
                            "Close"
                        ),
                        tags$button(
                            type = "button",
                            class = "btn btn-alt-primary",
                            `data-bs-dismiss` = "modal",
                            "Done"
                        )
                    )
                )
            )
        )
    )

    tagList(
        btn, modal
    )
}
