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
  minimum_width: 40mm
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
#let signature_image = image.with(height: 1fr, fit: "contain")

// Swedish bindings.

#let signatur = signature
#let signatur_bild = signature_image