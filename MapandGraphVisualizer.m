%%
%close all
clear all
clc

% fid = fopen('telemetry.log', 'rt');

%%

map_name = '/home/cornell/Documents/Projects/AutomatedWarehouse/drake_example/ECE6950';
%map_name = 'lab';
%map_name = 'raymond';

map_text = fileread([map_name '.map']);
map_data = jsondecode(map_text);
mp_text = fileread([map_name '.motion']);
mp_data = jsondecode(mp_text);
node_text = fileread('entire_road_map.json');
node_data = jsondecode(node_text);

%% participating locations
% b1
% connecting_points = {'H0X7Y19', 'H3X3Y16', 'H1X6Y7', 'H1X9Y3', 'H3X6Y17', 'H2X6Y11', 'H0X6Y10', 'H0X5Y19', 'H3X5Y15', 'H3X5Y19', 'H3X5Y3', 'H0X2Y10', 'H2X4Y21', 'H0X5Y10', 'H2X5Y8', 'H1X6Y9', 'H3X4Y3', 'H1X9Y6', 'H0X6Y19', 'H1X8Y10', 'H3X5Y13', 'H3X4Y8', 'H3X5Y21', 'H0X4Y17', 'H2X4Y5', 'H3X5Y22', 'H1X8Y6', 'H1X7Y9', 'H3X8Y17', 'H3X6Y14', 'H1X8Y8', 'H1X7Y8', 'H0X5Y17', 'H3X7Y15', 'H3X7Y11', 'H3X4Y13', 'H2X6Y5', 'H3X4Y5', 'H2X3Y8', 'H3X2Y5', 'H1X7Y17', 'H0X4Y13', 'H0X7Y10', 'H1X6Y15', 'H1X9Y11', 'H2X4Y20', 'H1X6Y8', 'H3X5Y5', 'H3X5Y17', 'H3X3Y9', 'H0X6Y18', 'H1X6Y6', 'H1X8Y12', 'H2X3Y20', 'H3X2Y10', 'H1X6Y18', 'H0X4Y4', 'H0X3Y10', 'H0X4Y10', 'H3X4Y7', 'H2X7Y14', 'H3X5Y9', 'H3X4Y15', 'H3X2Y14', 'H1X7Y13', 'H2X7Y5', 'H0X7Y4', 'H1X8Y7', 'H0X4Y19', 'H1X9Y5', 'H0X1Y19', 'H2X5Y5', 'H3X4Y9', 'H3X5Y7', 'H0X0Y10', 'H3X4Y4', 'H0X5Y18', 'H0X9Y19', 'H3X7Y7', 'H2X3Y5', 'H1X7Y16', 'H3X8Y14', 'H3X5Y14', 'H3X3Y17', 'H3X6Y15', 'H3X2Y19', 'H1X9Y4', 'H0X3Y14', 'H3X5Y6', 'H3X5Y16', 'H3X7Y8', 'H0X0Y19', 'H3X7Y12', 'H3X5Y18', 'H3X2Y7', 'H3X2Y8', 'H3X8Y13', 'H3X2Y18', 'H0X4Y18', 'H0X7Y9', 'H3X5Y8', 'H3X8Y15', 'H1X7Y15', 'H2X2Y5', 'H1X7Y7', 'H1X9Y12', 'H3X2Y16', 'H3X8Y16', 'H3X5Y10', 'H1X6Y19', 'H2X8Y5', 'H0X1Y10', 'H3X2Y11', 'H3X5Y20', 'H2X5Y11', 'H1X6Y10', 'H0X8Y19', 'H3X7Y16', 'H3X6Y16', 'H1X8Y9', 'H3X2Y4', 'H3X6Y7', 'H3X4Y6', 'H0X8Y10', 'H1X9Y7', 'H2X7Y13', 'H0X3Y19', 'H3X2Y21', 'H2X0Y5', 'H3X2Y13', 'H2X4Y8', 'H3X3Y18', 'H1X7Y6', 'H2X9Y5', 'H0X3Y13', 'H3X2Y12', 'H1X8Y13', 'H2X4Y6', 'H3X2Y9', 'H3X2Y15', 'H0X2Y19', 'H0X4Y14', 'H0X7Y18', 'H0X5Y14', 'H3X2Y17', 'H1X6Y11', 'H0X5Y4', 'H3X4Y14', 'H3X7Y17', 'H3X8Y12', 'H2X1Y5', 'H3X5Y4', 'H3X4Y10'};
% starting_points = {'H0X9Y10', 'H3X5Y11'};
% goal_points = {'H3X5Y12', 'H0X10Y10', 'H3X2Y20', 'H3X2Y6', 'H2X10Y5', 'H0X10Y19', 'H0X6Y4'};
% b2
% connecting_points = {'H0X9Y10', 'H3X2Y6', 'H2X10Y5', 'H3X5Y11', 'H3X2Y20', 'H0X6Y4', 'H3X5Y12', 'H0X10Y10', 'H0X10Y19'};
% starting_points = {'H0X9Y10', 'H3X5Y11'};
% goal_points = {'H3X5Y12', 'H0X10Y10', 'H3X2Y20', 'H3X2Y6', 'H2X10Y5', 'H0X10Y19', 'H0X6Y4'};
% c
connecting_points = {};
starting_points = {'H0X9Y10', 'H3X5Y11'};
goal_points = {'H3X5Y12', 'H0X10Y10', 'H3X2Y20', 'H3X2Y6', 'H2X10Y5', 'H0X10Y19', 'H0X6Y4'};



