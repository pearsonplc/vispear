#' E&R theme for all plots in presentation 
#' 
#' @export
#' @param method Which method was used to differ variables in a plot? Two possible value: color or fill.(Have to be the same method as used in ggplot phrase).
#' @param legend_title Title of legend. Default value: "Legend"
#' @param color Which color group we want to implement? Four possible group: categorical colors,diverging_colors, sequential colors or any other color vector. Default value: categorical_colors 
#' @param fig_number Number of figures. Default value = "".
#' @param text_font Font used in a text element in a plot (axis and legend). Devault value: font = "Open Sans"
#' @param title_font Font used in a title element in a plot (axis, legend and strip). Devault value: font = "Open Sans Semibold"
#' @param axis_title_size Size of title of axis. Default size: 22.
#' @param axis_text_size Size of value of axis. Default size: 17.
#' @param xtext_slope Slope of value of x axis (in degree). Default slope value: 0.
#' @param xtext_position Useful when xtext_slope != 0 (then this argument should be = 1). Distance between text and plot border. Default value: 0.5.
#' @param legend_object_size Size of object in legend. Default falue: 1.2
#' @param legend_text_size Size of text inside legend. Defalut size: 14.
#' @param legend_title_size Size of legend title. Default size: 15.
#' @examples 
#' \dontrun{
#' ggplot(mtcars, aes(factor(cyl), wt))+
#'      geom_bar(stat = "identity", fill = categorical_colors[1])+
#'      theme_enr()+
#'      draw_scale_numeric("y",0,60)
#'      
#' ggplot(diamonds[1:100,], aes(depth, carat, color = factor(cut)))+
#'      geom_point(size = 7)+
#'      theme_enr("color")+
#'      draw_scale_numeric("y",0,1,0.1,labels_percent = T)
#'      }


theme_enr <- function(method = "color", 
                      legend_title = "Legend", 
                      color = cat_colors, 
                      fig_number = "", 
                      text_font = "OpenSans", 
                      title_font = 'OpenSans-Semibold', 
                      axis_title_size = 22, 
                      axis_text_size = 17, 
                      xtext_slope = 0, 
                      xtext_position = 0.5, 
                      legend_object_size = 1.2, 
                      legend_text_size = 14, 
                      legend_title_size = 15) {
  
  load_enr_fonts(message = F)
  
  list(
    ggtitle(fig_number), 
    draw_scale_manual(method, color, legend_title), 
    theme(text              = element_text(colour = "black", family = title_font), 
          rect              = element_rect(color = "black"), 
          axis.line.x       = element_line(size = 0.3, linetype = 'solid', color = 'black'),
          axis.line.y       = element_line(size = 0.3, linetype = 'solid', color = 'black'),
          axis.text         = element_text(size = axis_text_size, family = text_font), 
          axis.text.x       = element_text(angle = xtext_slope, hjust = xtext_position), 
          axis.text.y       = element_text(vjust = 0.5, hjust = 1, angle = 0), 
          axis.ticks        = element_line(colour = "black", size = 0.3), 
          axis.ticks.length = unit(17/4, "pt"), 
          axis.title        = element_text(size = axis_title_size),
          axis.title.x      = element_text(margin = margin(t = 0.5 * axis_title_size)), 
          axis.title.y      = element_text(margin = margin(r = 0.7 * axis_title_size)), 
          legend.background = element_blank(),
          legend.key        = element_blank(), 
          legend.key.size   = unit(legend_object_size, "cm"), 
          legend.text       = element_text(size = legend_text_size, family = text_font), 
          legend.title      = element_text(size = legend_text_size), 
          panel.background  = element_blank(),
          panel.border      = element_blank(),
          panel.grid.major  = element_line(colour = "#E0E0E0", size = 0.2), 
          panel.grid.minor  = element_line(colour = "#F5F5F5", size = 0.1),
          plot.title        = element_text(margin = margin(t = 4, b = 1.5), hjust = 1, size = 8, colour = "#F5F5F5"), 
          plot.margin       = margin(3, 12, 18, 16), 
          strip.background  = element_rect(fill = NA, linetype = 'solid'), 
          strip.text        = element_text(size = 17))
  )
}

                       