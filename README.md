# MATLAB-License-Plate-Recognition-LPR
## Image and Video Processing Project: License Plate Recognition (LPR) 

This repository contains MATLAB code developed for an advanced **Signals and Systems** course exercise, focusing on computer vision techniques for **License Plate Recognition (LPR)** and **Average Vehicle Speed Estimation**.

The project is structured into four main sections, demonstrating proficiency in fundamental image processing, custom function implementation, and video analysis.

---

### Project Sections and Objectives

#### Part I: English License Plate Recognition (Custom Functions) (`pl.m`)

The primary goal of this section is to implement core image processing functions **without relying on built-in MATLAB alternatives** to demonstrate a deep understanding of the algorithms.

| Feature | Custom MATLAB Function | Description |
| :--- | :--- | :--- |
| **Grayscale Conversion** | `mygrayfun` | Converts the 3D color image matrix to a grayscale image using the weighted formula: $Gray_{channel}=0.299\times Red_{channel}+0.578\times Green_{channel}+0.114\times Blue_{channel}$. |
| **Binarization** | `mybinaryfun` | Converts the grayscale image to a binary image using a user-defined threshold. |
| **Noise Reduction** | `myremovecom` | Removes connected components (objects) with fewer than $n$ pixels, similar to `bwareaopen`, to clean up binary noise. |
| **Segmentation** | `mysegmentation` | Segments the cleaned binary image to isolate individual characters, similar to `bwlabel`. |
| **Character Recognition** | N/A | Performs **Decision Making** by calculating the **Correlation** between each segmented character and a provided database of English letters and number. |

#### Part II: Persian License Plate Recognition 

This part focuses on recognizing characters from Iranian license plates.

* **Database Creation:** Since no database is provided, the user must create a database containing Persian letters (ب, ج, س, ص, ط, ق, ل, م, ن, و, ه, ی) and all Persian numerals.
* **Implementation:** The code uses MATLAB's built-in functions (instead of the custom functions from Part I) to process the plate image and identify characters.

#### Part III: License Plate Detection from Full Car Image (`p3.m`)

This script handles the task of locating the license plate within a full image of the car's front body.

* **Plate Frame Isolation:** The core challenge is to **separate the license plate frame** from the entire car imageThe detailed isolation idea must be explained in the project report.
* **Character Extraction:** Once the frame is isolated, the remaining character recognition process is identical to **Part II**.


### Requirements and Running the Code

* **Software:** MATLAB Environment.
* **Files:** The repository should contain the main scripts: `pl.m`, `p2.m`, `p3.m`.
* [**Input:** The scripts use the `uigetfile` command to prompt the user for the input image/video file path.
