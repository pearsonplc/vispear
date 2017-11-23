#' E&R legend - put legend inside a plot.
#'
#' @export
#' @param geom Name of used geom. Default value: bar.
#' @param ... arguments listed below:
#' @param direction direction of the legend. Either h (horizontal) or v (vertical).
#' @param direction_box direction of the box of legend. Specifically it is useful when the plot has more than one legend. Default value: v.
#' @param position position of the legend - two-element numeric vector.
#' @param bc - background color. Default value: #FFFFFF.
#' @param bc_alpha - opacity of background color. Default value: 0.
#' @param bc_border - color of border of legend border. Default value: transparent.
#' @param lo_size size of legend objects. Default value for geom_point: 8, for geom_line: 1.2
#' @param lo_alpha opacity of legend objects. Default value: 1
#' @param lo_nrow number of rows in which categories should show up.
#' @examples
#' \dontrun{
#' ggplot(mtcars, aes(qsec, mpg, color = factor(cyl))) +
#'     geom_point() +
#'     theme_enr() +
#'     legend_enr("point")
#'      }

legend_enr <- function(geom = "bar", ...) {

  if (geom %in% c("bar", "violin", "hist", "freqpoly", "boxplot")) {
    legend_center(...)
  }

  else if (geom == "line") {
    legend_line(...)
  }

  else if (geom == "density") {
    legend_density(...)
  }

  else if (geom ==  "point") {
    legend_point(...)
  }
}

legend_point <- function(direction = 'v',
                         direction_box = 'v',
                         position = c(0.9, 0.9),
                         bc = '#FFFFFF',
                         bc_alpha = 0,
                         bc_border = "transparent",
                         lo_size = 8,
                         lo_alpha = 1,
                         lo_nrow = NULL) {
  list(
    build_legend(direction = direction, direction_box = direction_box,
                 position = position, bc = bc, bc_alpha = bc_alpha,
                 bc_border = bc_border),
    guides(color = guide_legend(nrow = lo_nrow,
                                override.aes = list(size = lo_size,
                                                    linetype = 0,
                                                    alpha = lo_alpha))
    )
  )

}

legend_center <- function(direction = 'h',
                          direction_box = 'v',
                          position = c(0.5, 0.9),
                          bc = '#FFFFFF',
                          bc_alpha = 0,
                          bc_border = "transparent") {
  list(
    build_legend(direction = direction, direction_box = direction_box,
                 position = position, bc = bc, bc_alpha = bc_alpha,
                 bc_border = bc_border)
  )

}

legend_line <- function(direction = 'h',
                        direction_box = 'v',
                        position = c(0.5, 0.9),
                        bc = '#FFFFFF',
                        bc_alpha = 0,
                        bc_border = "transparent",
                        lo_size = 1.2,
                        lo_alpha = 1,
                        lo_nrow = NULL) {
  list(
    build_legend(direction = direction, direction_box = direction_box,
                 position = position, bc = bc, bc_alpha = bc_alpha,
                 bc_border = bc_border),
    guides(color = guide_legend(nrow = lo_nrow,
                                override.aes = list(size = lo_size,
                                                    alpha = lo_alpha))
    )
  )

}

legend_density <- function(direction = 'h',
                           direction_box = 'v',
                           position = c(0.5, 0.9),
                           bc = '#FFFFFF',
                           bc_alpha = 0,
                           bc_border = "transparent",
                           lo_nrow = NULL) {
  list(
    build_legend(direction = direction, direction_box = direction_box,
                 position = position, bc = bc, bc_alpha = bc_alpha,
                 bc_border = bc_border),
    guides(fill = guide_legend(nrow = lo_nrow,
                               override.aes = list(color = 'white'))
    )
  )

}

build_legend <- function(direction = 'v',
                         direction_box = 'v',
                         position = c(0.9, 0.9),
                         bc = '#FFFFFF',
                         bc_alpha = 0.6,
                         bc_border = "#FFFFFF") {

  theme(legend.position         = position
        , legend.direction      = ifelse(direction == "h", "horizontal", "vertical")
        , legend.key            = element_blank()
        , legend.justification  = position
        , legend.box            = ifelse(direction_box == "h", "horizontal", "vertical")
        , legend.box.background = element_rect(fill = alpha(bc, bc_alpha), color = bc_border)
        , legend.background     = element_blank()
        , legend.box.just       = 'top'
  )
}
