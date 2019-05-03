# private auxiliary function aux_mean() to compute mean of a binomial distribution
aux_mean <- function(trials, prob){
  return(trials * prob)
}

# private auxiliary function aux_variance() to compute variance of a binomial distribution
aux_variance <- function(trials, prob){
  return(trials * prob * (1 - prob))
}

# private auxiliary function aux_mode() to compute mode of a binomial distribution
aux_mode <- function(trials, prob){
  m <- trials * prob + prob
  if (m %% 1 == 0) {
    return(c(m, m-1))
  }else{
    return(as.integer(m))
  }
}

# private auxiliary function aux_skewness() to compute skewness of a binomial distribution
aux_skewness <- function(trials, prob){
  skewness <- (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
  return(skewness)
}

# private auxiliary function aux_kurtosis() to compute the kurtosis of a binomial distribution
aux_kurtosis <- function(trials, prob){
  kurtosis <- (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(kurtosis)
}

