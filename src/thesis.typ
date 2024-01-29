#import "thesis_temp.typ": *

#show: project.with(
  title: "Simple Open Data Measures of Public Transit Service Availability",
  subtitle: "Temporal Variability",
  authors: (
    // TODO add matr number and postal address as secrets
    (name: "Emily C. Wilke",matr: "35xxxxxxxx", email: "emilycwilke@gmail.com", affiliation: "Ruprecht-Karls-Universität Heidelberg", postal: "xxxxxxx"),
  ),
  date: [#datetime.today().display()],
)

// TODO insert page for affidavit
// TODO maybe import chapters from separate documents
= Abstracts
== Abstract En
== Abstract De
#pagebreak()

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
==== Destinations
  - Usage of openly available data, preferably from osm .. extracted with pyrosm @tenkanen_pyrosm_2023
  - specific data if necessary, eg secondary school data not mapped in osm @ministerium_fur_schule_und_bildung_nrw_grunddaten_2016
=== Data Processing
  - Isochrones
    - available from openrouteservice @heigit_openrouteservice_2023, as used in @prayogi_openrouteservice_2022, not used because:
  - travel time matrices
    - enough for basic reach analyses, isochrone itself not important
    - calculated with r5py @r5py as used in @tenkanen_longitudinal_2020, based on the conveyal engine @conway_evidencetransit @Conway_uncertainty_2018
== Geographic Case Studies
  - Selected based on data availability, personal familiarity.
#pagebreak()

= Closeness or Reachability
== Closeness Centrality
== Reach
=== Isochrones as a Measure of Reach
  - ors @heigit_openrouteservice_2023
  - cummulative or individual accesibility measures from @verduzco_torres_public_2024
== Temporal Variability
- conveyal approach @Conway_uncertainty_2018
  - also used in @verduzco_torres_public_2024 for metrics spanning the UK, but identified gap in temporal variability of transport choices
== Comparison Cases
=== secondary schools
- see @verduzco_torres_public_2024
- data from @ministerium_fur_schule_und_bildung_nrw_grunddaten_2016
=== sports clubs
- osm data
=== hexgrid cells
- h3 pandas @dahn_h3pandas_2023
== Methods
=== Available Data
- school data from @ministerium_fur_schule_und_bildung_nrw_grunddaten_2016
- sports data from osm
=== Processing

// only if more chapters follow
/*
== Results
#pagebreak()
*/


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
    - reliability Data
    - delay data both for cars and public transit
    - public transit fare structures @conway_off_the_mta
  - _inequality_ being silly at times @graeber_dawn_2022.
#pagebreak()

= Conclusion
#pagebreak()
#bibliography("2023 BA Thesis.bib", title: auto, style:"ieee")