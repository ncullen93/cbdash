
#' Title
#'
#' @param items
#'
#' @return
#' @export
#'
#' @examples
#' cb_nestable(
#'     items = list(
#'         'Datasets' = list(
#'             'dataset_1.csv',
#'             'dataset_2.csv'
#'         ),
#'         'Models' = list(
#'             'regression_model1',
#'             'regression_model2',
#'             'regression_model3'
#'         ),
#'         'Tables' = list(
#'             'table1',
#'             'table2'
#'         ),
#'         'Figures' = list(
#'             'figure1'
#'         ),
#'         'Plans' = list(
#'             'SAP1.pdf'
#'         ),
#'         'Other Documents' = list(
#'             'manuscript.docx'
#'         )
#'     )
#' )
cb_nestable <- function(items) {
    item_tags <- lapply(names(items), function(item_name) {
        tags$li(
            class = "dd-item",
            #`data-id` = "21",
            tags$div(
                class = "dd-handle",
                tags$i(class = "fa fa-folder text-warning me-1"),
                item_name,

            ),
            tags$ol(
                class = "dd-list",
                lapply(items[[item_name]], function(subitem) {
                    tags$li(
                        class = "dd-item",
                        #`data-id` = "21",
                        tags$div(
                            class = "dd-handle",
                            tags$i(class = "far fa-file-image text-info me-1"),
                            subitem
                        )
                    )
                })
            )
        )
    })

    tags$div(
        class = "block-content block-content-full",
        tags$div(
            class = "js-nestable-connected-treeview dd",
            tags$ol(
                class = "dd-list",
                item_tags
            )
        )
    )
}
