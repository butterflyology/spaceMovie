#' Complete list of palettes
#'
#' Use \code{\link{SW_palette}} to construct palettes of desired length.
#'
#' @export
SW_palettes <- list(
  Main = c("#E5B13A", "#4BD5EE"),
  Boba = c("#546758", "#5A685D", "#926844", "#8E595A"),
  Kanan = c("#9C8412", "#6C571B", "#373A36"),
  Hera = c("#C5B783", "#C4B000", "#653819", "#EAAA00"),
  Zeb = c("#201547", "#594A25", "#512A44", "#F1C400", "#41273B", "#A07400"),
  Sabine = c("#E57200", "#651D32", "#25282A", "#5C462B", "#5B3427", "#41273B"),
  Chopper = c("#BE4D00", "#FED141", "#AEA79F", "#747474"),
  Ezra = c("#BE4D00", "#FFC72C", "#7D3F16", "#4F2C1D"),
  Inquisitor = c("#EF3340", "#3F4444", "#212121"),
  Kallus = c("#081F2C", "#A6A9AA"),
  AT_DP = c("#708573", "#D0D3D4", "#919D9D"),
  Tank_Transport_pilot = c("#403A60", "#919D9D"),
  ANH = c("#D6C078", "#F1B084", "#9E5960", "#0C5BA0", "#5E9FDD", "#433011", "#FCFEFF", "#C38348"),
  TESB = c("#CCB361", "#E89F6F", "#72142A", "#A00F19", "#90931C", "#0B1428", "#A9D9FE", "#123C90"),
  ROTJ = c("#CCB361", "#E89F6F", "#1E5321", "#69A85F", "#459C2C", "#4A2A00", "#A00F19", "#106382"),
  TPM = c("#D6C078", "#897320", "#AE191D", "#ACBBC2", "#881C1E", "#90CFEA", "#DDDEEE", "#F9A31D"),
  AOTC = c("#D6C078", "#897320", "#372324", "#6F3A3F", "#E7A944", "#006DB2", "#A9D9FE", "#6B6B56"),
  ROTS = c("#D6C078", "#897320", "#525252", "#787878", "#9E291C", "#F16B28", "#B7DDF1", "#006DB2"),
  TFA = c("#CCB361", "#A10000", "#D90008", "#51B6ED", "#41E19A", "#B09971", "#985C18", "#BBAE95")
)

#' A Space Movie palette generator ....
#'
#' These are a handful of color palettes from the Space Movie franchise.
#'
#' @param n Number of colors desired.
#'   If omitted, uses all colors.
#' @param name Name of desired palette. Choices are: \code{ANH}, \code{TESB}, \code{ROTJ}, \code{TPM}, \code{AOTC}, \code{ROTS}, \code{TFA} \code{Boba}, \code{Kanan}, \code{Hera}, \code{Zeb}, \code{Sabine}, \code{Chopper}, \code{Ezra}, \code{Inquisitor}, \code{Kallus} , \code{AT_DP} , \code{Tank_Transport_pilot}, \code{Main},
#' @param type Either "continuous" or "discrete". Use continuous if you want to automatically interpolate between colors.
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' SW_palette("Hera")
#' SW_palette("Sabine", 3)
#'
#' If you need more colors than normally found in a palette, you can use a continuous palette to interpolate between existing colors.
#'
#' pal <- SW_palette(name = "Boba", n = 21, type = "continuous")
#' image(volcano, col = pal)
SW_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- SW_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors is greater than the palette")
  }

  out <- switch(type,
                continuous = colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.1, 0.1, 0.1, 0.1))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text(((n + 1) / 2), 1, labels = attr(x, "name"), cex = 1.5, family = "sans")
}

#' heatmap
#'
#' A heatmap example
# "heatmap"

#' @seealso
#' Have a look at Karthik Ram's `wesanderson`(\url{https://github.com/karthik/wesanderson}) color palette generator.
#'
#' @section Warning:
#' As of v0.1 I do not think that the internet reference I found accurately reflects the color of the Main Title.
