## The first function gets the inverse of a given matrix and saves it to the cache. The second function
##also calculates the inverse, but if the matrix is the same as the first one, then it only loads it form the cache.

## This function creates a special matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Returns the inverse of the matrix x. If the matrix is the same, then it loads it from the cache.

cacheSolve <- function(x, ...) {
m <- x$getsolve()
if(!is.null(m)) {
      message("getting cached data")
      return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setsolve(m)
m
}
