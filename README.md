
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
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/8d22fe85c1f97012fae46215f6f088aa37286f16/Cloud%20Physics%20Project/Nt_100.png" width="255" alt="N_c= 100 cm−3" />
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/8d22fe85c1f97012fae46215f6f088aa37286f16/Cloud%20Physics%20Project/Nt_75.png" width="255" alt="N_c= 75 cm−3" /> 
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/8d22fe85c1f97012fae46215f6f088aa37286f16/Cloud%20Physics%20Project/Nt_100_28.png" width="255" alt="Varying N_c" />
</p>

**Figure 1:** Plotting Q_c against Height for 4 days with a 6 hr surface cooling at the start of the simulation. Fig 1 a) The Thompson scheme with Nc= 100 cm−3, b) The Thompson scheme with N_c= 75 cm−3 and c) The Thompson Aerosol-Aware scheme which has N_c as a predicted variable.

We observe that there are no upper layer clouds and the cloud/fog layer
develops after the 6-hour cooling. The fog layer seems pretty stratified and steadily increases
with time to reach a height of about 315 m for all of the three cases. This may be due to
no radiation schemes being introduced but this also simplifies accessing the performance
of our changes. We can see there is a slight decrease in LWC when we change the cloud
droplet concentration to 75 cm−3 and there is a significant decrease in LWC when we use
the Thompson Aerosol-Aware.

When doing the comparison between Fig 1 a) and 2.1 b), it is quite hard to distinguish the decrease in LWC content, so we decided to plot each day (16th, 17th, 18th, 19th) instead of continuously. For example, we plotted the cloud mixing on the 16th at 00:00 UTC against height for the original case and then for the maritime case. The figure is given below:

<p float="left">
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/7ae5cd1172e979b84b1c29af26835156df0d259a/Cloud%20Physics%20Project/Height.png" width="400" alt="Caption 1" />
</p>

**Figure 2.1:** Q_c against Height Comparison between Nc=100 cm-3 and 75 cm-3 for Thompson (2008) microphysics scheme.
 From Fig 2.1, we see that the dotted lines (Maritime case N_c = 75 cm-3) is less than the full lines. This shows that the LWC did decrease compared to the original case.

We also plotted a comparison between the default Thompson case
and the Thompson Aersol-Aware scheme which is given below:

<p float="left">
  <img src="https://github.com/Piyush-T31/WRF_Projects_CloudPhysics/blob/7ae5cd1172e979b84b1c29af26835156df0d259a/Cloud%20Physics%20Project/Thompson_Height.png" width="400" alt="Caption 1" />
</p>

**Figure 2.2:** Qc against Height Comparison between Thompson (2008) microphysics and Thompson (2014) aerosol-aware.

From Fig 2.2, we can see that for the Thompson Aerosol-Aware, there is a significant decrease in LWC which is in agreement with Fig 1.

### Discussion 

We decided to calculate the visibility inside the fog layer and do a comparison between the
three cases. 

| Visibility/m | After 24hrs | After 48hrs | After 72hrs | After 96hrs |
|--------------|-------------|-------------|-------------|-------------|
| Nc=100       | 37.44445    | 46.22861    | 56.55745    | 65.40787    |
| Nc=75        | 39.85451    | 48.97966    | 58.00246    | 69.36349    |
| Aerosol-Aware| 224.83444   | 235.82130   | 401.35534   | 491.91817   |

**Figure 3:** Table containing visibility at 00:00 UTC for each day of the simulation at height z= 1.6m for each case (original, when Nc is changed to 75 cm−3 and Thompson aerosol-aware).


### Conclusion 

By changing the cloud droplet number concentration to be more suitable for a maritime case in the Thompson microphysics scheme, that is changing the N c from 100 cm−3
to 75 cm−3, we were able to decrease the cloud mixing ratio or LWC by 7 %. This increased visibility by approximately 3 m. When we changed the Thompson microphysics scheme to its newer
version, the Thompson Aerosol-Aware microphysics scheme, which has N c varying with time, we saw the LWC decrease by 55 %. The resulting increase in visibility was around 300 m.


### Future Work 
To be able to validate the comparison, we need to run the real case in WRF and see which one
is closer to actual observations. This aligns well with the Fog and Turbulence Interactions in
the Marine Atmosphere (FATIMA) project which collects data around places that have a lot
of fog occurrence (Sable Island or Yellow Sea). We need to also investigate the Thompson
Aerosol-Aware scheme to fully understand why it differs that much from the older scheme.
Finally, we need to implement the radiation scheme as it plays a major role in the growth
of the fog layer (longwave radiation) and its dissipation (shortwave radiation).

## Futher Info At:

[Project Report](https://piyush-teeloku.gitbook.io/microphysics/https://piyush-teeloku.gitbook.io/microphysics/)
