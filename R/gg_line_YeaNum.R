#' Line Chart Year Numeric
#'
#' This chart does not allow for chaning orientation
#'
#' @param data A data.frame
#' @param orientation Doesn't do anything for this type of chart.
#' @param order doesn't do anything
#' @inherit dsvizopts::dsviz_default_opts
#' @inheritDotParams dsvizopts::dsviz_default_opts
#' @section ctypes:
#' Dat-Num, Yea-Num
#' @examples
#' gg_line_YeaNum(sample_data("Yea-Num", nrow = 10))
#' @export
gg_line_YeaNum <- function(data, ...) {

  if (is.null(data)) stop("need dataset to visualize")
  data[[1]] <- as_Cat(data[[1]])
  data[[2]] <- as_Num(data[[2]])

  opts <- dsvizopts::merge_dsviz_options(...)
  l <- ggmagic_prep(data, opts, ftype = "Yea-Num")
  default_theme <- c(opts$theme, orientation = l$orientation)

  gg <- ggplot(l$d, aes(x = a, y = value, color = ..colors, group = 1)) +
    geom_line() +
    scale_color_identity() +
    labs(title = l$titles$title,
         subtitle = l$titles$subtitle,
         caption = l$titles$caption,
         x = l$titles$x,
         y = l$titles$y) +
    scale_y_continuous(labels = l$formats$f_nums)

  if (l$dataLabels$show) {
    gg <-   gg + geom_text(
      aes(label = l$dataLabels$f_nums(l$d$value), y = l$d$value + 0.05),
      position = position_dodge(0.9),
      vjust = 0,
      check_overlap = TRUE,
      size = l$dataLabels$size,
      color = l$dataLabels$color
    )
  }
  gg <- gg + add_ggmagic_theme(default_theme)
  add_branding_bar(gg, opts$theme)

}


#' Line Chart Year
#'
#' This chart does not allow for chaning orientation
#'
#' @param data A data.frame
#' @param orientation Doesn't do anything for this type of chart.
#' @param order doesn't do anything
#' @inherit dsvizopts::dsviz_default_opts
#' @inheritDotParams dsvizopts::dsviz_default_opts
#' @section ctypes:
#' Yea
#' @examples
#' gg_line_Yea(sample_data("Yea", nrow = 10))
#' @export
gg_line_Yea <- function(data, ...) {

  if (is.null(data)) stop("need dataset to visualize")
  data[[1]] <- as_Cat(data[[1]])

  opts <- dsvizopts::merge_dsviz_options(...)
  l <- ggmagic_prep(data, opts, ftype = "Yea")
  default_theme <- c(opts$theme, orientation = l$orientation)

  gg <- ggplot(l$d, aes(x = a, y = value, color = ..colors, group = 1)) +
    geom_line() +
    scale_color_identity() +
    labs(title = l$titles$title,
         subtitle = l$titles$subtitle,
         caption = l$titles$caption,
         x = l$titles$x,
         y = l$titles$y) +
    scale_y_continuous(labels = l$formats$f_nums)

  if (l$dataLabels$show) {
    gg <-   gg +
      geom_text(
        aes(label = l$dataLabels$f_nums(l$d$value), y = l$d$value + 0.05),
        position = position_dodge(0.9),
        vjust = 0,
        check_overlap = TRUE,
        size = l$dataLabels$size,
        color = l$dataLabels$color
      )
  }
  gg <- gg + add_ggmagic_theme(default_theme)
  add_branding_bar(gg, opts$theme)

}
