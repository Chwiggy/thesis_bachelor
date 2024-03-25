#import "thesis_temp.typ": *

#show: project.with(
  title: "Simple Open Data Measures of Public Transit Service Availability",
  subtitle: "Planning and Temporal Variability",
  authors: (
    // TODO add matr number and postal address as secrets
    (name: "Emily C. Wilke",matr: "35xxxxxxxx", email: "emilycwilke@gmail.com", affiliation: "Ruprecht-Karls-Universität Heidelberg", postal: "xxxxxxx"),
  ),
  date: [#datetime.today().display()],
  abstract_en: "test oh my oh my",
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
  Public Transit Data beyond planned schedules is often hard to come by, and the often quite complex thoughts and models that go into service planning remain behind the closed doors of local transit agencies in a lot of cases @pieper_kreislauf_2021 @karner_assessing_2018.
  One option of addressing this gap is the use of reach data over larger areas to assess the coverage public transit provides for reaching different points of interest hopefully relevant to daily life of potential users e.g. @verduzco_torres_public_2024.
  These studies are based in schedule data and as in this example several assumptions about public transit usage.
  One of these assumptions is usually a time of day for travel time calculations, usually something like morning rush hour.

  As general traffic volumes change over the course of the day, so do public transit schedules.
  This temporal variability in transit accessibility is so far not generally addressed well in the literature and in available data sets @verduzco_torres_public_2024.
  There is also a smaller kind of temporal variation.
  With schedule based transit the exact departure time can have serious consequences on actual travel times.
  Any hour of the day travel times from a specific location may look very different: Arriving at a stop at 10:34 you might exactly make the bus out of your village, but at 10:35 you might have missed it and would need to wait for the next bus in what might be anything from a few minutes to hours.
  This variation necessitates more or less planning effort on the side of public transport users depending on their departure location, destination, and again the time of day as transit schedules change over the course of the day.
  With these two temporal variations in mind, this thesis will try to establish measures to visualise and illuminate transit accessibility issues and their temporal dimension. 

  == Transit Accesibility Equity and Equality
    But what is even meant by terminology like public transit accessibility or reach?
    To understand the measures proposed in this thesis it is necessary to expand on the terminology around transit accessibility.
    Furthermore, I will give a almost certainly incomplete overview of the landscape of literature and research surrounding this topic.

    === Terminology
      - There are various different, and branching understandings of _access_ and _accessibility_.
      - // TODO add more understandings of transit accessibility
      - Especially accesibility often used in the sense of the disabled community @levinson_towards_2020
      - general measures of access play an important role in empirical studies of transportation systems. There _access_, as opposed to _mobility_, measures the ease of reaching valued destinations @levinson_towards_2020.
      Specifically in North American literature, spurred by rules of the Federal Transport Administration on transit accessibility studies, there seem to be two general modes of thinking about transit access _Access to Transit_ and _Access with Transit_ @carleton_comparative_2018.
      Access to transit means that transit itself becomes the target destination of such an access analysis.
      And while access to transit measures can be as simple as the average proximity to transit stops in an area. These measures however fall short in explaining the mobility decisions in day to day life as they fail to consider desirable destinations @karner_assessing_2018.
      - This paper takes a geographical view into _access_ and uses it interchangeably with _accessibility_.
      - This paper also tries to consider access with transit above access to transit.

      - In the end such analysis aims to show gaps and inequalities in usable access to the transportation system.
      - Looking specifically at transit time as an impedance or cost factor and it's variability over time.
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
    - Planning Indicators? //TODO
  == Methodological Approach
    - explorative data analysis based on openly available and openly licensed data, with open source software tools
    === Data Acquisition
    === origins
      - hexgrids from h3pandas @dahn_h3pandas_2023 based on uber's implementation of them
    ==== Transport Data
      - osm files from geofabrik @geofabrik_gmbh_geofabrik_2018 downloadad with @tenkanen_pyrosm_2023
      - gtfs files from various transit companies @vrs_soll-fahrplandaten_2023 @vvs_soll-fahrplandaten_2023 @rhein-neckar-verkehr_gmbh_aktueller_2023 but ultimately settled on cropping the german weekly transit dataset from DELFI @delfi_deutschlandweite_2023 using gtfs-general.
      - Content descriptions for all of these and their usage
    ==== Population Data
  === Destinations
    - no point of interests due to complexity.
    - h3 pandas @dahn_h3pandas_2023
    - h3 cell to h3 cells with populations excluded or not
  === Case Studies
    - Selected based on data availability, personal familiarity: Heidelberg
#pagebreak()

= Transit Access
  == Measures of Access
    There is plenty of ways to operationalise access with transit then
    //TODO expand
    === Isochrones as a Measure of Reach
      An easy tool to asses a basic measure of access are isochrone maps.
      They are comprised of an area that can be reached within a certain time, where the actual isochrone delimits this area.
      The isochrone is the line that denotes equal (greek: _iso_) time (greek: _chronos_) and would transform into a circle in a coordinate system transformed by travel time.
      This can be generalised to a access measure: Destination opportunities outside this circle are considered reachable and counted, opportunities without are left out.
      This measure then encapsulates "all possible destinations within [a] travel cost threshold" @levinson_towards_2020.
      That then is what @verduzco_torres_public_2024 would call an cummulative accesibility measure.
      A modern tool that provides such isochrone maps is for example ors @heigit_openrouteservice_2023. Using Isochrones as an easy to understand and interpretable measure of access in geoinformation systems has a much longer history however @osullivan_using_2000 @bauer_computing_2008 @levinson_towards_2020.
      //TODO expand

      Besides cummulative there's also individual accessibility measures that are relevant for locations where not the access to a variety of locations is important, but the access to a specific location is of interest. This can be true for services that are common but not generally interchangeable either due to restrictions on their use or scarcity. For these measures the minimum travel cost is of relevance @verduzco_torres_public_2024.
      //TODO expand
    === Mean Travel Time
      Despite these measures not being mathematically complex this research approaches the question from a different point of view and tries to adapt a measure originally adopted in network centrality analysis for the measure of reach.
      - active measure of reach, that is I measure how easy or hard it may be to move from one cell to another, as oppossed how easy it is for a cell to be reached @levinson_towards_2020.
      - travel time as a common cost measure for transit accessibility
  == Temporal Variability
    Transit access then however depends on temporal aspects as well, both because different destinations offer various time constraints as well as the transport network changing over the course of the day @levinson_towards_2020.

  == Processing <processing>
    === Travel Matrices
      - enough for basic reach analyses, isochrone itself not important
      - calculated with r5py @r5py as used in @tenkanen_longitudinal_2020, based on the conveyal engine @conway_evidencetransit @Conway_uncertainty_2018
    === Temporal Variability
      - conveyal approach @Conway_uncertainty_2018
      - also used in @verduzco_torres_public_2024 for metrics spanning the UK, but identified gap in temporal variability of transport choices
      - automatic clustering using u-map, pca and k-means
    === Clustering
      - manually by neighbourhoods
      - manually by time chunks
      Optional bits:
      - Dimensionality reduction PCA or UMAP @mcinnes_umap_2018 based on the maths from @mcinnes_umap_2020
      - UMAP clustering prone to confabulations @generic_user_clustering_2018 @schubert_answer_2017.
      - Clustering K-Means or HDBSCAN @mcinnes_hdbscan_2016 based on an algorithm proposed by @campello_density-based_2013
    === Detailed Views
  == Results
    === Travel Times
      #figure(image("figures/Heidelberg_TravelTime_Map17.png"), caption: [Map of average travel times in minutes in Heidelberg in the hour from 5 to 6 pm from h3 cell to h3 cell.], supplement: "Map", kind: "Map") <map_17_tt>
        - Variations in @map_17_tt
        - Notable similarities
        - Outliers in @map_17_tt

      #figure(image("figures/Heidelberg_TravelTime_BP17.png"), caption: [Boxplots showing average travel times per cell grouped by the borough of the start location.]) <boxplot_17_tt>
        - Grouped by borough, notably boroughs can include unpopulated areas.
          - Explains broad spread of boroughs like Altstadt which include a lot of forested area @boxplot_17_tt
      
    === Temporal Variation
      #figure(image("figures/Heidelberg_TravelTime_MT17.png"), caption: [Plot of average travel times in Heidelberg from cell to cell with no population mask, over the course of a weekday.]) <daily_travel_time>
       - Night time travel in @daily_travel_time shows a consistent travel time spread. Around 4 am in the morning this fans out however, and while a majority of cells have faster connections a small part actually have longer average median travel times.
       - Outlier one cell on the eastern station throat of RH with no connections to any other cells and therefore an average travel time of 0 minutes.
#pagebreak()

= Transit Access and Planning
  == Motivation
    - see @verduzco_torres_public_2024
  == Processing
    - essentially the same processing as for mean travel times @processing but taking the difference between the 90th and 10th percentile of r5py travel times.
  == Results
    #figure(image("figures/Heidelberg_Difference_MT.png"), caption: [Plot of differences in travel times between 90th and 10th percentile in Heidelberg from cell to cell with no population mask, over the course of a weekday.]) <funky_differences>
      - As @funky_differences shows the impact of planning over the course of the day is much more    variable than than the average travel times based on a median travel time over the course of an hour (compare also @daily_travel_time).
#pagebreak()

= Results
  == Travel Times
    

    === Temporal Variation
      #figure(image("figures/Heidelberg_TravelTime_MT17.png"), caption: [Plot of average travel times Heidelberg from h3 cell to h3 cell with no population mask, over the course of a weekday.])
  == planning data
  // TODO needs a better name
      

#pagebreak()

= Discussion
  // TODO figure out what to do with the structure of this
  // Two discussions in the chapter above and recap here?
  == Temporal Variations of Mean Travel Times
    - as expected more central places within the city boundaries also feature lower average travel times throughout the day.

    This accessibility measure only considers other populated cells, and assumes a scenario in which destinations such as friends and other people, that lie generally within populated areas but don't have a specific location in general, are of interest.
    It does not distinguish between the impact of the spatial population distribution and the impact of the specific public transit network however (compare @levinson_towards_2020).
    Travel time here is assumed to be an objective cost measure, @levinson_towards_2020 however suggests that percieved travel time might substantially vary from the objectively needed travel time.
    And even hypothetical travelers with objective time perception have different ideas about the cost a certain travel time entails based on the mode of transit.
    That is they may have preferences on where and how they like to spend their travel time.
    This may go so far as taking objectively worse routes to reach their destinations to avoid wait times at interchanges. //source?
  == Differences to Planning
  == temporal variation in planning data
    - so what/what does this indicator describe that we don't get from the pure schedule already?
  == General Limitations
    - Lack of real world measures as Comparisons
    - special point of interests like school data
    - Focuses solely on door to door travel times and neglects other aspects of such journeys.

    There's no reliability and delay data included in this analysis as such data in a disaggregated form is rarely openly available and often requires setting up data scraping @kriesel_bahnmining_2019.
    We also excluded public transit fare structures as implemented in @conway_off_the_mta. While these are a common cost factor used next to travel time @levinson_towards_2020, they are complicated to implement for a simple analysis like this.

    - lacks data including
      - comparisons to cars
      - ride hailing services see @barajas_not_2021
      - related on demand services (trial at rohrbach and schlierbach)
    - _inequality_ being silly at times @graeber_dawn_2022.
    
#pagebreak()

= Final Remarks
  == Conclusion
    - Well this turned out to be a bit boring ...
  == Outlook
    - implementing a analysis accounting for delay and cancellation data would help to get a better picture of lived realities
    - implementing an analysis for scenarios based on more specific scenarios of day to day life
    - planning data can be helpful for planning new services, including needed night services, or stops
    - introducing points of interest to the analysis for clearer scenarios
#pagebreak()

#bibliography("2023 BA Thesis.bib", title: auto, style: "institute-of-electrical-and-electronics-engineers")
