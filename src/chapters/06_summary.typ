#import "../preamble.typ": *

= Hypotheses and their Falsification
At the start of this project I set a few hypotheses to primarily falsify. It is tempting to change these hypotheses based on the data acquired here, but that would be akin to putting a cart in front of a horse. The hypotheses as originally set out are listed in /*TODO reference right section here*/. In the following two sections I will try and see if I managed to bring evidence to falsify these hypotheses.

  == Travel Times
    The first hypothesis concerned mean travel times, and their ability to capture transit service patterns. The null hypothesis would be that our indicator cannot capture any details about public transit patterns in Heidelberg. Comparing the map of average cell to cell travel times /*TODO reference travel time maps*/  to for example a map of the Heidelberg tram network (@trams), the tram network coincides with a lot of lower travel time cells.

    #figure(image("../figures/2024-02-11_Straßenbahn-Linien-Heidelberg-2019-09.svg"), caption: [rnv Tram service map as of September 2023 from /*TODO reference this right*/], kind: "Map", supplement: "Map") <trams>
    
    Furthermore, the indicator clearly captures elements of centrality within the city, such as outlying districts which need more travel time to other districts than the central nodes of the public transit network. As such the null hypothesis that the travel time indicator cannot reproduce features of Heidelberg transit, can be rejected. The mean travel time is a useful indicator.

    The second hypothesis concerns //TODO do not reject the second null hypothesis.
  == Planning data
  // TODO needs a better name
      
<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))