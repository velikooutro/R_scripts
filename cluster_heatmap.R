#pdf("mygraph.pdf")

setwd("C:\\dev")

#import data
product <- read.csv("data.csv")

row.names(product) <- product$product

# scale data to mean=0, sd=1 and convert to matrix
product.scaled <- as.matrix(scale(product[2:28]))

# create heatmap and don't reorder columns
heatmap(product.scaled, Colv=F, col=topo.colors(256),scale='none',cexCol=.80)
#heatmap(environ.scaled, Colv=F, col=cm.colors(256),scale='none',cexCol=.80)
#heatmap(environ.scaled, Colv=F, col=heat.colors(256),scale='none',cexCol=.80)

#dev.off()

######Get color key########
library("gplots")
heatmap.2(product.scaled, col=topo.colors(75), scale="none",key=TRUE, symkey=FALSE, 
density.info="none", trace="none", cexRow=0.6,cexCol=.80)