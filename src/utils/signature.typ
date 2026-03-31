#import "misc.typ": labelize, ref-id, to-text, translate

// TODO: In typst 0.15.0+, we can take a path to the image.
//       We cannot do this at the moment since paths are resolved
//       relative to the file in which the image function was called.
#let signature(
  message,
  name,
  position,
  image: none,
  width: auto,
  signature_height: 15mm,
  minimum_width: 40mm,
) = context {
  let width = if width == auto {
    calc.max(
      measure(message).width,
      measure(name).width,
      measure(position).width,
      minimum_width,
    )
  } else {
    width
  }

  box(
    width: width,
  )[
    #message \
    #box(height: signature_height, image) \
    #name \
    #position \
  ]
  h(2em)
}

// A helper function to load an image.
#let signature-image = image.with(height: 1fr, fit: "contain")

#let author-signatures(
  authors,
  default_greeting: translate("Lund, dag som ovan", "Lund, day as above"),
  default_position: translate("Sektionsmedlem", "Guild member"),
) = {
  let authors = if type(authors) == array {
    if authors.len() == 2 and type(authors.at(0)) in (str, content) and type(authors.at(1)) in (str, content) {
      ((name: authors.at(0), position: authors.at(1)),)
    } else {
      authors
    }
  } else if type(authors) in (str, content) {
    ((name: authors),)
  } else {
    (authors,)
  }

  v(1.5em)
  table(
    stroke: none,
    columns: 3, // TODO: calculate based on longest width?
    row-gutter: 2em,
    ..authors.map(author => {
      let message = author.at("message", default: default_greeting)
      let position = author.at("position", default: default_position)
      let lbl = if type(author.name) == content {
        labelize(to-text(author.name))
      } else {
        labelize(author.name)
      }
      let name = context {
        show heading: set text(font: text.font, weight: text.weight, size: text.size)
        set heading(depth: ref-id.person, numbering: none, outlined: false)
        [#heading(author.name, supplement: position) #label(lbl)]
      }

      signature(
        message,
        box(name),
        position,
        image: author.at("image", default: none),
      )
    })
  )
}
