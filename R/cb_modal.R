
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
cb_show_modal <- function(id, asis = TRUE) {
    shinyjs::click(paste0(id,'_show'), asis = asis)
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_hide_modal <- function(id, asis = TRUE) {
    shinyjs::click(id = paste0(id,'_hide'), asis=asis)
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_modal <- function(id, title = NULL, ...) {
   btn <- cb_button(paste0(id,'_show'), label=NULL)
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

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_login_modal <- function(id, title = NULL, ...,
                            footer = NULL,
                            brand = NULL,
                            header = NULL,
                            background_color = NULL) {
    btn <- cb_button(paste0(id,'_show'), label=NULL)
    btn <- tagAppendAttributes(
        btn,
        'data-bs-toggle' = 'modal',
        'data-bs-target' = sprintf('#modal-%s',id)
    )
    btn <- btn %>% shinyjs::hidden()

    btn_close <- cb_button(paste0(id,'_close'), label = NULL)
    btn_close <- tagAppendAttributes(
        btn_close,
        'data-bs-dismiss'="modal",
        'data-bs-target' = sprintf('#modal-%s',id),
        'aria-label'="Close"
    )
    btn_close <- btn_close %>% shinyjs::hidden()

    above_content <- tags$div(
        class = "py-4 text-center",
        tags$a(
            class = "link-fx fw-bold",
            href = "#",
            tags$i(class = "fa fa-fire"),
            tags$span(
                class = "fs-4 text-body-color",
                brand[1]
            ),
            tags$span(
                class = "fs-4",
                brand[2]
            )
        ),
        tags$h1(
            class = "h3 fw-bold mt-4 mb-2",
            header[1]
        ),
        tags$h2(
            class = "h5 fw-medium text-muted mb-0",
            header[2]
        )
    )

    modal <- tags$div(
        class = "modal",
        style = glue::glue('background-color: {background_color}'),
        id = sprintf("modal-%s",id),
        tabindex = "-1",
        role = "dialog",
        `aria-labelledby` = sprintf("modal-%s",id),
        `aria-hidden` = "true",
        'data-bs-keyboard'="false",
        'data-bs-backdrop'="static",
        tags$div(
            class = "modal-dialog modal-dialog-centered",
            role = "document",
            tags$div(
                class = "modal-content",
                above_content,
                tags$div(
                    class = "block block-rounded shadow-none mb-2",
                    style = 'width: 350px; margin: 0 auto;
                    box-shadow: 0 0 25px #ccc !important;',
                    tags$div(
                        class = "block-header block-header-default bg-gd-dusk",
                        tags$h3(
                            class = "block-title",
                            style = 'color: white',
                            title
                        )
                    ),
                    # begin content
                    tags$div(
                        class = "block-content fs-sm mb-2",
                        ...,
                    ),
                    ## end content
                    tags$div(
                        class = "block-content block-content-full block-content-sm text-end border-top",
                        footer
                    )
                )
            )
        )
    )

    tagList(
        btn, btn_close, modal
    )
}