%% Jackal stuff
% fclose(fid);

%pix2m = 0.2;
%obstacle = [30.0, 60.0, 50.0,  140.0 ]*pix2m;
num_robots = map_data.robots;

obstacle = [];
for i =1:length(map_data.obstacles)
    obstacle = [obstacle; map_data.obstacles(i).x, map_data.obstacles(i).y, map_data.obstacles(i).X,  map_data.obstacles(i).Y  ];
end	
%goals = [70., 70., 90.0; ...
%         10., 120., -90.0]*pix2m;
% need to add dimension here for several robots
goals = {};
for r = 1:num_robots
    goals_robot_i = map_data.(['r' num2str(r-1)]);
    goals{r} = [];
    for i = 1:length(goals_robot_i)
        goals{r} = [goals{r}; goals_robot_i(i).x, goals_robot_i(i).y, goals_robot_i(i).teta ] ;
    end	
end

no_enter = [];
for i =1:length(map_data.no_enter)
    no_enter = [no_enter; map_data.no_enter(i).x, map_data.no_enter(i).y, map_data.no_enter(i).X,  map_data.no_enter(i).Y  ];
end	

one_ways_N = []; one_ways_S = []; one_ways_E = []; one_ways_W = [];
for i =1:length(map_data.one_ways)
    if(map_data.one_ways(i).D == 2)
        one_ways_N = [one_ways_N; map_data.one_ways(i).x, map_data.one_ways(i).y, map_data.one_ways(i).X,  map_data.one_ways(i).Y  ];
    elseif (map_data.one_ways(i).D == 1)
        one_ways_E = [one_ways_E; map_data.one_ways(i).x, map_data.one_ways(i).y, map_data.one_ways(i).X,  map_data.one_ways(i).Y  ];
    elseif (map_data.one_ways(i).D == 0)
        one_ways_S = [one_ways_S; map_data.one_ways(i).x, map_data.one_ways(i).y, map_data.one_ways(i).X,  map_data.one_ways(i).Y  ];
    elseif (map_data.one_ways(i).D == 3)
        one_ways_W = [one_ways_W; map_data.one_ways(i).x, map_data.one_ways(i).y, map_data.one_ways(i).X,  map_data.one_ways(i).Y  ];
    end
end	
% lab
%path = {'H1X12Y6', 'H3X15Y26', 'H3X1Y2'};

%pix2m = 0.2; %[m]
bounds = [ map_data.workspace.x,  map_data.workspace.y, map_data.workspace.X, map_data.workspace.Y];
cell   = map_data.cell; % 1.25; %[m]
W_xgrid = (bounds(1)+cell/2) : cell : (bounds(3)-cell/2);
W_ygrid = (bounds(2)+cell/2) : cell : (bounds(4)-cell/2);


%%
%close all

