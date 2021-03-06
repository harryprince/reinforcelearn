% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/environment_mdp.R
\name{MdpEnvironment}
\alias{MdpEnvironment}
\title{MDP Environment}
\arguments{
\item{transitions}{[\code{array (n.states x n.states x n.actions)}] \cr
State transition array.}

\item{rewards}{[\code{matrix (n.states x n.actions)}] \cr
Reward array.}

\item{initial.state}{[\code{integer}] \cr
Optional starting state.
If a vector is given a starting state will be
randomly sampled from this vector whenever \code{reset} is called.
Note that states are numerated starting with
0. If \code{initial.state = NULL} all non-terminal states are
possible starting states.}

\item{...}{[\code{any}] \cr Arguments passed on to \link{makeEnvironment}.}
}
\description{
Markov Decision Process environment.
}
\section{Usage}{

\code{makeEnvironment("MDP", transitions, rewards, initial.state, ...)}
}

\section{Methods}{

\itemize{
\item \code{$step(action)} \cr
Take action in environment.
Returns a list with \code{state}, \code{reward}, \code{done}.
\item \code{$reset()} \cr
Resets the \code{done} flag of the environment and returns an initial state.
Useful when starting a new episode.
\item \code{$visualize()} \cr
Visualizes the environment (if there is a visualization function).
}
}

\examples{
# Create a Markov Decision Process.
P = array(0, c(2, 2, 2))
P[, , 1] = matrix(c(0.5, 0.5, 0, 1), 2, 2, byrow = TRUE)
P[, , 2] = matrix(c(0, 1, 0, 1), 2, 2, byrow = TRUE)
R = matrix(c(5, 10, -1, 2), 2, 2, byrow = TRUE)
env = makeEnvironment("mdp", transitions = P, rewards = R)
env$reset()
env$step(1L)
}
