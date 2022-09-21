
#' Title
#'
#' @param language
#' @param code
#'
#' @return
#' @export
#'
#' @examples
#' cb_card(title='Code Example',cb_codeblock(
#'     language = 'r',
#'     'cb_codeblock <- function(language, code) {
#'     language <- tolower(language)
#'     tags$div(
#'         class="content content-full bg-light mb-5",
#'         tags$pre(
#'             class = "pre-sh",
#'             tags$code(
#'                 class = language,
#'                 code
#'             )
#'         )
#'     )
#' }
#' '
#' ))
cb_codeblock <- function(language, code) {
    language <- tolower(language)
    tags$div(
        class="content content-full bg-light",
        tags$pre(
            class = "pre-sh",
            tags$code(
                class = language,
                code
            )
        )
    )
}
