cb_slider_input <- function(id, label, min, max, value) {
    el <- shiny::sliderInput(
        id, label, min, max, value
    )
    el <- replace_css_class(el, 'control-label', 'form-label', 'label')
    el <- tagQuery(el)$find('input')$removeAttrs(c('data-grid','data-prettify-enabled',
                                                   'data-skin'))$allTags()
    el <- add_css_class(el, 'js-rangeslider','input')
    el <- add_css_class(el, 'mb-5')
    el <- add_css_class(el, 'mb-4', 'label')
    el
}
