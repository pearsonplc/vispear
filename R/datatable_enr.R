#' Create datatable in ENR style
#'
#' @export
#' @param data a data object
#' @param options a list of initialization options. All things available in DT package.
#' @param sorting binary parameter regarding soritng columns.
#' @param desc_column describing variables in the table. Numerical argument, e.g. 1:3 treats first three columns as a descr. variables.
#' @param tooltip tooltip which descibes content's table.
#' @param id table id. It's necessary in shiny app when you want to add a tooltip. Id must match with id of render object. More in examples.
#' @param ... all DT::datatable parameters (exept options which you can define in options argument).
#' @examples
#' \dontrun{
#' datatable_enr(mtcars,
#'         desc_column = 1:3,
#'         tooltip = "This is a description of table."
#' )
#'
# '# Use datatable_enr in shiny app, output$mtcars_table matches with `id` argument.
#' output$mtcars_table <- renderDataTable({
#'
#'  datatable_enr(mtcars, tooltip = "Lorem", id = "mtcars_table")
#'
#'})
#' }

datatable_enr <- function(data
                          , options = list()
                          , sorting = FALSE
                          , desc_column = NULL
                          , tooltip = ""
                          , id = NULL
                          , ... ) {

  # create table id to navigate
  if ( is.null(id) ) { element_id <- id <- sample(1e7, 1) }
  else { element_id <- NULL }

  all_col <- 1:ncol(data)
  depend_col <- base::setdiff(all_col, desc_column)

  desc_column2 <- NULL
  if (!is.null(desc_column)) desc_column2 <- desc_column - 1

  # build table legend tooltip
  text_tooltip <- gsub("[\r\n]", "",
                       paste0("$('#", id, " ').before(
                              \"&nbsp;
                              <span class='glyphicon glyphicon-info-sign table-tooltip'
                                 aria-hidden='true' data-toggle='tooltip' data-placement='right' title=
                             '<p>", tooltip, "</p>'>
                             </span>\"
  );"))

  if (tooltip == "") text_tooltip <- ""

  table_enr <- DT::datatable(data,
                             ...,
                             options = list(
                               scroller = TRUE,
                               scrollCollapse = TRUE,
                               scrollY = 400,
                               scrollX = TRUE,
                               columnDefs = list(
                                 list(className = "dt-left", targets = desc_column2),
                                 list(className = "dt-center", targets = depend_col - 1),
                                 list(orderable = sorting, targets = all_col - 1)
                               ),
                               initComplete = DT::JS(
                                 "function(settings, json) {",
                                 "$(this.api().table().header()).css({'background-color': '#f5f5f5', 'font-size': '87%'});",
                                 "}"),
                               dom = "t"),
                             callback = DT::JS(text_tooltip,
                                               "$('.table-tooltip').tooltip({container: 'body',html: true});"),
                             rownames = F,
                             elementId = element_id,
                             class = "cell-border",
                             escape = F
                             ) %>%
    DT::formatStyle(desc_column, backgroundColor = '#f5f5f5', 'padding-left' = "18px") %>%
    DT::formatStyle(depend_col, width = "100px") %>%
    DT::formatStyle(all_col, 'font-size' = '83%')

  # Modify table's options if necessary
  table_enr$x$options <- utils::modifyList(table_enr$x$options, options)

  dep <-
    htmltools::htmlDependency(
      name = "custom_css"
      , version = "1.0"
      , src = c(file = system.file("datatable", "css", package = 'ENRanalytics'))
      # , src = c(href = "css")
      , stylesheet = "datatable_layout.css"
    )

  dep_boot <-
    htmltools::htmlDependency(
      name = "bootstrap"
      , version = "1.0"
      , src = c(file = system.file("datatable", "bootstrap", package = 'ENRanalytics'))
      # , src = c(href = "css")
      , script = "js/bootstrap.min.js"
      , stylesheet = "css/bootstrap.min.css"
    )

  table_enr$dependencies <- c(table_enr$dependencies, list(dep_boot), list(dep))

  table_enr

}
