#' Function for saving a plot.
#'
#' @export
#' @param name Plot name we want to export.
#' @param file File name or path. Default filename: "plot"
#' @param type File type  we want to export. It is possible to export plot in certain format:eps/ps, pdf, jpeg, tiff, png, bmp, svg Default type of file: png
#' @param width Width of exported plot. Default value: 13 inches
#' @param height Height of exported plot. Default value: 8 inches
#' @param dpi Default value: dpi = 150


save_plot <-
  function(name,
           file = "plot",
           type = "png",
           width = 13,
           height = 8,
           dpi = 150) {


    file_name <- paste0(file,".",type)
    fonts_save()

    ggplot2::ggsave(
      file_name,
      name,
      width = width,
      height = height,
      dpi = dpi
    )

    if (type == "pdf")
      extrafont::embed_fonts(file_name)

    invisible(NULL)

  }


