function dy =  rot_dynamics(~, y) % no time-dependent functions
    p = y(1);
    q = y(2);
    r = y(3);
    phi = y(4);
    theta = y(5);
    psi = y(6);
    body_params % inertia
    w = [p; q; r]; % angular velocity
    dy(1:3) = I\(-cross(w, I*w));
    dy(4) = p+(q*sin(phi)+r*cos(phi))*tan(theta);
    dy(5) = q*cos(phi)-r*sin(phi);
    dy(6) = (q*sin(phi)+r*cos(phi))*sec(theta);
    dy = dy';
    