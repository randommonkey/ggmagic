#' Scatter Numeric Numeric
#'
#' This scatter
#'
#' @param data A data.frame
#' @param orientation Doesn't do anything for this type of chart.
#' @param order doesn't do anything
#' @inherit dsvizopts::dsviz_default_opts
#' @inheritDotParams dsvizopts::dsviz_default_opts
#' @section ctypes:
#' Num-Num
#' @examples
#' gg_scatter_NumNum(sample_data("Num-Num", nrow = 10))
#' @export
gg_scatter_NumNum <- function(data, ...){

  if (is.null(data)) stop("need dataset to visualize")
  data[[1]] <- as_Num(data[[1]])
  data[[2]] <- as_Num(data[[2]])

  opts <- dsvizopts::merge_dsviz_options(...)
  l <- ggmagic_prep(data, opts, plot = "scatter", ftype = "Num-Num")

  gg <- ggplot(l$d, aes(x = value_x, y = value_y, color = ..colors, group = 1)) +
    geom_point() +
    scale_color_identity() +
    labs(title = l$titles$title,
         subtitle = l$titles$subtitle,
         caption = l$titles$caption,
         x = l$titles$x,
         y = l$titles$y) +
    scale_y_continuous(labels = l$formats$f_nums$y) +
    scale_x_continuous(labels = l$formats$f_nums$x)

  gg <- gg + add_ggmagic_theme(opts$theme)
  add_branding_bar(gg, opts$theme)

}
