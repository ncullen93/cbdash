

#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_text_input <- function(id, label, value = "", width = NULL, placeholder = NULL,
                          floating = FALSE, mb = 4) {
    if (floating) placeholder <- 'placeholder'
    el <- shiny::textInput(
        inputId = id,
        label = label,
        value = value,
        width = width,
        placeholder = placeholder
    )
    el <- tagQuery(el)$find('label')$removeClass('control-label')$addClass('form-label')$allTags()
    el <- tagQuery(el)$find('input')$addAttrs('name' = id)$allTags()
    if (mb > 0) el <- add_css_class(el, paste0('mb-',mb))
    if (floating) {
        el <- add_css_class(el, 'form-floating')
        # switch the label and the input positions
        label <- tagQuery(el)$find('label')$selectedTags()[[1]]
        input <- tagQuery(el)$find('input')$selectedTags()[[1]]
        el <- tagQuery(el)$empty()$append(list(input,label))$allTags()
    }
    el
}
# email input
cb_email_input <- function(id, label, value = "", width = NULL, placeholder = NULL,
                              floating = FALSE) {
    el <- cb_text_input(
        id, label, value, width, placeholder, floating
    )
    el <- tagQuery(el)$find('input')$removeAttrs('type')$addAttrs('type' = 'email')$allTags()
    el
}

# password input
cb_password_input <- function(id, label, value = "", width = NULL, placeholder = NULL,
                              floating = FALSE) {
    el <- cb_text_input(
        id, label, value, width, placeholder, floating
    )
    el <- tagQuery(el)$find('input')$removeAttrs('type')$addAttrs('type' = 'password')$allTags()
    el
}

# text area


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_select_input <- function(id, label, choices, selected = NULL,
                            multiple = FALSE, select2 = TRUE,
                            width = NULL, size = NULL, mb = 4) {
    el <- shiny::selectInput(
        inputId = id,
        label = label,
        choices = choices,
        selected = selected,
        multiple = multiple,
        selectize = FALSE,
        width = width,
        size = size
    )
    if (mb > 0) el <- add_css_class(el, paste0('mb-', mb))
    el <- replace_css_class(el, 'control-label', 'form-label', selector = 'label')
    el <- replace_css_class(el, 'form-control', 'form-select', selector = 'select')
    el$children[[2]] <- el$children[[2]]$children # remove div around select

    if (select2) {
        el <- add_css_class(el, 'js-select2 form-select', 'select')
    }
    el
}


# {inline} checkbox

# {inline} radio

# {inline} switch


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
cb_file_input <- function(id,
                          label,
                          multiple = FALSE,
                          accept = NULL,
                          width = '100%',
                          buttonLabel = "Browse...",
                          placeholder = "No file selected",
                          capture = NULL,
                          color = c('secondary', 'info', 'primary','success','warning','danger')) {
    color <- match.arg(color)
    el <- shiny::fileInput(
        inputId = id,
        label = label,
        multiple = multiple,
        accept = accept,
        width = width,
        buttonLabel = buttonLabel,
        placeholder = placeholder,
        capture = capture
    )
    el <- add_css_class(el, 'mb-4')
    el <- replace_css_class(el, 'control-label', 'form-label', selector=sprintf('#%s-label',id))
    el <- replace_css_class(el, 'btn-default',
                            sprintf('btn-alt-%s rounded-0 rounded-start',color),
                            selector = 'span')
    el <- add_css_class(el, 'form-control', 'input')
    return(el)
}


# input groups

