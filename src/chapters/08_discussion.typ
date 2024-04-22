#import "../preamble.typ": *

= Discussion
  == Mean Travel Times
  // TODO figure out what to do with the structure of this
  // Two discussions in the chapter above and recap here?
  // should answer the hypotheses from methodology here
  == Temporal Variations of Mean Travel Times
    - as expected more central places within the city boundaries also feature lower average travel times throughout the day.

    This accessibility measure only considers other populated cells, and assumes a scenario in which destinations such as friends and other people, that lie generally within populated areas but don't have a specific location in general, are of interest.
    It does not distinguish between the impact of the spatial population distribution and the impact of the specific public transit network however (compare @levinson_towards_2020).
    Travel time here is assumed to be an objective cost measure, @levinson_towards_2020 however suggests that percieved travel time might substantially vary from the objectively needed travel time.
    And even hypothetical travelers with objective time perception have different ideas about the cost a certain travel time entails based on the mode of transit.
    That is they may have preferences on where and how they like to spend their travel time.
    This may go so far as taking objectively worse routes to reach their destinations to avoid wait times at interchanges. //source?

  == Planning Indicator
    - Handschuhsheim breaks expectations
    - central in transit network despite not located in the centre of town. Various tram lines connecting to a lot of area, means high frequency of transit opportunities (around 30 an hour)
  == Temporal Variation in Planning Indicator
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
      - related on demand services (trial at rohrbach and schlierbach) @nahverkehrsgesellschaft_baden-wurttemberg_mbh_-demand-verkehr_2024 @rhein-neckar-verkehr_gmbh_fips_2024
      - Lack of consideration for service quality: What about services in the gtfs file that need advanced booking of up to an hour, like transport association scheduled on-call taxi services @vrn_vrn_2017.
    - using travel time cubes for more detailed transit accessibility analysis offers a lot more detailed view of transit behaviours @kaplan_using_2014
    - @kaplan_using_2014 tries to quantify transit inequalities with gini coefficients 
      - _inequality_ being silly at times @graeber_dawn_2022.

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))