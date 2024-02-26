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
  Taunted benefits of a modal shift away from individual motorised transit towards public transit include a more efficient transport system both in terms of traffic throughput as well as in terms of energy usage, decreased local pollution @teufel_autoverkehr_1993, and a lessened dependency on cars favouring more healthy modes of transit and more livable environments for humans @rissel_physical_2012 @stevenson_health_2016 @holzapfel_urbanismus_2020.

  However appealing these pleas for an improved mobility regime may be, there is a distinct lack of easily accessible tools to measure how well a public transit system is serving its users, and the people who for some reason or another have decided that they will not use it.
  Public Transit Data beyond planned schedules is often hard to come by, and the often quite complex thoughts that go into service planning remain behind the closed doors of local transit agencies in a lot of cases @pieper_kreislauf_2021.
  One option of addressing this gap is the use of reach data over larger areas to assess the coverage public transit provides for reaching different points of interest hopefully relevant to daily life of potential users e.g. @verduzco_torres_public_2024. These studies are based in schedule data and as in this example several assumptions about public transit usage. One of these assumptions is usually a time of day for travel time calculations, usually something like morning rush hour.

  As general traffic volumes change over the course of the day the, so do public transit schedules. This temporal variability in transit accessibility is so far not generally addressed well in the literature and in available data sets @verduzco_torres_public_2024. So I shall make an attempt at addressing this gap.

  == Transit Accesibility Equity and Equality
    To address this gap as identified above it is paramount to first define, what is even meant by terminology like public transit accessibility or reach.
    Then it is necessary to expand on the short motivation I have given above to open up the questions i seek to answer in this thesis.
    Furthermore, I will give a almost certainly incomplete overview of the landscape of literature and research surrounding this topic. 
    
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
    - specific, eg secondary school data not mapped in osm @ministerium_fur_schule_und_bildung_nrw_grunddaten_2016, was deemed out of scope for this analysis
  === Case Studies
    - Selected based on data availability, personal familiarity: Heidelberg
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

= Results
  - temporal variation
  - planning data
  - temporal variation in planning data
#pagebreak()

= Discussion
  - temporal variations and clustering
  - planning data
  - temporal variation in planning data
  == General Limitations
    - Lack of real world measures as Comparisons
    - special point of interests like school data
    - Focuses solely on door to door travel times and neglects
      - reliability and delay Data
      - public transit fare structures @conway_off_the_mta
    - lacks data including 
      - comparisons to cars
      - ride hailing services see @barajas_not_2021
      - related on demand services (trial at rohrbach and schlierbach)
    - _inequality_ being silly at times @graeber_dawn_2022.
  == Methodological short commings
    - UMAP clustering prone to confabulations @generic_user_clustering_2018 @schubert_answer_2017.
  
#pagebreak()

= Final Remarks
  == Conclusion
    - Well this turned out to be a bit boring ...
  == Outlook
    - implementing a analysis accounting for delay and cancellation data would help to get a better picture of lived realities
    - implementing an analysis for scenarios based on more specific scenarios of day to day life
    - planning data can be helpful for planning new services, including needed night services, or stops
#pagebreak()

#bibliography("2023 BA Thesis.bib", title: auto, style: "american-psychological-association")
