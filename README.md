# 2021 DWR Yolo Bypass Telemetry Training

Packages to install in order to follow along with the training:

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
 
Function to copy to `utils.R` file in the practice report:

```
condition = function(weights, lengths) {
  if(any(lengths == 0 | weights == 0)) stop("some value(s) are 0")
  num = 1e5*weights
  den = lengths^3
  K = num/den
  return(K)
}
```