figure;
ax = gca; ax.YDir = 'reverse';
hold on;
% GUY TODO, inflate bounds just because I'm not considering that
% to be out-of-bounds because lab is too small
%bounds = [bounds(1)-.7 bounds(2)-.7 bounds(3)+.7 bounds(4)+.7 ];
for i=1:size(bounds,1)
    plot([bounds(i,2) bounds(i,2)], -[-bounds(i,1) -bounds(i,3)], 'k', 'LineWidth',3);
    plot([bounds(i,2) bounds(i,4)], -[-bounds(i,1) -bounds(i,1)], 'k', 'LineWidth',3);
    plot([bounds(i,4) bounds(i,4)], -[-bounds(i,1) -bounds(i,3)], 'k', 'LineWidth',3);
    plot([bounds(i,4) bounds(i,2)], -[-bounds(i,3) -bounds(i,3)], 'k', 'LineWidth',3);
end

nodes = fieldnames(node_data);
% disp('do not forget to remove me!!')
% nodes = {};
for node = nodes'
    node = node{:};
    [parent, child] = strtok(node, '_'); child = child(2:end);
    parent_state = sscanf(parent, 'H%dX%dY%d');
    child_state  = sscanf(child, 'H%dX%dY%d');
    xx = [W_xgrid(parent_state(2)+1), W_xgrid(child_state(2)+1)];
    yy = [W_ygrid(parent_state(3)+1), W_ygrid(child_state(3)+1)];
    
%     plot(yy, xx,'-o', 'Color', [0.80,0.80,0.80], 'MarkerSize',10,...
%                 'MarkerEdgeColor',[0.07 0.62 1.00],...
%                 'MarkerFaceColor',[.6 .6 1.]);
    plot(yy, xx,'-o', 'Color', [0.80,0.80,0.80], 'MarkerSize',10,...
                'MarkerEdgeColor',[1. 0.42 0.42],...
                'MarkerFaceColor',[1. 0.2 0.2]);
end
r = 0.09;
for node = connecting_points
    parent = node{:};
    parent_state = sscanf(parent, 'H%dX%dY%d');
    xx = W_xgrid(parent_state(2)+1);
    yy = W_ygrid(parent_state(3)+1);
    pos = [yy-r/2 xx-r/2 r r];
    
    rectangle('Position', pos, 'Curvature',[1 1], 'FaceColor', [1. 0.2 0.2]);
end
for node = goal_points
    parent = node{:};
    parent_state = sscanf(parent, 'H%dX%dY%d');
    xx = W_xgrid(parent_state(2)+1);
    yy = W_ygrid(parent_state(3)+1);
    pos = [yy-r/2 xx-r/2 r r];
    
    rectangle('Position', pos, 'Curvature',[1 1], 'FaceColor', [0.2 1. 0.2]);
end
i=0;
for node = starting_points
    i = i+1;
    parent = node{:};
    parent_state = sscanf(parent, 'H%dX%dY%d');
    xx = W_xgrid(parent_state(2)+1);
    yy = W_ygrid(parent_state(3)+1);
    pos = [yy-r/2 xx-r/2 r r];
    
    rectangle('Position', pos, 'Curvature',[1 1], 'FaceColor', [1. 0.85 0.]);
    text(pos(1)+0.1, pos(2)+0.1, ...
            ['robot' num2str(i)], 'Color', [0.2,0.2,0.2],'FontWeight','bold')
end

