#import "../preamble.typ": *
#set math.equation(numbering: "(1)")
= Transit Access
  == Measures of Access
    as we have seen, there are plenty of ways to operationalise access with transit then
    //TODO expand
    === Isochrones as a Measure of Reach
      
      As mentioned above, isochrones are a common tool to characterise the access opportunities from a specific point. As a spatial characteristic, this can be generalised to a access measure: Destination opportunities outside this circle are considered reachable and counted, opportunities without are left out.
      This measure then encapsulates "all possible destinations within [a] travel cost threshold" @levinson_towards_2020.
    That then is what @verduzco_torres_public_2024 would call an cummulative accesibility measure.
      - ideas from @zeng_visualizing_2014

      Besides cummulative there's also individual accessibility measures that are relevant for locations where not the access to a variety of locations is important, but the access to a specific location is of interest. This can be true for services that are common but not generally interchangeable either due to restrictions on their use or scarcity. For these measures the minimum travel cost is of relevance @verduzco_torres_public_2024.
      //TODO expand
    === Mean Travel Time
      Despite these measures not being mathematically complex this research approaches the question from a different point of view and tries to adapt a measure originally adopted in network centrality analysis for the measure of reach.
      - active measure of reach, that is I measure how easy or hard it may be to move from one cell to another, as oppossed how easy it is for a cell to be reached @levinson_towards_2020.
      - travel time as a common cost measure for transit accessibility
      - approximating closeness centrality as formulated by @stamos_transportation_2023
  == Temporal Variability
    Transit access then however depends on temporal aspects as well, both because different destinations offer various time constraints as well as the transport network changing over the course of the day @levinson_towards_2020.

  == Processing <processing>
    === Travel Matrices
      - enough for basic reach analyses, isochrone itself not important
      - calculated with r5py @r5py as used in @tenkanen_longitudinal_2020, based on the conveyal engine @conway_evidencetransit @Conway_uncertainty_2018
      - @TravelTimeEq Average Travel Times $T_c$ for each cell with $C_d$ as Travel Time Cost from cell to another destination cell divided by the Number of Cells $N_c-1$ for the cell itself
      $ T_c = (sum C_d)/(N_c-1) $ <TravelTimeEq>
      - Here $C_d$ describes the median travel time for a cell to cell connection at every point in time within the set 1 hour time interval given to `r5py`.
    === Temporal Variability
      - conveyal approach @Conway_uncertainty_2018.
        - That is @r5py by default returns the median travel time over the supplied departure window for the travel time matrix calculation, but it can also supply other percentile travel times within this departure time window.
        - Median travel time as with average travel time over the course of the departure time window of an hour can provide a more realistic measure than a single departure point in time @levinson_towards_2020 @owen_modeling_2015
      - also used in @verduzco_torres_public_2024 for metrics spanning the UK, but identified gap in temporal variability of transport choices
    === Detailed Routing
      To illustrate and illucidate some of the results of the above processing, I also provided some handpicked routing examples based on the same gtfs feed @delfi_deutschlandweite_2023.
      These detailed routings take h3 cells @dahn_h3pandas_2023 that i deemed interesting as a departure location and look at times and specific routes to arbitrary central locations within Heidelberg.
      Routing again was provided by r5py @r5py.
  == Results
    === Travel Times
      #figure(image("../figures/Heidelberg_TravelTime_Map17.svg"), caption: [Map of average travel times in minutes in Heidelberg in the hour from 5 to 6 pm from h3 cell to h3 cell.], supplement: "Map", kind: "Map", placement: auto) <map_17_tt>
        - Variations in @map_17_tt
        - Notable similarities
        - Outliers in @map_17_tt

      #figure(image("../figures/Heidelberg_TravelTime_BP17.svg"), caption: [Boxplots showing average travel times per cell grouped by the borough of the start location.]) <boxplot_17_tt>
        - Grouped by borough, notably boroughs can include unpopulated areas.
          - Explains broad spread of boroughs like Altstadt which include a lot of forested area @boxplot_17_tt
      
    === Temporal Variation
      #figure(image("../figures/Heidelberg_TravelTime_MT17.svg"), caption: [Plot of average travel times in Heidelberg from cell to cell with no population mask, over the course of a weekday.]) <daily_travel_time>
       - Night time travel in @daily_travel_time shows a consistent travel time spread. Around 4 am in the morning this fans out however, and while a majority of cells have faster connections a small part actually have longer average median travel times.
       - Outlier one cell on the eastern station throat of RH with no connections to any other cells and therefore an average travel time of 0 minutes, excluded from @daily_travel_time.
    
    === Detailed Routing

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))