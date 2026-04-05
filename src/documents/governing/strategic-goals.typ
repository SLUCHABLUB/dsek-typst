#import "governing-document.typ": governing-document
#import "../../utils/misc.typ": translate

#let strategic-goals(
  summary: none, // required
  purpose: none, // required
  scope: none, // required
  date: datetime.today(),
  lang: "sv",
  body,
) = {
  let strategic-goals-name = translate("Strategiska mål", "Stategic goals")

  governing-document(
    title: strategic-goals-name,
    summary: summary,
    purpose: purpose,
    scope: scope,
    history: history,
    date: date,
    lang: lang,
    doc-type: strategic-goals-name,
    use-cover-page: true,
    body,
  )
}
