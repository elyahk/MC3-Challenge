import UIKit

var greeting = "Hello, playground"
import UIKit

var database = [
            Message(id: "0", contents: ["Salut"], owner: .bot, options: [
                .init(key: "1", value: "Salut")]),
            Message(id: "1", contents: ["Ravi de vous rencontrer."], options: [
                .init(key: "2", value: "Réciproquement.")
            ]),
            Message(id: "2", contents: ["Laissez-moi vous en dire plus sur le code fiscal, le code des impôts"], options: [.init(key: "3", value: "OK")]),
            
            Message(id: "3", contents: ["Il s'agit d'un numéro d'identification unique utilisé pour payer les impôts et accéder à une variété d'autres services. \nVoulez-vous en savoir plus?"], options: [.init(key: "4", value: "Oui bien sûr.")]),
            
            Message(id: "4", contents: ["Par exemple : avec ce numéro, vous pouvez signer un contrat de travail ou travailler en tant qu'indépendant. Payer l'impôt sur le revenu. Ouvrir un compte bancaire en Italie. Accédez au système de santé. Obtenez un numéro de téléphone mobile italien. Signez un contrat de paiement des services publics ou de la location pour une période de plus d'un mois."], options: [.init(key: "5", value: "Intéressant.")]),
            
            Message(id: "5", contents: ["Comment obtenir un code fiscal?"], options: [.init(key: "6", value: "loi!")]),
            
            Message(id: "6", contents: ["Vous devez vous rendre dans n'importe quel bureau de l'Agenzia delle Entrate pour obtenir une attestation du Cdice Fiscale, après avoir pris rendez-vous en ligne. Nous vous aiderons plus tard."], options: [.init(key: "7", value: "Nous allons continuer.")]),

            Message(id: "7", contents: ["Parlons maintenant des documents. Tout d'abord, êtes-vous un citoyen européen?"], options: [.init(key: "8", value: "Oui"), .init(key: "9", value: "Non")]),
//          // 8.yes, 9. no
            Message(id: "8", contents: ["Vous aurez besoin des documents suivants : passeport, confirmation d'admission, demande de codiche fiscale en italien."], options: [.init(key: "10", value: "Il est clair.")]),
                // yes
//          // NON-EU Citizen
            Message(id: "9", contents: ["Vous aurez besoin des documents suivants : passeport, attestation d'admission, demande de codice fiscale en italien, etc."], options: [.init(key: "10", value: "Plus loin, s'il vous plait!")]),
                // no
//
//           //FOR BOTH
            Message(id: "10", contents: ["Voulez-vous savoir quelle est la prochaine étape ?"], options: [.init(key: "11", value: "Oui s'il te plaît.")]),
//            // for Yes
//
            // Appointment - How do we redirect to the website?
            Message(id: "11", contents: ["Dernière question, mais néanmoins importante. Avez-vous déjà pris rendez-vous ?"], options: [.init(key: "12", value: "Oui"), .init(key: "13", value: "Non")]),
            
            // yes - booked
            Message(id: "12", contents: ["Il semble que tout soit prêt. Bonne chance!"], options: [.init(key: "15", value: "Merci salut.")]), // end of
                // yes
            
            //Bye - no
            Message(id: "13", contents: ["Nous vous aiderons à réserver votre date et votre heure en ligne."], options: [.init(key: "14", value: "d'accord, merci")]), // without option there is empty button (placeholder)
            Message(id: "14", contents: ["Vous allez maintenant être redirigé vers le site Web de l'Agenzia delle Entrate. Bonne chance!"], options: [.init(key: "15", value: "Merci salut!")]),
            // yes
            
            // END
            Message(id: "15", contents: ["Fin du chat"], options: [])
        ]
print(database)
