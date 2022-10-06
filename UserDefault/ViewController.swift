//
//  ViewController.swift
//  UserDefault
//
//  Created by Даша Волошина on 30.09.22.
//
//Создать объект Person c полями pet(class Pet(У которого name(String) и ownerName(String))), name(String), surname(String). Сохранить на диск. Достать с диска и распечатать pet в консоль

import UIKit

class Pet {
    var petName: String
    var ownerName: String
    
    init(petName: String, ownerName: String) {
        self.petName = petName
        self.ownerName = ownerName
    }
    
}

class Person {
    var name: String
    var surname: String
    var pet: Pet
    init(name: String, surname: String, pet: Pet) {
        self.name = name
        self.surname = surname
        self.pet = pet
    }
    
 
}

class ViewController: UIViewController {

  var human = Person(name: "Garry", surname: "Potter", pet: Pet(petName: "Hedwig", ownerName: "Garry Potter"))
   
    override func viewDidLoad() {
        super.viewDidLoad()

//        UserDefaults.standard.set(human.name, forKey: "name")
//        UserDefaults.standard.set(human.surname, forKey: "surname")
//        UserDefaults.standard.set(human.pet.petName, forKey: "Petname")
//        UserDefaults.standard.set(human.pet.ownerName, forKey: "ownerName")
//        print(UserDefaults.standard.dictionaryRepresentation())
//
        if let petName = UserDefaults.standard.string(forKey: "Petname"),
           let ownerName = UserDefaults.standard.string(forKey: "ownerName"),
           let name = UserDefaults.standard.string(forKey: "name"),
           let surname = UserDefaults.standard.string(forKey: "surname"){
//
//
//
            let pet = Person(name: name, surname: surname, pet: Pet(petName: petName, ownerName: ownerName))
        
            print (pet.pet.petName)
            print (pet.pet.ownerName)
        }
    
    } 


}

