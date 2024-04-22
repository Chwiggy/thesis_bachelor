#import "../preamble.typ": *

= Methodological Approach
  - explorative data analysis based on openly available and openly licensed data, with open source software tools
  == Data Acquisition
  == Origins
    - hexgrids from h3pandas @dahn_h3pandas_2023 based on uber's implementation of them
  === Transport Data
    - osm files from geofabrik @geofabrik_gmbh_geofabrik_2018 downloadad with @tenkanen_pyrosm_2023
    - gtfs files from various transit companies @vrs_soll-fahrplandaten_2023 @vvs_soll-fahrplandaten_2023 @rhein-neckar-verkehr_gmbh_aktueller_2023 but ultimately settled on cropping the german weekly transit dataset from DELFI @delfi_deutschlandweite_2023 using gtfs-general.
    - Content descriptions for all of these and their usage
== Destinations
  - no point of interests due to complexity.
  - h3 pandas @dahn_h3pandas_2023
  - h3 cell to h3 cells with populations excluded or not
== Case Studies
  - Selected based on data availability, personal familiarity: Heidelberg
== Hypotheses
  - To be falsified:
    - Mean Travel Times cannot capture transit service patterns at a given point in time
    - Outlying areas have generally worse accessibility across all times of the day than geographically central locations. For Heidelberg this would mean that Hauptbahnhof and Bismarckplatz alway have a lower mean travel time than areas farther out.
    - The Planning indicator aligns with accissibility indicator, as in the most central parts of the city will also have the least need to plan journeys
    - The Planning indicator will preserve it's characteristics across the course of a day

  <end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))