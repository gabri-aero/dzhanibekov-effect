# Dzhanibekov Effect simulation
<p>
MatLab simulation of the intermediate axis theorem, also called the Dzhanibekov effect. I have explained the physics behind the simulation at the end of the page.
</p>
<p>
Rigid body free rotating dynamics simulation conditions:
<ul>
  <li>Cubic body (mimicing a CUBESAT). Body parameters found in <code>body_params.m</code></li>
  <li>Free rotation &#8594 no external forces applied</code></li>
  <li>The body has initial angular velocity in the intermediate axis of inertia and a really small angular velocity in one of the other axis (hypotetical perturbation that triggers this strange behavior). Initial conditions are provided in <code>mian.m</code></li>
</ul>
</p>
<p>
NOTE: the code provided is compatible with the free rotation dynamics of any rigid body having provided its body parameters. Besides that, adding external forces can be easily done changing <code>rot_dynamics.m</code>.
</p>

<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154386750-7b80b68c-d74c-4fa8-a2c6-41c4be607c93.gif"  | width=500 >
</p>

<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154380570-b0c1f6b0-e75a-4517-9758-c3cd6cf9b994.png">
</p>
<p>
To run the simulation, first it is necessary to derive the rotational dynamics equations. According to elementary mechanics:
</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154364167-7c73ae9b-df23-434c-a95a-b26e41aa9f77.svg">
</p>
<p>
To make things easier, we will assume the rotating body is a rigid body which has a main implication: the inertia matrix is constant in the body frame since there are not relative motion between the particles of the body.
  </p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/79655304/154364747-aeae64ae-defe-4549-aaea-419c5cf86e41.svg">
</p>
<p>The inertia matrix and the angular velocity in the body frame are expressed as follows.</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154363284-5b126ec1-928d-4e77-963c-1c11266313e5.svg">
</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154363294-48e02055-6fc6-46db-9575-809f66387977.svg">
</p>
<p>
Now, given that we are taking magnitudes in non-inertial frames, we will expand the right term of the 2nd Newton Law for rotating bodies in the body frame to take advantage of the rigid body conclusion.</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154366161-c725c0f6-1f61-4f9e-ba06-7f5ad9e02745.svg">
</p>
<p>As a result, the equation defining rotational dynamics becomes:</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154366634-d362b0e2-4fe0-46ca-b0ae-3239fd17d72f.svg">
</p>
<p>where the inertia matrix and the angular velocity are expressed in body frame coordinates. Besides that, since the simulation shows the free rotation of a rigid body, external forces momentum is zero.</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154367525-86cb7b88-cea7-47d4-8c3b-40b7c8ea3857.svg">
</p>
<p>Next, it is necessary to clear the angular velocity derivative terms in order to apply numerical methods for solving the system of equations. For simplicity, we will take the skew symetric operator to show the result in a matrix form.</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154367787-50b65e07-79cb-499a-9043-8b5e62aae8f6.svg">
</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154368009-f9a4560a-da1f-4cdf-a865-8599c31ea691.svg">
</p>
<p>Let's expand the whole system of equations to view the components of the final expression:</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154368277-6cccf84b-fbf6-4e2c-be03-7c9adef42e7e.svg">
</p>
<p>
Now, we could solve the system and get the angular velocity in the body frame. However, to plot the "real" movement of the body we have to plot how it moves in the inertial frame. To do so, we just have to transform the angular velocity in the body frame into the angular velocity in the inertial frame. This can be accomplished thank to the following expressions with state the relationship between the angular velocities of the rotating frame and the inertial frame:
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154376500-6fa8330a-352c-419e-9e80-e1916b67f2e5.svg">
</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154377036-f387cc4f-f714-4f8d-9e2e-e8d4484f88e8.svg">
</p>
<p>We can now clear the angular velocities in order to apply a numerical ODE solver</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154377460-b46b77ba-e8a8-4a68-b943-fb40264c5949.svg">
</p>
<p>Finally, putting together both systems of equations we can write the whole system of equations that we have to solve as follows.</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154373167-48bd318e-f7e9-40f5-8879-593f05c13694.svg">
</p>
<p>Which has been easily solved applying Runge-Kutta 4 technique</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154373918-793203ab-e5f6-4b29-982d-2db9c17f023c.svg">
</p>
<p align="center">
    <img src="https://user-images.githubusercontent.com/79655304/154373990-874e07d2-0fc2-4f76-bfcf-691d2e260cef.svg">
</p>
