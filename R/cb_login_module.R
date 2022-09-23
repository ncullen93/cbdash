#' login UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
cb_login_ui <- function(id = 'login'){
    ns <- NS(id)
    cb_login_modal(
        id = 'login_modal',
        title = 'Login',
        background_color = '#e4e7ed',
        brand = c('aba', 'online'),
        header = c(
            'Welcome to the ABA online application',
            'We make stats {relatively} fun for everyone!'
        ),
        cb_text_input(ns('email'),'Email', floating=T, width = '100%'),
        cb_text_input(ns('password'),'Password', floating=T, width = '100%'),
        cb_row(
            cb_col6(
                cb_button(ns("signin_account_email"), "Sign in", icon = "envelope",
                          color = 'info', width='100%'),
            ),
            cb_col6(
                cb_button(ns("create_account_email"), "Create", icon = "user",
                          color = 'success', width='100%')
            )
        ),
        hr(style='background-color: gray; height: 1px; border: none'),
        cb_row(
            cb_col12(
                cb_button(ns("google"), "Log in via Google", icon = icon("google"),color='danger', width='100%')
            )

        ),
        #cb_row(
        #    cb_col12(
        #        cb_button(ns("demo"), "Try a demo", icon = "user-lock",color='primary', width='100%')
        #    )
        #
        #),

        footer = tags$div(
            shiny::actionLink('xx', 'Forgot Password')
        )
    )

}

#' login Server Functions
#'
#' @noRd
cb_login_server <- function(id = 'login'){
    moduleServer( id, function(input, output, session){
        ns <- session$ns

        f <- firebase::FirebaseSocial$new()
        f2 <- firebase::FirebaseEmailPassword$new()

        cb_show_modal(id = 'login_modal', asis=T)

        # if google button pressed
        # then launch google signin
        observeEvent(
            input$google, {
                print('here')
                f$launch_google()
            }
        )

        # if sign-in button pressed
        # then launch email signin
        observeEvent(
            input$signin_account_email, {
                f2$sign_in(input$email, input$password)
            }
        )

        # if create account button pressed
        # then create the account and sign in
        observeEvent(
            input$create_account_email, {
                #cb_show_modal(id = 'login_modal', asis=T)
                #cb_show_modal(id = 'login_modal', asis=T)
#
                #print('here')
                #shinyjs::runjs("
                #               $('#modal-login_modal').dismiss()
                #               ")
                #f2$create(input$email, input$password)
            }
        )

        # if signed in
        # then hide dialog
        observeEvent(
            f$req_sign_in(), {
                print('here')
                #cb_show_modal(id = 'login_modal', asis=T)
                shinyjs::click(id = 'login_modal_close', asis=TRUE)
                print('there')
                #shinyjs::runjs("
                #               $('#modal-login_modal').dismiss()
                #               ")
            }
        )



    })
}

## To be copied in the UI
# mod_login_ui("login_1")

## To be copied in the server
# mod_login_server("login_1")
