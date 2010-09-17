\name{mpmcorrelogram}
\alias{mpmcorrelogram}
\alias{print.mpmcorrelogram}
\alias{plot.mpmcorrelogram}
\title{Multivariate Partial Mantel Correlogram}
\description{
  Function mpmcorrelogram computes both multivariate and multivariate partial
  Mantel correlograms. Multivariate Mantel correlograms were proposed by Sokal
  (1986) and Oden and Sokal (1986) and popularized among ecologists by Legendre
  and Legendre (1998, pp. 736-738). Multivariate partial Mantel correlograms
  are described and employed by Matesanz et al (submited).
}
\usage{
  mpmcorrelogram(xdis, geodis, zdis = NULL, method = "pearson",
                 alfa = 0.05, nclass = NULL, breaks = NULL,
                 permutations = 999, strata, simil = FALSE,
                 plot = TRUE, print = TRUE)

  \method{plot}{mpmcorrelogram}(x, pch = c(15, 22), xlim = NULL, ylim = NULL,
                ylab = NULL, xlab = NULL, alfa = 0.05, \dots)
}


\arguments{
  \item{xdis, geodis, zdis}{
    Multivariate distance (or similarity) matrices or their
    \link{as.dist} representation
  }
  \item{method}{
    Correlation method, as accepted by \link{cor}:
    "pearson", "spearman" or "kendall". 
  }
  \item{alfa}{
    Significance level for the points drawn with black symbols in the
    correlogram. By default \code{alpha} = 0.05.
  }
  \item{nclass}{
    Number of distance classes. Deafult \code{NULL} causes Sturge's law
    being used to determine the number of classes unless break points
    are provided.
  }
  \item{breaks}{
    Vector with break points of the distance classes.
  }
  \item{permutations}{
    Number of permutations for the tests of significance.
  }
  \item{strata}{
    An integer vector or factor specifying the strata for permutation.
    If supplied, observations are permuted only within the specified strata.
  }
  \item{simil}{
    Logical. Is the first matrix a similarity matrix? Default=\code{FALSE}.
  }
  \item{plot}{
    Logical. Should the correlogram be ploted?. 
  }
  \item{print}{
    Logical. Should the results be printed?
  }
 \item{x}{
    An object of class mpmcorrelogram, i.e. resulting from function
    mpmcorrelogram.
  }
  \item{pch}{
    Vector with two integers (or two single characters) specifying the symbols
    (or characters) to plot respectively the significant
    and non-significant \emph{rM} values.  See \link{points} for possible
    values and their interpretation.
  }
  \item{xlim}{
    Vector with the limits for the x-axis.
  }
  \item{ylim}{
    Vector with the limits for the y-axis.
  }
  \item{ylab}{
    Label for the y-axis.
  }
  \item{xlab}{
    Label for the x-axis.
  }
  \item{\dots}{
    Other parameters passed to print and plot methods.
}
}
\details{
  The function \code{mpmcorrelogram} computes both Mantel correlograms and
  \emph{partial} Mantel correlograms.
  A correlogram is a graph in which spatial correlation values are plotted,
  on the ordinate, as a function of the geographic distance classes among
  the study units along the abscissa. In a "classical" Mantel correlogram,
  a Mantel correlation (Mantel 1967) is computed between a multivariate 
  (e.g. multi-species or multi-locus) distance or similarity matrix
  and a design matrix representing each of the geographic distance classes
  in turn. The Mantel statistic is tested through a permutational Mantel test
  performed by \pkg{vegan}'s \link[vegan]{mantel} function.

  In a partial Mantel correlogram, a partial correlation conditioned on a
  third matrix is computed between the focal matrix and the design matrix
  representing each of the geographic distance classes. In this case, 
  the partial Mantel statistic is tested through a permutational test
  performed by \pkg{vegan}'s \link[vegan]{mantel.partial} function.
  
  A practical application of the use of the partial Mantel correlogram 
  can be seen in Matesanz et al. (submited).
}
\value{
  If the arguments \code{plot} and \code{print} are both \code{TRUE}, 
  \code{mpmcorrelogram} by default will draw a correlogram where solid squares
  indicate significant \code{rM} values and void squares indicate non-significant ones.
  It will also print the results as a table. In any case, \code{mpmcorrelogram}
  will return an object of \code{class mpmcorrelogram}, i.e. a list with the
  following elements:
  \item{breaks}{
    Vector with the break points of the distance classes considered. 
  }
  \item{rM}{
    Vector with the computed Mantel correlations for each distance class.  
  }
  \item{signif}{
    The value of the selected \code{alfa}.
  }
  \item{pvalues}{
    Vector with the p-values computed for each distance class.
  }
  \item{pval.Bonferroni}{
    Vector with the p-values after a progressive Bonferroni correction.
  }
  \item{clases}{
    Alfanumeric vector with the range of each distance class.
  }

}
\references{

  Legendre, P. and L. Legendre. 1998. \emph{Numerical ecology}, 2nd English
    edition. Elsevier Science BV, Amsterdam. 

  Mantel, N. 1967. The detection of disease clustering and a generalized
    regression approach. \emph{Cancer Res.} 27: 209-220. 

  Matesanz, S., T. E. Gimeno, M. de la Cruz, A. Escudero and F. Valladares.
    Fine-scale spatial patterns and genetic structure of two co-occurring
    plant congeners. \emph{submitted}, 2010.
    
  Oden, N. L. and R. R. Sokal. 1986. Directional autocorrelation: an extension
    of spatial correlograms to two dimensions. \emph{Syst. Zool.} 35: 608-617. 

  Sokal, R. R. 1986. Spatial data analysis and historical processes.
    29-43 in: E. Diday et al. (eds.) \emph{Data analysis and informatics},
    IV. North-Holland, Amsterdam. 

}

