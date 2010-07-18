a<-mondate(matrix(1:4,2,2,dimnames=list(c("A","B"),c("12","24"))), timeunits="months")
a  # should display the end of the first 4 months of 2000
as.numeric(a, convert=FALSE, stripdim=FALSE) # should see 1,2,3,4
as.numeric(a, convert=FALSE, stripdim=TRUE)  # without dim or dimnames
as.numeric(a, convert=TRUE, stripdim=FALSE)  # same
as.numeric(a, convert=TRUE, stripdim=TRUE)   # same
a<-mondate(matrix(1:4,2,2,dimnames=list(c("A","B"),c("12","24"))), timeunits="days")
a  # should display the end of the first 4 days of 2000
as.numeric(a, convert=FALSE, stripdim=FALSE) # should see 1/31,2/31,3/31,4/31 ... fraction of the month, which is how it's stored
as.numeric(a, convert=FALSE, stripdim=TRUE)  # without dim or dimnames
as.numeric(a, convert=TRUE, stripdim=FALSE)  # should see 1,2,3,4 ... convert back to how it was entered
as.numeric(a, convert=TRUE, stripdim=TRUE)
a<-mondate(matrix(1:4,2,2,dimnames=list(c("A","B"),c("12","24"))), timeunits="years")
a   #  should display the end of the first 4 years of millenium
as.numeric(a, convert=FALSE, stripdim=FALSE) # should see 12,24,36,48 ... number of months since beginning of 2000
as.numeric(a, convert=FALSE, stripdim=TRUE)  # without dim or dimnames
as.numeric(a, convert=TRUE, stripdim=FALSE)  # should see 1,2,3,4 ... convert back to how it was entered
as.numeric(a, convert=TRUE, stripdim=TRUE)
