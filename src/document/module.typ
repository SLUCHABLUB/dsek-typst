#import "@preview/datify:1.0.1": custom-date-format
#import "style.typ": *
#import "../graphics.typ": guild_logo
#import "../strings.typ": guild
#import "../resolutions.typ": *

#let header(short_title, meeting, date) = context pad(
  bottom: header_padding,
  box(height: header_height)[
    #set align(horizon)
    #set text(size: 10pt)
    #stack(
      dir: ltr,
      box(width: 18mm)[
        #guild_logo(height: header_height)
      ],
      box(width: 82mm)[
        #show: smallcaps
        #text(size: 11pt, guild.dseklth) \
        #short_title
      ],
      box(width: 60mm)[
        #set align(right)
        #meeting \
        #custom-date-format(date, pattern: "d MMMM y", lang: text.lang)
      ]
    )
  ]
)

#let footer() = context {
  set align(center)
  set text(number-type: "lining")

  v(2em)
  line(length: 100%, stroke: 0.4pt)
  v(-(par.leading + 6pt))

  let current_page = counter(page).get().at(0)
  let last_page = counter(page).final().at(0)
  let location = (page: last_page, x: 0mm, y: 0mm)

  [
    #current_page
    (#link(location)[#text(fill: red, [#last_page])])
  ]
}

#let titel = title

#let doc(
  title: none,
  meeting: none,
  short_title: "",
  language: "sv",
  date: datetime.today(),
  content
) = [
  #set document(
    title: title,
    // TODO: Set the authors from the signatures.
    date: date,
  )

  #set text(lang: language, font: serif, size: 11pt, number-type: "old-style")

  #show titel: set text(font: sans_serif, weight: "bold", size: 15pt)

  // TODO: Investigate spacing between numbering and heading text
  //       as well as heading text and paragraph.
  #show heading: set text(font: sans_serif, weight: "bold", number-type: "lining")
  #show heading.where(level: 1): set text(size: 14pt)
  #show heading.where(level: 2): set text(size: 12pt)
  #show heading.where(level: 3): set text(size: 11pt)
  
  #show footnote: set text(font: serif, size: 9pt)
  #show figure.caption: set text(font: serif, size: 9pt, style: "italic")

  #show list: resolutions

  // TODO: Pick and set a monospace font for code-esque excerpts.

  #set par(spacing: paragraph_spacing, justify: true)

  #set page(
    header: header(short_title, meeting, date),
    footer: footer(),
    header-ascent: 0%,
    footer-descent: 0%,
    margin: (
      x: horizontal_margin,
      top: top_margin,
      bottom: bottom_margin,
    ),
  )

  #set heading(numbering: "1.1   ")
  
  #titel()
  #content
]

// TODO: Cover page function.
// TODO: Agenda function.
// TODO: Attachments.
// TODO: LTH symbols.
// TODO: Colors (pink links, footnotes)
