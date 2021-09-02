//
//  ProgramList.swift
//  TvGuide
//
//  Created by SaiKiran Panuganti on 30/08/21.
//


import Foundation

// MARK: - WelcomeElement
struct ProgramList: Codable {
    let channelID: String?
    var listings: [Listing]?

    enum CodingKeys: String, CodingKey {
        case channelID = "channelId"
        case listings
    }
}

// MARK: - Listing
struct Listing: Codable {
    let listingID, paID: String?
    let title, listingDescription: String?
    let localizedTitle, localizedDescription: Localized?
    let startTime, endTime: Int?
    let images: [Image]?
    let seasonNumber: Int?
    let programType: ProgramType?
    let listingGUID: String?
    let ratings: [Rating]?
    let year: Int?

    enum CodingKeys: String, CodingKey {
        case listingID = "listingId"
        case paID = "paId"
        case title
        case listingDescription = "description"
        case localizedTitle, localizedDescription, startTime, endTime, images, seasonNumber, programType
        case listingGUID = "listingGuid"
        case ratings, year
    }
    
    var startTimeInSec: Double {
        guard let startTime = startTime else { return 0 }
        return Double(startTime/1000)
    }
    
    var endTimeInSec: Double {
        guard let startTime = endTime else { return 0 }
        return Double(startTime/1000)
    }
    
    var duration: Int {
        guard let startTime = startTime, let endTime = endTime else { return 0 }
        return (endTime - startTime)/60000
    }
    
    var durationString: String {
        guard let startTime = startTime, let endTime = endTime else { return "" }
        let durInMin = (endTime - startTime)/60000
        let hours = durInMin/60
        let minutes = durInMin%60
        if hours >= 1{
            if minutes > 0 {
                return "\(hours) h \(minutes) min"
            }else {
                return "\(hours) h"
            }
        }else {
            return "\(minutes) min"
        }
    }
    
    func getSeasonAndDuration() -> String {
        let durString = durationString
        
        if let season = seasonNumber {
            let last2 = String(title?.suffix(2) ?? "")
            if let episodeNumb = Int(last2) {
                return "S \(season) E \(episodeNumb) | \(durString)"
            }else {
                return "S \(season) | \(durString)"
            }
        }else {
            return durString
        }
    }
}

// MARK: - Image
struct Image: Codable {
    let imageURL: String?
    let width, height: Int?

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case width, height
    }
}

enum ProgramType: String, Codable {
    case episode = "episode"
    case movie = "movie"
}

// MARK: - Rating
struct Rating: Codable {
    let scheme: Scheme?
    let rating: String?
}

enum Scheme: String, Codable {
    case urnWWWCitcGovSa = "urn:www.citc.gov.sa"
}





