\name{ptb.extract.lead}
\alias{ptb.extract.lead}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ptb.extract.lead(ptb, name, recycle = TRUE, use.patient.id = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ptb}{
%%     ~~Describe \code{ptb} here~~
}
  \item{name}{
%%     ~~Describe \code{name} here~~
}
  \item{recycle}{
%%     ~~Describe \code{recycle} here~~
}
  \item{use.patient.id}{
%%     ~~Describe \code{use.patient.id} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ptb, name, recycle = TRUE, use.patient.id = TRUE) 
{
    lst <- lapply(ptb$leads, function(x) x[, name])
    if (!recycle) {
        min.len <- min(sapply(lst, length))
        lst <- lapply(lst, function(x) x[0:min.len])
    }
    df <- as.data.frame(lst)
    if (use.patient.id) {
        names(df) <- ptb.generate.pat.test.names(ptb, as.integer(names(lst)))
    }
    else {
        names(df) <- names(lst)
    }
    return(df)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line