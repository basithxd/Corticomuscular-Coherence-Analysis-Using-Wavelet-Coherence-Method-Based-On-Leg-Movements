# Corticomuscular Coherence Analysis Using Wavelet Coherence Method Based on Leg Movements

[cite_start]This repository contains the MATLAB code and research documentation for analyzing the functional connection between the motor cortex and leg muscles during various autonomous movements[cite: 1, 32]. [cite_start]This project was submitted in partial fulfillment of the requirements for the award of the degree of B.Tech in Instrumentation and Control Engineering at the National Institute of Technology, Tiruchirappalli[cite: 4, 5, 7, 16].

## Authors
* [cite_start]**Basith Mohamed** [cite: 9]
* [cite_start]**Varsha Raju**  [cite: 10]
* [cite_start]**Project Guide:** Dr. N Sivakumaran [cite: 24, 25]

---

## Project Overview
[cite_start]The interaction between brain activity (EEG) and muscle movement (EMG) can be expressed through **corticomuscular coherence**[cite: 33, 65]. [cite_start]While traditional frequency-domain methods like Magnitude Square Coherence (MSC) are limited by frequency resolution and struggle with non-stationary signals, this project utilizes **Wavelet Coherence**[cite: 71, 78].



[cite_start]Wavelet coherence detects common time-localized oscillations in non-stationary signals, providing a more accurate reflection of the time-frequency local characteristics of EEG-EMG signals[cite: 82, 85].

### Key Objectives
* [cite_start]Examine the functional connection between the brain and muscles during walking, ramp ascent/descent, and stair ascent/descent[cite: 32, 131].
* [cite_start]Analyze coherence characteristics across different frequency bands: Alpha (8-14 Hz), Beta (14-30 Hz), and Gamma (30-50 Hz)[cite: 316].
* [cite_start]Quantify the coupling relationship using a metric called the Coherence Significant Area ($A_{coh}$)[cite: 37, 406].

---

## Dataset & Methodology
### Data Source
[cite_start]The research uses the "Full body mobile brain-body imaging data during unconstrained locomotion on stairs, ramps, and level ground" dataset[cite: 121, 502, 503]. [cite_start]Subjects were instrumented with 17 wireless inertial measurement units (IMUs) for full-body motion capture[cite: 122, 123].

### Channels & Muscle Groups
* [cite_start]**EEG Channels:** C1, C2, and Cz[cite: 301].
* [cite_start]**EMG Muscle Groups:** Tibialis anterior (TA), medial gastrocnemius (GAST), vastus lateralis (VL), rectus femoris (RF), semitendinosus (SEM), and biceps femoris longus (BFL)[cite: 301, 448].

### Processing Workflow
1. [cite_start]**Pre-processing:** Synchronization of EEG and EMG signals followed by de-noising[cite: 312].
2. [cite_start]**Activity Segmentation:** Kinetics and accelerometer data are used to map motion paths and split data into distinct activities along the Z-axis[cite: 305, 306, 307].
3. [cite_start]**Normalization:** EMG burst points are used to normalize signals and derive sampled EEG by multiplying the normalized EMG signal[cite: 312].
4. [cite_start]**Coherence Analysis:** Calculation of the $A_{coh}$ metric to quantify the significant area of coherence above a threshold[cite: 407, 409].

---

## Key Results
* [cite_start]**Frequency Dominance:** The Alpha band demonstrated higher levels of significant coherence than the Beta band across all activities, including level walking, ramp descent, and stair ascent[cite: 416, 417, 469].
* [cite_start]**Significant Muscle Pairs:** Analysis revealed that the **TA-C2** and **VL-C2** pairs exhibited the highest levels of significant coherence[cite: 449, 477].
* [cite_start]**Activity Metrics:** For Stair Ascent, the average aggregated $A_{coh}$ was approximately **0.885** for the Alpha band compared to **0.717** for the Beta band[cite: 464, 468].

---

## Future Scope
This framework establishes a method for studying brain-muscle communication that can be extended to:
* [cite_start]**Brain-Computer Interfaces (BCI):** Controlling prostheses for patients with physical limitations[cite: 482, 483].
* [cite_start]**Movement Prediction:** Utilizing enhanced coherence metrics to predict limb movement intentions[cite: 484].
* [cite_start]**Functional Networking:** Constructing cortex-muscle functional networks to further reflect nerve control over muscles[cite: 485, 486].

## References
[cite_start]Please see the full [thesis draft](FYPThesisDraft%20(1).pdf) for the complete list of references and detailed literature review[cite: 490].
