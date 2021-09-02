//
//  Channel.swift
//  TvGuide
//
//  Created by SaiKiran Panuganti on 30/08/21.
//

import Foundation

// MARK: - ChannelList
class ChannelList: Codable {
    let txRef: String?
    var data: ChannelsData?

    init(txRef: String?, data: ChannelsData?) {
        self.txRef = txRef
        self.data = data
    }
}

// MARK: - DataClass
class ChannelsData: Codable {
    var channels: [Channel]?

    init(channels: [Channel]?) {
        self.channels = channels
    }
}

// MARK: - Channel
class Channel: Codable {
    let channelID: String?
    let guid, channelTitle, channelNumber: String?
    let stationURL: String?
    let category: [Category]?
    let channelImages: [ChannelImage]?
    let subscriptions: [Subscription]?
    let rights: Rights?
    let tuningURLs: TuningURLs?
    let visibility: Visibility?
    let audioQuality: [String]?
    var programList: [Listing]? = []

    init(channelID: String?, guid: String?, channelTitle: String?, channelNumber: String?, stationURL: String?, category: [Category]?, channelImages: [ChannelImage]?, subscriptions: [Subscription]?, rights: Rights?, tuningURLs: TuningURLs?, visibility: Visibility?, audioQuality: [String]?) {
        self.channelID = channelID
        self.guid = guid
        self.channelTitle = channelTitle
        self.channelNumber = channelNumber
        self.stationURL = stationURL
        self.category = category
        self.channelImages = channelImages
        self.subscriptions = subscriptions
        self.rights = rights
        self.tuningURLs = tuningURLs
        self.visibility = visibility
        self.audioQuality = audioQuality
    }
}

enum Category: String, Codable {
    case documentary = "Documentary"
    case education = "Education"
    case entertainment = "Entertainment"
    case islamic = "Islamic"
    case kids = "Kids"
    case movies = "Movies"
    case music = "Music"
    case news = "News"
    case sports = "Sports"
}

// MARK: - ChannelImage
class ChannelImage: Codable {
    let id: ID?
    let url: String?
    let width, height: Int?

    init(id: ID?, url: String?, width: Int?, height: Int?) {
        self.id = id
        self.url = url
        self.width = width
        self.height = height
    }
}

enum ID: String, Codable {
    case colour264X264 = "colour_264x264"
    case promo = "promo"
    case the176X176 = "176x176"
    case the264X264 = "264x264"
    case the80X60 = "80x60"
    case the88X88 = "88x88"
}

// MARK: - Rights
class Rights: Codable {
    let playLiveStream: Bool?
    let rewindBuffer, paListingBuffer: Int?
    let startOverBuffer: String?

    init(playLiveStream: Bool?, rewindBuffer: Int?, paListingBuffer: Int?, startOverBuffer: String?) {
        self.playLiveStream = playLiveStream
        self.rewindBuffer = rewindBuffer
        self.paListingBuffer = paListingBuffer
        self.startOverBuffer = startOverBuffer
    }
}

// MARK: - Subscription
class Subscription: Codable {
    let includedPackages: [SubscriptionGUID]?
    let subscriptionID: String?
    let subscriptionGUID: SubscriptionGUID?
    let subscriptionTitle: SubscriptionTitle?
    let subscriptionDescription: String?
    let currency: Currency?
    let amount, billingFrequency: Int?
    let localizedTitle, localizedDescription: Localized?
    let subscriptionUnit: SubscriptionUnit?
    let isBaseSubscription: Bool?

    enum CodingKeys: String, CodingKey {
        case includedPackages
        case subscriptionID = "subscriptionId"
        case subscriptionGUID, subscriptionTitle
        case subscriptionDescription = "description"
        case currency, amount, billingFrequency, localizedTitle, localizedDescription, subscriptionUnit, isBaseSubscription
    }

    init(includedPackages: [SubscriptionGUID]?, subscriptionID: String?, subscriptionGUID: SubscriptionGUID?, subscriptionTitle: SubscriptionTitle?, subscriptionDescription: String?, currency: Currency?, amount: Int?, billingFrequency: Int?, localizedTitle: Localized?, localizedDescription: Localized?, subscriptionUnit: SubscriptionUnit?, isBaseSubscription: Bool?) {
        self.includedPackages = includedPackages
        self.subscriptionID = subscriptionID
        self.subscriptionGUID = subscriptionGUID
        self.subscriptionTitle = subscriptionTitle
        self.subscriptionDescription = subscriptionDescription
        self.currency = currency
        self.amount = amount
        self.billingFrequency = billingFrequency
        self.localizedTitle = localizedTitle
        self.localizedDescription = localizedDescription
        self.subscriptionUnit = subscriptionUnit
        self.isBaseSubscription = isBaseSubscription
    }
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum SubscriptionGUID: String, Codable {
    case basePlusSubscription = "BASE_PLUS_SUBSCRIPTION"
    case baseSubscription = "BASE_SUBSCRIPTION"
    case entertainmentSubscription = "ENTERTAINMENT_SUBSCRIPTION"
    case fightSubscription = "FIGHT_SUBSCRIPTION"
}

// MARK: - Localized
class Localized: Codable {
    let ar: String?

    init(ar: String?) {
        self.ar = ar
    }
}

enum SubscriptionTitle: String, Codable {
    case entertainment = "Entertainment+"
    case fightSports = "Fight Sports"
    case jawwyPlus = "Jawwy Plus"
    case jawwyTV = "Jawwy TV"
}

enum SubscriptionUnit: String, Codable {
    case day = "day"
    case month = "month"
}

// MARK: - TuningURLs
class TuningURLs: Codable {
    let liveURL, catchUpURL, startOverURL: String?

    init(liveURL: String?, catchUpURL: String?, startOverURL: String?) {
        self.liveURL = liveURL
        self.catchUpURL = catchUpURL
        self.startOverURL = startOverURL
    }
}

enum Visibility: String, Codable {
    case visible = "visible"
}

