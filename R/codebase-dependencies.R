#' codebase dependencies utils
#'
#' @description This function attaches codebase dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_codebase_deps <- function(tag,
                              theme = c('none', 'corporate','earth',
                                        'elegance','flat','pulse')) {
    theme <- match.arg(theme)
    stylesheet <- c('js/plugins/highlightjs/styles/github-gist.css',
                    'js/plugins/nestable2/jquery.nestable.min.css',
                    'js/plugins/select2/css/select2.min.css',
                    'js/plugins/ion-rangeslider/css/ion.rangeSlider.css',
                    'css/codebase.min.css')
    if (theme != 'none') {
        stylesheet <- c(stylesheet, sprintf('css/themes/%s.min.css',theme))
    }

    codebase_deps <- htmlDependency(
        name = "codebase",
        version = "5.3",
        src = "codebase5.3/assets/",
        script = c(
            'js/codebase.app.min.js',
            'js/plugins/chart.js/chart.min.js',
            'js/pages/be_pages_dashboard.min.js',
            #'js/lib/jquery.min.js',
            'js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js',
            'js/plugins/select2/js/select2.full.min.js',
            'js/plugins/nestable2/jquery.nestable.min.js',
            'js/pages/be_comp_nestable.min.js', # not sure if needed
            'js/plugins/highlightjs/highlight.pack.min.js'
        ),
        stylesheet = stylesheet,
        package = 'cbdash'
    )
    tagList(tag, codebase_deps)
}