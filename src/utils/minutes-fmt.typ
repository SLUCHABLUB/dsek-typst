#import "misc.typ": to-text

#let minutes-fmt(mins) = context {
  let fmt-lbl(name) = lower(to-text(name)).replace(regex("\s+"), "-")

  // simulated version of old terms
  let old-terms(t) = {
    set par(hanging-indent: 2em)
    t.children.map(c => [
      *#c.term*
      #h(0.6em, weak: true)
      #c.description
    ]).join(parbreak())   
  }
  
  table(
    columns: (2.5em, 10.5em, 1fr),
    row-gutter: 0.6em,
    stroke: none,
    ..mins.children.enumerate(start: 1).map(x => {
      let (n, item) = x
      (
        [§#n],
        {
          set heading(depth: 98, numbering: none, outlined: false, supplement: str(n))
          show heading: set text(size: text.size, weight: text.weight, font: text.font)
          show heading: set par(justify: false)
          [#heading(item.term) #label(fmt-lbl(item.term))]
        }, 
        [
          #show terms: old-terms
          #item.description
        ]
      )
    }).flatten()
  )
}
