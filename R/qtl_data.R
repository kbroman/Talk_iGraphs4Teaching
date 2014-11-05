library(broman)
library(qtl)
source("my_geno_image.R")

png(file="../Figs/qtl_data.png", width=1180, height=600, res=108,
    pointsize=14, bg="transparent")
par(fg="white", col.axis="white", col.main="wheat", col.lab="#80daeb",
    cex.main=1.8, cex.lab=1.5)
layout(cbind(1,2,3), width=c(8,8,1.4))

data(hyper)
hyper <- hyper[,order(hyper$pheno[,1])]

bg <- "transparent"
blue <- "#0074D9"
red <- "#FF4136"

par(mar=c(5.1, 4.6, 4.1, 1.6))
plot.map(hyper, main="")
title(main="Genetic map", line=3)

par(mar=c(5.1, 4.6, 4.1, 1.6))
my.geno.image(hyper, alternate=TRUE, main="",
              thecolors=c(bg, blue, red))
title(main="Genotypes", line=3)

par(mar=c(5.1, 2.1, 4.1, 3.1))
color <- c(rev(colorRampPalette(c("white", blue))(256)[-1]),
           colorRampPalette(c("white", red))(256))

image(1, 1:nind(hyper), t(hyper$pheno[,1,drop=FALSE]),
      xaxt="n", yaxt="n", col=color, xlab="", ylab="")
title(main="Pheno", line=3)
axis(side=2, at=seq(50, 250, by=50), label=rep("", 5))




dev.off()
