require 'gmail'

#define a fonction for Email et le password.
def send_email_line()
  #define a variable gmail.
  gmail = Gmail.connect("email","password")
  #define a variable email with a loop.
    email = gmail.deliver do
      to ws
      subject "Présentation The hacking poject"
      html_part do
        content_type'text/html; charset=UTF8'
        body send_email_text
      end
  end
  #show email acount loggin.
  puts gmail.logged_in?
  #desconnecte after work.
  gmail.logout
end
#define fonction for the texte.
def send_email_text(cities)
#text a return
  return"<h2>Bonjour</h2>
  <p>Je m'appelle Charles Dacquay, je suis co-fondateur de lorganisme The Hacking Project qui propose une formation de dévelopeur web gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau.<br> Voici le lien de la formation s'appelle The Hacking Project (http://thehackingproject.org/).<br> la foramtion des baser sur la méthode du peer-learning : les étudiants sont répartie en petit groupes ou nous leur proposons la réaliation de projets concrets qui leur sont assignés chaque jours, sur lesquel ils travaillent et cherches des solution . Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.</p>
  <p>Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{cities}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.<br> Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{cities} !</p>
  <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
end

#define a fonction email list
def list_email()
session = GoogleDrive::Session.from_config("config.json")
ws = session.spreadsheet_by_key("1v7XEnpGDtgjgRom3bp7OwzaK99zlUQIfKuW3QdawXBc").worksheets[0]
#define a lopp with each for the spreadsheet.
(1..w_sheet.num_rows).each do |list|
		mail = ws[list, 2]
		city = ws[list, 1]
    list_email("email","password",mail, city)
 end
end
#call the fonction send email.
send_email_line()
