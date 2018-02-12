#' create a plot with inverse empirical cumulative distribution function
#
#' @export
#' @param mapping Set of aesthetic mappings created by \code{aes} or
#'   \code{aes_}. If specified and \code{inherit.aes = TRUE} (the
#'   default), it is combined with the default mapping at the top level of the
#'   plot. You must supply \code{mapping} if there is no plot mapping.
#' @param data The data to be displayed in this layer. There are three
#'    options:
#'
#'    If \code{NULL}, the default, the data is inherited from the plot
#'    data as specified in the call to \code{ggplot}.
#'
#'    A \code{data.frame}, or other object, will override the plot
#'    data. All objects will be fortified to produce a data frame. See
#'    \code{fortify} for which variables will be created.
#'
#'    A \code{function} will be called with a single argument,
#'    the plot data. The return value must be a \code{data.frame.}, and
#'    will be used as the layer data.
#' @param geom The geometric object to use display the data
#' @param position Position adjustment, either as a string, or the result of
#'  a call to a position adjustment function.
#' @param show.legend logical. Should this layer be included in the legends?
#'   \code{NA}, the default, includes if any aesthetics are mapped.
#'   \code{FALSE} never includes, and \code{TRUE} always includes.
#' @param inherit.aes If \code{FALSE}, overrides the default aesthetics,
#'   rather than combining with them. This is most useful for helper functions
#'   that define both data and aesthetics and shouldn't inherit behaviour from
#'   the default plot specification, e.g. \code{borders}.
#' @param ... Additional parameters to the \code{geom} and \code{stat}.
#'



geom_iecdf <- function(mapping = NULL, data = NULL, geom = "point",
                      position = "identity", show.legend = NA,
                      inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatIecdf,
    data = data,
    mapping = mapping,
    geom = geom,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(...)
  )
}


StatIecdf <- ggplot2::ggproto(
  "GeomIecdf", ggplot2::Stat,
  compute_group = function(data, scales) {
    x <- c(sort(data$x),Inf)
    n <- length(x)
    if (n < 1)
      stop("'x' must have 1 or more non-missing values")
    vals <- unique(x)
    rval <-
      approxfun(
        vals, 1 - cumsum(tabulate(match(x, vals))) / n,
        method = "constant", yleft = 0, yright = 1, f = 0, ties = "ordered"
      )
    class(rval) <-
      c("ecdf", "stepfun", class(rval))
    assign("nobs", n, envir = environment(rval))
    attr(rval, "call") <- sys.call()
    data.frame(x = sort(x),y = rval(sort(x)))
  },

  required_aes = c("x")
)
