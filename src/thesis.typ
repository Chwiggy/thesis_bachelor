#import "thesis_temp.typ": *

#show: project.with(
  title: "Simple Open Data Measures of Public Transit Service Availability",
  subtitle: "Usecases for Closeness Centrality and Isochrones",
  authors: (
    // TODO add matr number and postal address as secrets
    (name: "Emily C. Wilke",matr: "35xxxxxxxx", email: "emilycwilke@gmail.com", affiliation: "Ruprecht-Karls-Universität Heidelberg", postal: "xxxxxxx"),
  ),
  date: [#datetime.today().display()],
)

// TODO maybe import chapters from separate documents

= Introduction
In recent years, but for decades by now, the demand for a paradigm shift in transportation infrastructure and service has become louder and louder.
While calls for a shift away from car centric mobility are nothing new and were a well established part of German Academic discourse in the 1990s already @frank_hat_1993, it has become part of a widespread political discourse around the so called _Verkehrswende_ @holzapfel_urbanismus_2020.
With increased awareness and concrete experiences of climate change this discourse has reached states of heated debate.
Benefits of 


== Transit Equity and Equality
=== Motivation
- Traditional transport planning centering on men?
  - German Transport Planning post world war 2?
- Transit planning and identifying demand in public transit networks is a complicated process, that takes into account a plethora of data that's hard to access or acquire @pieper_kreislauf_2021.
=== Research Question
- How can an easy closenes centrality measure help asses transit service availability and equality
  
== Related Work
== Methodological Approach
== Geographic Case Studies
#pagebreak()

= Closeness or Reachability
== Closeness Centrality
== Isochrones as a Measure of Reach
== Comparison Use Cases
== Methods
== Results
#pagebreak()

= Comparisons with Non-Schedule-Based Modes
== Cycling
=== Methods
=== Results
== Cars
=== Methods
- added parking times
=== Results
== Temporal Discrepancies with Scheduled Transit
== Limitations
- limitations to car traffic estimations
- limitations to parking times

#pagebreak()

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
= Recap of Results
#pagebreak()
= Discussion
== General Limitations
- Lack of real world measures as Comparisons
- Lack of reliability Data
- Lack of delay data
- _inequality_ being silly at times @graeber_dawn_2022.

#pagebreak()
#bibliography("2023 BA Thesis.bib", title: auto, style:"ieee")