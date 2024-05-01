#import "thesis_temp.typ": *

#show: project.with(
  title: "Simple Open Data Measures of Public Transit Service Availability",
  subtitle: "Planning and Temporal Variability",
  authors: (
    // TODO add matr number and postal address as secrets
    (name: "Emily C. Wilke",matr: "35xxxxxxxx", email: "emilycwilke@gmail.com", affiliation: "Ruprecht-Karls-Universität Heidelberg", postal: "xxxxxxx"),
  ),
  date: [#datetime.today().display()],
  abstract_en: "test oh my oh my",
  abstract_de: "",
)

// TODO insert page for affidavit

#import "preamble.typ": *
#bib_state.update(none)

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

#include "chapters/06_patterns.typ"
#pagebreak()
  
#include "chapters/07_summary.typ"
#pagebreak()

#include "chapters/08_discussion.typ"
#pagebreak()


#pagebreak()

// TODO Appendices

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