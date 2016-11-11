# Biplot for Smari

## Description 
#### PCA and Biplot
Principal Component Analysis (PCA for the rest of the document) is a statistical technique to summarize features into algebraic combinations to capture the most correlation between the features and reponses. PCA is usually used to capture the most informations of provided features meanwhile reduce the number of features for modeling complexity. Biplot is a visualization plotting the PCA features as axises, features as vectors, and observations as dots. Such technique enables viewing multi-dimentional data into a 2-D graphic capturing the most information.

#### Advantage of Using Biplot for Consulting Purposes
Based on the nature of biplot explained in the previous section, biplot can be extremely useful to analyze and visualize customers' reviews and their expectations. For example, based on the customers' surveies provided by Smari Inc. on alcohol stores services, the difference between customers' opinions and expectations can be visualized as different of two vectors in both direction and magnitude. Moreover, biplot can be helpful to visualize the performance difference between groups. For the default biplot on my web app (link provided below), the survey on different brands of data is plotted and the observations on different brands are plotted with distinct colors.     

## App Details
The details of the app can be found [here](https://zhangruinan.shinyapps.io/shinny_myggbiplot/) 

### Functionality
#### Import File
The feature allows users to upload their own data sheet and construct a customerized biplot. For now, the app only accept data in format of excel file with all informations on "sheet1". The first rows has to be the number of features and the rest of the files has to be numerical values. 

#### Ratio of Total Observation (dots) to plot
This features allows you to plot only a subset of your data sheet in a percentage level if you have a large data set.

#### Transparency
This feature allows you to adjust the transparency levels on dots (observations).

#### Choose PCA vectors
This feature allows you to change the axis to be any two of the first four PCA vectors as X and Y axises of teh biplot.

#### Enter the Plot Title
This feature allows you to change the title of the generated graphic.

#### Pick Features for PCA Analysis
This feature allows you to pick only a subset of features for PCA analysis.

#### Pick Features to Display
The feature allows you to only display a subset of features on biplot.

### Default Dataset
#### Description
These data are the results of a chemical analysis of wines grown in the same region in Italy but derived from three different cultivars. The analysis determined the quantities of 13 constituents found in each of the three types of wines.

#### Feature Details
* class: The class vector, the three different cultivars of wine are reprensented by the three integers : 1 to 3.
* V1: Alcohol
* V2:Malic acid
* V3:Ash
* V4:Alcalinity of ash
* V5:Magnesium
* V6: Total phenols
* V7: Flavanoids
* V8: Nonflavanoid phenols
* V9: Proanthocyanins
* V10: Color intensity
* V11: Hue
* V12: OD280/OD315 of diluted wines
* V13: Proline


