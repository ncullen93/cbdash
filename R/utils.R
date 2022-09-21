add_css_class <- function(tag, class, selector = NULL) {
    if (!is.null(selector)) {
        htmltools::tagQuery(tag)$find(selector)$addClass(class)$allTags()
    } else {
        htmltools::tagQuery(tag)$addClass(class)$allTags()
    }
}

# this should error if the class is not found, but it is currently silent
remove_css_class <- function(tag, class, selector = NULL) {
    if (!is.null(selector)) {
        htmltools::tagQuery(tag)$find(selector)$removeClass(class)$allTags()
    } else {
        htmltools::tagQuery(tag)$removeClass(class)$allTags()
    }
}

replace_css_class <- function(tag, old_class, new_class, selector = NULL) {
    tag %>%
        remove_css_class(old_class, selector) %>%
        add_css_class(new_class, selector)
}

validate_icon <- function(icon) {
    if (is.character(icon)) {
        icon <- shiny::icon(icon)
    }
    icon
}