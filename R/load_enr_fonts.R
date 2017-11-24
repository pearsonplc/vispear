#' Download OpenSans fonts
#'
#' @export
#' @param message message that all necessary fonts are installed. Default value: TRUE

load_enr_fonts <- function(message = TRUE) {

  # check whether openSans is installed
  is_openSans <- any(extrafont::fonts() %in% "Open Sans")

  if (is_openSans == FALSE) { download_enr_fonts() }
  else {
    if (message == TRUE) { message("All necessary fonts (including OpenSans) were installed.") }
  }
}

# download fonts
download_enr_fonts <- function(){

    path <- c(file = system.file("fonts", "OpenSans/", package = 'vispear'))
    system(paste0("cp -R ", path, " /Library/Fonts/"))
    extrafont::font_import(prompt = F)
}
