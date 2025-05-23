% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualization.R
\name{vizAllClusters}
\alias{vizAllClusters}
\title{Visualize all clusters on the tissue}
\usage{
vizAllClusters(
  cells,
  coms,
  ofInterest = NULL,
  axisAdj = 1,
  s = 0.5,
  a = 1,
  title = NULL,
  nacol = transparentCol(color = "gray", percent = 50)
)
}
\arguments{
\item{cells}{either a data.frame or sf object with cell spatial coordinates}

\item{coms}{a factor of cell type labels for the cells}

\item{ofInterest}{a vector of specific clusters to visualize (default; NULL)}

\item{axisAdj}{how much to increase axis ranges. If tissue, 100 okay, if embedding, 1 ok (default: 100)}

\item{s}{size of points (default: 0.01)}

\item{a}{alpha of points (default: 1; no transparency)}

\item{title}{title of plot (default: NULL)}

\item{nacol}{color of the NA values for cells of "other" cluster (default: (transparentCol(color = "gray", percent = 50)))}
}
\value{
plot
}
\description{
uses the x and y position information and a chosen set of communities
}
\examples{
\dontrun{
data(slide)
vizAllClusters(slide, coms = slide$celltypes)
}

}
