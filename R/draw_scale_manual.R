#' Change color from categorical colors to diverging/sequential colors
#'
#' @export
#' @param method Which method was used to differ variables in a plot? Two possible value: color or fill.
#' @param color Which color group we want to implement? Four possible group: cat_colors,div_colors, seq_colors or other color vector. Default value: cat_colors
#' @param legend_title Title of legend. Default value: "Legend"
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
#'      draw_scale_numeric("y",0,1,0.1,labels_percent = T)
#'      }

draw_scale_manual <- function(method = "", color = cat_colors, legend_title = "Legend"){
  suppressWarnings(if (method == "fill") {
    if (color == div_colors) ggplot2::scale_fill_brewer(name = legend_title, palette = "RdBu")
    else if (color == seq_colors) ggplot2::scale_fill_brewer(name = legend_title, palette = "Blues")
    else ggplot2::scale_fill_manual(name = legend_title, values = color)
  }
  else if (method == "color"){
    if (color == div_colors) ggplot2::scale_color_brewer(name = legend_title, palette = "RdBu")
    else if (color == seq_colors) ggplot2::scale_color_brewer(name = legend_title, palette = "Blues")
    else ggplot2::scale_color_manual(name = legend_title, values = color)
  }
  )
}



