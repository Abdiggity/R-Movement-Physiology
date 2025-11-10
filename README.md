# Movement Physiology – Jump Height Analysis (Repeated-Measures ANOVA)

This project analyses **jump height performance** across different jump types using a **within-subjects (repeated-measures) ANOVA** in R.  
It forms part of a movement physiology case study exploring how biomechanical performance varies between **squat jumps (S)**, **countermovement jumps (CMJ)**, and **arm-swing countermovement jumps (CMJA)**.

---

## Objective

To determine whether **jump type** significantly influences **jump height (cm)** among participants, using robust statistical and visual methods.

---

## Analysis Summary

**Statistical Approach:**
- Repeated-measures ANOVA using the `ezANOVA()` function from the **`ez`** package  
- Within-subject factor: `Type` (S, CMJ, CMJA)  
- Dependent variable: `Height`  
- Subject ID: `ID`  

**Post-analysis:**
- Check **Mauchly’s test of sphericity**  
  - If *p < 0.05*, sphericity is violated → report **Greenhouse–Geisser corrected results**  
- Interpret F-ratios, p-values, and effect sizes  

---

## 📊 Visualisation

Two styles of boxplots are produced:
- **Base R plot**: clean and color-coded by jump type  
- **`ggplot2` version**: publication-ready visualization with custom colors, labels, and no frame  

---

## Repository Structure

```text
.
├── README.md               # this file
├── jumpheightANOVA.csv     # dataset (Height, ID, Type)
├── movement_ANOVA.R        # main R analysis script
└── figures/                # optional: save exported boxplots here
