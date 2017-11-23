#' Function for saving a plot in pdf and png format at once.
#' 
#' @export
#' @param file_name Name of file we want to see in directory. Default filename: "plot" 
#' @param plot_name Name of plot we want to export.
#' @param width Width of exported plot. Default value: 13 inches 
#' @param height Height of exported plot. Default value: 8 inches
#' @param dpi Default value: dpi = 150


save_plot2 <- function(plot_name, 
                       file_name = "plot",  
                       width = 13,
                       height = 8, 
                       dpi = 150) {
  
  ggplot2::ggsave(
    paste0(file_name, ".png"), plot_name, width = width,
    height = height, dpi = dpi)
  
  ggplot2::ggsave(
    paste0(file_name, ".pdf"), plot_name, width = width,
    height = height, dpi = dpi
  )
}