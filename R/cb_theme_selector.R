#' Title
#'
#' @return
#' @export
#'
#' @examples
cb_theme_selector <- function() {
    tags$div(
        class = "block block-rounded",
        tags$div(
            class = "block-content",
            tags$div(
                #class = "row items-push text-center",
                class = "row text-center",
                tags$div(
                    class = "col-6 col-md-6 col-xl-2",
                    tags$a(
                        class = "item item-circle bg-default text-white-75 mx-auto mb-3 active",
                        `data-toggle` = "theme",
                        `data-theme` = "codebase-5.3/css/codebase.min.css",
                        href = "javascript:void(0)",
                        id = "click_codebase",
                        tags$i(class = "fa fa-paint-brush")
                    ),
                    tags$div(
                        class = "fw-semibold",
                        "Default"
                    )
                ),
                tags$div(
                    class = "col-6 col-md-6 col-xl-2",
                    tags$a(
                        class = "item item-circle bg-elegance text-white-75 mx-auto mb-3",
                        `data-toggle` = "theme",
                        `data-theme` = "codebase-5.3/css/themes/elegance.min.css",
                        href = "javascript:void(0)",
                        id = "click_elegance",
                        tags$i(class = "fa fa-paint-brush")
                    ),
                    tags$div(
                        class = "fw-semibold",
                        "Elegance"
                    )
                ),
                tags$div(
                    class = "col-6 col-md-6 col-xl-2",
                    tags$a(
                        class = "item item-circle bg-pulse text-white-75 mx-auto mb-3",
                        `data-toggle` = "theme",
                        `data-theme` = "codebase-5.3/css/themes/pulse.min.css",
                        href = "javascript:void(0)",
                        id = "click_pulse",
                        tags$i(class = "fa fa-paint-brush")
                    ),
                    tags$div(
                        class = "fw-semibold",
                        "Pulse"
                    )
                ),
                tags$div(
                    class = "col-6 col-md-6 col-xl-2",
                    tags$a(
                        class = "item item-circle bg-flat text-white-75 mx-auto mb-3",
                        `data-toggle` = "theme",
                        `data-theme` = "codebase-5.3/css/themes/flat.min.css",
                        href = "javascript:void(0)",
                        id = "click_flat",
                        tags$i(class = "fa fa-paint-brush")
                    ),
                    tags$div(
                        class = "fw-semibold",
                        "Flat"
                    )
                ),
                tags$div(
                    class = "col-6 col-md-6 col-xl-2",
                    tags$a(
                        class = "item item-circle bg-corporate text-white-75 mx-auto mb-3",
                        `data-toggle` = "theme",
                        `data-theme` = "codebase-5.3/css/themes/corporate.min.css",
                        href = "javascript:void(0)",
                        id = "click_corporate",
                        tags$i(class = "fa fa-paint-brush")
                    ),
                    tags$div(
                        class = "fw-semibold",
                        "Corporate"
                    )
                ),
                tags$div(
                    class = "col-6 col-md-6 col-xl-2",
                    tags$a(
                        class = "item item-circle bg-earth text-white-75 mx-auto mb-3",
                        `data-toggle` = "theme",
                        `data-theme` = "codebase-5.3/css/themes/earth.min.css",
                        href = "javascript:void(0)",
                        id = "click_earth",
                        tags$i(class = "fa fa-paint-brush")
                    ),
                    tags$div(
                        class = "fw-semibold",
                        "Earth"
                    )
                )
            )
        )
    )
}
