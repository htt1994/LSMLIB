%
% File:        computeDistanceFunction2d.m
% Copyrights:  (c) 2005 The Trustees of Princeton University and Board of
%                  Regents of the University of Texas.  All rights reserved.
%              (c) 2009 Kevin T. Chu.  All rights reserved.
% Revision:    $Revision$
% Modified:    $Date$
% Description: MATLAB script to process the data file generated by
%              computeDistanceFunction2d
%

% geometric parameters
radius = 0.5;

% load data file
data = load('computeDistanceFunction2d.dat');
phi = data(:,1);
phi_init = data(:,2);

% compute the number of grid points
num_gridpts = length(phi);
N = round(sqrt(num_gridpts));

% reshape to 2D array
phi = reshape(phi,N,N); phi = phi';
phi_init = reshape(phi_init,N,N); phi_init = phi_init';

% generate mesh
dx = 2/(N-1);
X = -1:dx:1;
Y = X;

% show distance function and zero level set
figure(1); clf;
pcolor(X,Y,phi);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('distance function');
color_axis = caxis; % get color axis to use in other plot
colorbar;

% show original level set function
figure(2); clf;
pcolor(X,Y,phi_init);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('original level set function');
caxis(color_axis);  % set color axis to be the same as the distance function
                    % plot
colorbar;

% do some checks to see if phi is a distance function
figure(3); clf;
plot(X,phi(ceil(N/2),:),'b');  % X coord comes second in MATLAB
hold on;
plot([-radius radius],[0 0],'ro');
