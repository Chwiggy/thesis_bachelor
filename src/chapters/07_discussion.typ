#import "../preamble.typ": *

= Discussion
  Well, what does that mean for these two potential indicators of travel time? In the following section I discuss these indicators and see how they fit in with results from other studies. First again, this will concern the mean travel time indicator, and second the travel time difference indicator.
  == Mean Travel Times
    As expected this indicator seems a useful proxy for the connectivity of specific locations. As an indicator of general connectivity however it lacks the specificity of an measure of transit access with a strong model of itineraries that correspond to lived realities @levinson_towards_2020. It can, however, serve as a general indicator for locations like boroughs. As such the results fit in with other more generalised travel time datasets @tenkanen_longitudinal_2020.

    The temporal variablity is interesting in so far as it sheds light on some often missed effects of travel at uncommon times. Research often focuses on peak hour travel, that is either the morning rush hour or the evening rush hour. And while an overproportional amount of travel happens within the morning rush hour @verduzco_torres_public_2024, there are always populations and scenarios that require travel add more odd hours. This can include work at hours that aren't the common nine to five office job, like shift work in manufacturing, health care, emergency services, or public transit jobs themselves, but this can also inclued free time activities, like evening events, visiting friends, parties etc. 

    In a mid size city like Heidelberg then, it seems specifically activities past midnight, that make it hard to travel back with public transit. Average travel times for these kind of journeys lie on average around 77 minutes. At these times public transport seems to be largely absent, with the exclusion of some limited local train services in irregular patterns from different stations. But between 03:00 and 05:00 even these services largely seem to stop existing, and only after 04:00 the first morning services start up again. While rnv offers reduced nighttime services, on normal weekdays these already cease at 01:00. Only on weekend days or on public holidays these services run untli the early morning @rnv_gmbh_nachtnetz_2024.
    
    To gain more insight into these lived realities, it could have been useful to exclude cells without population or to find a better model for different kinds of destinations. Due to added complexity, this step was only taken after the routing and cell averages had already been computed. Thus unpopulated cells still counted as destinations even when this study only looked at populated cells for statistical analysis. Here again a more specific set of model itineraries could have been helpful. Such an accessibility measure could, for example, only consider other populated cells, and assume a scenario in which destinations such as friends and other people, that lie generally within populated areas but don't have a specific location in general, are of interest.
    The current measure as is, however, does not distinguish between the impact of the spatial population distribution and the impact of the specific public transit network however (compare @levinson_towards_2020).

    For this indicator I assumed travel time to be an objective cost measure, as suggested in some studies @levinson_towards_2020 however, percieved travel time might substantially vary from the objectively measured travel time. As human time perception varies considerably with the percieved pleasantness of the time spent.
    And even hypothetical travelers with objective time perception might have different ideas about the cost a certain travel time entails based on the mode of transit.
    That is they may have preferences on where and how they like to spend their travel time.
    This may go so far as taking objectively worse routes to reach their destinations to avoid wait times at interchanges.

    Beyond the difficulty of measuring percieved time, it also stands to reason, that travel time is not the only cost factor that public transit users and non-users take into account. Fare costs come up as an obvious cost factor quite often @conway_off_the_mta. To commuters with transit subscriptions in place like Heidelberg with integrated ticketing these differences might not play a huge role, but for an occasional or only potential user deciding between using a private car and public transit fare rules can make a considerable differennce. And as such, the effort of figuring out a fare system can become a cost factor in its own right. 

  == Planning Indicator
    - Handschuhsheim breaks expectations
    - central in transit network despite not located in the centre of town. Various tram lines connecting to a lot of area, means high frequency of transit opportunities (around 30 an hour)
    - for a lot of unpopulated cells low travel time differences can either mean a lot of walking is involved in any itinerary, as for example at night, or that there is multiple possible entry points into the public transit system in roughly equal walking distance. Unfortunately this skews the idea of a simple planning indicator as the decision in which direction to walk preclude the usage of the other entrypoint.
    - In populated areas the planning indicator largely aligns with common tram and bus schedule headways.
  == Temporal Variation in Planning Indicator
    - so what/what does this indicator describe that we don't get from the pure schedule already?
  == General Limitations
    - Lack of real world measures as Comparisons
    - special point of interests like school data
    - Focuses solely on door to door travel times and neglects other aspects of such journeys.
   

    There's no reliability and delay data included in this analysis as such data in a disaggregated form is rarely openly available and often requires setting up data scraping @kriesel_bahnmining_2019.
    We also excluded public transit fare structures as implemented in @conway_off_the_mta. While these are a common cost factor used next to travel time @levinson_towards_2020, they are complicated to implement for a simple analysis like this.

  == Outlook  
    - lacks data including
      - comparisons to cars
      - ride hailing services see @barajas_not_2021
      - related on demand services (trial at rohrbach and schlierbach) @nahverkehrsgesellschaft_baden-wurttemberg_mbh_-demand-verkehr_2024 @rhein-neckar-verkehr_gmbh_fips_2024
      - Lack of consideration for service quality: What about services in the gtfs file that need advanced booking of up to an hour, like transport association scheduled on-call taxi services @vrn_vrn_2017.
    - using travel time cubes for more detailed transit accessibility analysis offers a lot more detailed view of transit behaviours @kaplan_using_2014
    - @kaplan_using_2014 tries to quantify transit inequalities with gini coefficients 
      - _inequality_ being silly at times @graeber_dawn_2022.

    - implementing a analysis accounting for delay and cancellation data would help to get a better picture of lived realities
    - implementing an analysis for scenarios based on more specific scenarios of day to day life
    - planning data can be helpful for planning new services, including needed night services, or stops
    - introducing points of interest to the analysis for clearer scenarios
    === Patterns
      Geographically, I already did the following clusters:
        - manually by neighbourhoods
        - manually by time chunks
      Automatic clustering
      Optional bits:
      - Dimensionality reduction PCA or UMAP @mcinnes_umap_2018 based on the maths from @mcinnes_umap_2020
      - UMAP clustering prone to confabulations @generic_user_clustering_2018 @schubert_answer_2017.
      - Clustering K-Means or HDBSCAN @mcinnes_hdbscan_2016 based on an algorithm proposed by @campello_density-based_2013
    === Detailed Routing
    To illustrate and illucidate some of the results of the above processing, I also provided some handpicked routing examples based on the same gtfs feed @delfi_deutschlandweite_2023.
    These detailed routings take h3 cells @dahn_h3pandas_2023 that i deemed interesting as a departure location and look at times and specific routes to arbitrary central locations within Heidelberg.
    Routing again was provided by r5py @r5py.

    === Inequality measures
    - Lorentz curves
    === Spatial statistics
    - I wanna use Moran's I so badly
<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))