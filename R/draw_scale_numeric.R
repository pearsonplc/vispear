#' Manipulate value of text in given axis.
#'
#' @export
#' @param axis Name of axis - "x" or "y"
#' @param min Minimal value of given axis.
#' @param max Maximal value of given axis.
#' @param step How frequently we show text in given axis.
#' Default value is based on max and min arguments: (max - min)/10.
#' @param labels Show value in different way. Default value: comma;
#' other options: percent.
#' @examples
#' \dontrun{
#' ggplot(mtcars, aes(factor(cyl), wt))+
#'      geom_bar(stat = "identity", fill = cat_colors[1])+
#'      theme_peru()+
#'      draw_scale_numeric("y",0,60)
#'
#' ggplot(diamonds[1:100,], aes(depth, carat, color = factor(cut)))+
#'      geom_point(size = 7)+
#'      theme_peru("color")+
#'      draw_scale_numeric("y",0,1,0.1,labels = percent)
#'      }

draw_scale_numeric <- function(axis,
                               min,
                               max,
                               step = (max - min) / 10,
                               labels = scales::comma) {

  min_error <- min - 0.05
  max_error <- max + 0.05

  if (axis == "y") {
    ggplot2::scale_y_continuous(breaks = seq(min, max, step),
                       limits = c(min_error, max_error),
                       labels = labels)
  }

  else if (axis == "x") {
    ggplot2::scale_x_continuous(breaks = seq(min, max, step),
                       limits = c(min_error, max_error),
                       labels = labels)
  }

  else {
    stop("axis argument in draw_scale_numeric fun shoud be either 'x' or 'y'.", call. = FALSE)
  }
}
