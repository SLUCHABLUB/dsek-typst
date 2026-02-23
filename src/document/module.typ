#import "style.typ": *

// TODO: Change these.
#let sans_serif = "DejaVu Sans Mono"

#let doc(
  title: none,
  meeting: none,
  date: datetime.today(),
  content
) = [
  #set document(
    title: title,
    // TODO: Set the authors from the signatures.
    date: date,
  )
  #show heading: set text(font: heading_font)
  #show heading: heading_style

  #show heading.where(level: 1): set text(size: heading_level_1_text_size)
  #show heading.where(level: 2): set text(size: heading_level_2_text_size)
  #show heading.where(level: 3): set text(size: heading_level_3_text_size)

  // TODO: justify?
  #set par(spacing: paragraph_spacing)

  // TODO: Set font.
  // TODO: Take and set the "short title".
  // TODO: Style the title.
  // TODO: Style the headers and footers.

  #content
]

// TODO: Cover page function.
// TODO: Agenda function.
// TODO: Attachments.
// TODO: LTH symbols.
