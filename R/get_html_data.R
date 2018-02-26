#' Create HTML format data. Useful with datable_enr function.
#'
#' @export
#' @param data dataset you want to implement in DT::datatable.
#' @param column columns which will be format by 'formatter' argument. Those columns will be centered.
#' @param direction the direction in which cells will be coloured. Possible opitons: 'area', 'col' and 'row'. Default value: 'col'.
#' @param formatter method of color choosen columns' cells. Default value: 'custom_formatter'.
#' @examples
#' \dontrun{
#' example_dt <- get_html_data(mtcars, column = 4:6, direction = 'area')
#' datatable_enr(example_dt, tooltip = "This is a description.")
#' }

get_html_data <- function(data,
                          column = NULL,
                          direction = 'col',
                          formatter = 'simple_formatter') {

  ##############################################################################
  # check whether column was defined
  if (is.null(column)) {
    warning('You do not choose any columns to format.',call. = FALSE)
    return(formattable(data))
  }

  # check whether any columns is not numeric
  if (both_numeric(data, column) == F) {
    stop('\nAt least one column is not numeric.\nPlease choose only numeric/integer columns in column argument.',call. = FALSE)
  }

  # check whether direction use appropriate name
  if (!direction %in% c('col', 'row', 'area')) {
    stop('\ndirection argument has inappropriate name.\nPlease use either col, row or area.',call. = FALSE)
  }

  if (length(formatter) > 1) {
    if (length(formatter) != length(column)) {
      stop("Number of columns and number of formatters are not equal.", call. = F)
    }
    else if (direction != 'col') {
      stop('Multiple formatter works only with col approach.', call. = F)
    }
  }
  ##############################################################################

  # execute the code to create a html object
  html_data <- data.frame(
    form_html_data(data, column, direction, formatter) %>%
      formattable:::render_html_matrix.formattable(),
    stringsAsFactors = FALSE)

  return(html_data)
}

form_html_data <- function(data,
                           column = NULL,
                           direction = 'col',
                           formatter = 'simple_formatter'
                           ## Add color manipulation (in the future)
                           # , color_cell = c(p_colors[4], p_colors[1])
) {

  all_columns <- 1:ncol(data)
  col_number <- deparse(all_columns[column])
  col_name <- eval(colnames(data)[column])
  # col_cell1 <- deparse(color_cell[1]); col_cell2 <- deparse(color_cell[2])

  if (direction == 'area') {
    to_execute <- sprintf('formattable(data, list(area(col = %s) ~ %s()))', col_number, formatter)
  }
  else if (direction == 'row') {
    to_execute <- sprintf('formattable(data, lapply(1:%i, function(row) {area(row, col = %s) ~ %s()}))',
                          nrow(data), col_number, formatter)
  }
  else if (direction == 'col') {
    if (length(formatter) > 1) {
      to_execute <- paste0('formattable(data, list(', paste0('`', col_name, '` = ', formatter, '()', collapse = ', '),'))')
    }
    else {
      to_execute <- sprintf('formattable(data, lapply(%s, function(col) {area(col = col) ~ %s()}))',
                            col_number, formatter)
    }
  }

  parse(text = to_execute) %>% eval()
}

both_numeric <- function(data, col_num){
  lgl_names <- purrr::map_lgl(data, is.numeric)[col_num]

  all(lgl_names == T)
}

#' formatter no 1
#' @export

sign_formatter <- function() {
  formatter("span",
            style = x ~ style(display = "block",
                              background = ifelse(x > 0.03, '#4CBB17', ifelse(x < -0.03, div_colors[2], '#FFD300')),
                              color = ifelse(x > 0.03, 'white', ifelse(x < -0.03, 'white', 'black')),
                              padding = "3px",
                              border.radius = "4px"))
}

#' formatter no 2
#' @export
#' @param min.col Minimum of gradient color. By default. "#D4EAE4"
#' @param max.col Maximum of gradient color. By default. "#007FA3"

simple_formatter <- function(min.col = "#D4EAE4", max.col = "#007FA3") {
  formatter("span",
            style = x ~ style(display = "block",
                              background = as.vector(x) %>% gradient(min.color = min.col, max.color = max.col) %>% csscolor(),
                              color = ifelse(x > mean(x), "white", "black"),
                              padding = "3px",
                              border.radius = "4px"))
}

#' formatter no 3
#' @export
fixed_scale_formatter <- function() {

  colorFormat <- c("white", rep(c(RColorBrewer::brewer.pal(9,'Blues'),'#08306B'), each = 10))

  num_value <- substitute(readr::parse_number(x))

  formatter("span",
            style = x ~ style(display = "block",
                              background = colorFormat[eval(num_value) + 1],
                              color = ifelse(eval(num_value) > 50, fontBoldcolor, 'black'),
                              padding = "3px",
                              border.radius = "4px"))
}
