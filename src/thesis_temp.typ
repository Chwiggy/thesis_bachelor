#let project(
    title: "",
    subtitle: "",
    authors: (),
    date: none,
    logo: none,
    abstract_en: "",
    abstract_de: "",
    bib: "",
    body,
) = {
  // set the document's basic properties
  set document(author: authors.map(a => a.name), title: title)
  
  let ht-first = state("page-first-section", [])
  let ht-last = state("page-last-section", [])

  set page(
    paper: "a4",
    margin: (left: 30mm, right: 25mm, top: 30mm, bottom: 30mm),
    numbering: none,
    number-align: center,
    header: align(
      right,
      [
        #locate(
        loc => [
          // find first heading of level 1 on current page
          #let first-heading = query(heading.where(level: 1), loc).find(h => h.location().page() == loc.page())
          #let last-heading =  query(heading.where(level: 1), loc).rev().find(h => h.location().page() == loc.page())
          #{
            if not first-heading == none {
              ht-first.update([
                  // change style here if update needed section per section
                  (#counter(heading).at(first-heading.location()).at(0)) #first-heading.body
              ])
              ht-last.update([
                  // change style here if update needed section per section
                  (#counter(heading).at(last-heading.location()).at(0)) #last-heading.body
              ])
            // if one or more headings on the page, use first heading
            // change style here if update needed page per page
            [#ht-first.display()]
        } else {
            // no headings on the page, use last heading from variable
            // change style here if update needed page per page
            [#ht-last.display()]
        }}
        ]
        )
      ]
      )
  )
  set text(font: "Linux Libertine", lang: "en")

  // paragraph spacing
  show par: set  block(above: 1.2em, below: 1.2em)

  set heading(numbering: "1.1")
  set par(leading: 0.75em)

  // title page
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)
  v(1.5em, weak: true)
  text(1.2em,weight: 600, subtitle)

  //author info
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        #author.matr \
        #author.email \
        #author.affiliation \
        #author.postal
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()

  set page(numbering: "i")
  counter(page).update(1)
  heading([Affidavits], level: 1, numbering: none)
  pagebreak()

  // abstracts
  heading([Abstracts], level: 1, numbering: none)
    heading([English], level: 2, numbering: none, outlined: false)
      set par(justify: true)
      abstract_en
    heading([German], level: 2, numbering: none, outlined: false)
      set text(lang: "de")
      abstract_de
      set text(lang: "en")
  pagebreak()  

  // table of contents

  outline(depth: 3, indent: true)
  pagebreak()



  // body
  set page(numbering: "1")
  counter(page).update(1)
  set par(justify: true)

  body

  

}

