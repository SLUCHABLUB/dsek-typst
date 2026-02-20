#let translated(swedish, english) = context {
  let language = text.lang

  if language == "sv" {
    swedish
  } else if language == "en" {
    english
  } else {
    panic("language `" + language + "` is not supported")
  }
}

// Strings used by the templates.

#let organisation_name = translated("D-Sektionen inom TLTH", "The D-guild within TLTH")

// Hard to spell strings.

#let honours_committee = translated(
  "Medaljelelekommittén", "The Honours Committee"
)
#let honours_committee_member = translated(
  "Medaljelelekommittémedlem", "Member of the Honours Committee",
)

// Strings containing "Ø".

#let head_of_introductions_committee = translated(
  "Øverphøs", "Head of Introductions Committee"
)
#let head_of_introduction_coordinators = translated(
  "Øverpeppare", "Head of Introduction Coordinators"
)

// Alternative variable names that may have greater discoverability for Swedish speakers.

#let medals_committee = honours_committee
#let medals_committee_member = honours_committee_member

#let overphos = head_of_introductions_committee
#let overpeppare = head_of_introduction_coordinators
