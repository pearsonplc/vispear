#' Function for saving a plot.
#' 
#' @export
#' @param file_name Name of file we want to see in directory. Default filename: "plot" 
#' @param plot_name Name of plot we want to export.
#' @param type_file Type of file we want to export. It is possible to export plot in  certain format:eps/ps, pdf, jpeg, tiff, png, bmp, svg Default type of file: png
#' @param width Width of exported plot. Default value: 13 inches 
#' @param height Height of exported plot. Default value: 8 inches
#' @param dpi Default value: dpi = 150


save_plot <-
  function(plot_name, file_name = "plot", type_file = "png", width = 13, height = 8, dpi = 150) {
    ggplot2::ggsave(
      paste0(file_name,".",type_file),
      plot_name,
      width = width,
      height = height,
      dpi = dpi
    )
  }


