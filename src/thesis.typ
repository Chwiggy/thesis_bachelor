#import "thesis_temp.typ": *

#show: project.with(
  title: "Simple Open Data Measures of Public Transit Service Availability",
  subtitle: "Planning and Temporal Variability",
  authors: (
    (name: "Emily C. Wilke",matr: "Matrikel_Nr: 3652850", email: "emilycwilke@gmail.com", affiliation: "Geographisches Institut, Ruprecht-Karls-Universität Heidelberg", betreuer: "Betreuer: Prof. A. Zipf, Prof. apl. S. Lautenbach"),
  ),
  date: [#datetime.today().display()],
)

#import "preamble.typ": *
#bib_state.update(none)

#set figure(placement: auto)
#include "chapters/01_introduction.typ"
#pagebreak()

#include "chapters/02_related_work.typ"
#pagebreak()

#include "chapters/03_methodology.typ"
#pagebreak()

#include "chapters/04_access.typ"
#pagebreak()

#include "chapters/05_planning.typ"
#pagebreak()
  
#include "chapters/06_summary.typ"
#pagebreak()

#include "chapters/07_discussion.typ"
#pagebreak()

#include "chapters/08_conclusion.typ"
#pagebreak()


#set heading(supplement: "Appendix",depth:2, numbering: "A.1",)
#show heading.where(level: 1): it => [
  #text([#it.supplement #counter(heading).display(): #it.body])
]
#counter(heading).update(0)

#include "appendices/01_aknowledgements.typ"
#pagebreak()

= Bibliography
#bibliography("bibliography.bib", title: none, style: "american-psychological-association")
#pagebreak()

#include "appendices/03_code.typ"
#pagebreak(weak: true)

= Figures
== Images
#set par(first-line-indent: 0em)
#outline(title: none, target: figure.where(kind: image))
== Maps
#outline(title: none, target: figure.where(kind: "Map"))