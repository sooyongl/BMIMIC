library(BMIMIC)
library(rstan)

generated_data <-
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
    file = file.path(system.file("stan", package = "BMIMIC"),
                     "BMIMIC_example.stan"),
    data   = generated_data$stan_data
  )

summary(stan_fit)
