#import "../document.typ": doc
#import "../../utils/misc.typ": translate

#let nomination(
  title: none,
  meeting: none,
  lang: "sv",
  date: datetime.today(),
  nominees: (),
  it,
) = {
  show: doc.with(
    title: title,
    short-title: translate("Nominering", "Nomination"),
    lang: lang,
    meeting: meeting,
    date: date,
  )

  if type(nominees) not in (array, dictionary) or nominees.len() == 0 {
    panic("Please provide a list of nominees")
  }

  it
}

#show: nomination.with(
  title: "Val av Phaddrar",
  nominees: (
    name: "",
    position: "",
  ),
)

hej
