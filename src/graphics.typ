// TODO: Committee logos?
// TODO: "Word marks"?

#let graphic(type: "dsek", colour: false, symbol: false, height: 10pt) = {
  let available = ("dsek", "datateknik", "infocom", "vr_ar")

  if not available.contains(type) {
    panic("no `" + type + "` graphics available. please specify one of: " + available.join(", "))
  }

  let file_name = if symbol {
    if colour {
      if type != "dsek" {
        panic("only the guild (`dsek`) symbol is available in colour")
      }

      "symbol/symbol_rosa"
    } else {
      if type == "dsek" {
        "symbol/symbol_real"
      } else {
        "symbol"
      }
    }
  } else {
    if colour {
      "color"
    } else {
      "bw"
    }
  }

  let path = "../graphics/guild/" + type + "/" + file_name + ".svg"

  box(image(path, height: height))
}

#let guild_logo = graphic.with(type: "dsek")
#let data_logo = graphic.with(type: "datateknik")
#let info_com_logo = graphic.with(type: "infocom")
#let vr_ar_logo = graphic.with(type: "vr_ar")

#let guild_symbol = guild_logo.with(symbol: true)
#let data_symbol = data_logo.with(symbol: true)
#let info_com_symbol = info_com_logo.with(symbol: true)
#let vr_ar_symbol = vr_ar_logo.with(symbol: true)

// Swedish bindings.

#let sektions_logga = guild_logo
#let data_logga = data_logo
#let info_com_logga = info_com_logo
#let vr_ar_logga = vr_ar_logo

#let sektions_symbol = guild_symbol
