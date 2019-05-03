#private auxiliary function to test if an input prob is a valid probability value
check_prob<- function(prob){
  if(prob <= 1 & prob >=0){
    return(TRUE)
  }
  else{
    stop("p has to be a number betwen 0 and 1")
  }
}

#private auxiliary function to test if an input trials is a valid value for number of trials
check_trials <- function(trials){
  if(trials >= 0 & trials %% 1 == 0){
    return(TRUE)
  }
  else{
    stop("invalid trials value")
  }
}

#private auxiliary function to test if an input success is a valid value for number of successes
check_success <- function(success, trials){
  for(i in success){
    if(i %% 1 != 0|i < 0){
      stop("invalid success value")
    }
    if(i>trials){
      stop("success cannot be greater than trials")
    }
  }
  return(TRUE)
}
