#' Function for saving a plot (when it is not ggobject).
#'
#' @export
#' @param file_name Name of file we want to see in directory. Default filename: "plot"
#' @param plot_name Name of plot we want to export.
#' @param width Width of exported plot. Default value: 13 inches
#' @param height Height of exported plot. Default value: 8 inches
#' @param dpi Default value: dpi = 150

save_plot_grid <- function(plot_name,
                           file_name = "plot",
                           width = 13,
                           height = 8,
                           dpi = 150) {

  # generatate plot in .pdf file
  grDevices::pdf(
    paste0(file_name, ".pdf"), width = 13, height = 8
  )

  grid::grid.draw(plot_name)
  grDevices::dev.off()

  # generatate plot in .png file
  grDevices::png(
    paste0(file_name, ".png"), width = 13, height = 8, units = "in", res = dpi
  )

  grid::grid.draw(plot_name)
  grDevices::dev.off()
}
