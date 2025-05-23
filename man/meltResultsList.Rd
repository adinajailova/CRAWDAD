% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing_outputs.R
\name{meltResultsList}
\alias{meltResultsList}
\title{Melt the output list of \code{findTrends()} into a dataframe}
\usage{
meltResultsList(resultsList, id = NA, withPerms = FALSE)
}
\arguments{
\item{resultsList}{list output from \code{findTrends()}}

\item{id}{id desired, can add a column that contains an additional identifier for the results. Can use these for plotting and comparing different things}

\item{withPerms}{if the results list is a list of lists using \code{returnMeans = FALSE} in \code{findTrends()}, then column order is different and this flag is needed (default: FALSE)}
}
\description{
idea is that the output of \code{findTrends()} is a list of dataframes, where each dataframe
is for a reference cell type and contains the Z scores at each scale for the neighbor cell types.
So melt this list of dataframes into a single dataframe. Idea is to get a single dataframe setup for plotting with
ggplot2 and tidyverse functions. \code{id} parameter allows adding a specific identifier for the given melted results so that
one can combine multiple results dataframes and compare downstream.
For example, you melt a results list from \code{findTrends()} that was generated from an analysis using a neighbor distance of 100.
Then you generate another one that was done with neighbor distance of 200.
The id column for each dataframe can be set to "100" and "200", respectively.
Then both dataframes can be combined into one final dataframe.
Now you have identifiers that include: scale, neighbor, reference, and "id" (ie neighbor distance).
}
\examples{
\dontrun{
data(sim)
cells <- toSF(pos = sim[,c("x", "y")], celltypes = sim$celltypes)
shuffleList <- makeShuffledCells(cells, scales = c(150, 250, 500, 750, 1000), ncores = 2)
results <- findTrends(cells, dist = 100, shuffleList = shuffleList, ncores = 2)
meltResultsList(results)
}

}
