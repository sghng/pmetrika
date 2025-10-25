#import "@preview/pmetrika:0.1.0": conf

#show: conf.with(
  // These arguments are optional, but you likely need all of them in a paper.
  title: [A Typst Template for _Psychometrika_],
  abstract: lorem(100),
  section: "application and case studies - original",
  keywords: ("Typst", [_Psychometrika_], "typesetting"),
)

= Start Writing as You Normally Would

#lorem(20)

== Headings Are in Psychometrika Style

= Advanced Styling

You may want to import some of the predefined style elements:

#import "@preview/pmetrika:0.1.0": color-heading

So that you can have a #text(fill: color-heading)[word] colored like a heading!

#bibliography("refs.bib") // pass actual path to your bib!

When in doublt, consult the
#link("https://github.com/sghng/pmetrika/blob/main/lib.typ")[source code] to
see how things work.

= Sections After Bib Are Treated as Appendices

#lorem(100)
