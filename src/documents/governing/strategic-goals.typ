#import "governing-document.typ": governing-document
#import "../../utils/misc.typ": translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/assert.typ": required, required-keys

#let strategic-goals(
  summary: none, // required
  purpose: none, // required
  scope: none, // required
  history: (), // required
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
