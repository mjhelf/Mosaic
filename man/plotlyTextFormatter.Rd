% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions_plotting_genericData.R
\name{plotlyTextFormatter}
\alias{plotlyTextFormatter}
\title{plotlyTextFormatter}
\usage{
plotlyTextFormatter(df, cols)
}
\arguments{
\item{df}{data.frame}

\item{cols}{character() of column names to display}
}
\value{
a character(), pasting together column names and contents of 
columns to make an informative plot title
}
\description{
prepare text to be shown in plotly through aes(text)
}
