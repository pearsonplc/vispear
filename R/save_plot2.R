#' Function for saving a plot in pdf and png format at once.
#'
#' @export
#' @param name Plot name we want to export.
#' @param file File name or path. Default filename: "plot"
#' @param width Width of exported plot. Default value: 13 inches
#' @param height Height of exported plot. Default value: 8 inches
#' @param dpi Default value: dpi = 150


save_plot2 <- function(name,
                       file = "plot",
                       width = 13,
                       height = 8,
                       dpi = 150) {


  extrafont::loadfonts("pdf", quiet = TRUE)
  if (.Platform$OS.type == "windows")
    extrafont::loadfonts("win", quiet = TRUE)

  ggplot2::ggsave(
    paste0(file, ".png"), name, width = width,
    height = height, dpi = dpi)

  ggplot2::ggsave(
    paste0(file, ".pdf"), name, width = width,
    height = height, dpi = dpi
  )
}
