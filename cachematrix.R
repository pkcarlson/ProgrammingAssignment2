## These two functions create a special object that 
## stores a matrix and caches its inverse

## Create a list containing a function to: 
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        v <- NULL
        set <- function(y) {
                x <<- y
                v <<- NULL
                
        }
        get <- function() x 
        setinverse <- function(solve) v <<- solve
        getinverse <- function() v
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
}

## Check to see if the inverse of the matrix has already been calculated.
## If so, retreive the inverse from the cache.
## Otherwise, calculate the inverse of the matrix,
## and set the value of the inverse in the cache.

cacheSolve <- function(x, ...) {
        v <- x$getinverse()
        if(!is.null(v)) {
                message("getting cached data")
                return(v)
        }
        data <- x$get()
        v <- solve(data,...)
        x$setinverse(v)
        v        ## Return a matrix that is the inverse of 'x'
}
