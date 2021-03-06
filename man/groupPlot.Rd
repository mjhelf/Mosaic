% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions_plotting_EICs.R
\name{groupPlot}
\alias{groupPlot}
\title{groupPlot}
\usage{
groupPlot(
  EIClist,
  grouping,
  plotProps = list(TIC = TRUE, cx = 1, colr = topo.colors(nrow(EIClist[[1]]), alpha =
    1), ylim = NULL, xlim = NULL, lw = 1, midline = 100, yzoom = 1),
  compProps = list(mfrow = c(1, 2), oma = c(0, 2, 8, 0), xpd = NA, bg = NA, header =
    paste0(names(EIClist)), header2 = NULL, pdfFile = NULL, pdfHi = 6, pdfWi = 12, cx =
    1, adductLabs = c("0", "1", "2")),
  raise = F,
  relPlot = F,
  margins = NULL,
  ylabshift = 0,
  RescaleExclude = NULL
)
}
\arguments{
\item{EIClist}{list of EICs from \code{\link{multiEIC}()} or \code{\link{multiEICplus}()}}

\item{grouping}{a named list of grouped file names (as supplied in $grouping of rawLayout objects)}

\item{plotProps}{a list of settings for the individual plots, see \code{Details}}

\item{compProps}{layoout options for the composite plot, see \code{Details}}

\item{raise}{if TRUE, EIC will be plotted with y axis going to -0.02*max(ylim) so that EICs with 0 intensity are visible.}

\item{relPlot}{if TRUE, y-axis will show relative intensities}

\item{margins}{manual setting for plot margins (par$mar)}

\item{ylabshift}{shift horizontal position of y axis label}

\item{RescaleExclude}{character(), exclude this group from rescaling, or NULL to use all}
}
\value{
sends a grouped EIC plot to the current plotting device
}
\description{
generate multiple EICs on one page
}
\details{
\describe{
\item{plotProps}{A list with these elements:
\itemize{
\item \code{TIC} if TRUE, TIC instead of EIC
\item \code{cx} numeric(1) font size (character expansion) factor
\item \code{colr} color range (actual vector of color values)
\item \code{ylim} data.frame or matrix of nrow = number of plotted features,
 with min and max visible rt value (in seconds) for each feature
\item \code{xlim} data.frame or matrix of nrow = number of plotted features,
 with min and max visible intensity value for each feature
\item \code{midline} numeric() of y-axis positions where a dotted vertical 
line should be plotted
\item \code{lw} line width for plot lines
\item \code{yzoom} zoom factor into y-axis
}
}
\item{compProps}{
\itemize{
\item \code{mfrow} integer(2) rows and columns for plotting (cf. par(), mfrow)
\item \code{oma} numeric(4) outer margins (cf. par(), oma)
\item \code{xpd} drawing outside of plot region, cf. par(), xpd
\item \code{bg} background color, cf. par(), bg
\item \code{header} First (title) line of composite plot
\item \code{header2} Subtitle line of composite plot
\item \code{pdfFile} character - if not NULL, plotting result will be saved in a pdf file with this name.
\item \code{pdfHi} pdf height in inches
\item \code{pdfWi} pdf width in inches
\item \code{cx} numeric(1) font size (character expansion) factor
\item \code{adductLabs} adduct labels (nonfunctional)
}
}
}
}
