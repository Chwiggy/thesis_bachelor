#import "../preamble.typ": *

= Final Remarks
  == Conclusion
    - Well this turned out to be a bit boring ...
  == Outlook
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


<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))