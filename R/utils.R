#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
is_valid_email <- function(x) {
    grepl("\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>", as.character(x), ignore.case=TRUE)
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
add_css_class <- function(tag, class, selector = NULL) {
    if (!is.null(selector)) {
        htmltools::tagQuery(tag)$find(selector)$addClass(class)$allTags()
    } else {
        htmltools::tagQuery(tag)$addClass(class)$allTags()
    }
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
remove_css_class <- function(tag, class, selector = NULL) {
    if (!is.null(selector)) {
        htmltools::tagQuery(tag)$find(selector)$removeClass(class)$allTags()
    } else {
        htmltools::tagQuery(tag)$removeClass(class)$allTags()
    }
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
replace_css_class <- function(tag, old_class, new_class, selector = NULL) {
    tag %>%
        remove_css_class(old_class, selector) %>%
        add_css_class(new_class, selector)
}

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
validate_icon <- function(icon, fw = FALSE, opacity = NULL) {
    if (is.character(icon)) {
        myclass <- 'fa'
        if (fw) myclass <- paste(myclass, 'fa-fw')
        myclass <- paste0(myclass, ' fa-', icon)
        if (!is.null(opacity)) myclass <- paste0(myclass, ' opacity-', opacity)
        icon <- tags$i(class=myclass)
        #icon <- shiny::icon(icon, verify_fa=FALSE)
    }
    icon
}
