%write a function that creates an n x n matrix A in which all the elements
%are 1. Then, assign A to Anew such that
%demonstrate that the function [A,Anew]=new_matrices(n) 
% n is the size of the A matrix 
function[A,Anew]=new_matrices(n)
n=2;
A=ones(n)
B=zeros(n); 
Anew=[A,B;B,A]
end

