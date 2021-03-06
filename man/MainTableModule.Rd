% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Module_MainTableModule.R
\name{MainTableModule}
\alias{MainTableModule}
\alias{MainTableModuleUI}
\title{MainTableModule}
\usage{
MainTableModule(
  input,
  output,
  session,
  values = reactiveValues(featureTables = NULL, GlobalOpts = NULL, projectData = NULL),
  static = list(height = 300, readOnly = TRUE, contextMenu = TRUE, fixedColumnsLeft =
    1, invertReadOnly = NULL, controls = TRUE, format = list(col = NULL, format = NULL))
)

MainTableModuleUI(id)
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

\item{static}{a list of arguments that are not in a reactive context 
and hence do not change while the app is running.}

\item{id}{id to be used to define a namespace via  \code{\link[shiny]{NS}()} 
(must match \code{id} in \code{\link[shiny]{callModule}} 
for the server Module)}
}
\value{
returns its internalValues and modifies \code{\link{values}}
}
\description{
Main Feature Table viewer Module
}
\details{
\describe{
\item{static}{
\itemize{
\item \code{heigth} height of the Table view in pixels
\item \code{readOnly} if TRUE, no changes to table can be made from GUI
\item \code{contextMenu} if TRUE, allow right click 
\item \code{fixedColumnsLeft} number of columns to always show at the left 
even when scrolling horizontally
\item \code{invertReadOnly} character of column names for which to invert 
the readOnly rule (e.g. only allow editing on comments column)
\item \code{controls} show UI elements for filtering
\item \code{format} a named list with elements \code{col} and \code{format}
}

}
}
}
\section{Functions}{
\itemize{
\item \code{MainTableModule}: server logic

\item \code{MainTableModuleUI}: UI elements
}}

\examples{
\dontrun{
library(shiny)

ui <- MseekMinimalUI(MainTableModuleUI("examplemodule"),
                     diagnostics = F, dashboard = F)

server <- function(input, output) {
    MseekMinimalServer(diagnostics = F, data = F, tables = T)
    
    callModule(MainTableModule, "examplemodule", values = reactiveValues(featureTables = values$featureTables,
                                                                                          GlobalOpts = values$GlobalOpts,
                                                                                          projectData = values$projectData))
}
# Create Shiny app ----
shinyApp(ui, server)
}
}
\seealso{
\code{\link{values}} for a description of the \code{values} object
}
