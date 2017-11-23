#' Show ENR palettes
#' 
#' Function which lists all palettes stored in `ENRanalytics` package.
#' @export
#' 

show_enr_palettes <- function() {
  all_palette <- list( 
    p_colors = p_colors,
    p_colors2 = p_colors2,
    cat_colors = cat_colors,
    div_colors = div_colors,
    seq_colors = seq_colors,
    pair_colors = pair_colors,
    trio_colors = trio_colors,
    quar_colors = quar_colors
  )
  
  return(all_palette)
}
