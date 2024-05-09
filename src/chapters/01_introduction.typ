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
  With these two temporal variations in mind, this thesis will try to establish indicators to visualise and illuminate transit accessibility issues and their temporal dimension with the example of Heidelberg, Germany as a playing ground. 

  == Motivation
    There are a plenty of indicators already out there trying to capture the characteristics of transit networks.
    This spans from network centrality measures applied in almost simplistic network models to thorough analyses of various aspects of transit access @tu_centrality_2013 @liu_spatial_2020 @conway_evidencetransit @karner_assessing_2018.
    
    Within transit there is hardly such a thing as a neutral descriptive dataset, indicator or study.
    Baked in are almost always assumptions and political ideas on how our transit system should look, assumptions about the costs of transit to society and the individual, and last but not least assumptions about the need for mobility and the kind of destinations deemed worthwhile to reach.
    All of these assumptions of course are inherently also linked to larger societal ideas of how our lives should be structured and lived.
    None of these assumptions are inevitable or ever lasting and should be aknowledged then as at least in part tainted by normative ideas about how transit should work and about how transit should be used.
    And not least, this means, that this thesis won't be free of these implicit or explicit value judgements either.
    Transit is an inherently political topic.

    // TODO expand:
    As an exteriority to daily life, transport systems are hard to influence by an individual according to their own needs.
    With the strong link between transportation and the necessary built infrastructure, transit systems within their geographic location have a strong amount of inertia @holzapfel_urbanismus_2020.
    Historical decisions about the transport network therefor still have an outsized influence on the transit opportunities of modern people.
    And since these decisions underlie the general rules for societal decision making processes, they also mirror general social power structures. 
    Historically then transport planning also was a domain built for men by men.
    The daily itineraries of women however tend to be much less focused on the singular destinations of a commute, but tend to move through space more freely based on the needs of other people in need of care work @heier_alle_2024 @holzapfel_urbanismus_2020. 
    In German transport planning around the middle of the last century this has resulted in a tendency to make cities favourable to the usage of cars as transportation from A to B in terms of a regular commute @heier_alle_2024.
    But not only in Germany was this idea of how transit and cities should work en vogue. Functional cities, as in cities characterised by a separation of functions like living, work and relaxation, became the modern ideaal of a city. This trend not least helped by the publishing of the highly influential Athens Charta, however again centers the needs of men on their daily commutes @holzapfel_urbanismus_2020. 
    This way of looking at urban environments coupled with ideas of unlimited growth had far reaching ramifications then for the lived environment we still move in today. Urban and transit planning of course has undergone several trends in various distances to the ideals laid out in the Athens Charta since then. Among these changes, participation has gained a lot of importance in planning processes. However, from my own experience, participation is often easier used as buzzword than done. It takes deliberate and long processes to gain meaningful insights from these processes @heier_alle_2024 @amt_fur_stadtentwicklung_und_statistik_heidelberg_integriertes_2023.
        
    Capturing all these various aspects of a transit network and all the needs of various users at once however runs the danger of reducing all these complexities to the absurd.
    Transit planning and identifying demand in public transit networks then is a complicated process, that takes into account a plethora of data that's hard to access or acquire @pieper_kreislauf_2021. And often to this day neglects the needs of some populations, often based on paternalistic assumptions @heier_alle_2024. To this day a lot of research and planning have focused on the commute as the itinerary of interest @owen_modeling_2015. In part this may be due to the easy nature of these itineraries. Measuring transit demand otherwise takes the careful building of model itineraries that capture the different lived realities of all kinds of people @conway_evidencetransit.

    This almost precludes the idea of an easy spatial measure of transit access based on individual experiences. However, with an idea focused on opportunities for social connection and social services, which generally tend to be spread more evenly across cities, and a focus on a singular urban space, it might be possible to characterise the nature of a transit system and its capacity to move people without an intense focus on individual points of interest. To this end, I employed statistical routing data based on conveyal engine @conway_evidencetransit.

  == Research Questions
    Guiding this research, are a few research questions then, that I tried to answer with two indices one for average travel times and one trying to capture the need to plan journeys out before starting on an itinerary. For each research question there are a handful of hypotheses to test. Ideally this thesis can falsify some of these hypotheses.

    First of all, I will focus on the spatial pattern of mean travel times, to answer the question if the proposed indices can capture observable patterns in the traffic flow of the city. There are two hypothesis associated with this question:
      + Mean Travel Times cannot capture transit service patterns at a given point in time
      + Outlying areas have generally worse accessibility across all times of the day than geographically central locations. For Heidelberg this would mean that Hauptbahnhof and Bismarckplatz always have a lower mean travel time than areas farther out.
    Second, focussing on the travel planning indicator, I will try to answer if the planning indicator can be a useful measure of transit service in a given area.
    #set enum(start: 3)
      + The planning indicator aligns with accissibility indicator, as in the most central parts of the city will also have the least need to plan journeys
      + The planning indicator will preserve it's characteristics across the course of a day. Areas that neccessitate a lot of journey planning will allways neccessitate a lot of planning.

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))