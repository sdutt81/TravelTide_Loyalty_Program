# TravelTide Customer Classification and Loyalty Program

Welcome to the TravelTide Customer Classification & Loyalty Program repository! This initiative is designed to help the marketing team at TravelTide develop a tailored rewards system by implementing customer classification techniques. By grouping users based on shared characteristics, TravelTide can offer personalized incentives that align with their preferences and habits, fostering stronger customer relationships and retention.

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install airportsdata and haversine.

```bash
!pip install airportsdata pycountry
!pip install haversine
```

## Usage

```python
import airportsdata
from haversine import haversine, Unit

# returns 'country' from airport code
def get_country(airport_code):
    if pd.notnull(airport_code) and airport_code in airports:
        return airports[airport_code]['country']
    return np.nan

# returns Haversine distance between 2 locations
def calculate_haversine(row):
    if pd.notnull(row['home_airport_lat']) and pd.notnull(row['destination_airport_lat']):
        origin = (row['home_airport_lat'], row['home_airport_lon'])
        destination = (row['destination_airport_lat'], row['destination_airport_lon'])
        return haversine(origin, destination, unit=Unit.KILOMETERS)  # Distance in KM
    return np.nan

```

## Project Summary

TravelTide, a top-tier travel service provider, is considering introducing a loyalty program. To ensure its success, the marketing team is utilizing data-centric segmentation strategies. The main objectives of this project include:

* **Customer Classification:** Using K-Means clustering to divide customers into distinct groups based on their travel patterns, preferences, and purchasing behavior, enabling a clearer understanding of different customer types.

* **Personalized Incentives:** Through careful analysis of these groups, we can identify which rewards and benefits will appeal most to each segment, ensuring a more customized loyalty experience.

* **Data-Guided Decisions:** This project provides valuable insights to assist the marketing team in crafting strategic promotions, incentives, and engagement tactics.


## Core Features

* **In-Depth Data Analysis:** Utilizing data science techniques to uncover patterns in customer behavior and travel preferences.

* **K-Means Clustering Implementation:** Employing clustering methods to create meaningful customer segments, enhancing the relevance of reward offerings.

* **Optimal Cluster Identification:** Leveraging techniques like the Elbow Method and Silhouette Score to determine the best number of clusters for segmentation.

* **Reward Optimization:** Identifying which incentives resonate most with different customer classifications to create targeted rewards.

* **Actionable Insights:** Providing strategic recommendations for TravelTide, including potential tiered loyalty structures and bundled benefits.

[Notebook](https://colab.research.google.com/drive/19mPKLUYaLAbvZnSPibV3B7QrCiA1h6tD?usp=sharing)
