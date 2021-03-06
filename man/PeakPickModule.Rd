% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Module_PeakPickModule.R
\name{PeakPickModule}
\alias{PeakPickModule}
\alias{PeakPickModuleUI}
\title{PeakPickModule}
\usage{
PeakPickModule(input, output, session, values)

PeakPickModuleUI(id)
}
\arguments{
\item{input}{arguments necessary for use with 
\code{\link[shiny]{callModule}()}}

\item{output}{arguments necessary for use with 
\code{\link[shiny]{callModule}()}}

\item{session}{arguments necessary for use with 
\code{\link[shiny]{callModule}()}}

\item{values}{a \code{\link[shiny]{reactiveValues}} object that in effect 
gives read and write access to external objects}

\item{id}{id to be used to define a namespace via  \code{\link[shiny]{NS}()} 
(must match \code{id} in \code{\link[shiny]{callModule}} 
for the server Module)}
}
\value{
Returns its internalValues
}
\description{
Module for picking peaks in MS data for features in a featureTable
}
\section{Functions}{
\itemize{
\item \code{PeakPickModule}: Server logic

\item \code{PeakPickModuleUI}: UI elements
}}

\seealso{
\code{\link{values}} for a description of the \code{values} object
}
