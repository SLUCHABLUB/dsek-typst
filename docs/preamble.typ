#import "../src/lib.typ": *
#import "@preview/tidy:0.4.3"

#show: plain-document.with(
  title: [Documentation for `dsek-typst`],
  doc-type: "Documentation",
  lang: "en",
  use-cover-page: true,
)

#let document-module(path) = {
  let relative-path = path.trim("../src/", at: start)
  let name = relative-path.trim(".typ", at: end).replace("/", ".")

  // Tidy handles periods specifically, and both `_` and `-` are allowed in identifiers, so we use `:`.
  let label = name.replace(".", ":")

  let module = tidy.parse-module(
    read(path),
    name: name,
    label-prefix: label + ":",
    // Tinymist uses the old syntax.
    old-syntax: true,
  )

  show heading.where(level: 1): it => {
    pagebreak()
    it
  }
  show heading.where(level: 3).or(heading.where(level: 4)): set heading(numbering: none)
  heading[#name -- #link(path, raw(relative-path))]

  tidy.show-module(
    show-module-name: false,
    first-heading-level: 1,
    module,
  )
}

#outline(target: heading.where(level: 1).or(heading.where(level: 2)))

#document-module("../src/lib.typ")

// The build script inserts calls to `document-module` bellow.
