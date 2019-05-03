#1.3)

#' @title binomial_choose function
#' @description compute the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return number of combinations in which k successes can occur in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n, k){
    if(any(k > n)){
      stop("k cannot be greater than n")
    }
    else{
      x <- factorial(n)/(factorial(k)*factorial(n - k))
      return(x)
    }
}

#1.4)

#' @title bin_probability function
#' @description calculate the probability of k successes in n trials given prob of success p
#' @param success number of success
#' @param trials number of trials
#' @param prob probability of success
#' @return probability of k successes in n trials given prob of success p
#' @export
#' @examples
#' # probability of getting 2 successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' # probability of getting 2 or less successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' # 55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  p<- bin_choose(trials, success) * (prob^success) *
    (1 - prob)^(trials - success)
  return(p)
}

#1.5)

#' @title bin_distribution
#' @description compute the binomial probability distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame with the probability distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  df <- data.frame(success, probability)
  class(df) <- c("bindis", "data.frame")
  return(df)
}

#' @export
plot.bindis <- function(df){
  barplot(df$probability,xlab = "successes", ylab = "probability", border = NA)
}

#1.6)

#' @title bin_cumulative
#' @description compute binomial cumulative distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return a data frame with both the probability distribution and the cumulative probabilities
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials, prob){
  df<- bin_distribution(trials, prob)
  x = 0
  cumulative <- c()
  for(i in 1:(trials + 1)){
    x =x + df$probability[i]
    cumulative[i]=x
  }
  df$cumulative <- cumulative
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#' @export
plot.bincum <- function(df) {
  plot(df$success, df$cumulative, type = "o", xlab = "successes", ylab = "probability",las = 1)
}

#1.7)

#' @title bin_variable
#' @description generate a binomial random variable object
#' @param trials number of trials
#' @param prob probability of success
#' @return a binomial random variable object
#' @export
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' bin1

bin_variable <- function(trials, prob){
  check_prob(prob)
  check_trials(trials)
  ob <- list(trials = trials, prob = prob)
  class(ob) <- "binvar"
  return(ob)
}

#' @export
print.binvar <- function(x){
  cat('"Binomial variable"\n\n')
  cat('Paramaters\n')
  cat("- number of trials: ", x$trials,"\n")
  cat("- prob of success: ", x$prob, "\n")
}

#' @export
summary.binvar <- function(binvar){
  output <- list(
    trials = binvar$trials,
    prob = binvar$prob,
    mean = aux_mean(binvar$trials, binvar$prob),
    variance = aux_variance(binvar$trials, binvar$prob),
    mode = aux_mode(binvar$trials, binvar$prob),
    skewness = aux_skewness(binvar$trials, binvar$prob),
    kurtosis = aux_kurtosis(binvar$trials, binvar$prob)
  )
  class(output) = "summary.binvar"
  return(output)
}

#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"\n\n')
  cat('Paramaters\n')
  cat("- number of trials: ", x$trials,"\n")
  cat("- prob of success: ", x$prob, "\n\n")
  cat('Measures\n')
  cat("- mean    : ", x$mean, "\n")
  cat("- variance: ", x$variance, "\n")
  cat("- mode    : ", x$mode, "\n")
  cat("- skewness: ", x$skewness, "\n")
  cat("- kurtosis: ", x$kurtosis, "\n")
}

#1.8)

#' @title binomial mean function
#' @description compute the mean of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return the mean of a binomial distribution
#' @export
#' @examples
#' bin_mean(trials = 10, prob = 0.3)

bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title binomial variance function
#' @description compute the variance of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return the variance of a binomial distribution
#' @export
#' @examples
#' bin_variance(trials = 10, prob = 0.3)

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title binomial mode function
#' @description compute the mode of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return the mode of a binomial distribution
#' @export
#' @examples
#' bin_mode(trials = 10, prob = 0.3)

bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title binomial skewness function
#' @description compute the skewness of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return the skewness of a binomial distribution
#' @export
#' @examples
#' bin_skewness(trials = 10, prob = 0.3)

bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title binomial kurtosis function
#' @description compute the kurtosis of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return the kurtosis of a binomial distribution
#' @export
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.3)

bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
