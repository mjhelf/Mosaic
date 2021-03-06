% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions_formatting_utilities.R
\name{ListToReactiveValues}
\alias{ListToReactiveValues}
\title{ListToReactiveValues}
\usage{
ListToReactiveValues(ls)
}
\arguments{
\item{ls}{a list object}
}
\value{
a \code{\link[shiny]{reactiveValues}} object
}
\description{
recursively converts lists to reactiveValues, essentially the reverse of 
\code{\link[shiny]{reactiveValuesToList}()}. Has to be called in a shiny
 session.
}
