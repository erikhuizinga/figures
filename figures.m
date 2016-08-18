function varargout = figures(varargin)
%FIGURES Create figure windows.
%   FIGURES is the same as the figure command; it created a new figure
%   window.
%
%   FIGURES(n) creates n figures in ascending order. Any figure windows
%   currently open are not replaced. Instead, the lowest available numbers
%   are used to create the figure windows. For example, when figure 2 and 3
%   already exist, a call to FIGURES(2) creates figure 1 and 4.
%
%   FIGURES(N) activates the figure windows with the numbers in vector N.
%   Any non-existent figure windows are created. N must be a vector of
%   postive integers.
%
%   F = FIGURES(__) also returns a column vector of handle(s) to the
%   created or activated figure window(s) in descending order. This order
%   is the same as MATLAB's built-in list of currently existing figure
%   windows from get(0,'Children'). The order reflects the latest activated
%   figure window.
%
%   __ = FIGURES(__,'PropertyName',propertyvalue,...) uses the specified
%   property values for all created or activated figure windows.
%
%   __ = FIGURES(__,C) uses the specified property values in cell C for
%   each created or activated figure window. Construct C using the
%   following syntax: C = {{set1}, ..., {setN}}, where each set is any
%   number of 'PropertyName',propertyvalue pairs.
%
%   See also FIGURE.

% Erik Huizinga
% August 2016
% huizinga.erik@gmail.com

%TODO figuresdemo

in = varargin;
if ~nargin
    f = figure;
    n = 0;
    m = [];
else
    if isnumeric(in{1})
        n = in{1};
        in(1) = [];
        if any(mod(n,1))
            error(['A numeric first input argument must be an (array ' ...
                'of) positive integers.'])
        end
        if isscalar(n)
            cf = get(0,'Children');
            if isempty(cf)
                cf = [];
            else
                cf = [cf.Number];
            end
            m = 1:numel(cf)+n;
            m = setdiff(m,cf);
        else
            m = n;
            n = numel(n);
        end
    end
end
m = m(:); % force column
% m is a vector of the figure numbers to open, n = numel(m);

% Flip, because creation happens in reverse order.
% Output argument f then is ordered in reverse too, like get(0,'Children').
% The figure windows are created and ordered properly like this.
m = flip(m);

if ~isempty(in)
    if all(cellfun(@iscell,in))
        % multiple sets of 'PropertyName',propertyvalue pairs provided
        if numel(in{:})~=n
            error(['When providing multiple ' ...
                '''PropertyName'',propertyvalue pairs in a cell, the ' ...
                'number of pairs must equal the number of figures to ' ...
                'create or activate.'])
        end
        in = flip(in{:});
        for i = n:-1:1
            % f(i) = figure(m(i),in{i}{:});
            f(i) = figure(m(i));
            set(f(i),in{i}{:});
        end
    else % one set of 'PropertyName',propertyvalue pairs provided
        for i = n:-1:1
            % f(i) = figure(m(i),in{:});
            f(i) = figure(m(i));
            set(f(i),in{:});
        end
    end
else % no additional input arguments
    for i = n:-1:1, f(i) = figure(m(i)); end
end
if nargout, varargout = {f(:)}; end