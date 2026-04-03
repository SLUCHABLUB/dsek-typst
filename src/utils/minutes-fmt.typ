#import "misc.typ": labelize, old-terms, ref-id, to-text, translate

/// Formats a terms block as a meeting minutes table (§N | Title | Description).
///
/// Applied automatically inside `minutes()` via `show terms: minutes-fmt`,
/// not called directly. Each term gets automatically labeled, enabling `@title`
/// references that resolve to "§N Title".
///
/// - mins (content): A terms block produced by `/` syntax in the document body.
/// -> content
#let minutes-fmt(mins) = {
  table(
    columns: (2.5em, 10.5em, 1fr),
    row-gutter: 0.6em,
    stroke: none,
    ..mins
      .children
      .enumerate(start: 1)
      .map(x => {
        let (n, item) = x
        (
          [
            §#n
          ],
          {
            set heading(depth: ref-id.minute, numbering: none, outlined: false, supplement: str(n))
            show heading: set text(size: text.size, weight: text.weight, font: text.font)
            show heading: set par(justify: false)
            [#heading(item.term) #label(labelize(to-text(item.term), sep: "-"))]
          },
          [
            #show terms: old-terms
            #item.description
          ],
        )
      })
      .flatten()
  )
}
