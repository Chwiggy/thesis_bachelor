#let project(
    title: "",
    subtitle: "",
    authors: (),
    date: none,
    logo: none,
    body,
) = {
  // set the document's basic properties
  set document(author: authors.map(a => a.name), title: title)
  set page(
    paper: "a4",
    margin: (left: 25mm, right: 25mm, top: 30mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
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
  v(1em, weak: true)
  text(2em,weight: 600, subtitle)

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

  // table of contents
  outline(depth: 3, indent: true)
  pagebreak()

  // body
  set par(justify: true)

  body

}