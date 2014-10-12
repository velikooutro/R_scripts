#pdf("mygraph.pdf")

setwd("C:\\Documents and Settings\\RM\\Desktop")

store <- read.csv("fall_event.csv")
#environ <- read.csv("hci4.csv")

row.names(store) <- store$sap_store_name

# scale data to mean=0, sd=1 and convert to matrix
store.scaled <- as.matrix(scale(store[2:28]))

# create heatmap and don't reorder columns
heatmap(store.scaled, Colv=F, col=topo.colors(256),scale='none',cexCol=.80)
#heatmap(environ.scaled, Colv=F, col=cm.colors(256),scale='none',cexCol=.80)
#heatmap(environ.scaled, Colv=F, col=heat.colors(256),scale='none',cexCol=.80)

#dev.off()

######Get color key########
library("gplots")
heatmap.2(store.scaled, col=topo.colors(75), scale="none",key=TRUE, symkey=FALSE, 
density.info="none", trace="none", cexRow=0.6,cexCol=.80)