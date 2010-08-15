\name{Coersion-from-mondate methods}
\docType{methods}
\alias{as.character-methods}
\alias{as.character,mondate-method}
\alias{as.numeric,mondate-method}
\alias{as.Date-methods}
\alias{as.Date,ANY-method}
\alias{as.Date,mondate-method}
\alias{as.POSIXct,mondate-method}
\alias{as.POSIXct.mondate}
\alias{as.POSIXlt,mondate-method}
\alias{as.POSIXlt.mondate}
\title{Coersion Methods for Mondates}
\description{
Methods to coerce a \code{mondate} to other R objects.
Currently that includes numbers, characters, 
and three classes of dates.
}
\section{Methods}{
\describe{

\item{\code{as.character(x = "mondate", format="", displayFormat, ...)}}{
    Coerce \code{mondate} to class \code{character}.
    Uses the \code{format} function.
    \describe{
        \item{\code{format}}{
            If \code{missing} the value is drawn from 
            the \code{displayFormat} property of \code{x}.
            }
        \item{\code{displayFormat}}{
            Predecessor to \code{format} argument.
            Still functional but deprecated as of 8/13/2010.
            }
        \item{\code{\dots}}{
            arguments passed to other methods (e.g., \code{format}).
            }
        }
    }

    \item{\code{as.numeric(x = "mondate",}}{ 
        \code{convert=FALSE, stripdim=FALSE, }
        \code{timeunits=c("months", "years", "days"), ...)}
        Coerce \code{mondate} to class \code{numeric}.
        \describe{
            \item{\code{convert:}}{ 
            \code{FALSE} (the default)
            is equivalent to \code{getDataPart}.
            If \code{TRUE} the result will be converted to
            the number of years since 
            the beginning of the millennium if
            \code{timeunits}="years";
            to the number of days since
            the beginning of the millennium if
            \code{timeunits}="days".
            Also in the case that \code{convert=TRUE}
            the \code{numeric} returned will have
            "timeunits" as an attribute.
            }
            \item{\code{stripdim:}}{ 
            \code{FALSE} (the default)
            retains the array attributes \code{dim} and \code{dimnames}.
            If \code{TRUE} the dimension attributes are stripped,
            which is the default behavior of \code{base::as.numeric}.
            }
        \item{\code{timeunits}}{
            If \code{missing} the value is drawn from 
            the property of the \code{mondate}.
            }
        }
    }

    \item{\code{as.Date(x = "mondate")}}{
        Coerce \code{mondate} to class \code{Date}
        }

    \item{\code{as.POSIXlt(x = "mondate")}}{
        Coerce \code{mondate} to class \code{POSIXlt}
        }
    
    \item{\code{as.POSIXct(x = "mondate")}}{
        Coerce \code{mondate} to class \code{POSIXct}
        }
}}
\examples{
(b<-mondate(1))              # end of first month of current millennium
as.numeric(b)                # 1
as.character(b)              # December 31, 2000 in date format of locale
as.character(b, format="\%b-\%Y")  # "Dec-2000"
as.numeric(b, convert=TRUE, timeunits="years") # converts to 1/12 "years"
(b<-mondate(1, timeunits="days")) # end of first day of millennium
as.numeric(b)                # 1/31
as.numeric(b, convert=TRUE)  # 1 (with a "days" attribute)
as.Date(b)                   # displays as "2000-01-31"
as.POSIXct(b)                # displays as "2000-01-31 UTC"
weekdays(as.POSIXct(b))      # January 31, 2000 was a "Saturday" (in English)
as.POSIXlt(b)$hour           # zero, as are ...$min and ...$sec
}
\keyword{methods}
\keyword{chron}
