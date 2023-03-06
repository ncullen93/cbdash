
#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
is_button <- function(el) {
    (class(el)[1] == 'shiny.tag') & (el$name == 'button')
}

# check if a cb_navbar() object is mini or not
is_mini <- function(navbar) {
    'mini-sidebar' %in%
        strsplit(navbar$attribs$class, ' ', fixed=T)[[1]]
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_navbar <- function(brand = NULL, user = NULL, menu, footer = NULL,
                      mini = FALSE, width = 250) {
    if (!is.null(user)) {
            if (is_button(user)) {
        user <- add_css_class(
            user,
            'w-100 push d-flex align-items-center justify-content-between'
        )
        # put icon on the right side
        user$children <- list(user$children[[2]], user$children[[1]])
        user_icon <- user$children[[2]]
        user_icon <- add_css_class(
            user_icon,
            'nav-main-link-icon'
        )
    }
    } else {user_icon <- NULL}


    if (!is.null(footer)) {
        footer <- tags$div(
            style = 'width: 100%; text-align: center;
                        margin-bottom: 10px;',
            class = 'fixed-bottom',
            footer
        )
    }

    navclass <- ifelse(mini, 'mini-sidebar', 'normal-sidebar')
    tags$nav(
        id = "sidebar",
        class = navclass,
        style = glue::glue('width: {width}px'),
        tags$div(
            class = "sidebar-content",
            brand,
            br(),
            tags$div(
                class = "js-sidebar-scroll",
                tags$div(
                    class = 'content-side content-side-user pl-4 pr-4',
                    style = glue::glue('min-height: 5.5rem; display: block; width: {width}px !important;'),
                    tags$div(
                        class = 'smini-visible-block py-2',
                        style = 'margin-left: -2px; color: rgba(255,255,255,.3);',
                        user_icon
                    ),
                    tags$div(
                        class = 'smini-hidden text-center mx-auto',
                        user
                    )
                ),
                tags$div(
                    class = "content-side content-side-full",
                    menu,
                    footer
                )
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
cb_navbar_brand <- function(title1 = NULL, title2 = NULL, icon=NULL, width = 250) {
    tags$div(
        id = "navbar-brand-content",
        class = "content-header justify-content-lg-center bg-black-10",
        style = glue::glue('width: {width}px !important;'),
        tags$div(
            tags$a(
                class = "link-fx fw-bold tracking-wide mx-auto",
                href = "#",
                tags$span(
                    tags$i(class = sprintf("fs-4 fa fa-%s text-primary", icon))
                ),
                tags$span(
                    class = "smini-hidden",
                    tags$span(
                        class = "fs-4 text-primary",
                        title1
                    ),
                    tags$span(
                        class = "fs-4 text-dual",
                        title2
                    )
                )
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
cb_navbar_footer <- function(...) {
    els <- list(...)
    el_width <- 75 / length(els)
    els <- lapply(els, function(el) {
        tagAppendAttributes(
            el,
            style=glue::glue(
                'display:inline-block; width: {el_width}%;'
            )
        )
    })
    els
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_navbar_menu <- function(...) {
    navbar <- tags$ul(
        class = "nav-main",
        role = "tablist",
        ...
    )

    # make the first tab active
    navbar <- tagQuery(
        navbar
    )$find(
        'a'
    )$filter(
        function(x,i) i==1
    )$addClass(
        'active'
    )$allTags()

    navbar
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_navbar_heading <- function(title) {
    tags$li(
        class = 'nav-main-heading',
        title
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
cb_navbar_item <- function(id, title = NULL, icon=NULL) {
    if (!is.null(icon)) {
        icon <- add_css_class(
            validate_icon(icon),
            'nav-main-link-icon'
        )
    }

    tags$li(
        class = "nav-main-item",
        tags$a(
            class = "nav-main-link",
            style = 'font-size: 1rem; font-weight: 250;',
            id = paste0('nav-link-',id),
            role = "tab",
            type = "button",
            `data-bs-toggle` = "pill",
            `data-bs-target` = paste0("#",id),
            icon,
            tags$span(
                class = "nav-main-link-name",
                title
            )
        )
    )
}
