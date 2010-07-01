\name{Combining-methods}
\docType{methods}
\alias{c-methods}
\alias{c,mondate-method}
\alias{rep-methods}
\alias{rep,mondate-method}
\alias{cbindMondate}
\alias{rbindMondate}
\title{Methods for Combining Mondates}
\description{
Methods to combine \code{mondate}s.
}
\usage{
cbindMondate(\dots, deparse.level=1)
rbindMondate(\dots, deparse.level=1)
}
\arguments{
\item{\dots}{
R objects
that will be coerced to a \code{mondate}.
}
\item{deparse.level}{
See the \code{base} functions for details.
}
}
\details{
The \code{cbindMondate} and \code{rbindMondate} functions 
use the \code{base} \code{cbind} and \code{rbind} functions,
respectively,
to combine the arguments.
If the first argument in \code{\dots} is not a \code{mondate},
that combination is the value returned.
If the first argument in \code{\dots} is a \code{mondate},
the combination is converted to a \code{mondate}
with \code{displayFormat} and \code{timeunits} properties
equal to those of the first argument
(see method \code{mondate} to see how the conversion
takes place depending on \code{timeunits}; an example is below).
}
\section{Methods}{
\describe{
\item{\code{c(x = "mondate", \dots)}}{
combine \code{mondate}s into a \code{vector}. 
\code{\dots} any R object(s) that can
be coerced to a \code{mondate}.
The behavior mimics that of the \code{base} function.
The result will be a \code{mondate} with properties equal to those of 
\code{x}.
}

\item{\code{rep(x = "mondate", \dots)}}{
Replicates a \code{mondate}.
The behavior mimics that of the \code{base} function.
See \code{\link{rep}} for further details.
The result will be a \code{mondate} with properties equal to those of 
\code{x}.
}
}}
\value{
A \code{mondate}. 
For \code{cbind} and \code{rbind}, a \code{matrix}.
For \code{c} and \code{rep}, a \code{vector}.
}
\examples{
x <- mondate(1:6) # first 6 month-ends of the year 2000
c(x,x+6)          # all month-ends of 2000
c(0,x)            # result is "numeric", determined by the first argument
M<-mondate.ymd(2001:2005,12,31) # 5 year-ends
names(M)<-LETTERS[1:5]
rbindMondate(M,M)
begin_date <- M-12
cbindMondate(begin_date,end_date=M) # 5 pairs of year boundary-dates

# Examples of "cbind-ing" mondates with numerics
cbindMondate(begin_date, 1:5) # second column = first 5 month-ends of 2000
mondateTimeunits(begin_date)<-"years"
cbindMondate(begin_date, 1:5) # since the intention now is to measure time in years,
                              # the second column = year-ends 2000...2004

rbindMondate(end_date=M, begin_date)

rep(mondate("2010-2-14"), 3)

(M<-seq(from=mondate("1/1/2010"),length=2)) # Jan. and Feb. 1st
rep(M,3)                                  # three pairs
rep(M,each=3)                             # three Jan.'s, three Feb.'s
}
\keyword{methods}
