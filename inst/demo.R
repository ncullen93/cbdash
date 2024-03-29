devtools::load_all()
library(shiny)
library(htmltools)
library(shinyjs)
library(tidyverse)
library(reactable)
library(waiter)

project_df <- data.frame(
    user = 'nickcullen',
    name = c('project1', 'project2'),
    description = c('my first project', 'my second project'),
    date_created = c('09/21/2022', '09/22/2022')
    #date_last_updated <- c('09/21/2022', '09/23/2022')
)

#project_df <- project_df %>%
#    mutate(
#        serial_no = row_number(),
#        actionable = glue('<button id="custom_btn" onclick="Shiny.onInputChange(\'button_id\', \'{serial_no}\')">Click</button>')
#    )


ui <- cb_page(
    #auth = cb_login_ui(
    #    brand = c('sigatur','Cloud'),
    #    title = tags$span('The future is',
    #                      tags$s('bright'), 'Shiny!'),
    #    contact = 'info@sigatur.com'
    #),
    theme = 'flat',
    dependencies = list(firebase::useFirebase(), waiter::useWaiter()),
    navbar = cb_navbar(
        mini = T,
        brand = cb_navbar_brand(
            'sigatur', 'Cloud', 'cloud'
        ),
        user = cb_button(
            id = 'btn_new_project',
            label = 'New Project',
            icon = 'rocket',
            color = 'info',
            alt = TRUE
        ),
        menu = cb_navbar_menu(
            cb_navbar_item('page_home', 'Home', icon='house'),
            cb_navbar_heading('Analyze'),
            cb_navbar_item('page_datasets', 'Datasets', icon=shiny::icon('chart-line')),
            cb_navbar_item('page_analysis', 'Analysis', icon=shiny::icon('chart-line')),
            cb_navbar_item('page_visualizations', 'Visualization', icon=shiny::icon('chart-line')),
            cb_navbar_heading('Organize'),
            cb_navbar_item('page_projects', 'Projects', icon=shiny::icon('chart-line')),
            cb_navbar_item('page_all_projects', 'Pipelines', icon=shiny::icon('chart-line')),
            cb_navbar_heading('Learn'),
            cb_navbar_item('page_stats_corner', 'Stats Corner', icon=shiny::icon('chart-line')),
            cb_navbar_item('page_stats_corner', 'Tutorials', icon=shiny::icon('chart-line')),
            # hidden pages
            shinyjs::hidden(cb_navbar_item('page_new_project')),
            shinyjs::hidden(cb_navbar_item('page_view_project'))
        )
        #footer = cb_navbar_footer(
        #    #cb_button(id = 'page_user', icon='user', color='info', alt=T, size='sm'),
        #    #cb_button(id = 'page_settings', icon='gear', color='info', alt=T, size='sm'),
        #   # cb_button(id='page_help', icon='question', color='info', alt=T, size='sm')
        #)
    ),
    header = cb_header(
        cb_header_dropdown(
            id = 'project_dd',
            title = 'header_title',
            options = c('Profile', 'Settings', NA, 'Logout'),
            icons = c('user', 'gear', NA, 'sign-out-alt'),
            reactive_title = TRUE
        )
    ),
    body = cb_body(
        cb_body_page(
            id = 'page_home',
            tags$div(cb_item_block(id='cb0', title = 'My title', subtitle = 'My subtitle2')),
            cb_item_block(id='cb2322', title = 'My title2', subtitle = 'My subtitle2'),
            shiny::uiOutput('my_item_block'),
            cb_card(
                'slider',
                cb_slider_input('kMax','kMax',1,10,3)
            ),
            cb_button('launch_modal' ,'Launch modal'),
            cb_content_heading('Available Modules', cb_button('add','Explore all modules',
                                                      alt = TRUE, icon = 'arrow-right',
                                                      icon_right = TRUE,
                                                     size='sm', color='success')),
            cb_row(
                cb_hovercard(
                    id='stats_card',
                    title='Core Statistics',
                    #subtitle='Fit regression and classification models',
                    icon='chart-bar'
                ),
                cb_hovercard(id='my_hcard', title='Plan Creator',
                             #subtitle='Build your statistical methods section or SAP',
                             icon='chart-bar',
                             bg_color ='#eefcff'),
                cb_hovercard(id='my_hcard', title='Biomarkers',
                             subtitle='Perform analysis specific to biomarker data',
                             icon='chart-bar',
                             bg_color ='#eefcff'),
                cb_hovercard(id='my_hcard', title='Data Processing',
                             subtitle='Perform ANCOVA, MMRM & more on trial data',
                             icon='chart-bar',
                             bg_color ='#eefcff')
                #cb_hovercard_placeholder(id = 'my_hcard2', title = 'Explore...',
                #                         subtitle = 'Add new modules',
                #                         icon = 'globe')
            ),
            cb_content_heading('Available Add-ons',
                               cb_button('add','Explore all add-ons',
                                         alt = TRUE, icon = 'arrow-right',
                                         icon_right = TRUE,
                                         size='sm', color='success')),
            cb_row(
                cb_hovercard(id='my_hcard', title='Remote Upload',
                             subtitle='Use our R package to analyze data locally', icon='chart-bar',
                             bg_color ='#eef1ff'),
                cb_hovercard(id='my_hcard', title='Code Export',
                             subtitle='Generate complete scripts from all analyses', icon='chart-bar',
                             bg_color ='#eef1ff'),
                cb_hovercard(id='my_hcard', title='Public Datasets',
                             subtitle='Import & analyze publicly available data', icon='chart-bar',
                             bg_color ='#eef1ff'),
                cb_hovercard(id='my_hcard', title='Collaboration',
                             subtitle='Invite other users to work on your projects', icon='chart-bar',
                             bg_color ='#eef1ff')
            ),
            cb_content_heading('Ongoing Projects', cb_button('add','View all projects',
                                                               alt = TRUE, icon='arrow-right',
                                                             icon_right = TRUE,
                                                              size='sm', color='success')),
            tags$div(


                #cb_project_block()
            ),
            modals = list(
                cb_modal(id = 'test_modal',
                                title = 'Test Modal',
                         size = 'lg',
                                tags$div(
                                    tags$p("nick nicksd sfsd"),
                                    tags$p("Dolor posuere proin blandit accumsan senectus netus nullam curae, ornare laoreet adipiscing luctus mauris adipiscing pretium eget fermentum, tristique lobortis est ut metus lobortis tortor tincidunt himenaeos habitant quis dictumst proin odio sagittis purus mi, nec taciti vestibulum quis in sit varius lorem sit metus mi.")
                                ))
            )
        )
    )
)

