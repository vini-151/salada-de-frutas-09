//
//  preview.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 10/10/25.
//
import FoundationModels
import Playgrounds

#Playground {
    
    let instructions = """
    
    Dê uma motivação num tom engraçado que motive o usuário

    """
    
    
    let session = LanguageModelSession(instructions: instructions)
    
    let result = try await session.respond(to: "Dê uma motivação muito curta para que uma pessoa conclua uma tarefa pendente")
    
    print(result.content)
}

