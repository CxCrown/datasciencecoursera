# Assignment: Caching the Inverse of a Matrix
# The functions below allows the user to input a matrix, in which the values of the matrix will be inversed and cached. If the matrix previously
# has been inversed, then the function will retrieve the inversed matrix from the cache.

# The function below creates a "special" matrix object that can cache the inverse of x (a matrix)
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  set_matrix <- function(solve) m <<- solve
  get_matrix <- function() m
  list(set = set,
       get = get, 
       set_matrix = set_matrix,
       get_matrix = get_matrix)
}


# The following function checks if the input matrix has already been inversed. If so, then the computation stops and the message "getting cached data"
# will be shown, for which the already inversed matrix will be retrieved from the cache.If the matrix has not previously been inversed, then the 
# function takes the matrix (x) and inverses it and puts the inversed matrix in the cache with the set_matrix() function. 
cacheSolve <- function(x, ...) {
  m <- x$get_matrix()
  if(!is.null(m)){
    message("getting cahed data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_matrix(m)
  m
}

