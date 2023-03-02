import UIKit

var database = [
            Message(id: "0", contents: ["Привет"], owner: .bot, options: [
            .init(key: "1", value: "Привет"),
            Message(id: "1", contents: ["Приятно познакомиться."], options: [
                .init(key: "2", value: "Взаимно.")
            ]),
            Message(id: "2", contents: ["Давай я раскажу тебе подробнее о кодиче фискале, налоговом коде"], options: [.init(key: "3", value: "Окей")]),
            
            Message(id: "3", contents: ["Это уникальный идентификационный номер, используемый для уплаты налогов и получения доступа к множеству других услуг. \nХочешь узнать больше?"], options: [.init(key: "4", value: "Да, конечно.")]),
            
            Message(id: "4", contents: ["Например: с этим номером можно подписать трудовой договор или работать фрилансером. Оплатить подоходный налог. Открыть банковский счет в Италии. Получить доступ к системе здравоохранения. Получить итальянский номер мобильного телефона. Подписать договор на оплату коммунальных услуг или аренду имущества на срок более одного месяца."], options: [.init(key: "5", value: "Интересно.")]),
            
            Message(id: "5", contents: ["Как получить кодиче фискале?"], options: [.init(key: "6", value: "Действуй!")]),
            
            Message(id: "6", contents: ["Нужно обратиться в любой офис Agenzia delle Entrate, чтобы получить сертификат Сdice Fiscale, предварительно записавшись на прием онлайн. Мы поможем тебе с этим позже."], options: [.init(key: "7", value: "Давай продолжим.")]),

            Message(id: "7", contents: ["Теперь поговорим о документах. Во-первых, ты гражданин Европы?"], options: [.init(key: "8", value: "Да"), .init(key: "9", value: "Нет")]),
//          // 8.yes, 9. no
            Message(id: "8", contents: ["Тебе потребуются следующие документы: паспорт, подтверждение о поступлении, заявление на получение кодиче фискале на итальянском языке."], options: [.init(key: "10", value: "Понятно.")]),
                // yes
//          // NON-EU Citizen
            Message(id: "9", contents: ["Тебе потребуются следующие документы: паспорт, подтверждение о поступлении, заявление на получение кодичe фискале на итальянском языке и т. д."], options: [.init(key: "10", value: "Дальше, пожалуйста!")]),
                // no
//
//           //FOR BOTH
            Message(id: "10", contents: ["Хочешь знать, что дальше?"], options: [.init(key: "11", value: "Да, пожалуйста.")]),
//            // for Yes

//            INSTEAD ANOTHER TREE - WE SAY: if you don't have the form yet. Click and download.'

//            // FORM 12-13, 12-14 (for both)
//            Message(content: "Related to the form for Tax Code. Have you filled your form?", value: 12, options: ["yes", "no"]),
//            // yes 13
//
//            Message(content: "You're smart Cookie.", value: 13, options: []),
//            // yes -> bye
//
//            // To Download || show forms to download.
//            Message(content: "Choose your prefered language/s:", value: 14, options: ["en", "it", "es", "fr", "de"]),
//
//
            // Appointment - How do we redirect to the website?
            Message(id: "11", contents: ["Последний, но тем не менее важный вопрос. Ты уже записался на прием?"], options: [.init(key: "12", value: "Да"), .init(key: "13", value: "Нет")]),
            
            // yes - booked
            Message(id: "12", contents: ["Похоже, что всё готово. Желаю тебе удачи!"], options: [.init(key: "15", value: "Спасибо, пока.")]), // end of
                // yes
            
            //Bye - no
            Message(id: "13", contents: ["Мы поможем тебе забронировать дату и время онлайн."], options: [.init(key: "14", value: "Окей")]), // without option there is empty button (placeholder)
            Message(id: "14", contents: ["Сейчас ты будешь перенаправлен на сайт Agenzia delle Entrate. Желаю  удачи!"], options: [.init(key: "15", value: "Спасибо, пока!")]),
            // yes
            
            // END
            Message(id: "15", contents: ["Конец чата"], options: [])
        ]
