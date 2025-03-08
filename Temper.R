Sys.setenv(TZ='UTC')
library(xts)
### h1
## Load necessary dates
attach("../2010/h1/.RData")
temp.h1 <- hom
detach(pos = 2)
