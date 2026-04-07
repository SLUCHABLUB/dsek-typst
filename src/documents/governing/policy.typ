#import "governing-document.typ": governing-document
#import "../../utils/misc.typ": translate
#import "../../utils/assert.typ": required

/// #set raw(lang: "typst")
/// Creates a policy document. Apply with `#show: policy.with(...)`.
///
/// === Notes
/// - The document begins with an "Översikt" / "Overview" section containing the summary, purpose, scope, and a revision history table. A page break separates the Overview section from the body.
///
/// === Example
/// ```typst
/// #show: policy.with(
///   subject: "ekonomi", // title becomes "Policy för ekonomi"
///   summary: [Policyn beskriver hur ekonomin på sektionen ska skötas.],
///   purpose: [Syftet med denna policy är att se till att vi inte bryter lagen.],
///   scope: [Sektionen i sin helhet. Men mest Skattmästeriet.],
///   history: (
///     (
///       meeting: "VTM-extra 2022",
///       change: "Tillämpade Dijkstra på attesträttsgrafen",
///       who: "Styrelsen genom Truls Teknolog",
///     ),
///   )
/// )
///
/// = Bokslut
///
/// Bokslut måste lämnas in senast när Skattmästaren känner för det.
/// ```
///
/// - subject (content): The subject of the policy, e.g. `"Val"` or `"Tackverksamhet"`.
/// - summary (content): Description of what this document covers.
/// - purpose (content): Why this document exists.
/// - scope (content): Who or what this document applies to.
/// - history (array): Modification history.
///                    Each entry is a dict with required keys `meeting`, `change`, and `who`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let policy(
  subject: none,
  summary: none,
  purpose: none,
  scope: none,
  history: (),
  date: datetime.today(),
  lang: "sv",
  body,
) = {
  required(subject, "subject", fn: "policy")
  let policy-name = "Policy"

  governing-document(
    title: [#policy-name #translate("för", "for") #subject],
    summary: summary,
    purpose: purpose,
    scope: scope,
    history: history,
    date: date,
    lang: lang,
    doc-type: policy-name,
    body,
  )
}
