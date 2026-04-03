#import "misc.typ": translate

#let agenda-fmt(make-heading: false, en) = {
  let items = en.children

  // only format if correct syntax
  if items.any(item => {
    if item.body.has("text") { return true }
    if item.body.has("children") {
      let children = item.body.children
      let begin = children.first().at("text", default: "") == "["
      let end = "]" in children.map(x => x.at("text", default: ""))
      begin and not end
    }
  }) {
    return en
  }

  let link-map = (:)
  let link-counter = 1

  let partition(ls) = (
    ls.filter(x => not x.has("body")),
    ls.filter(x => x.has("body")),
  )

  let links = items.map(x => x.body.children.filter(x => x.has("body"))).flatten().map(x => x.body)

  for url in links {
    if url.dest not in link-map {
      if url.body.text != url.dest {
        link-map.insert(url.dest, url)
      } else {
        link-map.insert(url.dest, link(url.dest, [#link-counter]))
        link-counter += 1
      }
    }
  }

  let extract(item) = {
    let (n, it) = item
    if it.body.has("children") {
      let (open, label, close, ..rest) = it.body.children
      let txt = none
      let links = none
      let lbl = label
      if open.text == "[" and label.text == "]" {
        if close != [ ] { rest = (close,) }
        (txt, links) = partition(rest)
        lbl = ""
      } else if open.text == "[" and close.text == "]" {
        (txt, links) = partition(rest)
      }

      (
        [§#n],
        [
          #set par(justify: false)
          #txt.join()
        ],
        lbl,
        [
          #set par(justify: false)
          #set text(number-type: "lining")
          #links.map(x => link-map.at(x.body.dest)).join([, ])
        ],
      )
    }
  }

  if make-heading {
    heading(numbering: none, depth: 2, translate("Föredragningslista", "Agenda"))
  }

  v(1em)
  context grid(
    columns: (auto, 1fr, auto, 5em),
    stroke: none,
    row-gutter: (0.5em, 0.5em, par.leading),
    column-gutter: 1em,
    [*#sym.numero*],
    [*#translate("Ärende", "Item")*],
    [*#translate("Åtgärd", "Action")*],
    [*#translate("Bilaga", "Annex")*],
    grid.hline(stroke: 0.4pt),
    grid.cell(colspan: 4, []),
    ..en.children.enumerate(start: 1).map(item => extract(item)).flatten(),
  )
}
