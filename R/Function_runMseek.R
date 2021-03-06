#' RunMseek
#' 
#' Run Mseek in your webbrowser.
#' 
#' @param ... Additional arguments passed to shiny::runApp, e.g. to set up the 
#' port used or to make Mseek reachable from other computers 
#' (with host = getOption("shiny.host", "0.0.0.0"))
#'
#' @describeIn runMseek run the entire Metaboseek app
#' @export
runMseek <- function(...) {
    
    
    appDir <- system.file("app", package = "Metaboseek")
    if (appDir == "") {
        stop("Could not find Metaboseek directory.
             Try re-installing `Metaboseek`.",
             call. = FALSE)
    }
    
    shiny::runApp(appDir, ...)
}


#' @describeIn runMseek start just the peptide annotation app
#' @export
runPeptideApp <- function(...) {
    
    
    appDir <- system.file("PeptideApp", package = "Metaboseek")
    if (appDir == "") {
        stop("Could not find Metaboseek directory.
             Try re-installing `Metaboseek`.",
             call. = FALSE)
    }
    
    
    shiny::runApp(appDir, ...)
}