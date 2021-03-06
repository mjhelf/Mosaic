#' densplot
#' 
#' generate a density plot for numeric data.
#' 
#' @return sends a density plot to the current plotting device
#' 
#' @details
#' To accomodate logarithmized data,
#' Inf values will be set to 1.1*largest value that is not Inf
#' -Inf values will be set to 0.9*smallest value that is not -Inf
#' 
#' @param densin numeric vector or matrix
#' @param perc numeric(): draw lines at these quantiles
#' @param ... arguments passed to \code{plot()}
#' 
#' @importFrom BiocGenerics density
#' @importFrom stats quantile
#' @importFrom grDevices rainbow
#' 
#' @export
densplot <-function(densin = stats::rnorm(100),
                    perc = c(0.01,0.05,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9, 0.95, 0.99),
                    ... #pass arguments to plot()
){
    
    #densin <- log10(filtrate3$maxfold)
    densin[densin==Inf] <- 1.1*max(densin[densin!=Inf])
    densin[densin==-Inf] <- 0.9*min(densin[densin!=-Inf])
    densin <- na.omit(densin)
    
    dens <- density(densin,from=min(densin),
                    to=max(densin), cut=0, n=4096, na.rm = T)
    
    #dens$x[is.infinite(dens$x)] <- 1*max(dens$x[dens$x!=Inf])
    graphics::plot(dens, type= "l", ...)
    
    # perc <- c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9, 0.95, 0.99)
    
    quan <- quantile(densin,perc)
    
    ##plotquantile lines and legend
    colr <- rainbow(length(perc), s = 1, v = 1, start = 0, end = max(1, length(perc) - 1)/length(perc), alpha = 0.5)
    graphics::segments(quan,min(dens$y),quan,max(dens$y), col=colr, lwd=0.8)
    legendtext <- paste0(perc,": ",round(quan,4) )
    legend("topright", inset=c(0,0.03*max(dens$y)),legendtext, lty=1,lwd=2.5, col=colr, bty="n",  cex=.5)
}


#' Plot summary data on grouped data
#' 
#' Wrapper function for \code{ggplot}.
#' 
#' @return a ggplot object that can be plotted.
#' 
#' @param ... arguments passed to \code{\link[ggplot2]{ggplot}()}
#' @param main plot type
#' @param dotplot boolean whether or not to plot individual values as dots
#' @param mark select a value to be plotted
#' @param errorbar select type of error bar
#' @param rotate boolean whether or not to rotate x-axis labels
#' 
#' 
#' @import ggplot2
#' @export
groupedplot <- function(...,
                        main = c("boxplot", "barplot","violinplot"),
                        dotplot = TRUE,
                        mark = c("mean", "median"),
                        errorbar = c("Standard Deviation", "95% Confidence Interval"),
                        rotate = TRUE
){
    
    
    p<-ggplot2::ggplot(...) 
    
    switch(main,
           boxplot = {p <- p + ggplot2::geom_boxplot()},
           barplot = {p <- p + ggplot2::geom_bar(stat = "summary", fun.y = "mean")},
           violinplot = {p <- p + ggplot2::geom_violin(trim = F)})
    
    if(dotplot){#p <- p + ggplot2::geom_dotplot(binaxis='y', stackdir='center', binwidth = 1, dotsize = dsize)
        p <- p + ggplot2::geom_point()}
    
    switch(mark,
           mean = {p <- p + ggplot2::stat_summary(fun.y = mean, geom = "point", shape = 17, size = 3, color = "red")},
           median = {p <- p + ggplot2::stat_summary(fun.y = median, geom = "point", shape = 17, size = 3, color = "red")}
    )
    
    
    switch(errorbar,
           "Standard Deviation" = {p <- p + ggplot2::stat_summary(fun.data=mean_sdl, fun.args = list(mult=1),
                                                                  geom="errorbar", color="orange", width = 0.2)},
           "95% Confidence Interval" = {p <- p + ggplot2::stat_summary(fun.data=mean_cl_normal, fun.args = list(mult=1),
                                                                       geom="errorbar", color="orange", width = 0.2)}
    )
    
    
    if(rotate){p <- p + ggplot2::theme(axis.text.x = element_text(angle = -90, hjust = 0, vjust = 0.5))}
    return(p)
}


