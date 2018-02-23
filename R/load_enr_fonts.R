#' Download OpenSans fonts
#'
#' @export
#' @param message message that all necessary fonts are installed. Default value: TRUE

load_fonts <- function(message = TRUE) {

  # check whether openSans is installed
  is_openSans <- any(extrafont::fonts() %in% "Open Sans")

  if (!is_openSans) { download_fonts() }
  else {
    if (message) { message("All necessary fonts (including OpenSans) were installed.") }
  }
}

# download fonts
download_fonts <- function(){

    path <- system.file("fonts", "ttf/", package = 'vispear')
    extrafont::font_import(paths = path, prompt = F)

    # restart RStudio session
    .rs.restartR()
}
