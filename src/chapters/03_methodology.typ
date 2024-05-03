#import "../preamble.typ": *
#import "@preview/fletcher:0.4.4" as fletcher: diagram, node, edge
#import fletcher.shapes: pill, diamond, hexagon
#set heading(numbering: "1.")

= Methodological Approach
  This thesis project started as an exploratory data analysis project, trying to find easy to implement metrics for public transit service coverage and accessibility with transit based on open source software and openly accessible data.
  Starting points were prior considerations about closeness centrality and reach, as well as an interest in the temporal variability of transit services on the macro and micro scale. 
  // TODO add references to Related Work

  == Case Studies <case-study>
    To this end it was necessary to find at least on suitable case study. As my choice to approximate network characteristics here fell on routing with `r5py`, based on the conveyal routing engine @r5py, there were several data availability requirements. There needed to be a routable General Transit Feed Specification schedule (GTFS) @mobility_data_reference_2024 and suitable street network data from Open Street Map (OSM). For further details see @data below.

    First attempts at routing were based in Heidelberg, Germany arbitrarily.
    After fine tuning the process in Bonn, Germany, I made the decision to use Heidelberg again for the final data for this thesis, based on my personal familiarity with Heidelberg and its transit network.
    As this thesis does not include any measures to verify the data acquired through routing with an empircal sample of real life experiences, personal experience and familiarity at least allowed for checks against my own experience and intuition.

    // TODO better map of Heidelberg
    #figure(image("../figures/basemap.png"), caption: [Overview map of Heidelberg (OpenStreetMap contrubutors)], kind: "map", supplement: "Map") <overview>

    For a transit study, Heidelberg, a city of roughly 130,000 people with a large student population, offers a variety of modes of public transit. There are buses and trams operated by the local municpal transit company rnv, regional buses, as well as multiple S-Bahn stations with regular commuter trains.
    Beyond that Heidelberg offers a few different urban spaces (see @overview).
    There are outlying villages part of Heidelbergs administrative boundaries like Ziegelhausen and Peterstal, there are suburban developments from the 1970s like for example Emmertsgrund @amt_fur_stadtentwicklung_und_statistik_heidelberg_integriertes_2023, there are large areas of forests and agricultural land, as well as of course the central bits of urban agglomeration, with differing neighbourhoods, and a couple of industrial parks.

  == Data Acquisition <data>
    As mentioned in @case-study above, there were several requirements for data to process.
    Transportation data was required in two forms, both for the underlying street network, as well as for the public transit schedule data (see @transit).
    Beyond that routing needed origins and destinations (see @endpoints).

    === Transport Data <transit>
      While OSM data is generally available for most of the world in varying levels of quality, public transit schedule data isn't necessarily as easy to come by; especially not if there is formatting requirements like using the specifications of GTFS @mobility_data_reference_2024 for routing with `r5py` @r5py.

      GTFS is a standard trying to capture a plethora of data that can be relevant for routing. The specification includes a lot of options for all kinds of various transit modes, and multimodal network constellations, from interchange specifications to fare schemas @mobility_data_reference_2024.
      For a simple routing analysis only part of the possible data contained within a gtfs feed are necessary.
      This includes, stop, trip, and calendar data.

      Within Germany there are numerous recent and regularly updated GTFS Schedule datasets available on `opendata-oepnv.de` @openoepnv, including candidates for usage in different cities within Germany. These datasets include planned schedule data in accordance with GTFS specifications. There are datasets for Heidelberg from the local transit company RNV @rhein-neckar-verkehr_gmbh_aktueller_2023, and for Bonn for example there is data from the local transit authority of the region @vrs_soll-fahrplandaten_2023.
      Beyond the numerous offerings on `opendata-oepnv.de` in a federalised Germany, it is of course not beyond individual transit authorities like VRN for the Rhein-Neckar Metropolregion to publish their own transit schedule data @vrn_vrn_2023.
      At the same time, not all local transit authorities publish their schedule data as a gtfs feed. However, all scheduling data is collected by DELFI e.V., a network between federal states and other partners to collect travel information publishes a GTFS schedule dataset for the entirety of Germany, that is updated weekly @delfi_deutschlandweite_2023.

      With these three options applicable to routing, it was necessary to weigh their benefits. The RNV data includes only transport services operated by rnv @rhein-neckar-verkehr_gmbh_aktueller_2023.
      This includes most public transport services within Heidelberg, but ignores regional bus routes, as well as local trains operated by SWEG and DB Regio Mitte.
      While most public transport traffic in Heidelberg is probably handled by rnv, regional buses and specifically the fast S-Bahn services offer speedy connections between the 4 different train stations in Heidelberg.
      As ticketing within the VRN transit authority is integrated, excluding these trains ignores real transit opportunities.
      
      Fittingly, the VRN dataset includes these vital train connections and the regional buses as well @vrn_vrn_2023.
      The dataset however is much larger already than that provided by rnv, as the VRN servicing area has a quite large east to west extent. Although, the most crucial drawback here is that lack of regular updates by VRN, who seems to have once contributed to `opendata-oepnv.de`, but seems to have dropped off the system, with a last update to their self-hosted GTFS Schedule dataset in May 2023 -- almost a year before this thesis was written.
      
      The final choice of GTFS schedule data -- the DELFI schedule dataset for all of Germany -- contains almost all public transit in Germany, that include the local tram and bus network of Heidelberg, the regional buses, the local and regional trains, but also long distance train services operated by DB Fernverkehr @delfi_deutschlandweite_2023.
      For an analyis of connectivity and transit access within Heidelberg these services aren't helpful. After all they break the integrated ticketing and require much higher fares, to the point of ridiculesness for itineraries within a city.
      For this analysis however, they can just be ignored as there are no long distance trains stopping at more than one station in Heidelberg. In essence, they do not add or take away anything from the connectivity in Heidelberg.
      The larger drawback these carry however is that these datasets are incredibly large, and add a lot of overhead to routing just within the city boundaries of Heidelberg. To use them without taking up too much computational power it is necessary to crop them by a bounding box first.
      In the end however, these cropped datasets are the only option that provides recency and regular updates as well as all the regular public transport services within the city of Heidelberg.

      - osm files from geofabrik @geofabrik_gmbh_geofabrik_2018 downloadad with @tenkanen_pyrosm_2023
      - VGI quality concerns
      
    === Origins and Destinations <endpoints>
      - hexgrids from h3pandas @dahn_h3pandas_2023 based on uber's implementation of them
      - no point of interests due to complexity.
      - h3 pandas @dahn_h3pandas_2023
      - h3 cell to h3 cells with populations excluded or not


  == Processing
    #figure(
      box(
        diagram(
          spacing: (10pt, 20mm),
          node((0,0), [Study Area], shape: diamond, fill: teal.lighten(50%), stroke: teal, name: <area>),
          node((0,1), [GTFS Data], shape: hexagon, fill: orange.lighten(50%), stroke: orange, name:<gtfs>),
          node((1,1), [pyrosm], shape: pill, fill:red.lighten(50%), stroke: red, name:<pyrosm>),
          node((2,1), [Geofabrik OSM data], shape: hexagon, fill: orange.lighten(50%), stroke: orange, name: <osm>),
          edge(<gtfs>, <pyrosm>, "->", "extent"),
          edge(<pyrosm>, <osm>, "->", "downloads"),
          edge(<area>, <gtfs>, "->", "location"),
          node((3,0), [h3pandas], shape: pill, fill: red.lighten(50%), stroke: red, name: <h3pandas>),
          edge(<area>, <h3pandas>, "->", "area"),
          node((0,2), [size], shape: diamond, fill: teal.lighten(50%), stroke: teal, name: <gtfssize>),
          node((0,3), [gtfs-general], shape:pill, fill:red.lighten(50%), stroke: red, name: <gtfscrop>),
          node((1,3), [r5py network], shape:hexagon, fill:orange.lighten(50%), stroke: orange, name: <transitnetwork>),
          edge(<gtfs>,<gtfssize>, "->", "schedule"),
          edge(<gtfssize>, <gtfscrop>, "-->", [*if*: large]),
          edge(<gtfssize>, <transitnetwork>, "->", "schedule"),
          edge(<gtfscrop>, <transitnetwork>, "-->", "cropped gtfs"),
          node((2,2), [size], shape: diamond, fill: blue.lighten(50%), stroke: blue, name: <osmsize>),
          node((1,2), [osmosis], shape: pill, fill: red.lighten(50%), stroke: red, name: <osmosis>),
          edge(<osm>, <osmsize>, "->", [_osm.pbf_]),
          edge(<osmsize>, <osmosis>, "-->", [*if*: large]),
          edge(<osmosis>, <transitnetwork>, "-->", [cropped _osm.pbf_], label-side: left),
          edge(<osmsize>, <transitnetwork>, "->", [_osm.pbf_], bend: 30deg),
          node((1,4), [r5py TravelTimeMatrixCalculator], shape: pill, fill:red.lighten(50%), stroke: red),
          node((3,4), [h3 dataframe], shape: hexagon, fill: orange.lighten(50%), stroke: orange, name: <cells>),
          edge(<h3pandas>, <cells>, "->", "cells"),
          edge(<cells>, (1,4), "->", [destinations & origins]),
          edge(<transitnetwork>, (1,4), "->", "network", bend:-20deg),
          edge(<transitnetwork>, (1,4), "->", "departure_time", bend:20deg),
          node((1,5), [dataframe], shape: hexagon, fill: green.lighten(50%), stroke: green, name: <results>),
          edge((1,4), <results>, "->", "cell to cell travel times"),
          edge(<cells>, <results>, "->", "cells", bend: 15deg)
        )
      ),
      caption: [Flowchart describing the data processing done for routing with r5py]
    ) <processing_chart>
  
    The data as acquired then was processed with various tools as detailed in @processing_chart
  
  <end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))