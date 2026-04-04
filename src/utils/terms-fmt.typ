/// Manually emulates the default styling of `terms` in order to "undo" `terms-fmt`.
#let old-terms(unstyled) = {
  set par(hanging-indent: unstyled.hanging-indent)

  // TODO: Should we (as we do now) ignore `unstyled.tight`?

  unstyled
    .children
    .map(c => [
      *#c.term*
      #unstyled.separator
      #c.description
    ])
    .join(parbreak())
}

// TODO: Should 2-column be the default?
#let terms-fmt(
  numbered: true,
  columns: (2.5em, 9.5em, 1fr),
  unstyled
) = table(
  columns: columns,
  row-gutter: 0.6em,
  stroke: none,
  ..unstyled
    .children
    .enumerate(start: 1)
    .map(((n, item)) => {
      let column = (
        {
          set par(justify: false)
          item.term
        },
        {
          show terms: old-terms
          item.description
        },
      )

      if columns.len() == 3 {
        let last-heading-numbers = {
          let numbers = counter(heading).get().map(str).join(".")
          if numbers != "0" [#numbers.]
        }

        column.insert(0)[§#last-heading-numbers#n]
      }

      column
    })
    .flatten()
)
