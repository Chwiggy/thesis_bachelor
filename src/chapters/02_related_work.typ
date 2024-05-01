#import "../preamble.typ": *
#set math.equation(numbering: "(1)")

= Related Work
In the following section I will explore, the aspects of this work already discussed in the literature at the intersection of transit accessibility and transit network analysis. This overview is necessarily incomplete, and in the face of various historical traditions of transit planning procedures can only give a sample of ideas present in a very active field of literature. First of all, this section is concerned with giving an overview of the literature that led to the formation of the ideas in this thesis. A discussion of competing ideas follows in a later chapter.

  == Access
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
   
    This paper then takes a geographical perspective of _access_ and uses it generally interchangeably with _accessibility_. The considerations I make then also focus on access with transit above access to transit. In the end an analysis, such as this thesis tries to conduct, aims to show gaps and inequalities in usable access to the transportation system, where transit time is the most important impedance or cost factor.

  == Centrality
    Network centrality measures have long been at the base of understanding road based individualised traffic and routing phenomena @boeing_osmnx_2017 @kazerani_can_2009 @gao_understanding_2013.
    Facilitated by computational advances @hagberg_exploring_2008, these studies focus on analysing the infrastructural basis of road traffic, that is street networks, based often on Open Street Map data.
    Their analysis heavily leans on mathematical concepts borrowed from graph theory, that were more or less adapted for a more specifically geographical lense and more specific purposes @stamos_transportation_2023.
    A common thread here is an interest in betweenness and closeness centrality of nodes in the graph of a street network as a proxy for an importance of such a node (either a crossing or a street itself depending on the exact process) within traffic patterns of a city.
    Commonly, the edges of these street network graphs are weighted based on travel time.
    As such this approach has also gained momentum in applications such as disaster response and preparedness @klipper_flood_2021 @bono_network-based_2011 @warnier_humanitarian_2020.

    Almost obviously, the idea of treating public transit networks as networks isn't far from this usage.
    However there are a few complications that make it a bit harder to adapt these road network analysis approaches directly to public transit networks.
    In the simplest case, such an analysis would treat the transit network at face value as a set of station nodes and vertices linking stations @tu_centrality_2013.
    This approach allows a simple characterisation of an urban rail network for example. It, however, assumes a uniform world outside the specific transit network in question, and assumes the rail network to be uniformly distributed itself. 
    Uniform public transit networks embedded in uniform space are, unfortunately, hard to find in the real world.
    
    To embed a transit network into a more realistic model of an outside world, it can make sense to, in essence, combine the graph generated from a public transit network with one generated from the underlying road network. This makes some sense, as users of public transit generally require the usage of roads or paths to access a transit stop and many modes of public transit are dependent on street infrastructure themselves. Creating such a bipartite network then specifically makes sense for transit modes that are bound or predominantly bound to the street network such as buses @liu_spatial_2020.
    
    Generally however, public transit with a few exceptions has a few complicating factors in comparison to road transit with individual modes. The primary difference here is that transit options are only sporadically available over the course of an hour or a day. These opportunities can be defined by a schedule stating departure and arrival times, but can also be given as a frequency or headway stating the interval with which transit opportunities arise @levinson_towards_2020 @conway_evidencetransit.

    On the flip side of this, routing between stations only is a rare case in realistic transit usage. In reality, of course origin and destination are often locations not directly on the transit network, but in a certain distance from a stop. Consequently, these journeys are often multimodal: transit users walk, bike, or drive to a stop in their vicinity, take a potentially multi-leg transit journey to arrive at a station or stop in the general vicinity from their destination, from where they can walk, bike or drive to their actual destination @verduzco_torres_public_2024. This requires consideration of modes like walking in network analysis.

    Directly calculating network characteristic from such a complex network tends to be a complex task of finding the right weights and applying them correctly. With the widespread availability of routing tools, geographers have tried to simplify the problem of gaining insights about the network with less theoretical measures. For this, often network centrality measures are approximated by accummulating routing data for a set amount of sample points, that are either uniformly distributed in space, or based on characteristica like population, or a desirability of certain origins or destinations tailored to exact questions @tenkanen_longitudinal_2020 @klipper_flood_2021 @verduzco_torres_public_2024.

    For a general network analysis, there remain a few characteristica however that are commonly calculated and directly correspond to easy to communicate ideas about a specific location. These include closeness centrality and reach. Closeness centrality then describes how close a node is to every other node of the network. As an inverse sum of the distance $d$ from A node $i$ to every node $j$ @closeness, the higher the closeness centrality of a node, the easier it is to reach other nodes from it @stamos_transportation_2023 @jang_influence_2022.
    $ C_i = 1/(sum_j d_(i,j)) $ <closeness>

  == Reach
    Another approach that commonly crops up as an approach to characterising a transit network spatially is _reach_. Sometimes this measure is lumped in as a network measure @jang_influence_2022. In its simplest formulation it is very easy to formulate without the abstraction of treating the transit system as a mathematical graph. It is simply a count of how many destinations or how large an area can be reached from a certain point within a given search radius.

    #figure(image("../figures/galton_iso.png"), caption: [Isochronic passage chart based on estimated travel times from London in 1881 @galton_construction_1881], supplement: "Map", kind: "Map") <galton_map>
    
    This kind of measure is commonly employed in various scenarios to asses the potential access of a point in space and to figure out how central it is. This usage extends from exploring the surroundings of transit stations @prayogi_openrouteservice_2022 to the population within reach of healthcare services @klipper_flood_2021. To estimate reach in these scenarios, the search radius is often delimited not by euclidean or geographic distance, but by a travel time limit. This usage easily translates to the usage of isochrones, which have become a common tool to assess reach and by proxy access.

    Isochrone maps feature a long and rich history since the first publication of the _Isochronic Passage Chart for Travellers_ as a curiosity of travel planning in the 19th century @galton_construction_1881 (see @galton_map).
    Isochrones are comprised of an area that can be reached within a certain time, where the actual isochrone delimits this area.
    Borrowed from metereologic isothermic lines, the isochrone is the line that denotes equal (greek: _iso_) time (greek: _chronos_) and would transform into a circle in a coordinate system transformed by travel time @levinson_towards_2020 @galton_construction_1881.
    A modern tool that provides such isochrone maps is for example ors @heigit_openrouteservice_2023. Using Isochrones as an easy to understand and interpretable measure of access in geoinformation systems has a much longer history however @osullivan_using_2000 @bauer_computing_2008 @zeng_visualizing_2014 @levinson_towards_2020. This might be because they are a visually simple tool that can be easily overlaid over geographic maps of a study area @zeng_visualizing_2014.
      //TODO expand



  == Planning Indicators?
  //TODO Aaaah
  
    

  == Transit Equity
    - @liu_spatial_2020
    - US @kaplan_using_2014
      - travel time cubes @kaplan_using_2014
    - Network Planning @pieper_kreislauf_2021
  == Traveltime Datasets
    - such as @tenkanen_longitudinal_2020 and @verduzco_torres_public_2024
    - all the impedance factors from @levinson_towards_2020 @conway_off_the_mta

<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))