#' assignColor
#' 
#' Assign a color from a range of colors to all values in a numeric vector (datarange)
#' 
#' @return a character vector of same length as \code{datarange} with color values
#' 
#' @param datarange the data range for the legend
#' @param colscale character vector of colors
#' @param center force the middle of the color vector to correspond to this value
#' @param manualRange enter a range to fit the color range to, if not range(datarange)
#' @param NAcolor color to assign to NA values
#' 
#' @export
assignColor <- function(datarange,
                        colscale,
                        center = NULL,
                        manualRange = NULL,
                        NAcolor = "#FFFFFF"){
    
    ncolors <- length(colscale)
    
    nonas <- datarange[is.finite(datarange)]
    
    if(!missing(manualRange) 
       && !is.null(manualRange)){
        manualRange <- manualRange[is.finite(manualRange)]
        if(length(manualRange)){
            nonas[nonas > max(manualRange)] <- max(manualRange)
            nonas[nonas < min(manualRange)] <- min(manualRange)
        }         
           }
    

    if(
        max(abs(nonas)) > 0){
        if(!missing(center) && !is.null(center)){
            
            #First, set all color selections to the center value
            middleColInt <- as.integer((ncolors+1)/2)
            col <- rep(colscale[middleColInt],length(nonas))
            col[]
            #now, modify for the data values above and below the center value:
            selabove <- which(nonas > center)
            selbelow <- which(nonas < center)
            
             scalerange <- max(abs(c(manualRange,nonas) - center))

           
            if(length(selabove)){
                col[selabove] <- colscale[round(scales::rescale(x = nonas[selabove],
                                                          to = range(middleColInt:ncolors),
                                                          from = range(c(center, center + scalerange))),0)]
                    }
            if(length(selbelow)){
                col[selbelow] <- colscale[round(scales::rescale(nonas[selbelow],
                                                          c(1,middleColInt),
                                                          from = range(c(center - scalerange,center))),0)]
                    }
        }else{
            
            if(diff(range(nonas)) == 0){
                col <- rep(colscale[1], length(nonas))
            }else{
                colsel <- scales::rescale(nonas,
                                          c(1,ncolors),
                                          from = range(c(manualRange,nonas)))
                colsel <- round(colsel,0)
            
                col <- colscale[colsel]
                }
            
        }
        
        
    }
    else{
        col <- rep(colscale[1], length(nonas))
    }
    
    if(length(nonas) == length(datarange)){
        return(col)
        }else{
            res <- rep(NAcolor, length(datarange))
            res[is.finite(datarange)] <- col   
            return(res)
        }
    
}

#' colorRampLegend
#' 
#' Make a figure legend for a continuous color range
#' @return sends a new plot to the current plotting device
#' 
#' @param datarange the data range for the legend
#' @param colscale character vector of colors
#' @param title legend title
#'
#' @export
colorRampLegend <- function(datarange, colscale, title = ""){
    par(oma = c(1,0,1,0),
        mar = c(1,2,1,2), xpd = FALSE,
        xaxs = "i") 
    legend_image <- as.raster(matrix(colscale, nrow=1))
    
    plot(numeric(), numeric(),
         xlim =  c(min(datarange),max(datarange)),
         ylim = c(0,1),
         type = 'n', axes = F,xlab = '', ylab = '', main = title)
    
    
    axis(side=1, lwd=1, at = pretty(c(min(datarange),max(datarange))),
         labels = format(pretty(c(min(datarange),max(datarange))),
                         scientific = (max(abs(datarange)) > 10000 || min(abs(datarange)) < 0.0001 )),
         mgp=c(0,0.4,0), cex.axis=1, xaxs = "i")
    
    Hmisc::minor.tick(nx=2, ny=1, tick.ratio=0.5, x.args = list(), y.args = list())
    
    
    rasterImage(legend_image,min(datarange), 0, max(datarange), 1)
}



#' reverselog_trans
#' 
#' reverse log scale for ggplot, as described in reference. 
#' 
#' @references 
#' https://stackoverflow.com/questions/11053899/how-to-get-a-reversed-log10-scale-in-ggplot2 , accessed on 2019-06-17
#' 
#' @param base base of log
#' 
#' @importFrom scales trans_new log_breaks
#'
reverselog_trans <- function(base = exp(1)) {
    trans <- function(x) -log(x, base)
    inv <- function(x) base^(-x)
    trans_new(paste0("reverselog-", format(base)), trans, inv, 
              log_breaks(base = base), 
              domain = c(1e-100, Inf))
}

#' safelog
#' 
#' apply a log function to a numeric vector, but replaces zeros and uses abs values 
#' 
#' @return a numeric vector of same length as \code{x}, with logarithmized values
#' 
#' @param x numeric vector of positive values
#' @param base of log
#' @param replaceZeros replace zeros with this value, if NULL will use 
#' smallest non-zero absolute value in x
#' @param replaceNonFinites replace non-finite values (\code{Inf, -Inf, NA}) 
#' with this value before applying log
#' 
#' @importFrom scales trans_new log_breaks
#'
safelog <- function(x,
                    base = 10,
                    replaceZeros = NULL,
                    replaceNonFinites = NA_real_){
    if(!any(is.finite(x))){return(rep(replaceNonFinites, length(x)))}
    
    x[x==0]   <- if(is.null(replaceZeros)){min(abs(x[x!=0]))}else{replaceZeros}
    
    x[!is.finite(x)] <- replaceNonFinites
    
    return(log(abs(x), base))
}

#' plotlyTextFormatter
#' 
#' prepare text to be shown in plotly through aes(text)
#' 
#' @return a character(), pasting together column names and contents of 
#' columns to make an informative plot title
#' 
#' @param df data.frame
#' @param cols character() of column names to display
#' 
plotlyTextFormatter <- function(df, cols){
    
    collect <- list()
    
    for(i in cols){
        collect[[i]] <- paste(i, df[[i]], sep = ": ")
    }
    
    collect2 <- collect[[1]]
    
    if(length(collect) >1){
        for (i in 2:length(collect)){
            collect2 <- paste(collect2, collect[[i]], sep = "\n")
        }
    }
    return(collect2)
    
}