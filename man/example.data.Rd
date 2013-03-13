\name{example.data}
\alias{S}
\alias{D}
\alias{Zd}
\alias{example.data}
\docType{data}
\title{Assemblage similarity and geographic distance matrices}
\description{
  Artificial data matrices used by Legendre and Legendre (1998) to exemplify 
  the computation of multivariate Mantel correlograms. \code{S} is assumed to represent
  a similarity matrix computed from assemblage data among 10 sampling sites within
  a 1-km2 sampling area (Legendre and Legendre 1998: 737). \code{D} is the matrix of euclidean
  distances among the sampling localities (Legendre and Legendre 1998: 718).
  \code{Zd} is another distance matrix, assumed to represent some other multivariate difference
  among sites (e.g. environmental diferences) that are more accentuated for distances
  greater than 0.28 km. 
}
\usage{
  data(S)
  data(D)
  data(Zd)
}

\references{
Legendre, P. and Legendre, L. (1998) \emph{Numerical Ecology}. 2nd English Edition. Elsevier
}
\examples{
data(S)
%data(D)
data(Zd)
}
\keyword{datasets}
