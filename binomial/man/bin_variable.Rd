% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main_functions.R
\name{bin_variable}
\alias{bin_variable}
\title{bin_variable}
\usage{
bin_variable(trials, prob)
}
\arguments{
\item{trials}{number of trials}

\item{prob}{probability of success}
}
\value{
a binomial random variable object
}
\description{
generate a binomial random variable object
}
\examples{
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
}
