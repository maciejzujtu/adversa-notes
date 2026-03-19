#import "@preview/algorithmic:1.0.7": *
#import "@preview/minimal-note:0.10.0": *
#import "@preview/mousse-notes:1.0.0": *

#let FONT   = "New Computer Modern"
#let SIZE   = 12pt   
#let INDENT = 1.4em

#let title-page(
  title: none,
  subtitle: none,
  author: none,
) = {
  page[
    #place(horizon + center, dy: -15%, {
    set par(spacing: 0.7em, leading: 0.2em, justify: false)
    align(
      center,
      text(size: 4em, smallcaps(title), weight: "regular", hyphenate: false)
        + v(2.5%, weak: true)
        + if subtitle != none {
          text(size: 2em, smallcaps(subtitle))
          v(2.5%, weak: true)
        },
    )
  })
  #align(bottom + center, text(size: 1.5em, smallcaps(author)))
  ]
}


/**
 * The template function that you include
 * into the document at the beginning.
 **/ 
#let Adversa(
  title: none, 
  author: none,
  subtitle: none,
  outline-title: none,
  date: datetime.today(),
  body
) = {

  set text(font: FONT, size: SIZE, fill: rgb("#1A1A1A"))
  set par(first-line-indent: INDENT, justify: true)
  set terms(hanging-indent: INDENT)
  set enum(indent: INDENT, numbering: "1.")
  set heading(numbering: "1.")

  set page(fill: rgb("#FDFBF7"))  
  set document(author: if author != none { author } else { () }, title: title)

  show heading: it => block(
    text(fill: rgb("2563EB"),
    weight: "bold", 
    it)
  )

  title-page(
    author: author,
    title: title,
    subtitle: subtitle,
  )
  
  outline(
    title: outline-title
  )

  pagebreak()
  
  body
}

