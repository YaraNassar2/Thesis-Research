# README - Modeling Misinformation Spread on Social Media

This repository contains MATLAB code used to model the dynamics of the spread of two competing pieces of misinformation on social media platforms. The modeling is inspired by epidemiological models, adapted to the context of misinformation spread.

## Files Description

1. **`Thesis.m`**: This MATLAB script sets up and runs a simulation of the dynamics of misinformation spread using a system of ordinary differential equations (ODEs). It initializes the simulation parameters, runs the ODE solver, and plots the results showing the changes in the states of susceptible, infected, and uninterested populations over time.

2. **`ODEsys.m`**: This MATLAB function file defines the system of ordinary differential equations (ODEs) used to simulate the spread of misinformation. It calculates the derivatives of the state variables at any given time point during the simulation.

## System Requirements

- **MATLAB**: The code was developed and tested in MATLAB. Ensure you have a recent version of MATLAB installed, preferably MATLAB R2020a or later, to support all features used in these scripts.

## Setup and Execution

1. **Clone or download this repository** to your local machine.
2. **Open MATLAB** and navigate to the directory where you have saved these files.
3. **Run the `Thesis.m` script** to execute the simulation. This script will automatically use the `ODEsys.m` function to perform the ODE computations and plot the results.
4. **Inspect the `Thesis.m` script for detailed comments** explaining the initialization of parameters, the use of the ODE solver, and the plotting of results.

## Understanding `ODEsys.m`

- **Input Parameters**:
  - `t`: Current time point in the simulation.
  - `p`: Vector of current state variables.
  - `ft`: Vector of time frames for interpolation of parameters.
  - `u1, u2`: Control parameters for each type of misinformation.
  - `b1, b2`: Modifiers for the impact of controls.
  - `a1, a2`: Transition rates from uninterested to susceptible states.
  - `m12, m21`: Transition rates between susceptible states for two types of misinformation.
  - `d1, d2`: Transition rates from susceptible to infected states.
  - `l12, l21`: Transition rates from infected states back to susceptible of the other type.

- **Outputs**:
  - `dpdt`: Derivative of the state variables, used to update the states in the ODE solver.


## Contact

For any additional questions or requests for collaboration, please reach out to the repository maintainers or directly to the thesis author via [yara.nassar@mail.utoronto.ca].
