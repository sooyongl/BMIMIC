library(BMIMIC)
library(rstan)

stan_data <-
  mkData(N1         = 500, 
         N2         = 500, 
         nitem      = 10, 
         mu_2       = 0.2, 
         var_2      = 2,
         uni_dif    = c(0,0,0,0,0.2,0.2,0.2,0,0,0), 
         nonuni_dif = c(0,0,0,0,0,0,0,0.2,0.2,0.2), 
         anchor_n   = 4)


stan_fit <- 
  rstan::stan(
    file = system.file("inst/stan", package = "BMIMIC")
    data   = stan_data
  )