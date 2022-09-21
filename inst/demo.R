devtools::load_all()
library(shiny)
library(htmltools)
library(shinyjs)

ui <- cb_page(
    theme = 'flat',
    navbar = cb_navbar(
        brand = cb_navbar_brand(
            'aba', 'Cloud', 'cloud'
        ),
        user = cb_button(
            id = 'btn_new_project',
            label = 'New Project',
            icon = 'plus',
            color = 'info',
            alt = TRUE
        ),
        menu = cb_navbar_menu(
            cb_navbar_item('page_home', 'Home', icon='house'),
            cb_navbar_heading('Analyze'),
            cb_navbar_item('page_datasets', 'Datasets', icon=shiny::icon('line-chart')),
            cb_navbar_item('page_analysis', 'Analysis', icon=shiny::icon('line-chart')),
            cb_navbar_item('page_visualizations', 'Visualization', icon=shiny::icon('line-chart')),
            cb_navbar_heading('Organize'),
            cb_navbar_item('page_projects', 'Projects', icon=shiny::icon('line-chart')),
            cb_navbar_item('page_all_projects', 'Pipelines', icon=shiny::icon('line-chart')),
            cb_navbar_heading('Learn'),
            cb_navbar_item('page_stats_corner', 'Stats Corner', icon=shiny::icon('line-chart')),
            cb_navbar_item('page_stats_corner', 'Tutorials', icon=shiny::icon('line-chart')),
            # hidden pages
            shinyjs::hidden(cb_navbar_item('page_new_project')),
            shinyjs::hidden(cb_navbar_item('page_view_project'))
        ),
        footer = cb_navbar_footer(
            cb_button(id = 'page_user', icon='user', color='info', alt=T, size='sm'),
            cb_button(id = 'page_settings', icon='gear', color='info', alt=T, size='sm'),
            cb_button(id='page_help', icon='question', color='info', alt=T, size='sm')
        )
    ),
    header = cb_header(
        cb_header_dropdown(
            id = 'project_dd',
            title = 'No active project',
            subtitle = 'Recent projects',
            options = c('New Project (1)', 'New Project (2)', 'New Project (3)')
        )
    ),
    body = cb_body(
        cb_body_page(
            id = 'page_home',
            cb_row(
                cb_col8(
                    cb_content_block(title = 'Welcome to aba Cloud',
                                     subtitle=tags$div('Explore your modules, add-ons, and projects.'))
                ),
                cb_col4(
                    cb_content_block(
                        title = NULL,
                        subtitle=tags$div(
                            tags$div(shiny::actionLink('xx','Getting Started')),
                            tags$div(shiny::actionLink('xx','Latest Updates')),
                            tags$div(shiny::actionLink('xx','About Us'))
                        )
                    ) %>% tagAppendAttributes(style = 'background-color: transparent;')
                )
            ),
            cb_content_heading('Available Modules', cb_button('add','Explore all modules',
                                                      alt = TRUE, icon = 'arrow-right',
                                                      icon_right = TRUE,
                                                     size='sm', color='success')),
            cb_row(
                cb_hovercard(id='my_hcard', title='Core Statistics',
                             subtitle='Fit regression and classification models', icon='chart-bar',
                             bg_color ='#eefcff'),
                cb_hovercard(id='my_hcard', title='Plan Creator',
                             subtitle='Build your statistical methods section or SAP', icon='chart-bar',
                             bg_color ='#eefcff'),
                cb_hovercard(id='my_hcard', title='Biomarkers',
                             subtitle='Perform analysis specific to biomarker data', icon='chart-bar',
                             bg_color ='#eefcff'),
                cb_hovercard(id='my_hcard', title='Clinical Trials',
                             subtitle='Perform ANCOVA, MMRM & more on trial data', icon='chart-bar',
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
                cb_project_block_demo(),
                #cb_project_block(),
                #cb_project_block()
            ),
            modals = list(
                cb_modal_dialog(id = 'test_modal',
                                title = 'Test Modal',
                                tags$div(
                                    tags$p("nick nicksd sfsd"),
                                    tags$p("Dolor posuere proin blandit accumsan senectus netus nullam curae, ornare laoreet adipiscing luctus mauris adipiscing pretium eget fermentum, tristique lobortis est ut metus lobortis tortor tincidunt himenaeos habitant quis dictumst proin odio sagittis purus mi, nec taciti vestibulum quis in sit varius lorem sit metus mi.")
                                ))
            )
        ),
        cb_body_page(
            id = 'page_new_project',
            cb_row(
                cb_col12(
                    cb_card(
                        title = 'Create New Project',
                        cb_row(
                            cb_col3(
                                cb_muted_text('Projects are how work is organized.
                                They consist of plans, models, and visualizations.')
                            ),
                            cb_col8(
                                offset = 1,
                                cb_row(
                                    cb_col6(
                                        cb_text_input(id = 'project_name', label='Project Name',
                                                      width ='100%')
                                    )
                                ),
                                cb_row(
                                    cb_col12(
                                        cb_text_input(id = 'project_name', label='Project Description',
                                                      placeholder = 'This project is about...',
                                                      width = '100%')
                                    )
                                ),
                                cb_row(
                                    cb_col12(
                                        cb_button(id = 'create_project', label = 'Create Project',
                                                  icon = 'plus', color = 'success',
                                                  alt = T, size = 'lg', width='100%')
                                    )
                                )
                            )
                        )
                    )
                )
            )

        ),
        cb_body_page(
            id = 'page_analysis',
            cb_row(cb_col6(cb_card(title = 'Data',
                                   tags$div(
                                       cb_file_input('my_input',NULL)
                                   )))),
            cb_row(
                cb_col6(cb_card(title = 'Data', p('This is the data card'))),
                cb_col6(cb_card(title = 'Data', p('This is the data card')))
            )
        ),
        cb_body_page(
            id = 'stats',
            cb_hovercard(id='my_hcard2', title='3 Active', subtitle='Domains', icon='globe'),
            cb_tabpanel(
                cb_tab('home','HOME',tagList(p('my home'))),
                cb_tab('home2','HOME2',p('my home2')),
                options = cb_tabpanel_options(
                    cb_button(id = 'tabbtn1', icon='minus', color='secondary', alt=T),
                    cb_button(id='tabbtn3', icon='plus', color='secondary', alt=T),
                    cb_dropdown(
                        id = 'mydropdown',
                        label=NULL,
                        icon = 'gear',
                        actions = c('enable2', 'disable2', NA, 'do nothing2'),
                        alt = TRUE,
                        color = 'secondary'
                    )
                )
            )
        )
    )
)

server <- function(input, output, session) {

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
            cb_launch_modal(id = 'test_modal')
        }
    )

    observeEvent(
        input$launch_modal2, {
            # create the modal
            dialog <- cb_modal_dialog(
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
