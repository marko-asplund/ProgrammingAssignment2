## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list that includes the following functions:
# 1. set the matrix to invert
# 2. get the matrix to invert
# 3. set the inverted matrix
# 4. get the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
				m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrixinverse <- function(solve) m <<- solve
        getmatrixinverse <- function() m
        list(set = set, get = get,
             setmatrixinverse = setmatrixinverse,
             getmatrixinverse = getmatrixinverse)
}


## Calculate matrix inverse or return a cached matrix inverse if the inverse
## has already been calculated.
## Takes a list of functions created by makeCacheMatrix() as input.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrixinverse()
        if(!is.null(m)) {
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrixinverse(m)
        m
}
