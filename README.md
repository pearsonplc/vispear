<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`vispear` package belongs to the `pearsonverse` - a set of packages which facilitates the data science process in R. The main goal of this package is to support teams via **creating visualisation with standardised and coherent layout**. It was built mainly to cooperate with such packages as `ggplot2` and `DT`.

Installation
------------

First install `pearsonverse` [package](https://github.com/pearsonplc/pearsonverse). It will install all `*pear` packages.

``` r
devtools::install_github("pearsonplc/pearsonverse")
```

However, if you want to install just `vispear` package:

``` r
devtools::install_github("pearsonplc/vispear")
```

Main functions
--------------

1.  `theme_enr()`
2.  `save_plot()` & `save_plot2()`
3.  `get_html_data() + datatable_enr()`
4.  `show_enr_palettes()`

Goals
-----

### 1. Creating visualisation with standardised and coherent layout

#### 1.1 *theme\_enr()*

A function which implements a coherent layout to visualisation created by `ggplot2` package.

*Basic layout*

``` r
ggplot(mtcars, aes(qsec, mpg, color = factor(cyl))) + 
  geom_point(size = 5)
```

![plot](https://raw.githubusercontent.com/pearsonplc/vispear/readme/inst/img/example_plot_basic.png)

*Defined layout*

``` r
ggplot(mtcars, aes(qsec, mpg, color = factor(cyl))) + 
  geom_point() +
  theme_enr(color = p_colors)
```

![plot](https://raw.githubusercontent.com/pearsonplc/vispear/readme/inst/img/example_plot.png)

#### 1.2 *save\_plot() & save\_plot2()*

A pair of functions which allows to save graphs into a file. By default, `save_plot` saves plot in `.png` file, and `save_plot2` creates two files i.e. in `.png` and .`pdf` extensions.

#### 1.3 *get\_html\_data() + datatable\_enr()*

A pair of functions which allows to create interactive table with coherent layout. It's really useful when you want to add a table in the report. More info <a href = "http://ea.ioki.pl/~mbogucki/datatable_enr.html" target = '_blank'>here</a>.

![datatable\_enr](https://raw.githubusercontent.com/pearsonplc/vispear/readme/inst/img/datatable_enr.png)

#### 1.4 *show\_enr\_palettes()*

A function which lists all available defined palettes.

    #>   palette_name                     description
    #> 1     p_colors      4-coloured Pearson palette
    #> 2    p_colors2      8-coloured Pearson palette
    #> 3   cat_colors 20-coloured categorical palette
    #> 4   div_colors   11-coloured diverging palette
    #> 5   seq_colors   9-coloured sequential palette
    #> 6  pair_colors      '6-pair of colors' palette
    #> 7  trio_colors     '6-trios of colors' palette
    #> 8  quar_colors  '6-quartets of colors` palette
