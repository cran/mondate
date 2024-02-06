\name{as.difftime}
\alias{as.difftime}
\title{Difftime with units Months and Years}
\description{
Expand difftime units to include months and years .
}
\usage{
as.difftime(tim, format = "\%X", units = "auto")
}
\arguments{
\item{tim}{
  character string or numeric value specifying a time interval.
}
\item{format}{
  character specifying the format of tim: see \link{strptime}.
  The default is a locale-specific time format.
}
\item{units}{
  Anything allowed by \link[base]{as.difftime}.
  In addition, can be "months" or "years" in which case 
  \code{tim} must be numeric.
}
}
\details{
Primarily used to facilitate adding months and years to 
\code{mondate}s.
See \link[base]{as.difftime}.
}
\value{
See \link[base]{as.difftime}.
}
\author{
Dan Murphy.
}
\seealso{
Base \code{\link{as.difftime}}
}
\examples{
x <- mondate(0:12)
y <- as.difftime(1, , "months")
x + y
x - y
}
