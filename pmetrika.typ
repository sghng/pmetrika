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

#let pmetrika(
  title: none,
  section: none,
  abstract: none,
  keywords: none,
  body,
) = {
  set text(font: font-serif, size: 9.75pt)
  show strong: it => text(weight: "light", it) // FIXME: why it has to be light?

  set page(
    width: 176mm,
    height: 250mm,
    margin: (x: 0.6in, y: 0.5in),
    header: context [
      #if counter(page).get().first() > 1 [
        #smallcaps[Psychomatrika Submission]
        #h(1fr) #counter(page).display()
      ]
    ],
  )

  set heading(numbering: "1.")
  show heading: set text(
    font: font-sans,
    size: 9.5pt,
    fill: color-heading,
  )

  show figure: it => align(center, it)

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

  set bibliography(title: "References", style: "apa")

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
    block(fill: color-abstract, inset: 8.5pt)[
      #text(font: font-sans, tracking: -0.02pt)[*Abstract*]

      #text(size: 9pt)[#abstract]
    ]
  }

  if keywords != none {
    text(size: 8pt)[
      #text(tracking: -0.17pt)[*Keywords:*]
      #keywords
    ]
  }

  body
}
