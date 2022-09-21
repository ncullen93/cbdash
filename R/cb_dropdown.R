cb_dropdown <- function(id, label = NULL, icon = NULL, actions,
                        color = c('primary','secondary','success','info','warning','danger'),
                        alt = FALSE) {

    color <- match.arg(color)

    action_tags <- lapply(
        actions,
        function(action) {
            if (is.na(action)) {
                tags$div(class="dropdown-divider")
            } else {
                add_css_class(
                    shiny::actionLink(
                        action,
                        action
                    ),
                    'dropdown-item'
                )
            }
        }
    )

    tags$div(
        class = "dropdown",
        tags$button(
            type = "button",
            class = glue::glue(
                "btn btn-{ ifelse(alt, 'alt-', '') }{color} dropdown-toggle"
            ),
            id = sprintf("dropdown-%s-primary", id),
            `data-bs-toggle` = "dropdown",
            `aria-haspopup` = "true",
            `aria-expanded` = "false",
            validate_icon(icon),
            label
        ),
        tags$div(
            class = "dropdown-menu fs-sm",
            `aria-labelledby` = sprintf("dropdown-%s-primary", id),
            style = NA,
            action_tags
        )
    )
}
