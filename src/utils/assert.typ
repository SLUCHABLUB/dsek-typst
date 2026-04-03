/// Shared helpers for consistent, informative validation panics.
///
/// Usage:
///   #import "../../utils/assert.typ": required, required-keys

#let origin(fn) = if fn != none { fn + ": " } else { "" }
#let make-hint(hint) = if hint != none { "\n  hint: " + hint } else { "" }

/// Panic if `value` is `none` or the empty array `()`.
///
/// - value (any): The value to check.
/// - key (str): The parameter name, shown in backticks in the message.
/// - fn (str): The calling function's name, prepended as context.
/// - hint (str): Optional example or explanation appended after a newline.
#let required(value, key, fn: none, hint: none) = {
  if value != none and value != () { return }
  panic(origin(fn) + "missing required argument `" + key + "`" + make-hint(hint))
}

/// Panic if `dict` is missing any of the given `keys`.
///
/// - dict (dictionary): The dictionary to check.
/// - keys (array): Key names (strings) that must be present.
/// - fn (str): The calling function's name, prepended as context.
/// - hint (str): Optional example or explanation appended after a newline.
#let required-keys(dict, keys, fn: none, hint: none) = {
  let missing = keys.filter(k => not dict.keys().contains(k))
  if missing == () { return }
  let label = if missing.len() == 1 { "key" } else { "keys" }
  let listed = missing.map(k => "`" + k + "`").join(", ")
  panic(_where(fn) + "missing required " + label + " " + listed + make-hint(hint))
}
