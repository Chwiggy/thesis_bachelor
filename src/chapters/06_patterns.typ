#import "../preamble.typ": *

= Patterns
  == Geographically
    I already did the following clusters:
      - manually by neighbourhoods
      - manually by time chunks
  == Clustering
    Optional bits:
    - Dimensionality reduction PCA or UMAP @mcinnes_umap_2018 based on the maths from @mcinnes_umap_2020
    - UMAP clustering prone to confabulations @generic_user_clustering_2018 @schubert_answer_2017.
    - Clustering K-Means or HDBSCAN @mcinnes_hdbscan_2016 based on an algorithm proposed by @campello_density-based_2013
  == Results

  <end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))