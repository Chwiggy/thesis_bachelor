#import "../preamble.typ": *
#set math.equation(numbering: "(1)")

= Planning to Access
  == Motivation
    - see @verduzco_torres_public_2024
  == Processing
    To measure these differences, I performed essentially the same processing as for mean travel times in @processing but taking the difference between the 90th and 10th percentile of r5py @r5py travel times according to @TravelTimeEq as seen in @Percentile_Difference.

    $ P_c = (sum C_d\("90th"\)-C_d\("10th"\))/(N_c-1) $ <Percentile_Difference>
    
    These percentile differences can be understood as a proxy for the amount of flexibility a traveller brings to adjust their departure time to minimise their waiting time at their first public transport stop or to minimise their overall journey time.
    As such a high percentile implies transit usage without much planning and adaptation to the schedule and a low percentile implies transit usage with a high degree of planning, but flexibly adapted to the schedule @verduzco_torres_public_2024.
    The mean difference between these two resulting travel times from each cell to each other cell then represents the expected travel time difference that a public transit user might experience in a specific location when travelling either with a considerable amount of premeditation, or on a whim just hoping for public transit to show up.
    A low difference could either imply a dense schedule with a lot of opportunities to catch a ride, or the complete absence of transit services to catch within the departure time window.

  == Results
    === Spatial
      #figure(image("../figures/Heidelberg_Difference_Map17.svg"), kind: "Map", supplement: "Map", caption: [Map of differences in travel time in Heidelberg for 90th and 10th percentile of travel times in minutes per cell.])

    === Temporal
      #figure(image("../figures/Heidelberg_Difference_MT.svg"), caption: [Differences in travel times between 90th and 10th percentile in Heidelberg from cell to cell with no population mask, over the course of a weekday.]) <funky_differences>
        - As @funky_differences shows the impact of planning over the course of the day is much more variable than than the average travel times based on a median travel time over the course of an hour (compare also @daily_travel_time).

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))