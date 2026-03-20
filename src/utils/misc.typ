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

#let labelize(str, sep: "") = latinize(lower(str.split(regex("[-`'´\s]")).join(sep)))

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

#let ref-id = (
  "person": 99,
  "minute": 98,
)

#let enhanced_ref(it) = {
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

#let old-terms(t) = {
  set par(hanging-indent: 2em)
  t
    .children
    .map(c => [
      *#c.term*
      #h(0.6em, weak: true)
      #c.description
    ])
    .join(parbreak())
}

#let date(day, month, year, time: none) = {
  let (h, m, s) = if time != none {
    let time = (time,).flatten()
    if time.len() == 3 {
      time
    } else if time.len() == 2 {
      (time.at(0), time.at(1), 0)
    } else if time.len() == 1 {
      (time.at(0), 0, 0)
    }
  } else {
    (0, 0, 0)
  }

  datetime(
    year: year,
    month: month,
    day: day,
    hour: h,
    minute: m,
    second: s,
  )
}

