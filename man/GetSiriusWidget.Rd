% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Widget_GetSiriusWidget.R
\name{GetSiriusWidget}
\alias{GetSiriusWidget}
\alias{GetSiriusWidgetUI}
\title{GetSiriusWidget}
\usage{
GetSiriusWidget(
  input,
  output,
  session,
  reactives = reactive({     list(outfolder = "Metaboseek", ms2 = NULL, instrument =
    "orbitrap", parentmz = NULL, rt = NULL, comments = NULL, ion = "[M+H]+", charge = 1,
    fingerid = T, scanindices = NULL, sirpath = "sirius-console-64", moreOpts = "") })
)

GetSiriusWidgetUI(id)
}
\arguments{
\item{input}{arguments necessary for use with 
\code{\link[shiny]{callModule}()}}

\item{output}{arguments necessary for use with 
\code{\link[shiny]{callModule}()}}

\item{session}{arguments necessary for use with 
\code{\link[shiny]{callModule}()}}

\item{reactives}{a reactive() returning a list of \code{\link{runSirius}()}
parameters}

\item{id}{id to be used to define a namespace via  \code{\link[shiny]{NS}()}
(must match \code{id} in \code{\link[shiny]{callModule}} 
for the server Module)}
}
\description{
Widget that starts a SIRIUS analysis as specified in reactives({}, which will 
add an entry to the index file in the SIRIUS folder to be observed by the SiriusModule
}
\section{Functions}{
\itemize{
\item \code{GetSiriusWidget}: server logic

\item \code{GetSiriusWidgetUI}: UI elements
}}

