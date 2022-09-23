

#' Title
#'
#' @param id
#'
#' @return
#' @export
#'
#' @examples
cb_login_ui <- function(id = 'login'){
    ns <- NS(id)
    cb_login_news_modal(
        id = 'login_modal',
        title = 'Please sign in',
        background_color = '#e4e7ed',
        brand = c('aba', 'online'),
        header = c(
            'Welcome to the ABA online application',
            'We make stats {relatively} fun for everyone!'
        ),
        cb_email_input(ns('email'),'Email', floating=T, width = '100%'),
        cb_password_input(ns('password'),'Password', floating=T, width = '100%'),
        cb_row(
            cb_col6(
                cb_button(ns("signin_account_email"), "Log in",
                          color = 'info', width='100%'),
            ),
            cb_col6(
                cb_button(ns("create_account_email"), "Create", icon = "user",
                          icon_right = TRUE,
                          color = 'success', width='100%')
            )
        ),
        shiny::uiOutput(ns('error_ui')),
        shiny::uiOutput(ns('success_ui')),
        hr(style='background-color: gray; height: 1px; border: none'),
        cb_row(
            cb_col12(
                cb_button(ns("google"), "Log in via Google", icon = icon("google"),color='danger', width='100%')
            )

        ),
        footer = tags$div(
            shiny::actionLink(ns('forgot_password'), 'Forgot Password?')
        )
    )

}

#' Title
#'
#' @param id
#'
#' @return
#' @export
#'
#' @examples
cb_login_server <- function(id = 'login'){
    moduleServer( id, function(input, output, session){
        ns <- session$ns

        # events to implement
        # when auth fails, display a message to user
        # return user login info from this module
        # require user to accept terms when creating account

        r <- reactiveValues(new_account = FALSE,
                            user = NULL)

        f_google <- firebase::FirebaseSocial$new()
        f <- firebase::FirebaseEmailPassword$new()

        cb_show_modal(id = 'login_modal', asis=T)

        output$error_ui <- renderUI({
            req(r$active_error)
            tags$span(
                style = 'color: red;',
                r$error_message
            )
        })

        output$success_ui <- renderUI({
            req(r$active_success)
            tags$span(
                style = 'color: green;',
                r$success_message
            )
        })

        # if google button pressed
        # then launch google signin
        observeEvent(
            input$google, {
                f_google$launch_google()
            }
        )

        # if sign-in button pressed
        # then launch email signin
        observeEvent(
            input$signin_account_email, {
                f$sign_in(input$email, input$password)
            }
        )

        # if sign in failed
        # then notify user
        observeEvent(
            input$fireblaze_signed_up_user, {
                if (!is.null(input$fireblaze_signed_up_user$response$code)) {
                    r$active_error <- TRUE
                    r$error_message <- paste('Error logging in:',
                                             input$fireblaze_signed_up_user$response$code)
                } else {
                    r$active_error <- FALSE
                    r$active_success <- TRUE
                    r$success_message <- 'Authorization successful. Logging in...'
                }
            }
        )

        # if create account button pressed
        # then create the account and sign in
        observeEvent(
            input$create_account_email, {
                if (!is_valid_email(input$email)) {
                    r$active_error <- TRUE
                    r$error_message <- 'Please enter a valid email address'
                } else {
                    r$active_error <- FALSE
                    f$create(input$email, input$password)
                }
            }
        )

        # check if creation sucessful
        observeEvent(f$get_created(), {
          created <- f$get_created()

          if (!created$success) {
              r$active_error <- TRUE
              r$active_success <- FALSE
              r$error_message <- paste('Error creating account:', created$response$code)
          } else {
              r$active_error <- FALSE
              r$active_success <- TRUE
              r$success_message <- 'Account successfully created. Logging in...'
          }

          r$new_account <- TRUE
        })

        signout_fn <- function() {
            # sign the user out from firebase
            f$sign_out()

            # clear all inputs from the login modal


            # show the login modal again
            cb_show_modal(id = 'login_modal', asis=T)
            updateTextInput(inputId = ns('email'), value = '')
            updateTextInput(inputId = ns('password'), value = '')

        }
        # if signed in
        # then hide dialog
        observeEvent(
            f$req_sign_in(), {
               # print(input$fireblaze_signed_in)
                # get user information
                user <- f$get_signed_in()$response
                r$user <- user[c(
                    'uid',
                    'email'
                )]
                r$user$logout <- signout_fn

                r$active_error <- FALSE
                r$active_success <- FALSE
                shinyjs::click(id = 'login_modal_close', asis=TRUE)
            }
        )

        # if forgot password
        # then send password reset to email
        observeEvent(
            input$forgot_password, {
                user_email <- input$email
                if (!is_valid_email(user_email)) {
                    r$active_error <- TRUE
                    r$active_success <- FALSE
                    r$error_message <- paste('Please enter a valid email to reset your password')
                } else {
                    r$active_error <- FALSE
                    r$active_success <- TRUE
                    r$success_message <- 'Password reset link was sent to email'
                    print('click resetting password')
                    print(user_email)
                    f$reset_password(user_email)
                }
            }
        )

        return(
            reactive(r$user)
        )

    })
}

## To be copied in the UI
# mod_login_ui("login_1")

## To be copied in the server
# mod_login_server("login_1")
