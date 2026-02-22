// TODO: Import a module for text size (or general size) constants.

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
  #show heading: set text(font: sans_serif)
  #show heading: strong

  #show heading.where(level: 1): set text(size: 14pt)
  #show heading.where(level: 2): set text(size: 12pt)
  #show heading.where(level: 3): set text(size: 11pt)

  // TODO: justify?
  #set par(spacing: 3mm)

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
