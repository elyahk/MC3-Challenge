extension ChatbotViewModel {
    static let mock: ChatbotViewModel = ChatbotViewModel(
        currentMessage: Message(id: "1", contents: ["Hello"], options: [.init(key: "2", value: "Hi")]),
        database: [
            Message(id: "1", contents: ["Hello"], options: [.init(key: "2", value: "Hi")]),
            Message(id: "2", contents: ["Nice to meet you.", "Let me tell you more about Tax Code (Codice Fiscale):"], options: [.init(key: "3", value: "Ok")]),
            Message(id: "3", contents: ["It's an unique identification number to be able to pay your tax and receive access to a variety of services. Do you want to know, more?"], options: [.init(key: "4", value: "yes")]),
            Message(id: "4", contents: ["For instance: Sign an employment contract or work as a freelancer. Pay Income Tax. Open bank account in Italy. Gain an access to, Health Care System. Obtain an Italian mobile phone number. Sign contract for utility bills. Rent property for more than one month."], options: [.init(key: "5", value: "Interesting")]),
            Message(id: "6", contents: ["How to obtain Codice Fiscale Certificate?"], options: [.init(key: "7", value: "Go for it")])
            
//            Message(content: "You can go to any office of the Italian Revenue Agency to get Tax Code Certificate or book appointment online. We will help you with it later, on.", value: 7, options: []),
            // Dowloand forms
            // Question are you ready -> doesn't matter of answer or... Just to click to trigger following question'
            // 1. Click once you are ready to walk you through the process.
            // 2. If you want download the required... - instead do you want yes/no
            
            //Let's talk about documents. First of all, are you EU-Citizen?
//            Message(content: "Tell me. Are you European Citizen?", value: 8, options: ["yes", "no"]),
//            // 9.yes, 11. no
//
//            Message(content: "You need these documents: *Passport, *Confirmation of Study, *Italian version of Form for Codice Fiscale", value: 9, options: []),
//            // yes
//
//            //FOR BOTH
//            Message(content: "Do you want to know what's next?", value: 10, options: ["yes"]),
//            // for Yes
//
//            // NON-EU Citizen
//            Message(content: "Non-EU (info for me:) You need these documents:", value: 11, options: ["Passport", "Confirmation of Study", "Italian version of Form for Codice, Fiscale", "What ever non-eu students needs"]),
//            // for yes
//
//            // JUMP into message10 repeat Message(content: "Do you want to know what's next?", value: 10, options: ["yes", "no"]), // for Yes,
//
//            // FORM 12-13, 12-14 (for both)
//            Message(content: "Related to the form for Tax Code. Have you filled your form?", value: 12, options: ["yes"]),
//            // yes 13
//
//            Message(content: "You're smart Cookie.", value: 13, options: []),
//            // yes -> bye
//
//
//            // To Download || show forms to download.
//            Message(content: "Choose your prefered language/s:", value: 14, options: ["en", "it", "es", "fr", "de"]),
//
//
//            // Appointment - How do we redirect to the website?
//            Message(content: "Last but not least. Do you already have your appointment?", value: 15, options: ["yes", "no"]),
//            // yes,no
//
//            //Bye - yes
//            Message(content: "Now you will be redirected to the website. Wish you a lot of luck.", value: 14, options: ["Thank you. Bye"]),
//            // yes
//
//
//            //Bye - no
//            Message(content: "Looks like, you are set. Wish you a lot of luck.", value: 14, options: ["Thank you. Bye"]),

            
            
            //
            //            .init(id: "1", content: "Hello", owner: .bot, options: [.init(key: "2", value: "Hi")]),
            //
            //            .init(id: "2", answerId: "3", content: "Hi 2", owner: .user),
            //
            //            .init(id: "3", content: "Appointment", owner: .bot, options: [.init(key: "4", value: "yes"), .init(key: "6", value: "no")]),
            //            .init(id: "4", answerId: "5", content: "Yes", owner: .user),
            //            .init(id: "5", content: "Form", owner: .bot),
            //            .init(id: "6", answerId: "7", content: "No", owner: .user),
            //            .init(id: "7", content: "Help", owner: .bot, options: [.init(key: "8", value: "Sure")]),
            //            .init(id: "8", content: "Sure", owner: .user, options: [.init(key: "8", value: "End")])
        ]
    )
}
