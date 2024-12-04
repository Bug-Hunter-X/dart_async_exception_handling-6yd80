# Unhandled Exception Propagation in Dart

This repository demonstrates a common error in Dart asynchronous operations where exceptions are caught but not properly handled or logged, leading to unexpected behavior or silent failures.

The `bug.dart` file contains the problematic code. The `bugSolution.dart` file provides a more robust solution. 

## Problem
The initial `fetchData` function uses a `try-catch` block, but the `catch` block only prints the error to the console.  In a production environment, this is inadequate.  A more comprehensive approach is needed to handle and potentially recover from errors.  The rethrow isn't helpful here unless the caller handles the exception appropriately.

## Solution
The improved version in `bugSolution.dart` provides better error handling, logging more informative messages, and offering different ways of dealing with the error. Consider custom exceptions, more detailed logging, and fallback mechanisms. 