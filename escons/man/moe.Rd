% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/moe.R
\name{moe}
\alias{moe}
\alias{moe.default}
\alias{moe.numeric}
\alias{moe.data.frame}
\title{Calculate margin of error of a proportion}
\usage{
moe(x, ...)

\method{moe}{default}(x, N, level, ...)

\method{moe}{numeric}(x, N, level, ...)

\method{moe}{data.frame}(x, N, level, ...)
}
\arguments{
\item{x}{A numeric vector or data.frame}

\item{...}{Additional parameters (currently not used)}

\item{N}{The sample size}

\item{level}{The confidence level (between 0 and 1)}
}
\description{
Calculates margin of error of a proportion for a given confidence
level and sample size
}
\examples{
\dontrun{
moe(.5, N=1000, level=.95)
moe(res2021, N=3000, level=.95)
}
}
