## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  n <- NULL
  set <- function(y) {
    x <<- y
    n <<- NULL
  }
  #define the get function to be called by getSolve
  get <- function() {
    x
  }
  # setSolve will saves the solve value
  setSolve <- function(solve) {
    n <<- solve
  }
  # getSolve will returns cached inverse value and will be called in cacheSolve
  getSolve <- function() {
    n
  }
  #Generate a list..
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
   # Calls the getSolve function
  n <- x$getSolve()
  if(!is.null(n)) {
    message("getting cached data")
    return(n)
  }
  data <- x$get()
  #Set the solved inverted into n
  n <- solve(data, ...)
  x$setSolve(n)
  n       ## Return a matrix that is the inverse of 'x'
}
