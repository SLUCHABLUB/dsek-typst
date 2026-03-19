#import "utils/misc.typ": translate

#let guild = (
  "dsek": translate("D-sektionen", "The D-guild"),
  "dseklth": translate("D-sektionen inom TLTH", "The D-guild within TLTH"),
  "data": translate("Datateknik", "Computer Science and Engineering"),
  "infocom": translate("Informations- och kommunikationsteknik", "Information and Communication Engineering"),
  "vrar": translate("Virtuell verklighet och förstärkt verklighet", "Virtual Reality and Augmented Reality"),
)

#let styr = (
  "name": translate("Styrelsen", "The Board"),
  "ordf": translate("Ordförande", "President"),
  "sordf": translate("Sektionsordförande", "Guild President"),
  "vice_ordf": translate("Vice ordförande", "Vice President"),
  "vice_sordf": translate("Vice sektionsordförande", "Vice Guild President"),
)

#let aktu = (
  "name": translate("Aktivitetsutskottet", "The Recreation Committee"),
  "mastare": translate("Aktivitetsansvarig", "Head of Recreation"),
  "vice_mastare": translate("Vice Aktivitetsansvarig", "Vice Head of Recreation"),
  "dischoansv": translate("UtEDischoansvarig", "UtEDischo Manager"),
  "idrottsfm": translate("Idrottsförman", "Head of Sports Events"),
  "dsportare": translate("D-sportare", "Tournament Organizer"),
  "karnevalsansv": translate("Karnevalsansvarig", "Lundakarnevalen Representative"),
  "lanpartyansv": translate("LAN-partyansvarig", "LAN-party Coordinator"),
  "semester": translate("Semesterfirare", "Holidaymaker"),
  "tandemgen": translate("Tandemgeneral", "Tandem Relay Team Captain"),
  "nojesfm": translate("Nöjesförman", "Chief of Joy"),
  "coach": translate("Coach", "Coach"),
)

#let infu = (
  "name": translate("Informationsutskottet", "The Communications Committee"),
  "mastare": translate("Informationsansvarig", "Head of Communications"),
  "vice_mastare": translate("Vice Informationsansvarig", "Vice Head of Communications"),
  "fotograf": translate("Fotograf", "Photographer"),
  "filmare": translate("Filmare", "Filmmaker"),
  "arkivarie": translate("Arkivare", "Archivist"),
  "artist": translate("Artist", "Artist"),
  "influencer": translate("Influencer", "Influencer"),
  "journalist": translate("Journalist", "Journalist"),
  "redaktor": translate("Redaktör", "Editor"),
  "shopaholic": translate("Shopaholic", "Shopaholic"),
  "skald": translate("Skald", "Bard"),
  "markv": translate("Märkvärdig", "Patchy"),
)

#let cafe = (
  "name": translate("Cafémästeriet", "The Café Committee"),
  "mastare": translate("Cafémästare", "Head of the Café"),
  "vice_mastare": translate("Vice cafémästare", "Vice Head of the Café"),
  "dagsansv": translate("Dagsansvarig", "Daycarer"),
  "inventarieansv": translate("Inventarieansvarig", "Stockpiler"),
  "stekare": translate("Stekare", "Grillmaster"),
  "brunchm": translate("Brunchmästare", "Head of Brunch"),
  "bakis": translate("Bakis", "Baked"),
)

#let skattm = (
  "name": translate("Skattmästeriet", "The Treasury"),
  "mastare": translate("Skattmästare", "Treasurer"),
  "vice_mastare": translate("Vice Skattmästare", "Vice Treasurer"),
  "fm": translate("Skattförman", "Treasury Foreman"),
)

#let fram = (
  "name": translate("Framtidsutskottet", "The Strategic Committee"),
  "ordf": translate("Framtidsordförande", "Head of the Strategic Committee"),
  "ledamot": translate("Framtidsledamot", "Member of the Strategic Committee"),
)

#let km = (
  "name": translate("Källarmästeriet", "The Facilities Committee"),
  "mastare": translate("Källarmästare", "Head of Facilities"),
  "vice_mastare": translate("Vice källarmästare", "Vice Head of Facilities"),
  "bilansv": translate("Bilansvarig", "Guild Car Mechanic"),
  "ljudoljus": translate("Ljud- och ljusansvarig", "Audiovisual Technician"),
  "tradgm": translate("Trädgårdsmästare", "Gardener"),
)

#let nollu = (
  "name": translate("Nollningsutskottet", "The Introductions Committee"),
  "oph": translate("Øverphøs", "Head of the Introductions Committee"),
  "stab": translate("Stabsmedlem", "Member of the Introductions Committee"),
  "opepp": translate("Øverpeppare", "Head of Introduction Coordinators"),
  "pepp": translate("Peppare", "Introduction Coordinator"),
  "phadder": translate("Phadder", "Mentor"),
  "pluggphadder": translate("Pluggphadder", "Study Mentor"),
)

