//
//  preview.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 10/10/25.
//
import FoundationModels
import Playgrounds

#Playground {
    let session = LanguageModelSession()
    
    let result = try await session.respond(to: "Dê uma motivação muito curta para que uma pessoa conclua uma tarefa pendente, mas essa motivação deve ser de tom engraçado e humilhante")
    
    print(result.content)
}

