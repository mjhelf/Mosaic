#' RTplot
#' 
#' Plot retention time deviation for each file generated by an 
#' \code{\link{rtexport}()} generated RTcorr object
#' 
#' @return generates a new plot in current plotting device
#' 
#' @param rtt \code{RTcorr} object as generated by \code{\link{rtexport}()}
#' @param colscheme character(1): name of function for color palette
#' @param liwi line width
#' @param cx font size
#' 
#' @export
RTplot <- function(rtt,
                   colscheme = "Mseek.colors",
                   liwi = 2,
                   cx = 1){
  PlotWindow(cx, 
             ylim = c(min(unlist(rtt[["rtdiff"]])),max(unlist(rtt[["rtdiff"]]))), 
             xlim = c(min(unlist(rtt[["noncorr"]])),max(unlist(rtt[["noncorr"]]))),
             heading = "Retention time correction",
             single = T,
             par = T,
             relto = NULL,
             ylab = "RT difference (seconds)",
             xlab = "RT (seconds)",
             ysci = F)
  
  
  
  lcolors <- do.call(colscheme, list(n = length(rtt$noncorr), alpha = 0.8))
  par(xpd = NA) 
  
  for(i in 1:length(rtt$noncorr)){
    
    lines(rtt$noncorr[[i]],rtt[["rtdiff"]][[i]], col = lcolors[[i]], lwd = liwi)
    
  }
  
  
  par(xpd = NA) 
  
  legend("topright",
         #inset = c(-0.08,-0.08),
         legend = basename(rtt[["fnames"]]),
         lty = 1, 
         lwd = liwi *1.3, 
         col = lcolors,
         bty = "n", cex = cx*0.7)
}



#' rtexport
#' 
#' Extract corrected and uncorrected retention times for each scan from an 
#' xcms::XCMSnExp, xcms::xcmsSet or xcms::xsAnnotate object
#' 
#' @param xset an xcms::XCMSnExp, xcms::xcmsSet or xcms::xsAnnotate object
#' 
#' @return \code{RTcorr} object, which is a named list, see \code{Details}
#' 
#' @details 
#' elements of the returned \code{RTcorr} class object
#' \itemize{
#' \item \code{noncorr} list of numeric vectors with retention times for each scan for each file, before RT correction
#' \item \code{corr} list of numeric vectors with retention times for each scan for each file, after RT correction
#' \item \code{fnames} character() of filenames for each of the lists in \code{noncorr} and \code{corr} 
#' }
#' 
#' 
#' @export
rtexport <- function(xset){
  res <- NULL
if(class(xset)=="XCMSnExp"){
  if(!xcms::hasAdjustedRtime(xset)){
    message("XCMSnExp object did not contain RT correction information.")
      res <- list(
          noncorr = xcms::rtime(xset, bySample = TRUE, adjusted = FALSE),
          corr = xcms::rtime(xset, bySample = TRUE, adjusted = FALSE),
          fnames = xset@processingData@files
      )
  }else{
  res <- list(
      noncorr = xcms::rtime(xset, bySample=T, adjusted = F),
  corr = xcms::rtime(xset, bySample=T, adjusted = T),
  fnames = xset@processingData@files
    )
  }
}

#get the embedded xcmsSet out of a CAMERA object
if(class(xset)=="xsAnnotate"){
  xset <- xset@xcmsSet
}

if(class(xset)=="xcmsSet"){
  
  res <-  list(
  noncorr = xset@rt$raw,
  corr = xset@rt$corrected,
  fnames = xset@filepaths
    )
}

  if(length(res)){
    class(res) <- "RTcorr"
    return(res)
    
  }else{
    warning("something went wrong - rtexport did not return anything - 
          was the input an XCMSnExp, xcmsSet or xsAnnotate object?")
  }
  
  
}

#' rtadjust
#' 
#' recalculate original rt values from rt values as reported in 
#' featuretables after rt correction for each file
#' 
#' @param rtexportObj \code{RTcorr} class object as generated by \code{\link{rtexport}()}
#' @param rts data.frame with rt values after RT correction
#' 
#' @return a list of data.frames with corrected RT values
#' 
#' @details 
#' each element in the returned list corresponds to \code{rts}, with RT values 
#' reset to pre-RT correction values
#' 
#' @export
rtadjust <- function(rtexportObj,
                     rts){ #df, each column is expected to contain rt values
  
  
   fx <- function(num, rtcorr, rtdiffs){
    sel <- which.min(abs(num - rtcorr))
    return(num + rtdiffs[sel])
  }
  
  
  rtdiff <- list()
  res <- list()
  for(i in c(1:length(rtexportObj$noncorr))){
    rtdiff[[i]] <- rtexportObj$noncorr[[i]]-rtexportObj$corr[[i]]
    
    res[[i]] <- rts
    for(n in c(1:ncol(rts))){
      res[[i]][,n] <- sapply(rts[,n],
                             fx,
                             rtcorr = rtexportObj$corr[[i]],
                             rtdiffs = rtdiff[[i]])
      
    }
  }
  

    names(res) <- basename(rtexportObj$fnames)

  return(res)
}