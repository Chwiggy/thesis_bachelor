#import "../preamble.typ": *
#set math.equation(numbering: "(1)")

= Planning to Access
  Beyond raw travel times, I also looked at different percentiles of `r5py` travel time calculations. These percentile differences can be understood as a proxy for the amount of flexibility a traveller brings to adjust their departure time to minimise their waiting time at their first public transport stop or to minimise their overall journey time.
  As such a high percentile implies transit usage without much planning and adaptation to the schedule and a low percentile implies transit usage with a high degree of planning, but flexibly adapted to the schedule @verduzco_torres_public_2024.
  The mean difference between these two resulting travel times from each cell to each other cell then represents the expected travel time difference that a public transit user might experience in a specific location when travelling either with a considerable amount of premeditation, or on a whim just hoping for public transit to show up.

  == Post-Processing
    To measure these differences, I performed essentially the same processing as for mean travel times in /*TODO reference processing*/ but taking the difference between the 90th and 10th percentile of r5py @r5py travel times according to /*TODO reference TravelTimeEq */ as seen in @Percentile_Difference.

    $ P_c = (sum C_d\("90th"\)-C_d\("10th"\))/(N_c-1) $ <Percentile_Difference>
    
    Here the planning indicator $P_c$ describes the average of differences for travel times from cell to cell $C_d$ at the respective percentile. These average differences between travel times were again calculated for a departure time window of an hour for each hour of the selected day to provide insights about temporal variation in this indicator. In human terms this indicator could be described as the difference in travel times in minutes depending on if the imagined traveller picked a close to optimal time (10th percentile of travel times), or got unlucky (90th percentile of travel times). 

  == Results
    Below I will talk about the resulting travel time matrices in two sections. The first concerns the raw insights from travel time calculations. primarily centered around discussions of the travel time matrix at 17:00 local time. The second section then summarises insights gained from the differences in travel time matrices over the course of the day.
    === Planning Difference.
      Consulting the map of travel time differences at 17:00 local time (compare @difference_map), there is a much less clear picture emerging, than with the raw travel times in /*reference travel time map or chapter*/. While there seem to be a few areas where travel times are relatively high with travel times up to 25 minutes they seem to be primarily unpopulated areas, like fields south of Patrick-Henry-Village, the forests south east of the historic city centre Altstadt, and slivers north of Ziegelhausen. If you then expect the low travel time difference areas to lie well within population centres, you would be mistaken however. The minimum of travel time difference with around 6 minutes lies within a forested area again: this time in the forest, right around the midpoint between Handschuhsheim and Ziegelhausen.

      #figure(image("../figures/Difference_Map17.svg"), kind: "Map", supplement: "Map", caption: [Map of differences in travel time in Heidelberg for 90th and 10th percentile of travel times in minutes per cell. Difference in minutes.]) <difference_map>

      In general the populated areas in @difference_map seem to display with a few exceptions a hugely homogenous travel time difference of around 10 to 15 minutes. This homogeneity is remains intact looking at neighbourhood averages including unpopulated cells (compare @boxplot_difference). Here neighbourhood averages for travel time differences all range between 10 and 15 minutes. With the exclusion of Handschuhsheim, the window gets even more narrow and average travel times all lie between 12.5 and 15 minutes. Again however as in /*TODO reference previous chapter or boxplot */, neighbourhoods with a lot of unpopulated area like Altstad or Handschuhsheim exhibit a much larger spread of travel time differences than central districts without much unpopulated area, like Bahnstadt. Without populated cell the picture remains largely the same, however differences between the different neighbourhoods shrink further, and the spread of travel time differences within neighbourhoods diminishes as well.

      #figure(image("../figures/Boxplots_Difference.svg"), caption: [Boxplot of travel times grouped by neighbourhoods.]) <boxplot_difference>

    === Temporal
      Moving on to temporal variation across the day @funky_differences, one can again notice a rough three phase structure to the data. For the travel time differences however, this structure is much noisier. The three parts roughly match the parts already observed with trave times in /*reference previous chapter*/:
      + from midnight until 03:00 local time, travel time differences seeem generally low under 10 minutes, reaching their lowest at 3:00.
      + Around 04:00 travel time differences increase sharply. Their spread increases to between 5 and 30 minutes during the day until 17:00 local time.
      + After a short dip in travel time differences at 17:00 the spread of travel time differences increases even more strongly until midnight. At 19:00 local time peak travel time differences hit 40 minutes, while low travel time differences drop below 5 minutes.  

      #figure(image("../figures/Heidelberg_Difference_MT.svg"), caption: [Differences in travel times between 90th and 10th percentile in Heidelberg from cell to cell with no population mask, over the course of a weekday.]) <funky_differences>

      #figure(image("../figures/Clean_pd_summary_stats_all.svg"), caption: [Average Travel Time Difference for every populated cell in Heidelberg, with standard deviation]) <averege_differences>

      Reducing the plot to the average cell with a population density above 5 people per square kilometre (compare @averege_differences), yields a much cleaner picture. Only a few populated cells exhibit a volatile change in travel time difference now. For most populated cells travel time differences decrease to near 0 during the night, to rise to general levels around 15 minutes during the rest of the day. Only at the edge times in the very early morning and the post rush-hour evening average travel time differences seem to be slightly elevated above 15 minutes.

      
      #figure(image("../figures/clean_select_HD_DI_boroughs.svg"), caption: [Travel time differences averaged for populated cells by select districts]) <borough_differences>
      Looking at a plot by borough (compare @borough_differences), this pattern generally holds. Notably, central districts like Altstadt and Weststadt experience less of a early morning and evening bump in travel time differences than less central districts like Handschuhsheim or Emmertsgrund.      


<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))