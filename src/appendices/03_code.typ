#import "../preamble.typ": *

= Code
#figure(image("../figures/qr.png"), caption: [Link to Thesis release.], kind: "qr", supplement: "QR") <release>

The code used in this thesis is available on `github.com`:
  + The code to typeset this document can be found at #link("https://github.com/Chwiggy/thesis_bachelor"). A release version of the document can be found at #link("https://github.com/Chwiggy/thesis_bachelor/releases") (compare @release).
  + The code to produce the travel time matrix data can be found at #link("https://github.com/Chwiggy/BA-Thesis-App").
  + The jupyter notebooks to analyse the resulting data can be found at #link("https://github.com/Chwiggy/thesis_analysis").



<end_of_chapter>

#locate(loc => bib_state.at(query(<end_of_chapter>, loc).first().location()))