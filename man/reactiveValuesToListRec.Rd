% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions_formatting_utilities.R
\name{reactiveValuesToListRec}
\alias{reactiveValuesToListRec}
\title{reactiveValuesToListRec}
\usage{
reactiveValuesToListRec(x)
}
\arguments{
\item{x}{a \code{\link[shiny]{reactiveValues}} object}
}
\value{
a list object
}
\description{
recursively converts reactiveValues to lists, essentially a recursive version of 
\code{\link[shiny]{reactiveValuesToList}()}. Has to be called in a shiny
 session.
}
