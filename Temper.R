Sys.setenv(TZ='UTC')
library(xts)

### h1
## Load necessary dates
## First year
attach("../2002/h1/.RData")
temp.h1 <- hom
detach(pos = 2)
## Consecutive years
for(ttev in 2003:2025) {
    ## Attach the year's .RData file
    attach(paste0("../",ttev,"/h1/.RData"))
    ## Find last measurement
    ttaktind <- index(temp.h1)
    ttaktend <- ttaktind[length(ttaktind)]
    ## Step last time with half hour resolution
    ttaktstart <- ttaktend + 30*60
    temp.h1 <- c(temp.h1, hom[paste(ttaktstart,"/")])
    ## Detach year
    detach(pos = 2)
}

## Visualisation as pdf
pdf("h1hom.pdf", width=6*7)
par(mar=c(3.1,2.6,1.1,2.6))
## Empty plot
plot.zoo(temp.h1, xaxs = "i", xlab = "", type = "n", xaxt = "n")
## Axes
axis(4)
axis(1, at = as.POSIXct(paste0(2002:2025,"-01-01")), lab = FALSE)
axis.POSIXct(1, at = as.POSIXct(paste0(2002:2025,"-07-02")), format = "%Y", tick = FALSE)
## Grids
grid(nx = NA, ny = NULL) # only y
abline(v=as.POSIXct(paste0(2002:2025,"-01-01")), col="lightgray", lty="dotted") # x
## Temperature line
lines(as.zoo(temp.h1))
## Save pdf
dev.off()

## Export monthly average
write.zoo(round(apply.monthly(temp.h1, colMeans),2), "Dataqua.csv", sep = ";", dec = ",")
