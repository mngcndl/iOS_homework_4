//
//  CharacterAPI.swift
//  Homework4
//
//  Created by Liubov on 03.07.2023.
//

import Foundation
class CharacterAPI{
    static func getCharacters() -> [Character] {
        let characters = [
            Character(id: 0, name: "First", status: Character.Status.unknown, species: "unknown species", gender: Character.Gender.unknown, location: "some location", image: "no image yet"),
            Character(id: 1, name: "First", status: Character.Status.unknown, species: "unknown species", gender: Character.Gender.unknown, location: "some location", image: "no image yet"),
            Character(id: 2, name: "First", status: Character.Status.unknown, species: "unknown species", gender: Character.Gender.unknown, location: "some location", image: "no image yet")
        ]
        return characters
    }
}
