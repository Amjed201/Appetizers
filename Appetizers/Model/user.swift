//
//  user.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 22/07/2025.
//

import SwiftUI

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
