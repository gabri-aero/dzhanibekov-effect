function mat=RBI(phi,theta,psi)
    d1 = phi;
    d2 = theta;
    d3 = psi;
    mat=[cos(d2)*cos(d3) cos(d2)*sin(d3) -sin(d2);
        sin(d1)*sin(d2)*cos(d3)-cos(d1)*sin(d3) sin(d1)*sin(d2)*sin(d3)+cos(d1)*cos(d3) sin(d1)*cos(d2);
        cos(d1)*sin(d2)*cos(d3)+sin(d1)*sin(d3) cos(d1)*sin(d2)*sin(d3)-sin(d1)*cos(d3) cos(d1)*cos(d2)];
end