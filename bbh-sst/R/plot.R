#' Plots SST timeseries
#' 
#' @param x tibble
#' @param ... other arguments passed to \code{\link[ggplot2]{geom_line}} and/or
#'   \code{\link[ggplot2]{geom_ribbon}}
#' @return ggplot object
plot_bbh <- function(x, ...){

  ggplot2::ggplot(x, 
                  ggplot2::aes(x = date,
                               y = Tavg)) +
    ggplot2::ylim(-5, 25) + 
    ggplot2::geom_line(...) +
    ggplot2::geom_ribbon(ggplot2::aes(ymin = Tmin,
                                      ymax = Tmax),
                         linetype = 0,
                         alpha = 0.4,
                         ...) +
    ggplot2::labs(title = "BBH SST",
                  caption = "source: https://www.maine.gov/dmr/science/weather-tides/boothbay-harbor-environmental-data")
}