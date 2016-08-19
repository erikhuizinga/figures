# `figures`: a MATLAB function to create multiple figure windows
`figures` is a function that extends the default functionality of MATLAB's built-in [`figure`](http://mathworks.com/help/matlab/ref/figure.html) command. `figures` remains highly compatible with the syntax of the `figure` command while adding support for the creation and editing of one or more figure windows at once.

## Syntax
 - `figures` does the same as the `figure` command; it creates a new figure window.
 - `figures(n)` creates `n` figures in ascending order. Any currently existing figure windows are not replaced. Instead, the lowest available numbers are used to create the figure windows. For example, when figure 2 and 3 already exist, a call to `figures(2)` creates figure 1 and 4.
 - `figures(N)` activates the figure windows with the numbers in vector `N`. Any non-existent figure windows are created. `N` must be a vector of postive integers.
 - `F = figures(__)` also returns `F`, a column vector of handle(s) to the created or activated figure window(s) in descending order. This order is the same as MATLAB's built-in list of currently existing figure windows from `get(0,'Children')`. The order reflects the latest activated figure window.
 - `__ = figures(__,'PropertyName',propertyvalue,...)` uses the specified property values for all created or activated figure windows.
 - `__ = figures(__,C)` uses the specified property values in cell `C` for each created or activated figure window. Construct `C` using the following syntax: `C = {{set1}, ..., {setN}}`, where each set is any number of `'PropertyName',propertyvalue` pairs.
