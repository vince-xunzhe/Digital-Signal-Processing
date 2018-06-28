function yy = firfilt(bb, xx)
%FIRFILT   FIR filter implemented as a difference equation
%
%   usage:   yy = firfilt(bb, xx) 
%
%    implements the FIR filter difference equation:
%
%                   M-1
%                   __
%                   \
%           y[n]=   /  b[k] * x[n-k]
%                   --
%                   k=0
%
%     The length of the resulting vector is  length(bb)+length(xx)-1.
%
% NOTE:
%   Convolution, polynomial multiplication, and FIR digital filtering
%   are all equivalent operations. The Matlab function CONV
%   also does convolution---it is identical to FIRFILT
%             yy = conv(bb, xx)
%    convolves vectors bb and xx. If bb and xx are vectors of
%    polynomial coefficients, convolving them is equivalent
%    to multiplying the two polynomials.

xx( length(xx)+length(bb)-1 ) = 0;  %-- force filter() to make all of y[n]

yy = filter( bb, 1, xx );