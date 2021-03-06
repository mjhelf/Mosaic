% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Module_MatchReferenceModule.R
\name{MatchReferenceModule}
\alias{MatchReferenceModule}
\alias{MatchReferenceModuleUI}
\title{MatchReferenceModule}
\usage{
MatchReferenceModule(
  input,
  output,
  session,
  values = reactiveValues(featureTables = NULL, Networks = NULL, MSData = NULL)
)

MatchReferenceModuleUI(id)
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
If the server module for this Module returns something,
 it is described in \code{Details}.
}
\description{
One-button module to match MseekFT and MseekGraph objects with each other
}
\section{Functions}{
\itemize{
\item \code{MatchReferenceModule}: server logic

\item \code{MatchReferenceModuleUI}: server logic
}}

\seealso{
\code{\link{values}} for a description of the \code{values} object
}
