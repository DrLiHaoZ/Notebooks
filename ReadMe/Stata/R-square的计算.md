sysuse auto,clear
keep mpg weight
reg mpg weight
predict predicted_mpg
twoway (scatter mpg weight) (scatter predicted_mpg weight)
sum mpg
twoway (scatter mpg weight) (scatter predicted_mpg weight) ,yline(21.297297)

sum mpg
gen ssr = (predicted_mpg - r(mean) ^ 2
gen sst =  (mpg - r(mean)) ^ 2

total ssr
total sst

