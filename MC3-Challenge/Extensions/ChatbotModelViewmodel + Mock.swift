extension ChatbotViewModel {
    static let mock: ChatbotViewModel = ChatbotViewModel(
        currentMessage: Message(id: "1", contents: ["Hello"], options: [
            .init(key: "2", value: "Hi"),
            .init(key: "6", value: "Hi 2")
        ]),
        database: [
            Message(id: "1", contents: ["Hello"], options: [
                .init(key: "2", value: "Hi"),
//                .init(key: "6", value: "Hi 2")
            ]),
            Message(id: "2", contents: ["Nice to meet you.", "Let me tell you more about Tax Code (Codice Fiscale):"], options: [.init(key: "3", value: "Ok")]),
            
            Message(id: "3", contents: ["It's an unique identification number to be able to pay your tax and receive access to a variety of services. Do you want to know, more?"], options: [.init(key: "4", value: "yes")]),
            
            Message(id: "4", contents: ["For instance: Sign an employment contract or work as a freelancer. Pay Income Tax. Open bank account in Italy. Gain an access to, Health Care System. Obtain an Italian mobile phone number. Sign contract for utility bills. Rent property for more than one month."], options: [.init(key: "5", value: "Interesting")]),
            
            Message(id: "5", contents: ["How to obtain Codice Fiscale Certificate?"], options: [.init(key: "6", value: "Go for it")]),
            
            Message(id: "6", contents: ["You can go to any office of the Italian Revenue Agency to get Tax Code Certificate or book appointment online. We will help you with it later, on."], options: [.init(key: "7", value: "Ok"),
            
            Message(id: "7", contents: ["Now, let's talk about documents. First of all, are you European Citizen?"], options: [.init(key: "8", value: "yes"), .init(key: "9", value: "no")],
//            // 9.yes, 11. no
//
            Message(id: "8", contents: ["You need these documents: *Passport, *Confirmation of Study, *Italian version of Form for Codice Fiscale"], options: [.init(key: "10", value: "")],
//            // yes
//
//          // NON-EU Citizen
            Message(id: "9", contents: ["Non-EU (info for me:) You need these documents: Passport, Confirmation of Study, Italian version of Form for Codice, Fiscale, What ever non-eu students needs"], options: [.init(key: "10", value: "")],
            // no

//            //FOR BOTH
            Message(id: "10", contents: ["Do you want to know what's next?"], options: [.init(key: "11", value: "yes")]
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

        ]
    )
}


    // Dowloand forms
    // Question are you ready -> doesn't matter of answer or... Just to click to trigger following question'
    // 1. Click once you are ready to walk you through the process.
    // 2. If you want download the required... - instead do you want yes/no
