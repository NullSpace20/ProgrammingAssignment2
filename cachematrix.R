# This function creates matrix object that can cache its inverse
#and computes the inverse of  matrix returned by makeCacheMatrix 
#If the inverse  already  calculated and the matrix has not changed
# then the cachesolve should retrieve the inverse from the cache.



makeCacheMatrix <- function(x = matrix()) {
    inv = NULL
    set = function( matrix )# This function set the value of vector
    {
        m <<- matrix
        inv <<- NULL
    }
    get = function() # This function get the actual matrix
    {
        m
    }
    setInverse = function(inverse)  # This function set the value of the inverse of the matrix
    {
        inv <<- inverse
    }
    getInverse = function()  # This function get the inverse of the matrix
    {
        inv
    }   
    
    list(set = set,get=get,setInverse=setInverse,getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    m = x$getInverse()
    
    if( !is.null(m) ) {
        message("get the cached data")
        return(m)
    }
    
    data = x$get()# get the actual matrix
    m = solve(data)
    x$setInverse(m)  # updating the variable
    m    # Return the matrix
}