\author{
  Marcelino de la Cruz Rot \email{marcelino.delacruz@upm.es}
}

\note{
  The implementation of the Mantel correlogram computation in
  the function \code{mpmcorrelogram} (and that of Mantel correlation performed
  by \pkg{vegan}'s \link[vegan]{mantel.partial} and \link[vegan]{mantel} 
  functions) are based on the description of Legendre and Legendre (1998).
  Following these approaches, positive Mantel statistics correspond to
  positive autocorrelation when the focal matrix (i.e. \code{xdis})
  is a similarity matrix and to negative values when it is a 
  distance matrix. As most of the designed tools in \R for summarizing
  relationships between the rows of data matrices return distance objects,
  the argument \code{simil} in \code{mpmcorrelogram} is set by default to 
  \code{FALSE}. See the examples for the use with a similarity matrix.
}

\seealso{
  \pkg{vegan}'s \link[vegan]{mantel.correlog} for another implementation of 
  (non-partial) Mantel correlograms.
}

\examples{
 # Example from Figure 13.12 of Legendre and Legendre (1998):

 # Get similarity matrix based on assemblage composition.
 
 data(S) 
 
 # Get euclidean distance between sites.
 
 data(D)
 
 # Compute Multivariate Mantel Correlogram
 # as in Fig. 13.12 of Legendre and Legendre
 
 \dontrun{
 result <- mpmcorrelogram(S, D, simil=TRUE)
 }
 \testonly{
 result <- mpmcorrelogram(S,D, simil=TRUE,permutations=4)
 }
 
 # A Multivariate Partial examle.
 # Get distance matrix of "covariate" attributes
 
 data(Zd)
 
 # Compute multivariate partial Mantel correlogram
 
 \dontrun{
 result <- mpmcorrelogram(S, D, Zd, simil=TRUE)
 }
 \testonly{
 result <- mpmcorrelogram(S, D, Zd, simil=TRUE, permutations=4)
 }

# Change the appearance of the plot
 
 \dontrun{
 plot(result, pch=c(17,24))
 }
}

\keyword{ spatial }
\keyword{ multivariate }
