function [x, V] = LoadMotionPrimitives(mp_data, action, index, orientation)
%     %jackal gazebo 

    mp = mp_data.mp.(['x' num2str(action)]);
    if index > size(mp)
        x = nan;
        V = nan;
        return
    end
    x = mp(index).x;
    V = reshape( mp(index).V ,3,3);
    %V = reshape( V(index, :) ,3,3);
    %x = x(index,:)';
    
    R = GetRotmat(orientation);
    Rinv = inv(R);
    
    x = R * x;
    V = Rinv' * V * Rinv;
%     V = R' * V * R;

end

function rotmat = GetRotmat(orient)
    if(orient == 0)
        rotmat = [1.,0. 0; 0.,1. 0; 0, 0, 1];
    elseif(orient == 1)
        rotmat = [0.,-1., 0; 1.,0. 0; 0, 0, 1];
    elseif(orient == 2)
        rotmat = [-1.,0., 0; 0.,-1. 0; 0, 0, 1];
    elseif((orient == 3) || (orient == -1))
        rotmat = [0.,1., 0; -1.,0. 0; 0, 0, 1];
    else
        disp('bad orientation parameter')
        rotmat = eye(3);
    end
end