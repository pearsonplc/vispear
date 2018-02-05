#' Function for saving a plot in pdf and png format at once.
#'
#' @export
#' @param plot_name Plot name we want to export.
#' @param file_name File name or path. Default filename: "plot"
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
