
fonts_save <- function() {
  extrafont::loadfonts("pdf", quiet = TRUE)
  extrafont::loadfonts("postscript", quiet = TRUE)
  if (.Platform$OS.type == "windows")
    extrafont::loadfonts("win", quiet = TRUE)
}

