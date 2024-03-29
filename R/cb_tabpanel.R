
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_pillpanel <- function(..., options = NULL) {
    tabs <- list(...)

    cb_tab_title_tags <- lapply(tabs, function(x) x[['title']])
    cb_tab_content_tags <- lapply(tabs, function(x) x[['content']])

    # make the first tab title active
    cb_tab_title_tags[[1]] <- tagQuery(
        cb_tab_title_tags[[1]]
    )$find(
        '.nav-link'
    )$addClass(
        'active'
    )$removeAttrs(
        'aria-selected'
    )$addAttrs(
        'aria-selected'='true'
    )$addAttrs(
        'tabindex'='0'
    )$allTags()

    # make the first tab content active
    cb_tab_content_tags[[1]] <- tagQuery(
        cb_tab_content_tags[[1]]
    )$addClass(
        'active show'
    )$removeAttrs(
        'tabindex'
    )$addAttrs(
        'tabindex' = '0'
    )$allTags()


    tabpanel_header <- tags$ul(
        class = "nav nav-pills justify-content-center space-x-1",
        role = "tablist",
        cb_tab_title_tags
    )

    tabpanel_header <- tags$div(
        class = "px-4 py-2 bg-body-extra-light mb-3 rounded push pillpanel-header",
        tabpanel_header
    )


    tagList(
        tabpanel_header,
        tags$div(
            class = "block block-rounded overflow-hidden pillpanel-tab",
            tags$div(
                class = "block-content tab-content",
                cb_tab_content_tags
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
cb_tabpanel <- function(..., options = NULL, pills = FALSE) {
    tabs <- list(...)

    cb_tab_title_tags <- lapply(tabs, function(x) x[['title']])
    cb_tab_content_tags <- lapply(tabs, function(x) x[['content']])

    # make the first tab title active
    cb_tab_title_tags[[1]] <- tagQuery(
        cb_tab_title_tags[[1]]
    )$find(
        '.nav-link'
    )$addClass(
        'active'
    )$removeAttrs(
        'aria-selected'
    )$addAttrs(
        'aria-selected'='true'
    )$addAttrs(
        'tabindex'='0'
    )$allTags()

    # make the first tab content active
    cb_tab_content_tags[[1]] <- tagQuery(
        cb_tab_content_tags[[1]]
    )$addClass(
        'active show'
    )$removeAttrs(
        'tabindex'
    )$addAttrs(
        'tabindex' = '0'
    )$allTags()

    tabpanel_header <- tags$ul(
        class = "nav nav-tabs nav-tabs-block align-items-center",
        role = "tablist",
        cb_tab_title_tags
    )

    if (!is.null(options)) {
        # add options
        tabpanel_header <- tagAppendChild(
            tabpanel_header,
            options
        )
    }

    tags$div(
        class = "block block-rounded overflow-hidden",
        tabpanel_header,
        tags$div(
            class = "block-content tab-content",
            cb_tab_content_tags
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
cb_tab <- function(id, title, content, icon = NULL) {
    cb_tab_title <- .cb_tab_title(id, title, icon)
    cb_tab_content <- .cb_tab_content(id, content)

    list(
        title = cb_tab_title,
        content = cb_tab_content
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
cb_tabpanel_options <- function(...) {
    tags$li(
        class = 'nav-item ms-auto',
        tags$div(
            class = 'btn-group btn-group-sm pe-2',
            ...
        )
    )
}

.cb_tab_title <- function(id, title, icon = NULL) {
    if (!is.null(icon)) icon <- validate_icon(icon)

    tags$li(
        class = "nav-item",
        role = "presentation",
        tags$button(
            class = "nav-link",
            id = sprintf("btabs-static-%s-tab", id),
            `data-bs-toggle` = "tab",
            `data-bs-target` = sprintf("#btabs-static-%s", id),
            role = "tab",
            `aria-controls` = sprintf("btabs-static-%s", id),
            `aria-selected` = "false",
            tabindex = "-1",
            icon,
            title
        )
    )
}

.cb_tab_content <- function(id, content) {
    tags$div(
        class = "tab-pane",
        id = sprintf("btabs-static-%s", id),
        role = "tabpanel",
        `aria-labelledby` = sprintf("btabs-static-%s-tab", id),
        tabindex = "-1",
        content
    )
}