#let naru = (
  "name": translate("Näringslivsutskottet", "The Corporate Relations Committee"),
  "mastare": translate("Näringslivsansvarig", "Head of Corporate Relations"),
  "vice_mastare": translate("Vice näringslivsansvarig", "Vice Head of Corporate Relations"),
  "alumniansv": translate("Alumnigruppsansvarig", "Head of the Alumni Committee"),
  "aulmnimdlm": translate("Alumnigruppsmedlem", "Member of the Alumni Committee"),
  "koordinator": translate("Näringslivskoordinator", "Corporate Relations Coordinator"),
)

#let sexm = (
  "name": translate("Sexmästeriet", "The Festivities Committee"),
  "mastare": translate("Sexmästare", "Head of Festivities"),
  "vice_mastare": translate("Vice sexmästare", "Vice Head of Festivities"),
  "barm": translate("Barmästare", "Bartender"),
  "vbarm": translate("Vice barmästare", "Vice Bartender"),
  "pubm": translate("Pubmästare", "Head of Pubs"),
  "vpubm": translate("Vice pubmästare", "Vice Head of Pubs"),
  "hovm": translate("Hovmästare", "Maître D'guild"),
  "sangfm": translate("Sångförman", "Toastmaster"),
  "kokm": translate("Köksmästare", "Head chef"),
  "vkokm": translate("Vice köksmästare", "Sous chef"),
  "prefm": translate("Preferensmästare", "Preferences chef"),
  "olfm": translate("Ölförman", "Beer Boss"),
  "vinfm": translate("Vinförman", "Wine Warden"),
  "tappad": translate("TappaD", "Beer Boss in charge of Draft"),
  "sektkock": translate("Sektionskock", "Guild Cook"),
)

#let srd = (
  "name": translate("Studierådet", "The Student Council"),
  "ordf": translate("Studierådsordförande", "Head of the Student Council"),
  "vice_ordf": translate("Vice studierådsordförande", "Vice Head of the Student Council"),
  "sekr": translate("Studierådssekreterare", "Secretary of the Student Council"),
  "progledrep": translate("Programledningsrepresentant", "Student Representative of Program Management"),
  "instledrep": translate("Institutionsledningsrepresentant", "Student Representative of the Department Board"),
  "husrep": translate("Husrepresentant", "Student Representative of the House Board"),
  "arskursrep": translate("Årskursrepresentant", "Class Representative"),
)

#let cpu = (
  "name": translate("Centralprocessutskottet", "The Central Processing Unit"),
  "mastare": translate("Processmästare", "Head Processor"),
  "vice_mastare": translate("Vice Processmästare", "Subprocessor"),
  "dwwwansv": translate("DWWW-ansvarig", "Head of DWWW"),
  "root": translate("root", "root"),
  "utvecklare": translate("Utvecklare", "Developer"),
)

#let medalj = (
  "name": translate("Medeljelelekommitén", "The Honours Committee"),
  "mastare": translate("Øvermarskalk", "Master of Ceremonies"),
  "mdlm": translate("Medaljelelekommitémedlem", "Member of the Honours Committee"),
)

#let valb = (
  "name": translate("Valberedningen", "The Nomination Committee"),
  "ordf": translate("Valberedningens ordförande", "Head of the Nomination Committee"),
  "rep": translate("Valberedningsrepresentant", "Member of the Nomination Committee"),
)

#let tackm = (
  "name": translate("Tackmästeriet", "The Thanksgiving Committee"),
  "mastare": translate("Tackmästare", "Head of the Thanksgiving Committee"),
  "mdlm": translate("Tackmästerist", "Member of the Thanksgiving Committee"),
)

#let triv = (
  "name": translate("Trivselrådet", "The Student Well-being Committee"),
  "mastare": translate("Trivselmästare", "Head of Student Well-being"),
  "likbehombud": translate("Likabehandlingsombud", "Equal Opportunities Representative"),
  "skyddsombud": translate("Skyddsombud", "Student Safety Representative"),
  "varldsm": translate("Världsmästare", "World Master"),
)

#let otherpos = (
  "inspektor": translate("Inspektor", "Inspector"),
  "revisor": translate("Revisor", "Auditor"),
  "talman": translate("Talman", "Assembly speaker"),
  "jublegeneral": translate("Jubileumsgeneral", "Head of the Anniversary Committee"),
)

#let lth-symbols = (
  "asek": text(font: "LTH symbols", "A"),
  "dsek": text(font: "LTH symbols", "D"),
  "esek": text(font: "LTH symbols", "E"),
  "fsek": text(font: "LTH symbols", "F"),
  "ing": text(font: "LTH symbols", "H"),
  "isek": text(font: "LTH symbols", "I"),
  "ksek": text(font: "LTH symbols", "K"),
  "msek": text(font: "LTH symbols", "M"),
  "dokt": text(font: "LTH symbols", "O"),
  "tlth": text(font: "LTH symbols", "T"),
  "vsek": text(font: "LTH symbols", "V"),
  "wsek": text(font: "LTH symbols", "W"),
  "biif": text(font: "LTH symbols", "b"),
  "infocom": text(font: "LTH symbols", "C"),
  "helge": text(font: "LTH symbols", "h"),
  "lant": text(font: "LTH symbols", "l"),
  "td": text(font: "LTH symbols", "t"),
)
