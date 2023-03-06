
#' Title
#'
#' @param title
#' @param subtitle
#'
#' @return
#' @export
#'
#' @examples
cb_item_block <- function(id, title, subtitle) {
    tags$div(
        class="block block-rounded block-mode-hidden",
        id = id,
        tags$div(
            class="block-header block-header-default",
            tags$h3(
                class="block-title",
                title,
                tags$small(
                    subtitle
                )
            ),
            tags$div(
                class="block-options",
                tags$button(
                    type="button",
                    class="btn-block-option",
                    onclick=glue::glue("Codebase.block('content_toggle', '#{id}');"),
                    tags$i(class="si si-arrow-down")
                )
            )
        ),
        tags$div(
            class = "block-content",
            tags$p(
                'Dolor posuere proin blandit accumsan senectus netus nullam curae,
            ornare laoreet adipiscing luctus mauris adipiscing pretium eget
            fermentum, tristique lobortis est ut metus lobortis tortor tincidunt
            himenaeos habitant quis dictumst proin odio sagittis purus mi, nec
            taciti vestibulum quis in sit varius lorem sit metus mi'
            )
        )
    )
}
