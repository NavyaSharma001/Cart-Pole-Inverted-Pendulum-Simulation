# Cart-Pole-Inverted-Pendulum-Simulation
A MATLAB-based simulation modeling the nonlinear dynamics and time-stepped animation of an underactuated, two-degree-of-freedom (2-DOF) Cart-Pole inverted pendulum system. 
The system's equations of motion are derived from first principles using **Lagrangian mechanics** and solved numerically without linear approximations.

<img width="800" height="450" alt="WhatsAppVideo2026-06-20at3 32 02PM-ezgif com-video-to-gif-converter" src="https://github.com/user-attachments/assets/091125c9-29e9-4331-84d5-c83a5dff96db" />


## Technical Highlights
* **Mathematical Modeling:** Implemented full second-order nonlinear differential equations derived via Euler-Lagrange equations to model state vectors ($\theta, \dot{\theta}, x, \dot{x}$).
* **Numerical Integration:** Utilized MATLAB's adaptive step-size Runge-Kutta solver (`ode45`) to accurately compute state transitions over a 10-second window.
* **Kinematic Animation Engine:** Developed a custom time-stepped visualization loop that renders the physical cart displacement and pendulum oscillations in real time.

## System Parameters
* **Cart Mass ($M$):** 2.4 kg
* **Pole Mass ($m$):** 0.6 kg
* **Pole Length ($l$):** 0.5 m
* **Acceleration due to Gravity ($g$):** 9.81 m/s²
* **Initial State ($x_0$):** `[pi/4; 0; 0; 0]` (Pendulum dropped from a 45° angle under unforced free-fall conditions)

## Dynamic Behavior & Control Context

If you run the simulation, you will notice the cart and pendulum oscillate rapidly and aggressively ("move like crazy"). There is a precise engineering reason for this:

1. **Zero Control Input ($u = 0$):** The simulation models a completely **unactuated / passive system**. No external motor forces, damping, or friction are applied to counteract gravity.
2. **Energy Exchange:** Because the pendulum is dropped from an initial non-equilibrium angle of 45° ($\pi/4$ rad), potential energy continuously converts into kinetic energy. The system violently transfers momentum back and forth between the linear displacement of the cart and the angular acceleration of the pole.
3. **The Need for Control Theory:** This chaotic, undamped behavior perfectly demonstrates why this system is a classic benchmark in robotics. It sets up the ideal foundation for implementing active feedback control architectures—such as **PID (Proportional-Integral-Derivative)** loop tuning or **LQR (Linear Quadratic Regulator)** state-space control—to stabilize the cart and catch the pendulum in its inverted position.

## How to Run
1. Clone this repository or download `cartpole_simulation.m`.
2. Open the file in MATLAB.
3. Run the script to view the dynamic state plots (Cart Position vs. Time and Angular Displacement vs. Time) followed by the real-time kinematic animation window.

