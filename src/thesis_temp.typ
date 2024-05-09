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
  )
  set text(font: "Crimson Text", lang: "en", size: 12pt)
  set math.equation(numbering: "(1)")
  set figure(placement: auto)

  // paragraph spacing
  show par: set  block(above: 1.2em, below: 1.2em)
  
  // caption rules
  show figure: it => [
    #block(it.body)
    #set text (style: "italic", weight: "bold", size: 10pt)
    #pad(
      bottom: 0.75em,
      left: 2em,
      right: 2em,
      block(it.caption))
  ]

  set heading(numbering: "1.1")
  show par: set block(spacing: 1em)
  set par(leading: 1em)

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
  box(
    [
      #set text(lang: "de")
      #set par(justify: true)
      #set heading(numbering: none)
      = Eidesstattliche Erklärung
        Hiermit versichere ich, dass ich die vorliegende Arbeit selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe. Alle Ausführungen, die anderen veröffentlichten oder nicht veröffentlichten Schriften wörtlich oder sinngemäß entnommen wurden, habe ich kenntlich gemacht.

        Die Arbeit hat in gleicher oder ähnlicher Fassung noch keiner anderen Prüfungsbehörde vorgelegen.
        
        #box(height: 3em)
        #grid(columns: 2, gutter: 5em,
          box(
            [
              #line(length: 100%)
              Ort, Datum
            ]
          ),
          box(
            [
              #line(length: 100%)
              Unterschrift
            ]
          )
        )
        #box(height: 3em)
    ]
  )
  
  

  box(
    [
      #set text(lang: "en")
      #set par(justify: true)
      #set heading(numbering: none)
      = Statutory Declaration
        I declare that I have authored this thesis independently, that I have not used other than the declared sources / resources and that I have explicitly marked all material which has been quoted either literally or by content from the used sources.
        
        This paper was not previously presented to another examination board and has not been published.
        
        #box(height: 3em)
        #grid(columns: 2, gutter: 5em,
          box(
            [
              #line(length: 100%)
              Date
            ]
          ),
          box(
            [
              #line(length: 100%)
              Signature
            ]
          )
        )
    ]
  )

  pagebreak()

  // abstracts
  heading([Abstracts], level: 1, numbering: none)
    heading([English], level: 2, numbering: none, outlined: false)
      set par(justify: true)
      par(justify: true, abstract_en)
    heading([German], level: 2, numbering: none, outlined: false)
      set text(lang: "de")
      par(justify: true, abstract_de)
      set text(lang: "en")
  pagebreak()  

  // table of contents

  outline(depth: 3, indent: true)
  pagebreak()



  // body
  set page(
    numbering: "1",
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
  counter(page).update(1)
  set block(above: 2em)
  set par(justify: true, first-line-indent: 1em, leading: 1em)
  

  

  body

  

}

