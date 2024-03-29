\name{year-month-day-methods}
\docType{methods}
\alias{year-methods}
\alias{year,mondate-method}
\alias{year,Date-method}
\alias{year,POSIXt-method}
\alias{year}
\alias{quarter-methods}
\alias{quarter,mondate-method}
\alias{quarter,Date-method}
\alias{quarter,POSIXt-method}
\alias{quarter}
\alias{month-methods}
\alias{month,mondate-method}
\alias{month,Date-method}
\alias{month,POSIXt-method}
\alias{month}
\alias{day-methods}
\alias{day,mondate-method}
\alias{day,Date-method}
\alias{day,POSIXt-method}
\alias{day}
\alias{mondate.mdy}
\alias{mondate.ymd}
\alias{ymd}
\title{Useful Methods for Class mondate}
\description{
The methods in this section facilitate 
year-, month-, day-, and quarter-number extraction from objects that represent dates, 
as well as 
\code{mondate} construction
using the year, month, and day numbers of the date 
(as those numbers would be seen in the character representation of the date,
i.e.., "January" = 1 and the first day of a month = 1).
}
\usage{
year(x, ...)
month(x, ...)
day(x, ...)
quarter(x, ...)
ymd(x)

mondate.mdy(m, d, y, ...)

mondate.ymd(y, m, d, ...)

}
\arguments{
  \item{x}{
an object of class \code{mondate}, \code{Date}, or \code{POSIXt}
}
  \item{m}{
the month: 1, ..., 12.
If "missing" and \code{d} is also "missing", 
\code{m=12} by default.
}
  \item{d}{
the day: 1, ..., 31, depending on the month. 
If "missing" in the case of \code{mondate.ymd},
the last day of the month is inserted.
}
  \item{y}{
the four-digit year.
}
  \item{\dots}{
For \code{year}, \code{month}, and \code{day},
not used.
For \code{mondate.mdy} and \code{mondate.ymd}
arguments to be passed to the \code{mondate} constructor,
e.g., \code{displayFormat} and \code{timeunits}.
}
}
\value{
\code{year} returns the year \code{numeric} (e.g., 2000).

\code{month} returns the month \code{numeric} 1, ..., 12.

\code{day} returns the \code{numeric} day of the month.

\code{quarter} returns the \code{numeric} calendar quarter of the year:
1 for January - March, 2 for April - June, etc.

\code{ymd} returns a matrix with the number of rows equal to the
length of \code{x},
with appropriately-named 
columns 1 through 3 holding the \code{year},
\code{month}, and \code{day}, respectively
and with "rownames" equal to \code{names(x)}.

\code{mondate.mdy} and \code{mondate.ymd} return \code{mondate}s with the given
month, day, and year. 
Arguments \code{m}, \code{d}, and \code{y} may have length > 1;
the usual recycling rules apply.

The \code{mondate.ymd} function has a bit more functionality.
If \code{d} is "missing" in a call to \code{mondate.ymd} then the date
returned will be the last day of month \code{m} in year \code{y}.
If \code{m} is also missing, 
then the date returned will be the last day of the year.
If any of \code{y}, \code{m}, or \code{d} are \code{NA}
the result will be an all-\code{NA} vector.
And if \code{y=+-Inf} then the result will be an "infinite" mondate vector,
overriding other rules included herein.
The length of a vector result is determined 
using the usual recycling rules
as though a valid, finite scalar had been inserted instead of
\code{NA} or \code{+-Inf}.
See the \bold{Examples} section.

}
\examples{
M <- mondate.mdy(6,30,2008)
year(M)     # 2008
month(M)    # 6
day(M)      # 30

mondate.ymd(2008,6,30)  # ditto
mondate.ymd(2008,6)     # ditto; 'day' argument is "missing" so
                        # returns the last day of the month
mondate.ymd(2008,1:12)  # all month-ends of 2008, a leapyear
# year-ends 2001 through 2013, displaying only the 4-digit year when shown
mondate.ymd(2001:2013, displayFormat = "\%Y")
mondate.ymd(2010:2012, NA) # NA mondate vector of length 3
mondate.ymd(Inf,11,31)  # An infinite mondate even though only 30 days in 
                        # November
                        
x <- mondate.ymd(2013, 1:12) # month-ends in 2013
# Give x some shape
dim(x) <- 3:4
dimnames(x) <- list(A = letters[1:3], B = LETTERS[1:4])
# Return the quarter numbers in an array with the same shape and dimnames
quarter(x) 
}
\keyword{methods}