server <- function(input, output, session) {

    output$my_item_block <- shiny::renderUI({
        tagList(cb_item_block(id='cb1', title = 'My title3', subtitle = 'My subtitle3'))
    })
    observeEvent(
        input$stats_card, {
            print('stats card clicked')
        }
    )

    #user <- cb_login_server()
    user <- reactive({list('email'='nickcullen31@gmail.com')})#

    output$header_title <- shiny::renderText({
        user()$email
    })

    observeEvent(
        input$Logout, {
            #print('signing out')
            user()$logout()
        }
    )

    observeEvent(
        user(),
        {
            #print('here')
            #print(user())
            #print(names(input))
        }
    )


    observeEvent(
        input$Profile, {
            #print('profile clicked')
        }
    )

    observeEvent(
        input$Settings, {
            #print('Settings clicked')
        }
    )
   # f <- firebase::FirebaseSocial$new()
   # f2 <- firebase::FirebaseEmailPassword$new()
#
   # cb_launch_modal(id = 'login')
#
   # observeEvent(
   #     input$google, {
   #         print('here')
   #         f$launch_google()
   #     }
   # )
#
   # observeEvent(
   #     input$signin_account_email, {
   #         f2$sign_in(input$email, input$password)
   #     }
   # )
#
   # observeEvent(
   #     input$create_account_email, {
   #         f2$create(input$email, input$password)
   #     }
   # )

    projects <- c('test','test2')

    #lapply(
    #    projects,
    #    function(p) {
    #        observeEvent(
    #            input[[paste0(p,'btn_view')]], {
    #                print(paste(p, ' view pressed'))
    #            }
    #        )
    #        observeEvent(
    #            input[[paste0(p,'btn_archive')]], {
    #                print(paste(p, ' archive pressed'))
    #            }
    #        )
    #    }
    #)

    #observeEvent(
    #    input$project_block_view_test, {
    #        print('view btn pressed')
    #    }
    #)

    observeEvent(
        input$button_id,
        {
            print('btn 1 pressed')
            print(input$button_id)
        }
    )

    output$mytable <- renderTable(
        {
            project_df
        },
        width = '100%',
        striped = TRUE,
        spacing = 'l'
    )


    output$mytable2 <- DT::renderDT(
        {
           onclick <- sprintf(
               "Shiny.setInputValue('myclick', '%s')",
               rownames(project_df)
           )

           #button = sprintf(
           #    "<a class='btn btn-primary' onClick='%s'>Click me</a>",
           #    onclick
           #)

           #project_df$button <- button
           #
            project_df$button <- rownames(project_df) %>%
                purrr::map_chr(
                    function(x) {as.character(
                        tagAppendAttributes(cb_button('clickme','click me'),
                                            onClick=sprintf("Shiny.setInputValue('myclick', '%s')",
                                                            x))
                    )}
                )

            print(project_df)

            DT::datatable(
                project_df,
                width = '100%',
                # class = 'display table',
                rownames = FALSE,
                escape = FALSE,
                selection = "none"
                #options = list(
                #    searching = FALSE
                #)
            )



        }
    )

    observeEvent(
        input$myclick, {
            print(input$myclick)
        }
    )


    output$mytable3 <- reactable::renderReactable(
        {
            reactable(
                project_df, resizable = TRUE, showPageInfo = FALSE, selection = "single",
                onClick = "select", borderless = TRUE, striped = TRUE, highlight = TRUE,
                theme =  reactableTheme(borderColor = "#dfe2e5", stripedColor = "#f6f8fa",
                                        highlightColor = "#f0f5f9", cellPadding = "20px 10px")
            )
        }
    )

    observeEvent(
        input$btn_new_project, {
            print('new project')
            cb_activate_body_page(id = 'page_new_project')
        }
    )

    observeEvent(
        input$demobtn, {
            print('card clicked')
            cb_activate_body_page(id = 'page_analysis')
        }
    )

    observeEvent(
        input$showmodule, {
            shinyjs::show(id = 'module_dd')
        }
    )

    observeEvent(
        input$myselect, {
            print(input$myselect)
        }
    )
    observeEvent(
        input$myslider, {
            print(input$myslider)
        }
    )
    observeEvent(
        input$my_hcard, {
            print('card clicked')
            cb_activate_body_page(id = 'stats')
        }
    )

    observeEvent(
        input$my_hcard2, {
            print('card clicked')
            cb_activate_body_page(id = 'home')
        }
    )

    observeEvent(
        input$file_upload, {
            filename <- input$file_upload$datapath
            extension <- tools::file_ext(input$file_upload$name)
            print(extension)
            df <- switch(extension,
                         csv = vroom::vroom(filename, delim = ",", show_col_types = F),
                         tsv = vroom::vroom(filename, delim = "\t", show_col_types = F),
                         xls = readxl::read_xls(filename),
                         xlsx = readxl::read_xlsx(filename),
                         validate("Invalid file; Please upload a .csv, .tsv, or excel file")
            )

            print(df)
        }
    )

    observeEvent(
        input$check_elements, {
            print(input$txtinput)
            print(input$txtinput2)
            print(input$myinput)
            print(input$myinput2)
        }
    )

    observeEvent(
        input$launch_modal, {
            cb_show_modal(id = 'test_modal')
        }
    )

    observeEvent(
        input$launch_modal2, {
            # create the modal
            dialog <- cb_modal(
                id = 'my_modal2',
                title = 'test modal 2',
                tags$p('this is a modal test!!')
            )
            # launch it
            cb_launch_modal(dialog)
        }
    )

    observeEvent(
        input$tabbtn1, {
            print('tab btn1')
        }
    )

    observeEvent(
        input$tabbtn3, {
            print('tab btn 3')
        }
    )

    observeEvent(
        input$enable2, {
            print('enable 2')
        }
    )
    observeEvent(
        input$`do nothing`, {
            print('doing nothing')
        }
    )

    observeEvent(
        input$enable, {
            shinyjs::enable('xx')
        }
    )
    observeEvent(
        input$disable, {
            shinyjs::disable('xx')
        }
    )

    observeEvent(
        input$xx, {
            print('xx')
        }
    )

    observeEvent(
        input$xx2, {
            print('xx2')
        }
    )

    observeEvent(
        input$xx3, {
            shinyjs::enable(id = 'xx')
        }
    )
}

shinyApp(ui, server)
