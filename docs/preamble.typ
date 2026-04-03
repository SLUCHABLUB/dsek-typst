#import "../src/lib.typ": *
#import "@preview/tidy:0.4.3"

#show: plain-document.with(
  title: [Documentation for `dsek-typst`],
  doc-type: "Documentation",
  lang: "en",
)

#let document-module(path) = {
  let relative_path = path.trim("../src/", at: start)
  let name = relative_path.trim(".typ", at: end).replace("/", ".")

  // Tidy handles periods specifically, and both `_` and `-` are allowed in identifiers, so we use `:`.
  let label = name.replace(".", ":")

  let module = tidy.parse-module(
    read(path),
    name: name,
    label-prefix: label + ":",
  )

  heading[#name -- #link(path, raw(relative_path))]

  tidy.show-module(
    show-module-name: false,
    first-heading-level: 1,
    module
  )
}

#outline(target: heading.where(level: 1).or(heading.where(level: 2)))

#document-module("../src/lib.typ")

// The build script inserts calls to `document-module` bellow.
