# Corticomuscular Coherence Analysis Using Wavelet Coherence Method Based on Leg Movements

This repository contains the MATLAB implementation and research findings for a final year project analyzing the functional connection between the human brain and muscles during various leg movements. This work was submitted in partial fulfillment of the requirements for the degree of Bachelor of Technology in Instrumentation and Control Engineering at the National Institute of Technology, Tiruchirappalli.

## Authors
* **Basith Mohamed** 
* **Varsha Raju** 
* **Project Guide:** Dr. N Sivakumaran

---

## Project Overview
The interaction between motor cortex activity and muscle movement is expressed through the coherence between Electroencephalogram (EEG) and Electromyogram (EMG) signals. While traditional methods like Magnitude Square Coherence (MSC) are limited by frequency resolution and non-linear characteristics, this project utilizes **Wavelet Coherence** to reflect time-frequency local and instantaneous characteristics of non-stationary signals.

### Key Features
* **Activity Mapping:** Analysis of EEG-EMG coupling during level walking, ramp ascent/descent, and stair ascent/descent.
* **Frequency Band Analysis:** Comparison of coherence across Alpha (8-14 Hz), Beta (14-30 Hz), and Gamma (30-50 Hz) bands.
* **Quantitative Metrics:** Uses the Coherence Significant Area ($A_{coh}$) to provide a quantifiable metric for comparing different muscle-cortex pairs.

---

## Dataset & Methodology
### Data Source
The study utilizes the "Full body mobile brain-body imaging data during unconstrained locomotion on stairs, ramps, and level ground" dataset. Subjects were instrumented with 17 wireless inertial measurement units (IMUs) for full-body motion capture.

### Channels & Muscle Groups
* **EEG Channels:** C1, C2, and Cz.
* **EMG Muscle Groups:** Tibialis anterior (TA), medial gastrocnemius (GAST), vastus lateralis (VL), rectus femoris (RF), semitendinosus (SEM), and biceps femorus longus (BFL).

### Processing Workflow
1. **Pre-processing:** Synchronization of EEG and EMG signals followed by de-noising and selecting appropriate channels.
2. **Activity Segmentation:** Kinetics and accelerometer data are used to map motion paths and split data into distinct activities along the Z-axis.
3. **Signal Representation:** EMG burst points are used to normalize signals and derive sampled EEG data.
4. **Coherence Calculation:** Execution of Wavelet Coherence and aggregation of values to generate comparative plots.

---

## Key Results
* **Alpha Band Dominance:** Coherence in the Alpha band was found to be significantly higher than in the Beta band across all tested activities (Ramp, Stairs, and Level Walking).
* **Significant Muscle Pairs:** Analysis revealed that the **C2-TA** (Tibialis Anterior) and **C2-VL** (Vastus Lateralis) pairs demonstrated the highest levels of significant coherence.
* **Quantifiable Comparison:** The research provides average aggregated values of $A_{coh}$ for different activities, showing that Alpha band coherence consistently outperforms Beta band coherence in terms of significance.

---

## Future Scope
This framework sets a foundation for future Brain-Computer Interface (BCI) development, offering potential pathways for:
* **Prosthetic Control:** Developing means of controlling prostheses for patients with physical limitations.
* **Movement Prediction:** Utilizing enhanced coherence metrics to predict limb movement intentions.
* **Nerve Research:** Revealing more detailed mechanisms regarding how nerves control muscles through functional networks.

## Repository Link
[Corticomuscular Coherence Analysis - GitHub](https://github.com/basithxd/Corticomuscular-Coherence-Analysis-Using-Wavelet-Coherence-Method-Based-On-Leg-Movements)
