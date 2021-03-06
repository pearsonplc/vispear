% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_enr.R
\name{theme_enr}
\alias{theme_enr}
\title{E&R theme for all plots in presentation}
\usage{
theme_enr(method = "color", legend_title = "Legend", color = cat_colors,
  fig_number = "", text_font = "Open Sans",
  title_font = "Open Sans Semibold", axis_title_size = 22,
  axis_text_size = 17, xtext_slope = 0, xtext_position = 0.5,
  legend_object_size = 1.2, legend_text_size = 14, legend_title_size = 15)
}
\arguments{
\item{method}{Which method was used to differ variables in a plot? Two possible value: color or fill.(Have to be the same method as used in ggplot phrase).}

\item{legend_title}{Title of legend. Default value: "Legend"}

\item{color}{Which color group we want to implement? Four possible group: categorical colors,diverging_colors, sequential colors or any other color vector. Default value: categorical_colors}

\item{fig_number}{Number of figures. Default value = "".}

\item{text_font}{Font used in a text element in a plot (axis and legend). Devault value: font = "Open Sans"}

\item{title_font}{Font used in a title element in a plot (axis, legend and strip). Devault value: font = "Open Sans Semibold"}

\item{axis_title_size}{Size of title of axis. Default size: 22.}

\item{axis_text_size}{Size of value of axis. Default size: 17.}

\item{xtext_slope}{Slope of value of x axis (in degree). Default slope value: 0.}

\item{xtext_position}{Useful when xtext_slope != 0 (then this argument should be = 1). Distance between text and plot border. Default value: 0.5.}

\item{legend_object_size}{Size of object in legend. Default falue: 1.2}

\item{legend_text_size}{Size of text inside legend. Defalut size: 14.}

\item{legend_title_size}{Size of legend title. Default size: 15.}
}
\description{
E&R theme for all plots in presentation
}
\examples{
\dontrun{
ggplot(mtcars, aes(factor(cyl), wt))+
     geom_bar(stat = "identity", fill = categorical_colors[1])+
     theme_enr()+
     draw_scale_numeric("y",0,60)

ggplot(diamonds[1:100,], aes(depth, carat, color = factor(cut)))+
     geom_point(size = 7)+
     theme_enr("color")+
     draw_scale_numeric("y",0,1,0.1,labels_percent = T)
     }
}
