# Quarter-Car Suspension Simulation (MATLAB)

A MATLAB simulation of a vehicle's suspension system, built from first principles to explore how spring stiffness and damping affect ride comfort and handling.

## Overview

This project models a **quarter-car suspension system** — a standard simplification in vehicle dynamics that represents one wheel and its share of the car body as a two-mass system connected by springs and a damper. The model simulates the system's response to a road bump and solves the resulting equations of motion numerically using MATLAB's `ode45`.

The project was built to strengthen my understanding of numerical methods, dynamic systems, and MATLAB, alongside my first year of an MEng in Integrated Mechanical and Electrical Engineering at the University of Bath.

## The model

The quarter-car model consists of:

- **Car body mass** (`m2`) — the "sprung mass," connected to the wheel via a suspension spring (`ks`) and damper (`c`)
- **Wheel/axle mass** (`m1`) — the "unsprung mass," connected to the road via the tyre, modelled as a spring only (`kt`)
- **Road input** — a smooth bump profile used to excite the system

<p align="center">
  <em>Road → Tyre spring (kt) → Wheel mass (m1) → Suspension spring/damper (ks, c) → Car body mass (m2)</em>
</p>

### Equations of motion

$$m_1\ddot{x}_1 = k_t(x_r - x_1) - k_s(x_1 - x_2) - c(\dot{x}_1 - \dot{x}_2)$$
$$m_2\ddot{x}_2 = k_s(x_1 - x_2) + c(\dot{x}_1 - \dot{x}_2)$$

These are converted to first-order state-space form (four states: position and velocity of each mass) and solved with `ode45`.

## Repository contents

| File | Description |
|---|---|
| `quarter_car_model.m` | Main script — sets parameters, runs the simulation, plots results |
| `suspension_ode.m` | ODE function defining the system's equations of motion |
| `road_profile.m` | Defines the road bump input as a function of time |

## Results

Simulating a 5 cm road bump with baseline parameters (`m1 = 30 kg`, `m2 = 300 kg`, `kt = 150,000 N/m`, `ks = 20,000 N/m`, `c = 1200 Ns/m`) gives the following response:

- The **wheel** reacts quickly and sharply to the bump, closely tracking the road input.
- The **car body** rises more slowly, with a *larger* peak displacement (~0.07 m vs ~0.05 m for the wheel) and continues oscillating for longer before settling.

This is a genuinely interesting (and initially counterintuitive) result: rather than simply "filtering out" the bump, the car body **resonates**, because its low natural frequency — a result of its large mass and relatively soft suspension spring — happens to be excited well by the shape and duration of the bump. It's a concrete illustration of why real suspension tuning is a careful trade-off exercise, not just "add a spring and damper."

### Damping sweep and wheel hop

Reducing the damping coefficient (`c`) reveals a second effect: at low damping, the wheel's response develops a fast, low-amplitude oscillation superimposed on the main bump response. This matches a real phenomenon in vehicle dynamics called **wheel hop** — a lightly-damped wheel oscillating rapidly against the road via the (undamped) tyre spring, which affects tyre grip and road contact.

The observed oscillation frequency was checked against the wheel's analytical natural frequency:

$$f = \frac{1}{2\pi}\sqrt{\frac{k_t}{m_1}} \approx 11.3\ \text{Hz}$$

which closely matched the simulated behaviour, confirming the effect was genuine system dynamics rather than a numerical artifact.

## What I'd extend next

- Compare simulated parameters against real published suspension specs to validate the model
- Add a PID-controlled active suspension and compare its performance against the passive system above
- Sweep spring stiffness and damping systematically to map out the comfort–handling trade-off space

## Skills demonstrated

Numerical solution of coupled ODEs, state-space modelling, MATLAB (`ode45`, vectorisation, plotting), physical interpretation and validation of simulation results, and independent research into vehicle dynamics theory.

---
*Built by Cameron Swain — MEng Integrated Mechanical and Electrical Engineering, University of Bath*
