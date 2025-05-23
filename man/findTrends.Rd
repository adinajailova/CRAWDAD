% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/finding_trends.R
\name{findTrends}
\alias{findTrends}
\title{Compute trends of cell type colocalization for each cell type combination across specified scales}
\usage{
findTrends(
  cells,
  neighDist = 50,
  ncores = 1,
  shuffleList,
  subsetList = NULL,
  verbose = TRUE,
  removeDups = TRUE,
  returnMeans = TRUE
)
}
\arguments{
\item{cells}{sf object, with celltypes features and point geometries}

\item{neighDist}{numeric distance to define neighbor cells with respect to each reference cell (default: 50)}

\item{ncores}{number of cores for parallelization (default 1)}

\item{shuffleList}{a list of cell type labels shuffled at different scales (output from \code{makeShuffledCells()})}

\item{subsetList}{a subset list (output from \code{selectSubsets()}). Required if computing trends for subsets (default NULL)}

\item{verbose}{Boolean for verbosity (default TRUE)}

\item{removeDups}{remove duplicate neighbor cells to prevent them from being counted multiple times and inflate the Z scores (default: TRUE)}

\item{returnMeans}{if multiple permutations, return the mean Z score across the permutations in each scale with respect to each neighbor cell type (default: TRUE)}
}
\value{
A list that contains a dataframe for each reference cell type, where the dataframe contains the significance values for each neighbor cell type at each scale
}
\description{
Trends are based on significant differences in cell type proportions between the real and randomly shuffled datasets.
Cell type proportions are with respect to the different cell types that are neighboring the cells of a given reference cell type within a certain defined distance.
This is done at difference scales, where a scale is whether the cell type labels are shuffled locally or globally.
Trends are essentially built from significance values. The significance test basically asks if two cell types are localized or separated by assessing if the proportion of the neighboring cell type is significantly greater, or less than, random chance.
}
\examples{
\dontrun{
data(sim)
shuffleList <- makeShuffledCells(sim, scales = c(50, 100, 200, 300, 400, 500))
findTrends(sim, neighDist = 50, shuffleList = shuffleList, ncores = 2)
}

}
