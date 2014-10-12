scatter_data <- read.csv(file="../Desktop/data/scatterplot_data.csv",head=TRUE,sep=",")

#######  scatterplot matrix 1  ########
panel.cor <- function(x, y, digits=2, prefix="", cex.cor, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y))
    txt <- format(c(r, 0.123456789), digits=digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex.cor * r)
}

pairs(~Variable1 + Variable2 + Variable3 + Variable4 + Variable5 + Variable6, data=scatter_data,
      lower.panel=panel.smooth, upper.panel=panel.cor, 
      pch=20, main="Sample Scatterplot Matrix")

#######  scatterplot matrix 2  ########
install.packages("car")
library(car)
scatterplotMatrix(~ TM_GAP + Tenure + AvgTotalLots + AvgGAP + AvgSellers + AvgRegist, data=scatter_data,
spread=FALSE, diagonal="histogram",
main="Sample Scatterplot Matrix")

#######  scatterplot matrix 3  ########
install.packages("psych")
library(psych)
pairs.panels(scatter_data)
