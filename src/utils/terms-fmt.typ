#import "../utils/misc.typ": old-terms

#let terms-fmt(numbered: true, columns: (2.5em, 9.5em, 1fr), ts) = table(
  columns: columns,
  row-gutter: 0.6em,
  stroke: none,
  ..ts
    .children
    .enumerate(start: 1)
    .map(x => {
      let (n, item) = x
      let prev-heading = {
        let h = counter(heading).get().map(str).join(".")
        if h != "0" [#h.]
      }

      let num = ([§#prev-heading#n],)
      let rest = (
        [
          #set par(justify: false)
          #item.term
        ],
        [
          #show terms: old-terms
          #item.description
        ],
      )
      if columns.len() == 3 { num + rest } else { rest }
    })
    .flatten()
)
