#' Calculate NDVI
#'
#' Calculates the NDVI
#'
#' @param path Path to a file
#' @param type Type of NDVI to calculate
#' @importFrom imager load.image R B
#' @importFrom imagerExtra BalanceSimplest
#' @export
piNDVI <- function(path, type="PiNoir") {
  im <- load.image(path)

  s <- 0.1
  R <- BalanceSimplest(R(im), s, s, range=c(0,1))
  B <- BalanceSimplest(B(im), s, s, range=c(0,1))

  ndvi <- (R-B)/(R+B)

  return(ndvi)
}
