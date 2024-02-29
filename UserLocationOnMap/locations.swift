//
//  locations.swift
//  UserLocationOnMap
//
//  Created by Abraham Morales Arroyo on 2/29/24.
//

import Foundation


struct locations: Codable, Equatable, Identifiable{
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