% robot1
% human
% path={'H3X5Y11', 'H3X5Y12', 'H3X5Y11', 'H3X5Y10', 'H2X3Y8', 'H2X4Y8', 'H3X2Y6', ...
%      'H3X2Y7', 'H3X2Y8', 'H3X2Y9', 'H3X2Y10', 'H3X2Y11', 'H3X2Y12', 'H3X2Y13', ...
%     'H3X2Y14', 'H3X2Y15', 'H3X2Y16', 'H3X2Y17', 'H3X2Y18', 'H3X2Y19', 'H3X2Y20', ...
%     'H3X3Y17', 'H3X4Y14', 'H3X4Y10', 'H3X4Y6', 'H0X6Y4'};
% actions = [2,1,1,6,2,5,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,0,0,5,0];
% b1
% path = {'H3X5Y11', 'H3X5Y12', 'H3X5Y11', 'H3X5Y10', 'H2X3Y8', 'H2X4Y8', 'H3X2Y6'};
% actions = [2, 1, 1, 6, 2, 5, 0];
%b2
% path = {'H3X5Y11', 'H0X7Y9', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H0X5Y10', 'H3X7Y8', 'H3X7Y7', 'H2X5Y5', 'H2X6Y5', 'H2X7Y5', 'H2X8Y5', 'H2X9Y5', 'H2X10Y5', 'H2X9Y5', 'H2X8Y5', 'H1X6Y7', 'H1X6Y11', 'H1X6Y15', 'H1X6Y19', 'H2X4Y21', 'H3X2Y19', 'H3X2Y20', 'H3X3Y17', 'H3X4Y14', 'H3X4Y10', 'H3X4Y6'};
% actions = [5, 3, 2, 2, 2, 2, 2, 6, 1, 6, 2, 2, 2, 2, 2, 1, 1, 6, 0, 0, 0, 5, 5, 2, 3, 3, 0, 0, 5, 0];
% c
path = {'H3X5Y11', 'H3X5Y12', 'H2X3Y10', 'H2X0Y11', 'H0X0Y8', 'H3X2Y6', 'H0X4Y4', 'H0X5Y4', 'H0X6Y4', 'H0X9Y5', 'H0X8Y5', 'H3X10Y3', 'H0X12Y1', 'H2X12Y4', 'H2X9Y5', 'H2X10Y5', 'H2X6Y5', 'H2X3Y6', 'H0X3Y9', 'H0X6Y10', 'H0X10Y10', 'H2X10Y13', 'H3X8Y11', 'H3X7Y8', 'H3X7Y4', 'H0X9Y2', 'H0X12Y1', 'H2X12Y4', 'H2X9Y5', 'H2X10Y5'};
actions = [2, 6, 4, 7, 6, 5, 1, 1, 3, 2, 6, 5, 7, 4, 2, 0, 4, 8, 3, 0, 7, 5, 4, 0, 5, 4, 7, 4, 2, 0];
% d
% path = {'H3X5Y11', 'H3X5Y12', 'H3X5Y11', 'H3X5Y10', 'H2X3Y8', 'H2X4Y8', 'H3X2Y6', 'H0X4Y4', 'H0X5Y4', 'H0X6Y4', 'H0X5Y4', 'H1X7Y6', 'H1X7Y7', 'H1X7Y8', 'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H1X8Y12', 'H1X8Y13', 'H1X7Y16', 'H1X7Y17', 'H0X9Y19', 'H0X10Y19'};
% actions = [2, 1, 1, 6, 2, 5, 5, 1, 1, 2, 5, 1, 1, 6, 1, 2, 2, 2, 2, 5, 1, 3, 1, 6, 1, 0];

states = zeros(length(path), 3);
for i = 1:length(path)
    tmp = sscanf(path{i}, 'H%dX%dY%d');
    states(i,:) = tmp';
end
traj =[];
for i = 1:size(states,1)
    traj =[traj ; W_xgrid(states(i,2)+1), W_ygrid(states(i,3)+1)];
end
for i = 1:size(states,1)-1
    orientation = states(i,1);
    x0 = [traj(i, 1:2) (-1+orientation)*pi/2];
    index = 1;
    el_loc = [];
    pnts = [];
    while 1
        [x_centers, V] = LoadMotionPrimitives(mp_data, actions(i), index, orientation);
        if(isnan(x_centers))
            break;
        end
        el_loc = [el_loc; x0 + x_centers'];
        index = index+1;
        %pnt = Ellipse_plot(V(1:2,1:2), [el_loc(end,1) el_loc(end,2)]);
        %plot(el_loc(end,2),-el_loc(end,1),'.k');
        %pnts = [pnts; pnt'];
    end
    %k = boundary(pnts, 0.9); %.8
    %plot(pnts(k,2), -pnts(k,1));
    %patch(pnts(k,2), -pnts(k,1), 'red');
    %f1 = 1:length(k);
    %v1 = [pnts(k,2), pnts(k,1)];
    %patch('Faces',f1,'Vertices',v1,'FaceColor','blue','FaceAlpha',.1);
    plot(el_loc(:,2),el_loc(:,1), 'Color', [.8 .2 .2], 'LineWidth', 2);
    
end

% robot0
% path={'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H0X5Y10', ...
%     'H3X7Y8',  'H3X7Y7', 'H2X5Y5', 'H2X6Y5', 'H2X7Y5', 'H2X8Y5', 'H2X9Y5', 'H2X10Y5', 'H2X9Y5', ...
%     'H2X8Y5', 'H1X6Y7', 'H1X6Y8', 'H0X8Y10', 'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10',...
%     'H0X7Y10', 'H0X6Y10', 'H1X8Y12', 'H1X8Y13', 'H1X7Y16', 'H1X7Y17', 'H0X9Y19', 'H0X10Y19'};
% actions = [1,2,2,2,2,2,6,1,6,2,2,2,2,2,1,1,6,1,6,1,1,2,2,2,2,5,1,3,1,6,1,0];
% b1
%path = {'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H1X8Y12', 'H1X8Y13', 'H1X7Y16', 'H1X7Y17', 'H0X9Y19', 'H0X10Y19', 'H0X9Y19', 'H0X8Y19', 'H0X7Y19', 'H0X6Y19', 'H0X5Y19', 'H0X4Y19', 'H0X3Y19', 'H0X2Y19', 'H0X1Y19', 'H0X0Y19', 'H3X2Y17', 'H3X2Y18', 'H3X2Y19', 'H3X2Y20', 'H3X3Y17', 'H3X4Y14', 'H3X4Y10', 'H3X4Y6', 'H0X6Y4', 'H0X5Y4', 'H1X7Y6', 'H1X7Y7', 'H1X7Y8', 'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H0X5Y10', 'H3X7Y8', 'H3X7Y7', 'H2X5Y5', 'H2X6Y5', 'H2X7Y5', 'H2X8Y5', 'H2X9Y5', 'H2X10Y5'};
%actions = [1, 2, 2, 2, 2, 5, 1, 3, 1, 6, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 2, 2, 2, 3, 3, 0, 0, 5, 2, 5, 1, 1, 6, 1, 2, 2, 2, 2, 2, 6, 1, 6, 2, 2, 2, 2, 2, 0];
%b2
% path = {'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H1X9Y12', 'H2X7Y14', 'H3X5Y12', 'H3X5Y11', 'H3X5Y10', 'H2X3Y8', 'H2X4Y8', 'H3X2Y6', 'H0X4Y4', 'H0X5Y4', 'H1X7Y6', 'H1X7Y7', 'H1X7Y8', 'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H1X8Y12', 'H1X8Y13', 'H1X7Y16', 'H1X7Y17', 'H0X9Y19' };
% actions = [2, 2, 5, 5, 5, 1, 1, 6, 2, 5, 5, 1, 5, 1, 1, 6, 1, 2, 2, 2, 2, 5, 1, 3, 1, 6, 1, 0];
% c
path = {'H0X9Y10', 'H0X10Y10', 'H2X10Y13', 'H2X7Y14', 'H1X5Y16', 'H0X7Y18', 'H0X10Y19', 'H1X12Y21', 'H3X9Y21', 'H2X7Y19', 'H1X5Y21', 'H1X5Y20', 'H3X2Y20', 'H3X2Y16', 'H3X3Y13', 'H3X3Y9', 'H3X4Y6', 'H0X6Y4'};
actions = [1, 7, 4, 6, 6, 3, 5, 7, 6, 6, 2, 7, 0, 3, 0, 3, 5, 0];
% d
% path = {'H0X9Y10', 'H0X10Y10', 'H0X9Y10', 'H0X8Y10', 'H0X7Y10', 'H0X6Y10', 'H0X5Y10', 'H3X7Y8', 'H3X7Y7', 'H2X5Y5', 'H2X6Y5', 'H2X7Y5', 'H2X8Y5', 'H2X9Y5', 'H2X10Y5', 'H2X9Y5', 'H2X8Y5', 'H1X6Y7', 'H1X6Y11', 'H1X6Y15', 'H1X6Y19', 'H2X4Y21', 'H3X2Y19', 'H3X2Y20', 'H3X3Y17', 'H3X4Y14', 'H3X4Y10', 'H3X4Y6', 'H0X6Y4'};
% actions = [1, 2, 2, 2, 2, 2, 6, 1, 6, 2, 2, 2, 2, 2, 1, 1, 6, 0, 0, 0, 5, 5, 2, 3, 3, 0, 0, 5, 0];
states = zeros(length(path), 3);
for i = 1:length(path)
    tmp = sscanf(path{i}, 'H%dX%dY%d');
    states(i,:) = tmp';
end
traj =[];
for i = 1:size(states,1)
    traj =[traj ; W_xgrid(states(i,2)+1), W_ygrid(states(i,3)+1)];
end
for i = 1:size(states,1)-1
    orientation = states(i,1);
    x0 = [traj(i, 1:2) (-1+orientation)*pi/2];
    index = 1;
    el_loc = [];
    pnts = [];
    while 1
        [x_centers, V] = LoadMotionPrimitives(mp_data, actions(i), index, orientation);
        if(isnan(x_centers))
            break;
        end
        el_loc = [el_loc; x0 + x_centers'];
        index = index+1;
        %pnt = Ellipse_plot(V(1:2,1:2), [el_loc(end,1) el_loc(end,2)]);
        %plot(el_loc(end,2),-el_loc(end,1),'.k');
        %pnts = [pnts; pnt'];
    end
    %k = boundary(pnts, 0.9); %.8
    %plot(pnts(k,2), -pnts(k,1));
    %patch(pnts(k,2), -pnts(k,1), 'red');
    %f1 = 1:length(k);
    %v1 = [pnts(k,2), pnts(k,1)];
    %patch('Faces',f1,'Vertices',v1,'FaceColor','blue','FaceAlpha',.1);
    plot(el_loc(:,2),el_loc(:,1), 'Color', [.2 .8 .2], 'LineWidth', 2);
    
end

for i=1:size(W_ygrid,2)
    plot(repmat(W_ygrid(i),1,size(W_xgrid,2)), W_xgrid, '+', 'Color', [0.85 0.85 0.85])
end

for i=1:size(obstacle,1)
    plot([obstacle(i,2) obstacle(i,2)], -[-obstacle(i,1) -obstacle(i,3)], 'k', 'LineWidth',3);
    plot([obstacle(i,2) obstacle(i,4)], -[-obstacle(i,1) -obstacle(i,1)], 'k', 'LineWidth',3);
    plot([obstacle(i,4) obstacle(i,4)], -[-obstacle(i,1) -obstacle(i,3)], 'k', 'LineWidth',3);
    plot([obstacle(i,4) obstacle(i,2)], -[-obstacle(i,3) -obstacle(i,3)], 'k', 'LineWidth',3);
    v1 = [obstacle(i,2) obstacle(i,1); ...
         obstacle(i,4)  obstacle(i,1); ...
         obstacle(i,4)  obstacle(i,3); ...
         obstacle(i,2)  obstacle(i,3)];

    f1 = [1 2 3 4];
    patch('Faces',f1,'Vertices',v1,'FaceColor', 'red', 'FaceAlpha',.3);
    text(obstacle(i,2)+(obstacle(i,4)-obstacle(i,2))/6, (obstacle(i,3)+obstacle(i,1))/2, ...
        ['$O_{' num2str(i) '}$'], 'Interpreter', 'latex')
    
end

for i=1:size(no_enter,1)
    plot([no_enter(i,2) no_enter(i,2)], -[-no_enter(i,1) -no_enter(i,3)], 'k', 'LineWidth',3);
    plot([no_enter(i,2) no_enter(i,4)], -[-no_enter(i,1) -no_enter(i,1)], 'k', 'LineWidth',3);
    plot([no_enter(i,4) no_enter(i,4)], -[-no_enter(i,1) -no_enter(i,3)], 'k', 'LineWidth',3);
    plot([no_enter(i,4) no_enter(i,2)], -[-no_enter(i,3) -no_enter(i,3)], 'k', 'LineWidth',3);
    v1 = [no_enter(i,2) no_enter(i,1); ...
         no_enter(i,4)  no_enter(i,1); ...
         no_enter(i,4)  no_enter(i,3); ...
         no_enter(i,2)  no_enter(i,3)];

    f1 = [1 2 3 4];
    patch('Faces',f1,'Vertices',v1,'FaceColor', 'magenta', 'FaceAlpha',.3);
    text(no_enter(i,2)+(no_enter(i,4)-no_enter(i,2))/6, (no_enter(i,3)+no_enter(i,1))/2, ...
        ['$NEZ_{' num2str(i) '}$'], 'Interpreter', 'latex')
    
end
% num_robots = 1;
j = 1;
goals_str = {'p_1 pick', 'p_1 drop', 'p_3 pick', 'p_3 drop', 'p_0 pick', ...
             'p_0 drop', 'p_2 pick', 'p_2 drop'};
for r = 1:num_robots
    for i=1:size(goals{r},1)
        plot(goals{r}(i,2), goals{r}(i,1), 's', 'MarkerSize', 16, 'Color', [0,0.5,0]);
        text(goals{r}(i,2)+0.1, goals{r}(i,1)+0.1, ...
            [goals_str{j}], 'Color', [0,0.5,0],'FontWeight','bold')
        j = j + 1;
    end
end
%[0.7, 0.7, 0.9]
for i=1:size(one_ways_N,1)
    p1 = [(one_ways_N(i,2)+one_ways_N(i,4))/2 one_ways_N(i,3)];                         % First Point
    p2 = [(one_ways_N(i,2)+one_ways_N(i,4))/2 one_ways_N(i,1)];                         % Second Point
    dp = p2-p1;                         % Difference
    quiver(p1(1),p1(2),dp(1),1.0*dp(2),0.0, 'Color', 'r', 'LineWidth',2)
end
for i=1:size(one_ways_S,1)
    p1 = [(one_ways_S(i,2)+one_ways_S(i,4))/2 one_ways_S(i,1)];                         % First Point
    p2 = [(one_ways_S(i,2)+one_ways_S(i,4))/2 one_ways_S(i,3)];                         % Second Point
    dp = p2-p1;                         % Difference
    quiver(p1(1),p1(2),dp(1),1.00*dp(2),0.0, 'Color', 'r', 'LineWidth',2)
end
for i=1:size(one_ways_E,1)
    p1 = [one_ways_E(i,2) (one_ways_E(i,1)+one_ways_E(i,3))/2];                         % First Point
    p2 = [one_ways_E(i,4) (one_ways_E(i,1)+one_ways_E(i,3))/2];                         % Second Point
    dp = p2-p1;                         % Difference
    quiver(p1(1),p1(2),1.00*dp(1),dp(2),0.0, 'Color', 'r', 'LineWidth',2)
end
for i=1:size(one_ways_W,1)
    p1 = [one_ways_W(i,4) (one_ways_W(i,1)+one_ways_W(i,3))/2];                         % First Point
    p2 = [one_ways_W(i,2) (one_ways_W(i,1)+one_ways_W(i,3))/2];                         % Second Point
    dp = p2-p1;                         % Difference
    quiver(p1(1),p1(2),1.00*dp(1),dp(2),0.0, 'Color', 'r', 'LineWidth',2)
end

axis equal
%axis([bounds(2) bounds(4) -bounds(3) -bounds(1)])
axis([bounds(2)-0.2 bounds(4)+0.2 bounds(1)-0.2 bounds(3)+0.2])
title('Workspace, graph-view'); 

% grid on;
xlabel('y [m]'); ylabel('x [m]');

%%
% Command summary goes here
width=8; %in 
height=4; %in
FontSize = 14;
hFig = gcf;
hLegend = findobj(hFig, 'Type', 'Legend');
hTitle = get(gca, 'title');

% fits a two column letter paper 
%hFig.Units = 'inches';
%hFig.Position = [0 0 width height];
%hFig.PaperPositionMode = 'auto';

%figure('Units','inches', ...
%       'Position',[0 0 width height], ...
%       'PaperPositionMode','auto');
   
set(gca, ...
    'Units','normalized',...
    'Position',[.15 .2 .75 .7],...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',FontSize,...
    'FontName','Times')

if ~isempty(hLegend)
    new_text = {};
    for i = 1:length(hLegend.String)
        new_text = [new_text hLegend.String{i}];
    end
    legend(new_text,...
        'Units','points',...
        'interpreter','latex',...
        'FontSize',FontSize,...
        'FontName','Times',...
        'Location','NorthWest')
end
if(~strcmp(hTitle.String, ''))
    title(hTitle.String,...
          'FontUnits','points',...
          'FontWeight','normal',...
          'interpreter','latex',...
          'FontSize',FontSize,...
          'FontName','Times')
end  

hTexts=findobj(hFig, 'Type', 'Text');
if(~isempty(hTexts))
    for i=1:length(hTexts)
        try
            hTexts(i).FontUnits = 'points';
            hTexts(i).FontWeight = 'normal';
            hTexts(i).FontSize = FontSize;
            hTexts(i).FontName = 'Times';
            hTexts(i).interpreter = 'latex';
        catch
            continue
        end
    end    
end


%disp(['printing /home/cornell/Downloads/' file])
%eval(['print -depsc2 /home/cornell/Downloads/' strtok(file, '.') '.eps'])

