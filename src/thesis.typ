#import "thesis_temp.typ": *

#show: project.with(
  title: "Simple Open Data Measures of Public Transit Service Availability",
  subtitle: "Temporal Variability",
  authors: (
    // TODO add matr number and postal address as secrets
    (name: "Emily C. Wilke",matr: "35xxxxxxxx", email: "emilycwilke@gmail.com", affiliation: "Ruprecht-Karls-Universität Heidelberg", postal: "xxxxxxx"),
  ),
  date: [#datetime.today().display()],
  abstract_en: "",
  abstract_de: "",
)

// TODO insert page for affidavit
// TODO maybe import chapters from separate documents

= Introduction
  In recent years, but for decades by now, the demand for a paradigm shift in transportation infrastructure and service has become louder and louder.
  While calls for a shift away from car centric mobility are nothing new and were a well established part of German Academic discourse in the 1990s already @frank_hat_1993, it has become part of a widespread political discourse around the so called _Verkehrswende_ @holzapfel_urbanismus_2020.
  With increased awareness and concrete experiences of climate change this discourse has reached states of heated debate.
  Benefits of


  == Transit Accesibility Equity and Equality
    === Terminology

    === Motivation
      - Traditional transport planning centering on men? // source
        - German Transport Planning post world war 2? // source
      - Transit planning and identifying demand in public transit networks is a complicated process, that takes into account a plethora of data that's hard to access or acquire @pieper_kreislauf_2021.
        - statistical routing data based on conveyal engine @conway_evidencetransit
    === Research Question
      - How temporal variability in transit accessibility maps on to spatial usage patterns?
      - are cities really better connected? edge times?
      - are rural areas always worse off in connections or are there times when it's actual actions?

  == Related Work
    - Network Centrality Measures
      - road networks
      - public transit networks
      - bipartite networks
    - Transit Equity Studies
      - US
      - Network Planning @pieper_kreislauf_2021
    - Traveltime Datasets such as @tenkanen_longitudinal_2020 and @verduzco_torres_public_2024
  == Methodological Approach
    === Data Acquisition
      - explorative data analysis
  === origins
    - hexgrids from h3pandas @dahn_h3pandas_2023 based on uber's implementation of them
    ==== Transport Data
      - osm files from geofabrik @geofabrik_gmbh_geofabrik_2018
      - gtfs files from various transit companies @vrs_soll-fahrplandaten_2023 @vvs_soll-fahrplandaten_2023 @rhein-neckar-verkehr_gmbh_aktueller_2023 @delfi_deutschlandweite_2023.
    ==== Population Data
  === Destinations
    - Usage of openly available data, preferably from osm .. extracted with pyrosm @tenkanen_pyrosm_2023
    - specific data if necessary, eg secondary school data not mapped in osm @ministerium_fur_schule_und_bildung_nrw_grunddaten_2016
  === Case Studies
    - Selected based on data availability, personal familiarity.
    ==== secondary schools
      - see @verduzco_torres_public_2024
      - data from @ministerium_fur_schule_und_bildung_nrw_grunddaten_2016
    ==== sports clubs
      - osm data
    ==== hexgrid cells
      - h3 pandas @dahn_h3pandas_2023
#pagebreak()

= Transit Reach
  == Measures of Reach
    === Isochrones as a Measure of Reach
      - ors @heigit_openrouteservice_2023
      - cummulative or individual accesibility measures from @verduzco_torres_public_2024
    === Mean Travel Time
  == Temporal Variability
    - conveyal approach @Conway_uncertainty_2018
      - also used in @verduzco_torres_public_2024 for metrics spanning the UK, but identified gap in temporal variability of transport choices
    - automatic clustering using u-map, pca and k-means
  == Processing
    === Travel Matrices
      - enough for basic reach analyses, isochrone itself not important
      - calculated with r5py @r5py as used in @tenkanen_longitudinal_2020, based on the conveyal engine @conway_evidencetransit @Conway_uncertainty_2018
    === clustering
      - Dimensionality reduction PCA or UMAP @mcinnes_umap_2018 based on the maths from @mcinnes_umap_2020
      - Clustering K-Means or HDBSCAN @mcinnes_hdbscan_2016 based on an algorithm proposed by @campello_density-based_2013
  == Results
#pagebreak()

= Transit Access and Planning
  == Conveyal Percentiles
    - see @verduzco_torres_public_2024
  == Processing
  == Results
#pagebreak()

// optional if there's still time
/*
= Distinguishing Transit Footprints
  == Historical Urban Blueprints
  == Radial and Tangential Services
  == Methods
    === Visual Differences
    === Inequality Measures
      - Lorenz Curves and Gini Coefficients being silly sometimes @graeber_dawn_2022
  == Results
  == Hub and Spoke Transit Planning
#pagebreak()
*/

// optional if there's still time
/*
= Comparisons with Non-Schedule-Based Modes
  == Cycling
    === Methods
    === Results
  == Cars
    === Methods
      - added parking times
    === Results
  == Limitations
    - limitations to car traffic estimations
      - temporal variability
    - limitations to parking times
 #pagebreak()
 */

= Results
  // if there's multiple rounds of results then this becomes a recap
#pagebreak()

= Discussion
  == General Limitations
  - Lack of real world measures as Comparisons
  - Focuses solely on door to door travel times and neglects
    - reliability and delay Data
    - public transit fare structures @conway_off_the_mta
  - lacks data including 
    - comparisons to cars // if chapter on cars gets added this needs removal
    - ride hailing services see @barajas_not_2021
    - related on demand services (trial at rohrbach)
  - _inequality_ being silly at times @graeber_dawn_2022.
  == Methodological short commings
    - UMAP clustering prone to confabulations @generic_user_clustering_2018 @schubert_answer_2017.
  
#pagebreak()

= Final Remarks
  == Conclusion
  == Outlook
#pagebreak()

#bibliography("2023 BA Thesis.bib", title: auto, style: "american-psychological-association")
