#
# This code is subject to the terms and conditions defined in the GPLv3 license.
#

plotHaplotypesLongitutinalPerPatient <- function(studyIdInfo, alleles, title, timepointUnit=c("days","weeks"), xAxisMarks=c(0,5,10,15,20,25,30,35,40)){
  
  timepointUnit <- match.arg(timepointUnit)
  
  timepoint <- studyIdInfo$timepoint # child$StudyDay/7
  treatment <- studyIdInfo$treatment
  qpcr  <- studyIdInfo$qpcr # child$pf_qpcr
  
  a <- unique(unlist(alleles))
  a <- sort(a[!is.na(a)])
  y <- length(a)
  ylab <- a
  
  plot(NA, xlim=c(min(0,timepoint,na.rm=T), max(40,timepoint,na.rm=T)), ylim=c(0.5,y+0.5), 
       type="n", bty="n", axes = FALSE, 
       xlab=sprintf("Time in %s", timepointUnit), ylab="",
       main=title)
  axis(side=2, at=1:y, labels=ylab, tick=F, las=T, cex.axis=0.8)
  axis(side=1, at=xAxisMarks, cex.axis=0.8)
  abline(v=timepoint, lty=2, col="grey")
  isPos <- rep(1, length(treatment))
  isPos[qpcr==1] <- 2
  abline(v=timepoint[treatment==1], lty=1, lwd=1, col=isPos[treatment==1])
  
  invisible(lapply(seq_along(a), function(i){
    sym <- rep(4, length(timepoint))
    sym[qpcr==1] <- 1
    sym[grep(a[i], alleles)] <- 19 # 19
    cols <- rep(0, length(timepoint))
    cols[qpcr==1] <- 1
    cols[grep(a[i], alleles)] <- 2
    points((timepoint), rep(i, length(timepoint)), pch=sym, col=cols)
  }))
 }