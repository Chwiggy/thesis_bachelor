#import "../preamble.typ": *

= Hypotheses and their Falsification
At the start of this project I set a few hypotheses to primarily falsify. It is tempting to change these hypotheses based on the data acquired here, but that would be akin to putting a cart in front of a horse. The hypotheses as originally set out are listed in /*TODO reference right section here*/. In the following two sections I will try and see if I managed to bring evidence to falsify these hypotheses.

  == Travel Time Indicator
    The first hypothesis concerned mean travel times, and their ability to capture transit service patterns. The null hypothesis would be that our indicator cannot capture any details about public transit patterns in Heidelberg. Comparing the map of average cell to cell travel times /*TODO reference travel time maps*/  to for example a map of the Heidelberg tram network (@trams), the tram network coincides with a lot of lower travel time cells.

    #figure(image("../figures/2024-02-11_Straßenbahn-Linien-Heidelberg-2019-09.svg"), caption: [rnv Tram service map as of September 2023 from /*TODO reference this right*/], kind: "Map", supplement: "Map") <trams>
    
    Furthermore, the indicator clearly captures elements of centrality within the city, such as outlying districts which need more travel time to other districts than the central nodes of the public transit network. As such the null hypothesis that the travel time indicator cannot reproduce features of Heidelberg transit, can be rejected. The mean travel time is a useful indicator.

    The second hypothesis concerns the distribution of accessibility throughout the day and it's distribution. The assumption was that outlying areas like Emmertsgrund would have a worse spread of travel times at any hour of the day. At midnight however this does not seem to be true (compare @midnight). At midnight, locations the spread of average travel times is very low, but a few outliers emerge around some of the more outlying railway stations like Heidelberg Kirchheim/Rohrbach, Schlierbach, Weststadt/Südstadt. Beyond that there are also some curious travel time lows at outlying settlements like Grenzhof and Bruchhausen outside the city boundaries.

    #figure(image("../figures/Heidelberg_TravelTime_Map0.svg"), kind: "Map", supplement: "Map", caption: [Average Travel times at midnight in minutes]) <midnight>

    This falsifies the hypothesis that outlying areas always have worse travel time averages than central locations like Bismarckplatz. At specific edge times, it can be harder to travel from Bismarckplatz than from Schlierbach.

  == Planning Indicator
    The third hypothesis concerns the alignment of the planning indicator with the mean travel time indicator. I hypothesised that these would align fairly well, and central locations with a low average travel time would be also well connected in terms of the need to plan out journeys, or how much difference planning a journey makes to travel times.

    For peak hour travel this is definitely not true. At 17:00 local time /*TODO reference right chapter, or image*/, it is weirdly enough not central places that have a low travel time difference, but the places that lie in unpopulated areas without direct access to a stop, but that are about equidistant from two stops that lie on completely differenc line. These, for example, are cells in the forest east of Handschuhsheim. Cells within the populated area display a largely homogenous distribution of travel time differences, acrosse the day. Only at edge times, do outlying districts exhibit worse travel time differences than central hubs. As such the hypothesis can be falsified, but in a way that puts the usefulness of this indicator as a proxy for the need to plan into question.

    This however also falsifies the fourth hypothesis, that the planning indicator will preserve it's pattern across the day. As seen above, this isn't true, and outlying areas experience higher travel time differences specifically before the morning rush-hour and after the evening peak. For nighttime travel the pattern reverses because in outlying areas walking becomes the only viable mode in the set of modes used for routing, and suddenly the schedules matter only at stations that still see some limited night time service.

      
<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))