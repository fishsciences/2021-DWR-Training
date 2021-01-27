# 2021 DWR Yolo Bypass Telemetry Training


## Session 2 (2021-01-27)

To install the `ybt` package, please run:

```

remotes::install_github("fishsciences/ybt", build_vignettes = TRUE)

```

The QAQC script we will be working through can be found [here](https://github.com/fishsciences/YBT_Reports/blob/master/R/setup.R)







## Session 1 (2021-01-20)

Packages to install in order to follow along with the training Session 1:

```
install.packages(c('rmarkdown', 
                    'knitr', 
                    'lubridate', 
                    'ggplot2', 
                    'data.table', 
                    'readxl',
                    'RSQLite',
                    'dplyr'
                   )
                 )
 ```
 
Function to copy to `utils.R` file during the exercises in the practice report:

```
condition = function(weights, lengths) {
  if(any(lengths == 0 | weights == 0)) stop("some value(s) are 0")
  num = 1e5*weights
  den = lengths^3
  K = num/den
  return(K)
}
```
