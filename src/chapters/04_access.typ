#import "../preamble.typ": *
#set math.equation(numbering: "(1)")
= Transit Access
  As seen in @related, there are plenty of ways to operationalise transit accessibility, as a local measure.
  For this thesis, I focused on local connectivity without a large focus on specific itinerary scenarios. As detailed in @data, data acquisition focused on travel time matrices to ascertain a measure of reach. As as i set up these these travel time matrices, they are an active measure of reach, that is they measure how easy or hard it may be to move from one cell to another, as oppossed how easy it is for a cell to be reached @levinson_towards_2020.
  This can obviously easily be reversed to measure passive reach.
  
  Travel time here is used as a common cost measure for transit accessibility.
  As discussed earlier @related this is of course not the only realistic measure of impedance.
  As Heidelbergs transit has generally integrated ticketing and a reasonably high degree of people with public transit subscriptions, it seems reasonable to ignore some cost measures like fare rules.
  With this approach to reach, I'm basically approximating the inverse of closeness centrality as formulated by @stamos_transportation_2023.
  
  Transit access, however, depends on temporal aspects as well, both because different destinations offer various time constraints as well as the transport network changing over the course of the day @levinson_towards_2020. As mentioned in @related, this represents a gap in current travel time datasets, and transit accessibility analyses @verduzco_torres_public_2024. By calculating travel time matrices for every hour of the day for this thesis, I try to fill this gap. 

  == Post-Processing <processing>
    After travel time matrices were calculated with `r5py` @r5py as used in @tenkanen_longitudinal_2020, based on the conveyal engine @Conway_uncertainty_2018, average Travel Times $T_c$ were calculated as in @TravelTimeEq for each cell with $C_d$ as Travel Time Cost from cell to another destination cell divided by the Number of Cells $N_c-1$ for the cell itself.
      $ T_c = (sum C_d)/(N_c-1) $ <TravelTimeEq>
    Here $C_d$ describes the median travel time for a cell to cell connection at every point in time within the set 1 hour time interval given to `r5py`. These average travel times were calculated for 24 hours in a representative day for each cell. Capturing median travel times for each hour of that day from cell to cell, based on the Conveyal approach to travel time uncertainties @Conway_uncertainty_2018. This also represents `r5py`'s default behaviour, as `r5py` @r5py by default returns the median travel time over the supplied departure time window for the travel time matrix calculation. It can also supply other percentile travel times within this departure time window. I will make use of this fact in @planning. Using this median travel time for the average cell to cell travel times over the course of the departure time window of an hour can provide a more realistic measure than a single departure point in time, that would be inherently dependent on the whims of the schedule @levinson_towards_2020 @owen_modeling_2015.
    
    This measure has also been used in travel time datasets for metrics spanning the UK @verduzco_torres_public_2024 or Helsinki @tenkanen_longitudinal_2020. There is however a gap in temporal variability of transport choices across the course of a day @verduzco_torres_public_2024. One could obviously extend the whole departure time window to an entire day and compare various percentile outcomes. However, that approach limits insights into specific service patterns accross a day and their influence on connectivity. Therefore, it makes more sense to compute travel time matrices for multiple routing queries over the course of a day and to compare their results with each other.

  == Results
    Below I will talk about the resulting travel time matrices in two sections. The first concerns the raw insights from travel time calculations. primarily centered around discussions of the travel time matrix at 17:00 local time. The second section then summarises insights gained from the differences in travel time matrices over the course of the day.

    === Travel Times
      Looking of a map of the travel time matrix at 17:00 local time (see @map_17_tt), there is a clear pattern visible. The brightest spots with the lowest average cell to cell travel times centre around central locations within Heidelberg, specifically around the central station and the central interchange hubs Stadtbücherei / Römerkreis Süd and Bismarckplatz. Here average travel times to all cells are as low as 48 minutes. 
      
      Notably at the central station there is a cell which lands in the middle of the western station throat, from which no other cells than the cell itself are reachable, and therefore technically has an average travel time of 0 minutes. This cell was discounted for analysis.

      #figure(image("../figures/Heidelberg_TravelTime_Map17.svg"), caption: [Map of average travel times in minutes in Heidelberg in the hour from 5 to 6 pm from h3 cell to h3 cell.], supplement: "Map", kind: "Map") <map_17_tt>
      
      The highest average travel times can be found on the outskirts of the administrative boundaries of Heidelberg in areas without much population or built up area. This includes the area around Grenzhof, an outlying farm complex, a landfill south of Patrick-Henry-Village, and forests to the West of Ziegelhausen and north east of Handschuhsheim. Here average travel times reach values of up to 95 minutes. Many of them include significant walks in their itineraries.
      
      Notably, the lowest travel times extend specifically along the tram lines of Heidelberg. The lowest median travel times can be found specifically along those tracks that carry more than one tram line. Those are the tracks between Hauptbahnhof / Betriebshof and Seegarten / Bismarkplatz, as well as the tracks extending north to Handshuhsheim from there. Another low travel time corridor extends then south from Römerkreis towards Rohrbach. Corridors like the line from Betriebshof to the university campus Im Neuenheimer Feld, show up as a low travel time corridor at peak times, but diminish in prominence off peak.

      As a whole the 1301 cells across Heidelberg, are hard to grasp. So I attempted to group them by neighbourhoods (compare @boxplot_17_tt). Unfortunately this results in a clear separation between boroughs that contain large unpopulated areas and those that do not. Bahnstadt, Bergheim, Pfaffengrund, Neuenheim, Rohrbach, Südstadt, and Weststadt all contain comparatively little unpopulated area. The range of travel times in these boroughs is all comparatively small and their median cells have travel times below 70 minutes. 

      #figure(image("../figures/Heidelberg_TravelTime_BP17.svg"), caption: [Boxplots showing average travel times per cell grouped by the borough of the start location.]) <boxplot_17_tt>
      
      On the flip side, boroughs with large unpopulated areas like Altstadt, Handschuhsheim, Schlierbach, Wieblingen, Ziegelhausen show a large spread of travel times and exhibit median travel times up to 80 minutes. Their population density too then drops far below the values for the lower travel time boroughs. For this reason it seemed reasonable to exclude cells with a low population density below 5 people per square kilometre from the analysis (compare @clean_boxplot).
      
      #figure(image("../figures/Heidelberg_TravelTime_BP_cleaned.svg"), caption: [Boxplot showing average travel times per cell grouped by borough, ignoring cells with population densities lower than 5 / $"km"^2$.]) <clean_boxplot>

      Excluding low population cells like this reduces the amount of cells in consideration to about a third. This of course means the statistics for each borough might get more susceptible to outlier cells like Grenzhof in Wieblingen. Notable however is that now Altstadt joins the ranks of well connected neighbourhoods. Whereas, it becomes more clear that Boxberg, and Emmertsgrund are actually less well connected even after exclusion of the large forrested area to the east of their population centres (compare @borough_map).

      #figure(image("../figures/Boroughs_TravelTime_Map17.svg"), caption: [Chloropleth map of Heidelberg boroughs showing average travel times in minutes], kind: "Map", supplement: "Map") <borough_map>

    === Temporal Variability
      As I calculated travel times for all 24 hour slots of the day, we can look at the changes to these travel time patterns over the course of the day. Looking at a plot of all cells' average travel times then, it is hard to make out individual cells among the 1301 different locations (compare @daily_travel_time). There are however three distinct sections to the graph:
      + there appears to be a night section from midnight up until about 03:00 local time. The spread of travel times seems fairly low within this time span, but travel times are fairly high between 70 and 90 minutes.
      + between 04:00 and about 17:00 local time, the span of average travel times increases quite severely, now ranging from under 50 minutes to curiously about 100 minutes. Several locations seem to exhibit volatile changes within that span, while others remain steady.
      + after 17:00 local time, the spread of average travel times reduces again until midnight. Notably, well connected locations seem to gain travel times first.
            
      #box(grid(columns: 1,
        [#figure(image("../figures/Heidelberg_TravelTime_MT17.svg"), caption: [Plot of average travel times in Heidelberg from cell to cell, over the course of a weekday.], placement:auto) <daily_travel_time>],
        [#figure(image("../figures/clean_tt_summary_stats_all.svg"), caption: [Summary plot for all of Heidelberg.])<summary_plot>]
      ))
      
      
      A similar picture emerges when plotting, summary statistics for the cells above the population threshhold. @summary_plot shows the average travel time and a one standard deviation interval. Again, there seem to be multiple phases of travel time regimes:
      + Until 03:00 local time night time travel times are relatively high with a low spread ov travel times in different cells.
      + Again at around 04:00 local time the spread of travel times increases and travel times generally decrease over the course of the day. Curiously enough however at 04:00 local time, travel times are at their highest. Potentially indicating a gap between reduced night time services, and morning services kicking in. Notably, without the unpopulated cells, the spread of travel times is reduced and only a few cells exhibit longer travel times than during the night.
      + After 17:00 travel times increase again. Notably, for some unpopulated cells they decrease again between 23:00 and midnight.

      #figure(image("../figures/select_HD_TT_boroughs.svg"), caption: [Plot of average travel times in select neighbourhoods of Heidelberg across the day without low population cells.]) <borough_time>

      Grouping populated cells by borough reveals a similar general pattern. With 15 boroughs the plot still remains a bit hard to parse. Selecting a few representative boroughs for @borough_time, lets us make. Notably there seem to be two groups, low travel time boroughs like Altstadt or Weststadt. And boroughs which ove the course of the day do not lose as much travel time, like Wieblingen or Ziegelhausen. Curiously enough, the more central boroughs do not experience the 04:00 local time uptick in travel times, the less central boroughs experience. Another curiosity is the uptick in travel time in a few places like Emmertsgrund right around noon.


<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))