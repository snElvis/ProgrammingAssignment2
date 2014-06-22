## This function is similar to the sample.It uses the same logic
## make a cachematrix and  then calculate the inverse  to store in the cachematrix.If cachematrix had 
##store the  inverse,cacheSolve function can read the result directly without solve function calculating.
##if don't,cacheSolve function need to calculate the result by Solve function
 

## First make a cachematrix to store the inverse matrix

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


## Judge the cachematrix then decide whether need to calculate the inverse matrix according the result 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
  m
}
