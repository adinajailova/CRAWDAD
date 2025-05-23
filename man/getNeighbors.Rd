% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/processing_outputs.R
\name{getNeighbors}
\alias{getNeighbors}
\title{get neighbor cells defined as being a distance away from a set of reference cells}
\usage{
getNeighbors(
  cells,
  referenceIds,
  removeRef = TRUE,
  dist = 50,
  returnSF = FALSE
)
}
\arguments{
\item{cells}{sf object, with celltypes features and point geometries}

\item{referenceIds}{vector of cell ids (rownames) in \code{cells} to be used as the reference cell set}

\item{removeRef}{boolean; remove reference (default: TRUE)}

\item{dist}{distance to define neighbors (default = 50)}

\item{returnSF}{boolean to return either an sf object of just the neighbors
otherwise returns factor where non neighbor cells are NAs. (default: FALSE)}
}
\value{
sf object of the neighbor cells or factor of neighbor cells
}
\description{
get neighbor cells defined as being a distance away from a set of reference cells.
\code{referenceIds} can be selected by subsetting rownames from \code{cells}:
ex: \code{rownames(cells)[which(cells$celltypes == "A")]}
or can be an entry in a subset list from \code{selectSubsets()}
}
\examples{
\dontrun{
data(sim)
cells <- toSF(pos = sim[,c("x", "y")], celltypes = sim$celltypes)
shuffleList <- makeShuffledCells(cells, scales = c(150, 250, 500, 750, 1000), ncores = 2)
binomMat <- binomialTestMatrix(cells, neighDist = 100, ncores = 2)
subsetList <- selectSubsets(binomMat, cells$celltypes, subType = "near", subThresh = 0.05)
neighCells <- getNeighbors(cells = cells, referenceIds = subsetList[["C_near_B"]],  dist = 100)
}

}
