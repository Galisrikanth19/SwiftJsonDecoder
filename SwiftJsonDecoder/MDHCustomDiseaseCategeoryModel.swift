//
//  MDHCustomDiseaseCategeoryModel.swift
//  SampleProject
//
//  Created by ELORCE INDUSTRIES PRIVATE LIMITED on 20/12/21.
//

import Foundation

struct MDHCustomDiseaseCategeoryModel: Codable {
    let status: Bool
    let data: [CustomDiseaseCategeoryModel]
    let message: String
}

struct CustomDiseaseCategeoryModel: Codable {
    let symptoms: [Symptom]?
    let events: [Event]?
    let archived, status, order: Int?
    let id, title: String?
    let v: Int?
    let created: String?
    
    enum CodingKeys: String, CodingKey {
        case symptoms
        case archived, status, order, events
        case id = "_id"
        case title
        case v = "__v"
        case created
    }
}

struct Event: Codable {
    let id, doctorLookupID, title, categoryName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case doctorLookupID = "doctor_lookup_id"
        case title
        case categoryName = "category_name"
    }
}

struct Symptom: Codable {
    var alarmMax: String?
    var alarmMin: String?
    var highLabel: String?
    var lowLabel: String?
    var unit: String?
    var step, max, min: Int?
    var graphType: String?
    var type: Int?
    var title: String?
    var id: String?
    var doctorLookupID: String?
    var category: String?
    var options: [String]?

    enum CodingKeys: String, CodingKey {
        case alarmMax = "alarm_max"
        case alarmMin = "alarm_min"
        case type
        case highLabel = "high_label"
        case lowLabel = "low_label"
        case unit
        case step, max, min
        case graphType
        case title
        case id
        case doctorLookupID = "doctor_lookup_id"
        case category
        case options
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            alarmMax = try container.decode(String.self, forKey: .alarmMax)
            alarmMin = try container.decode(String.self, forKey: .alarmMin)
            highLabel = try container.decode(String.self, forKey: .highLabel)
            lowLabel = try container.decode(String.self, forKey: .lowLabel)
            
            step = try container.decode(Int.self, forKey: .step)
            max = try container.decode(Int.self, forKey: .max)
            min = try container.decode(Int.self, forKey: .min)
            
            graphType = try container.decode(String.self, forKey: .graphType)
            title = try container.decode(String.self, forKey: .title)
            id = try container.decode(String.self, forKey: .id)
            doctorLookupID = try container.decode(String.self, forKey: .doctorLookupID)
            category = try container.decode(String.self, forKey: .category)
            options = try container.decode([String].self, forKey: .options)
            
            type = try Int(container.decode(String.self, forKey: .type))
        } catch DecodingError.typeMismatch {
            type = try container.decode(Int.self, forKey: .type)
        }
        catch {
            
        }
        
    }
}
