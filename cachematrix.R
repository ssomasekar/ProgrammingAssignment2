## Below are two functions that are used to create a special object that stores a matrix and cache's its mean.

## Write a short comment describing this function
The first function, makeCachMatrix creates a special "matrix", which is really a list containing a function to 
1.set the value of the matrix
2.get the value of the matrix
3.set the value of the inv
4.get the value of the inv

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinv <- function(inv) i <<- inv
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)  
}


## Write a short comment describing this function
The following cachesolve function calculates the inv of the "matrix" created with the first function. However, it first checks to see if the inv has already been calculated. If so, it gets the inv from the cache and skips the computation. Otherwise, it calculates the inv of the matrix and sets the value of the inv in the cache via the inv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinv()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
    i

}
