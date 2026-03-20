#import "misc.typ": labelize, old-terms, ref-id, to-text, translate

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
            // #set align(center)
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
