% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions_class_featureTable.R
\name{asMetaboAnalyst}
\alias{asMetaboAnalyst}
\title{asMetaboAnalyst}
\usage{
asMetaboAnalyst(df, groups)
}
\arguments{
\item{df}{data.frame with intensity values and rt and mz columns}

\item{groups}{a data.frame with grouping information (Sample names in first column, groups in additional columns)}
}
\value{
A list with header and body of the MetaboAnalyst formatted table
}
\description{
Reformat a data.frame to MetaboAnalyst csv format
}
\examples{
\dontrun{
MseekExamplePreload(data = FALSE, tables = TRUE)
asMetaboAnalyst(tab1$df, groups = tab1$anagrouptable)
}

}
