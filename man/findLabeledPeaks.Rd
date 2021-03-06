% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions_Labelfinder.R
\name{findLabeledPeaks}
\alias{findLabeledPeaks}
\title{findLabeledPeaks}
\usage{
findLabeledPeaks(
  df,
  ref_intensityCols,
  comp_intensityCols,
  ifoldS1 = 10,
  ifoldS2 = 5
)
}
\arguments{
\item{df}{data.frame as returned by mergecollectlist(); importantly with IXSX prefixes, including for the intensity columns}

\item{ref_intensityCols}{intensity column names from original feature table (without IXS1. prefix) e.g. for unlabeled samples}

\item{comp_intensityCols}{intensity column names from original feature table (without IXS2. prefix) e.g. for labeled samples}

\item{ifoldS1}{min. fold Iso1/Iso2 in unlabeled}

\item{ifoldS2}{max. fold Iso1/Iso2 in labeled}
}
\description{
find labeled peaks in a data.frame that was prepared by mergecollectlist()
}
