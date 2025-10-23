// definitions
// TODO: obtain actual colors programmtically
#let color-heading = rgb("#4086B1")
#let color-abstract = rgb("#E8EEF3")  // abstract bg
#let color-header = rgb("#B4C5DA") // table header bg
#let color-body = rgb("#EEF0F4") // table body bg
#let color-link = rgb("#455CA5") // cross references and links
#let color-doi = rgb("#337BCA") // doi in bottom left of pages
#let font-sans = "Source Sans Pro"
#let font-serif = "Minion Pro"
#let font-mono = "Source Code Pro"
#let stroke-table = stroke(0.5pt)

#let pmetrika(
  title: none,
  section: none,
  abstract: none,
  keywords: none,
  bib: none,
  body,
) = {
  set text(font: font-serif, size: 9.75pt)
  // FIXME: mono font too light, setting weight doesn't work
  show raw: set text(font: font-mono)
  show strong: it => text(weight: "light", it) // FIXME: why it has to be light?

  set page(
    width: 176mm,
    height: 250mm,
    margin: (x: 0.6in, y: 0.5in),
    header: context [
      #if counter(page).get().first() > 1 [
        _Psychometrika_ Submission
        #h(1fr) #counter(page).display()
      ]
    ],
  )

  set heading(numbering: "1.")
  show heading: set text(
    font: font-sans,
    size: 9.5pt,
    fill: color-heading,
    weight: "semibold",
  )
  show heading: set block(below: 1em)
  show heading.where(level: 2): set text(style: "italic")


  set table(
    // TODO: cell spanning a whole row should have no strokes
    // TODO: rows sharing a spanned first cell should have no strokes
    // TODO: spanned cells in header should have "padding" for strokes
    stroke: (_, y) => (y: 0.5pt),
    // FIXME: header spanning multiple rows should be colored correctly
    fill: (_, y) => if y == 0 { color-header } else { color-body },
  )
  show table.cell: it => {
    set text(font: font-sans, size: 7.75pt)
    it
  }
  set table.hline(stroke: stroke-table)

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption: it => align(left, text(font: font-sans, size: 7.75pt)[
    *#it.supplement #context it.counter.display(it.numbering).*
    #sym.space
    #it.body
  ])

  // if a term list has only one term and it's called Note, it will be treated
  // as a figure note
  // TODO: only if the term list is after a figure
  // TODO: make notes float with figure
  show terms: it => {
    let terms = it.children
    if terms.len() == 1 {
      let it = terms.first()
      if it.term.at("text", default: none) == "Note" {
        set text(font: font-sans, size: 6.75pt)
        return [#emph(it.term): #it.description]
      }
    }
    it
  }

  set bibliography(title: "References", style: "apa")
  show bibliography: set text(size: 8pt)

  show link: set text(fill: color-link)


  // content

  if section != none {
    text(
      size: 8.5pt,
      font: font-sans,
      tracking: 1.1pt,
      fill: color-heading,
      upper(section),
    )
    parbreak()
  }


  if title != none {
    text(
      size: 16pt,
      font: font-sans,
      fill: color-heading,
    )[*#title*]
  }

  if abstract != none {
    block(fill: color-abstract, inset: 9pt)[
      #text(size: 9pt)[
        #text(font: font-sans, tracking: -0.02pt)[*Abstract*]

        #abstract
      ]
    ]
  }

  if keywords != none {
    text(size: 8pt)[#text(tracking: -0.17pt)[*Keywords:*] #keywords]
  }

  body

  if bib != none { bibliography(bib) }
}
