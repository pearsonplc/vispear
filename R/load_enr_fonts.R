#' Download OpenSans fonts
#'
#' @export
#' @param message message that all necessary fonts are installed. Default value: TRUE

load_enr_fonts <- function(message = TRUE) {

  # check whether openSans is installed
  is_openSans <- any(extrafont::fonts() %in% "Open Sans")

  if (!is_openSans) { download_enr_fonts() }
  else {
    if (message) { message("All necessary fonts (including OpenSans) were installed.") }
  }
}

# download fonts
download_enr_fonts <- function(){

    path <- c(file = system.file("fonts", "ttf/", package = 'vispear'))

    # dest_path <- switch(get_os(),
    #                     "osx" = " /Library/Fonts/",
    #                     "linux" = " /usr/share/fonts/"
    # )

    # system(paste0("cp -R ", path, dest_path))
    extrafont::font_import(paths = path, prompt = F, pattern = "OpenSans")

    # restart RStudio session
    .rs.restartR()
}

# extract info about operating system
get_os <- function() {

  sysinf <- Sys.info()

  if (!is.null(sysinf)) {
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  }

  else {
    ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}
