// The counter for resolutions (individual items).
// Counters in typst are global so this needs to be reset at the start of every list.
// As a result of this yo cannot nest resolutions.
#let counter = counter("resolution")

// TODO: Wrap in a figure to make references in feature parity with LaTeX.
#let resolutions(enumerate: auto, ..arguments) = {
  if arguments.named().len() != 0 {
    panic("unexpected named arguments: " + arguments.named().keys().join(", "))
  }

  let resolutions = arguments.pos()

  let enumerate = if enumerate == auto {
    resolutions.len() > 3
  } else {
    enumerate
  }

  // Reset the counter.
  counter.update(0)

  list(
    marker: {
      counter.step()

      let number = if enumerate {
        context align(center, text(gray, size: 0.8em, counter.display()))
      }

      box(width: 1em, number)
      [*att*]
    },
    ..resolutions
  )
}

#let that(resolution) = resolution

// Swedish bindings.

#let att-lista = resolutions
#let att = that
