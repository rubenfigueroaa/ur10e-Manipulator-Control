% Step 1: Load the robot
robot = loadrobot("universalUR10e");
robot.DataFormat = 'row';
figure;
hold on; % Allow overlaying additional graphics

% Step 2: Define the table or reference plane
table_length = 5.0; % Length of the table (meters)
table_width = 5.0;  % Width of the table (meters)
table_height = 0;   % Height of the table (meters, where base starts)

% Define vertices of the table
x = [-table_length/2, table_length/2, table_length/2, -table_length/2];
y = [-table_width/2, -table_width/2, table_width/2, table_width/2];
z = [table_height, table_height, table_height, table_height];

% Draw the table
patch('XData', x, 'YData', y, 'ZData', z, ...
      'FaceColor', [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

% Step 3: Show the robot without applying any transformation
show(robot, 'Frames', 'on', 'Visuals', 'on'); % Show the robot without transformation

% Step 4: Add a smaller 3D red cube close to the robot
cube_size = 0.05; % Even smaller side length of the cube (in meters)

% Vertices of the cube (8 vertices in 3D space)
x_cube = [-cube_size/2, cube_size/2, cube_size/2, -cube_size/2, ...
          -cube_size/2, cube_size/2, cube_size/2, -cube_size/2];
y_cube = [-cube_size/2, -cube_size/2, cube_size/2, cube_size/2, ...
          -cube_size/2, -cube_size/2, cube_size/2, cube_size/2];
z_cube = [-cube_size/2, -cube_size/2, -cube_size/2, -cube_size/2, ...
          cube_size/2, cube_size/2, cube_size/2, cube_size/2];

% Define the cube's position above the table and near the robot
z_cube = z_cube + 0.5; % Adjust Z position to be above the table
x_cube = x_cube + 0.5; % Move the cube 0.5m to the right of the robot
y_cube = y_cube - 0.5; % Move the cube 0.5m forward from the robot

% Faces of the cube (6 faces)
faces = [1, 2, 3, 4;   % Bottom face
         5, 6, 7, 8;   % Top face
         1, 2, 6, 5;   % Front face
         2, 3, 7, 6;   % Right face
         3, 4, 8, 7;   % Back face
         4, 1, 5, 8];  % Left face

% Draw the 3D red cube
patch('Faces', faces, 'Vertices', [x_cube' y_cube' z_cube'], ...
      'FaceColor', 'red', 'EdgeColor', 'k', 'LineWidth', 1.5);

% Step 5: Add labels and enhance visualization

% Labels for axes
xlabel('X (m)', 'FontSize', 12);
ylabel('Y (m)', 'FontSize', 12);
zlabel('Z (m)', 'FontSize', 12);
title('Universal Robot with Table and Closer 3D Red Cube', 'FontSize', 14);

% Set grid and axis for better visualization
grid on;
axis equal; % Equal scale for all axes
xlim([-2.5, 2.5]); % Adjust axis limits to make the view more centered
ylim([-2.5, 2.5]); % Adjust axis limits to make the view more centered
zlim([0, 1.5]);    % Limit Z-axis to a reasonable range

% Add some lighting for better 3D visualization
light('Position', [1, 1, 3], 'Style', 'local');
lighting gouraud;
material shiny;

% Add a floor plane (to make it look like a real environment)
floor_size = 10;
x_floor = [-floor_size/2, floor_size/2, floor_size/2, -floor_size/2];
y_floor = [-floor_size/2, -floor_size/2, floor_size/2, floor_size/2];
z_floor = [0, 0, 0, 0]; % Height of the floor

patch('XData', x_floor, 'YData', y_floor, 'ZData', z_floor, ...
      'FaceColor', [0.6 0.6 0.6], 'EdgeColor', 'none', 'FaceAlpha', 0.3);

% Add a camera view angle for better perspective
view(3); % 3D view

% Make sure the figure updates properly

