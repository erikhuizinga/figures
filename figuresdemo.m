%FIGURESDEMO A demonstration of figures.
%   This demo shows all possible syntaxes of the figures function. This
%   script consists of sections. Run through them one-by-one by pressing
%   CTRL+SHIFT+RETURN (on Windows) while the first section is selected.
%   Warning: figuresdemo closes all figure before the demonstration.
% 
%   See also FIGURES

%   Copyright (C) 2016 Erik Huizinga, huizinga.erik@gmail.com
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   any later version.
%   
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% preparation
close all

%% open a figure
figures

%% open 2 new figures
figures(2)
% now figures 1, 2 and 3 exist

%% bring figures 3 and 1 to the front
figures([3 1])
% note the particular order: the windows have been sorted with figure 2 in
% last position

%% close figure 2 and open 2 more figures
close(2)
figures(2)
% now figure 2 and 4 are created: figures 1 and 3 are not recreated,
% activated or modified at all

%% again, close figure 2 and activate figures 2 and 3
close(2)
figures([2 3])
% now figure 2 is created and figure 3 is activated because it already
% exists

%% open a figure with certain properties
close all
figures('Units','normalized','Position',[1/6 1/3 1/6 1/3])
% this is essentially the same as calling figure with the same input
% arguments

%% open multiple figures with certain properties
figures(2,'Units','normalized','Position',[1/6 1/3 1/6 1/3])

%% reactivate figures 2 and 3 with different properties
C = { ... % C = {{set1}, ..., {setN}}
    {'Position',[5/12 1/3 1/6 1/3]}
    {'Position',[2/3 1/3 1/6 1/3]}
    };
figures(2:3,C)

%% get the function handles of created figures
% all the commands above can be called with an output argument:
% F = figures(__);
% The following two lines give two examples of how this might be used.
F1 = figures(3);
display(F1); % see Command Window for output
F2 = figures(1:3);
display(F2);

%% example use: close multiple figures with one command
close(figures(4:6))
