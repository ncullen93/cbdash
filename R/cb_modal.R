
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
    shinyjs::click(id = paste0(id,'_close'), asis=asis)
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_modal <- function(id, title = NULL, ..., footer = NULL,
                     size = c('md', 'sm', 'lg', 'xl')) {
    size <- match.arg(size)

   btn <- cb_button(paste0(id,'_show'), label = NULL)
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
        'data-bs-target' = sprintf('#modal-%s',id)
    )
    btn_close <- btn_close %>% shinyjs::hidden()

    modal_size <- NULL
    if (size != 'md') modal_size <- sprintf('modal-%s', size)

   if (is.null(footer)) {
       footer <- tagList(
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
   }

    modal <- tags$div(
        class = "modal",
        id = sprintf("modal-%s",id),
        tabindex = "-1",
        role = "dialog",
        `aria-labelledby` = sprintf("modal-%s",id),
        `aria-hidden` = "true",
        'data-bs-keyboard'="false",
        'data-bs-backdrop'="static",
        tags$div(
            class = paste("modal-dialog", modal_size),
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

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_login_news_modal <- function(title = NULL, ...,
                                news,
                           left_footer = NULL,
                           right_footer = NULL,
                           brand = NULL,
                           header = NULL,
                           background_color = NULL,
                           icon = NULL) {

    above_icon <- NULL
    if (!is.null(icon)) above_icon <- tags$i(class = paste("fa", icon))

    above_content <- tags$div(
        class = "py-4 text-center",
        tags$a(
            class = "link-fx fw-bold",
            href = "#",
            above_icon,
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

    news_tags <- news %>% purrr::map2(
        names(news),
        function(content, title) {
            tagList(
                span(tags$b(title), br(), content),
                br(), br()
            )
        }
    )

    modal <- tags$div(
        class = "modal",
        style = glue::glue('background-color: {background_color}'),
        id = "shiny-modal",#sprintf("modal-%s",id),
        tabindex = "-1",
        #role = "dialog",
        #`aria-labelledby` = sprintf("modal-%s",id),
        `aria-hidden` = "true",
        `data-bs-keyboard`="false",
        `data-bs-backdrop`="static",
        tags$div(
            class = "modal-dialog modal-xl",
            #role = "document",
            tags$div(
                class = "modal-content",
                above_content,
                tags$div(
                    class = "block block-rounded shadow-none mb-2",
                    style = 'width: 70%; margin: 0 auto;
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
                        class = "modal-body block-content fs-sm mb-2",
                        cb_row(
                            cb_col6(
                                style = 'padding-right: 30px; padding-left: 30px;
                                border-right: 1px solid #e4e7ed;',
                                ...
                            ),
                            cb_col6(
                                style = 'padding-right: 30px; padding-left: 30px;',
                                tags$div(
                                    cb_content_heading('Latest News') %>%
                                        tagAppendAttributes(class='pt-0 mb-0',
                                                            style='color: #0891b2;
                                                            border-bottom: none;'),
                                    news_tags
                                )
                            )
                        )

                    ),
                    ## end content
                    cb_row(
                        cb_col6(
                            tags$div(
                                class = "block-content block-content-full block-content-sm border-top",
                                left_footer
                            )
                        ),
                        cb_col6(
                            tags$div(
                                class = "block-content block-content-full block-content-sm text-end border-top",
                                right_footer
                            )
                        )
                    )

                )
            )
        ),
        tags$script(HTML(
            "if (window.bootstrap && !window.bootstrap.Modal.VERSION.match(/^4\\./)) {
         var modal = new bootstrap.Modal(document.getElementById('shiny-modal'));
         modal.show();
      } else {
         $('#shiny-modal').modal().focus();
      }"
        ))
    )

    tagList(
        modal
    )
}
