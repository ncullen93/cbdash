cb_card <- function(title, ..., subtitle = NULL) {
    if (!is.null(subtitle)) subtitle <- tags$small(subtitle)
    tags$div(
        class = "block block-rounded",
        style = 'padding: 0;',
        tags$div(
            class = "block-header block-header-default",
            tags$h3(
                class = "block-title",
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

