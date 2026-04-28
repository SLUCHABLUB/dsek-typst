// TODO: Document this thoroughly.
#let ref-id = (
  "person": 99,
  "minute": 98,
)

/// Custom `@ref` renderer applied automatically by `doc()` via `show ref`.
///
/// Renders person references (depth `ref-id.person`) as "Position Name" links,
/// and minute-item references (depth `ref-id.minute`) as "§N Title" links,
/// both in the body text colour (no pink). Falls back to the default renderer
/// for all other references.
///
/// Not called directly — set via `show ref: enhanced-ref` inside `doc()`.
/// -> content
#let enhanced-ref(it) = {
  let elem = it.element
  show: box
  if elem != none and elem.func() == heading and elem.numbering == none and not elem.outlined {
    if elem.depth == ref-id.person {
      // people
      show link: set text(text.fill)
      link(elem.location(), [
        #{ if it.supplement == [] { elem.supplement } else if it.supplement != auto { it.supplement } }
        #elem.body
      ])
    } else if elem.depth == ref-id.minute {
      // minutes
      show link: set text(text.fill)
      link(elem.location(), [§#elem.supplement #elem.body])
    }
  } else {
    it
  }
}
