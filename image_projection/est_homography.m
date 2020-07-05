function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
A = zeros(8, 9);

x = video_pts(1, 1);
y = video_pts(1, 2);
x_dash = logo_pts(1, 1);
y_dash = logo_pts(1, 2);

A(1, :) = [-x -y -1 0 0 0 x*x_dash y*x_dash x_dash];
A(2, :) = [0 0 0 -x -y -1 x*y_dash y*y_dash y_dash];

x = video_pts(2, 1);
y = video_pts(2, 2);
x_dash = logo_pts(2, 1);
y_dash = logo_pts(2, 2);

A(3, :) = [-x -y -1 0 0 0 x*x_dash y*x_dash x_dash];
A(4, :) = [0 0 0 -x -y -1 x*y_dash y*y_dash y_dash];

x = video_pts(3, 1);
y = video_pts(3, 2);
x_dash = logo_pts(3, 1);
y_dash = logo_pts(3, 2);

A(5, :) = [-x -y -1.0 0 0 0 x*x_dash y*x_dash x_dash];
A(6, :) = [0 0 0 -x -y -1.0 x*y_dash y*y_dash y_dash];


x = video_pts(4, 1);
y = video_pts(4, 2);
x_dash = logo_pts(4, 1);
y_dash = logo_pts(4, 2);

A(7, :) = [-x -y -1.0 0 0 0 x*x_dash y*x_dash x_dash];
A(8, :) = [0 0 0 -x -y -1.0 x*y_dash y*y_dash y_dash];

[U, S, V] = svd(A);


H = V(:, 9);
H = reshape(H, [3, 3]);
H = H';

end

