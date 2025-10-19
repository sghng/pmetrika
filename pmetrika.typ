#let primary-fg = rgb("#0A7CAE")
#let primary-bg = rgb("#E8ECF2")
#let sans = "Source Sans Pro"
#let serif = "Minion Pro"

#let pmetrika(
  title: none,
  section: none,
  abstract: none,
  keywords: none,
  body,
) = {
  set text(font: serif, size: 9.75pt)

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
    font: sans,
    size: 9.5pt,
    fill: primary-fg,
    weight: "semibold",
  )

  set bibliography(title: "References", style: "apa")

  if section != none {
    text(
      size: 8.5pt,
      font: sans,
      tracking: 1.1pt,
      fill: primary-fg,
      upper(section),
    )
    parbreak()
  }


  if title != none {
    text(
      size: 16pt,
      font: sans,
      fill: primary-fg,
      weight: "semibold",
    )[#title]
  }

  if abstract != none {
    block(fill: primary-bg, inset: 8.5pt)[#text(size: 9pt)[
      #text(font: sans, tracking: -0.02pt, weight: "semibold")[Abstract]

      [#abstract]
    ]]
  }

  if keywords != none {
    text(size: 8pt)[
      #text(tracking: -0.17pt)[*Keywords:*]
      #keywords
    ]
  }

  body
}
