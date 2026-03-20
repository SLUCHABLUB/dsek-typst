#let diff-added(content, color: green) = highlight(fill: colour, content)
#let diff-removed(content, color: red) = highlight(fill: colour, content)

#let translate(swedish, english) = context {
  let lang = text.lang
  if lang == "sv" {
    swedish
  } else if lang == "en" {
    english
  } else {
    panic("language `" + lang + "` is not supported for name translations")
  }
}

#let latinize(str) = {
  let new = str
  let chars = (
    ("á", "a"),
    ("à", "a"),
    ("ó", "o"),
    ("ò", "o"),
    ("ú", "u"),
    ("ù", "u"),
    ("ü", "u"),
    ("é", "e"),
    ("è", "e"),
    ("ë", "e"),
    ("í", "i"),
    ("ì", "i"),
    ("ý", "y"),
    ("ỳ", "y"),
    ("ð", "d"),
    ("þ", "th"),
    ("æ", "ae"),
    ("ø", "ö"),
    ("ç", "c"),
    ("ć", "c"),
    ("ñ", "n"),
    ("ß", "ss"),
  )
  for (t, f) in chars {
    new = new.replace(t, f)
  }
  return new
}

// Turn content into a string representation
#let to-text(c) = {
  if type(c) == "string" {
    return c
  } else if type(c) == content {
    let f = c.func()
    if f == text {
      return c.text
    } else if f == [ ].func() {
      return " "
    } else if f == [\n].func() {
      return "\n"
    } else if f == ['].func() {
      return if c.double { "\"" } else { "'" }
    } else if c.has("children") {
      return c.children.map(to-text).join()
    } else if c.has("body") {
      return to-text(c.body)
    } else {
      return ""
    }
  } else {
    return ""
  }
}

#let enhanced_ref(it) = {
  let elem = it.element
  if elem.func() == heading and elem.numbering == none and not elem.outlined {
    if elem.depth == 99 {
      // attendance
      link(elem.location(), [
        #{ if it.supplement == [] { elem.supplement } else if it.supplement != auto { it.supplement } }
        #elem.body
      ])
    } else if elem.depth == 98 {
      // minutes
      link(elem.location(), [§#elem.supplement #elem.body])
    }
  } else {
    it
  }
}
