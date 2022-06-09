# unique_switch_matlab

% This Matlab function provides a way to find 
% (1) unique rows, when rows have switched elements ("u"), 
% (2) rows with switched elements ("s"), and 
% (3) indices of rows with switched elements ("is").

% Example of usage:

clear all
clc

% input
a = [1 2
     4 5
     5 1
     2 1
     1 2
     5 2
     5 1
     1 5
     2 9
     5 1]

% output
[u,s,is] = unique_switch(a)


% command window of Matlab
u =

     1     2
     1     5
     2     9
     4     5
     5     2

s =

     2     1
     5     1

is =

  1×2 cell array

    {3×1 double}    {4×1 double}

% to see inside "is", just type "is{:}" in the command window:
>> is{:}

ans =

     1
     4
     5


ans =

     3
     7
     8
    10
