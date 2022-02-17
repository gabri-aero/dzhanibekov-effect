function I = cube_inertia(m, x, y, z)
    Ix = m*(y^2+z^2);
    Iy = m*(x^2+z^2);
    Iz = m*(x^2+y^2);
    Jxz = 0;
    Jxy = 0;
    Jyz = 0;
    I = [Ix -Jxy -Jxz; -Jxy Iy -Jyz; -Jxz -Jyz Iz];