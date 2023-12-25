
## Documentation

### Introduction

Many studies on marine fog have shown that different models overestimate the liquid
water content (LWC) in the fog layer, resulting in thicker layers and reduced visibility compared to observations. The Weather Research and Forecasting (WRF) model uses different
parametrization schemes for different physical processes in the atmosphere. In this report, I
investigated the two Thompson microphysics schemes as they are relevant to the formation
and evolution of marine fog.

This project is based on a previous study from the ”Surface Deposition of marine fog and
its treatment in the Weather Research and Forecasting (WRF) model” paper. The paper
also suggests that many weather models, including WRF, overestimate LWC in fog layers.
Their main idea was to investigate the surface layer parametrization in WRF.  Since we
are investigating marine fog, one needs to take into account the sea surface in the weather
model but there does not seem to be a deposition of fog droplets to the surface. They
hypothesized that the sea surface is an effective sink for the fog droplets and turbulence
within the fog layer will increase the probability of the droplets colliding and coalescing with
the water surface.

### Microphysics in WRF and Thompson microphysics schemes.

Microphysics scheme deals with moisture
tendencies and atmospheric heat of water vapor, cloud droplets, rain, ice, and graupels. It
deals with the different processes for each of those aerosols, such as for cloud droplets there
will be collision and coalescence, for water vapor there will be condensation or evaporation
which are relevant to clouds. 

In the "Surface Deposition" paper, they used the Thompson microphysics scheme. So, for this project we decided to change the cloud droplet concentration and to use the newer Thompson Aerosol-Aware microphysics scheme. 

### Results

After investigating the Thompson microphysics
scheme, we identified that the N_c is a constant and can be changed in the code, so we changed
the cloud number from 100 cm3 to 75 cm−3 which is more suitable for maritime cases. Then, we used the Thompson Aerosol-Aware scheme which had a varying N_c. 


We decided to compare the first figure in the 'Surface Deposition' Paper. We plotted the cloud mixing ratio varying with height against time for each case, that is, the default Nc= 100 cm−3, when Nc= 75 cm−3 and with the varying Nc. We had the MYNN surface layer with z0c = 0.01 m, the surface cooling of 3 K/hr which decreased the skin
temperature to 282 K.

<p float="left">
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/8d22fe85c1f97012fae46215f6f088aa37286f16/Cloud%20Physics%20Project/Nt_100.png" width="100" alt="N_c= 100 cm−3" />
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/8d22fe85c1f97012fae46215f6f088aa37286f16/Cloud%20Physics%20Project/Nt_75.png" width="100" alt="N_c= 75 cm−3" /> 
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/8d22fe85c1f97012fae46215f6f088aa37286f16/Cloud%20Physics%20Project/Nt_100_28.png" width="100" alt="Varying N_c" />
</p>

**Figure 1:** Plotting Q_c against Height for 4 days with a 6 hr surface cooling at the start of the simulation. Fig 2.1 a) The Thompson scheme with Nc= 100 cm−3, b) The Thompson scheme with N_c= 75 cm−3 and c) The Thompson Aerosol-Aware scheme which has N_c as a predicted variable.

