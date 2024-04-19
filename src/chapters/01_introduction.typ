#import "../preamble.typ": *

= Introduction
  In recent years, but for decades by now, the demand for a paradigm shift in transportation infrastructure and service has become louder and louder.
  While calls for a shift away from car centric mobility are nothing new and were a well established part of German academic discourse in the 1990s already @frank_hat_1993, it has become part of a widespread political discourse around the so called _Verkehrswende_ @holzapfel_urbanismus_2020.
  With increased awareness and concrete experiences of climate change this discourse has reached states of heated debate.
  Taunted benefits of a modal shift away from individual motorised transit towards public transit include a more efficient transport system both in terms of traffic throughput as well as in terms of energy usage, decreased local pollution @teufel_autoverkehr_1993, and a lessened dependency on cars favouring more healthy modes of transit and more livable environments for humans @rissel_physical_2012 @stevenson_health_2016 @holzapfel_urbanismus_2020.

  However appealing these pleas for an improved mobility regime may be, there is a distinct lack of easily accessible tools to measure how well a public transit system is serving its users, and the people who for some reason or another have decided that they will not use it.
  Public Transit Data beyond planned schedules is often hard to come by, and the often quite complex thoughts and models that go into service planning remain behind the closed doors of local transit agencies in a lot of cases @pieper_kreislauf_2021 @karner_assessing_2018.
  One option of addressing this gap is the use of reach data over larger areas to assess the coverage public transit provides for reaching different points of interest hopefully relevant to daily life of potential users e.g. @verduzco_torres_public_2024.
  These studies are based in schedule data and as in this example several assumptions about public transit usage.

  One of these assumptions is usually a time of day for travel time calculations, usually something like morning rush hour on an average workday @verduzco_torres_public_2024.
  This however ignores the changing nature of transit accessibility over the course of the day.
  As general traffic volumes change over the course of the day, so do public transit schedules and quite dramatically at that @levinson_towards_2020.
  Unlike with car traffic, it is not uncommon to see public transport schedules with considerable gaps: be they a few hours at night in which there is basically no service, or in some instances even entire days like Sundays that see no service at all, or very reduced service patterns.
  This temporal variability in transit accessibility is so far not generally addressed well in the literature and in available data sets @verduzco_torres_public_2024.
  There is, of course, also a smaller kind of temporal variation.
  With schedule based transit the exact departure time can have distinct consequences on actual travel times.
  Any hour of the day travel times from a specific location may look very different: Arriving at a stop at 10:34 you might exactly make the bus out of your village, but at 10:35 you might have missed it and would need to wait for the next bus in what might be anything from a few minutes to hours @levinson_towards_2020.
  This variation necessitates more or less planning effort on the side of public transport users depending on their departure location, destination, and again the time of day as transit schedules change over the course of the day.
  With these two temporal variations in mind, this thesis will try to establish indicators to visualise and illuminate transit accessibility issues and their temporal dimension. 

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

    // TODO continue here
    
    - This paper takes a geographical view into _access_ and uses it interchangeably with _accessibility_.
    - This paper also tries to consider access with transit above access to transit.

    - In the end such analysis aims to show gaps and inequalities in usable access to the transportation system.
    - Looking specifically at transit time as an impedance or cost factor and it's variability over time.
  == Motivation
    - Traditional transport planning centering on men? // source
      - German Transport Planning post world war 2? // source
    - Transit planning and identifying demand in public transit networks is a complicated process, that takes into account a plethora of data that's hard to access or acquire @pieper_kreislauf_2021.
      - statistical routing data based on conveyal engine @conway_evidencetransit
  == Research Question
    - How temporal variability in transit accessibility maps on to spatial usage patterns?
    - are cities really better connected? edge times?
    - are rural areas always worse off in connections or are there times when it's actual actions?

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))