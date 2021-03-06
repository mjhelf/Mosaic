% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Module_WelcomePageModule.R
\name{WelcomePageModule}
\alias{WelcomePageModule}
\alias{WelcomePageModuleUI}
\title{WelcomePageModule}
\usage{
WelcomePageModule(
  input,
  output,
  session,
  values = reactiveValues(projectData = values$projectData, featureTables =
    values$featureTables, MSData = values$MSData, GlobalOpts = values$GlobalOpts),
  show = reactive({     TRUE })
)

WelcomePageModuleUI(id)
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

\item{show}{a reactive(), if show() is TRUE, will show update news}

\item{id}{id to be used to define a namespace via  \code{\link[shiny]{NS}()} 
(must match \code{id} in \code{\link[shiny]{callModule}} 
for the server Module)}
}
\value{
Returns nothing
}
\description{
Start page module, shows update news and allows loading of data.
}
\section{Functions}{
\itemize{
\item \code{WelcomePageModule}: Server logic

\item \code{WelcomePageModuleUI}: UI elements
}}

\examples{
\dontrun{
library(shiny)

ui <- MseekMinimalUI(WelcomePageModuleUI("examplemodule"), diagnostics = T)

server <- function(input, output, session) {
  MseekMinimalServer(diagnostics = T, data = F, tables = F)
  
  ExampleModule <- callModule(WelcomePageModule, "examplemodule", values)
}

# Run Shiny app
shinyApp(ui, server)
}

}
\seealso{
\code{\link{values}} for a description of the \code{values} object
}
