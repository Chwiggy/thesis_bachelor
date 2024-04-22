#import "../preamble.typ": *

= Related Work
In the following section I will explore, the aspects of this work already discussed at the intersection of transit accessibility and transit network analysis
  == Terminology
    But what is even meant by terminology like public transit accessibility or reach?
    To understand the indices proposed in this thesis it is necessary to expand on the terminology around transit accessibility.
    Furthermore, I will give a almost certainly incomplete overview of the landscape of literature and research surrounding this topic.

    Understandings of _access_ and _accessibility_ inevitably vary across different contexts and subject areas.
    But even within the context of geographic transport analysis theri usage may differ between different authors.
    Partly, these understandings build on each other, partly they mean different things on various in- and interdependent axes.
    To understand what I mean with measures for transit acccess, it seems prudent to examine these various understandings of _access_ and _accessibility_ first.
    
    For example the term _accessibility_ has deep roots in discourses around marginalised communities, particularly among disability activism @levinson_towards_2020.
    This dimension of access usually depends on the negative freedom from barriers to a certain service.
    May these be physical barriers like stairs for a wheelchair user, or non-physical barriers like access requirements to services from language barrriers or price barriers like high fares.
    While this kind of _access_ is an important consideration in any kind of transportation network, it itself carries a plethora of different dimensions and intersections, that could plausibly fill years of graduate theses. 
    For this thesis then the focus lies in geographical notions of _accessibility_.
    In these _access_ measures a general ease of reaching destinations, that are deemed valuable in some sense or another.
    For these, general measures of _access_ in a geographic sense, as opposed to _mobility_ as a personalised characteristic, play an important role in empirical studies of transportation systems @pyrialakou_accessibility_2016 @levinson_towards_2020.

    Specifically in North American literature, spurred by rules of the Federal Transport Administration on transit accessibility studies, there seem to be two general modes of thinking about transit access _Access to Transit_ and _Access with Transit_ @carleton_comparative_2018.
    _Access to transit_ means that transit itself becomes the target destination of such an access analysis.
    And while access to transit measures can be as simple as the average proximity to transit stops in an area. These measures however fall short in explaining the mobility decisions in day to day life as they fail to consider desirable destinations @karner_assessing_2018.
   
    This paper then takes a geographical view into _access_ and uses it interchangeably with _accessibility_.
    - This paper also tries to consider access with transit above access to transit.

    - In the end such analysis aims to show gaps and inequalities in usable access to the transportation system.
    - Looking specifically at transit time as an impedance or cost factor and it's variability over time.
  == Centrality and Reach
  - Network Centrality Measures
    - road networks
    - public transit networks
    - bipartite networks
  == Transit Equity Studies
    - US @kaplan_using_2014
      - travel time cubes @kaplan_using_2014
    - Network Planning @pieper_kreislauf_2021
  - Traveltime Datasets such as @tenkanen_longitudinal_2020 and @verduzco_torres_public_2024
  - Planning Indicators? //TODO

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))