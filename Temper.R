Sys.setenv(TZ='UTC')
library(xts)
### h1
## Load necessary dates
attach("../2005/h1/.RData")
temp.h1 <- hom
detach(pos = 2)

for(ttev in 2006:2025) {
    attach(paste0("../",ttev,"/h1/.RData"))
    ttaktind <- index(temp.h1)
    ttaktend <- ttaktind[length(ttaktind)]
    ttaktstart <- ttaktend + 30*60
    temp.h1 <- c(temp.h1, hom[paste(ttaktstart,"/")])
    detach(pos = 2)
}
