//
//  Utilities.swift
//  Nifty Time Tracker
//
//  Created by Iiro Alhonen on 04.02.21.
//

import Foundation

/// Returns a tuple of hours, minutes, seconds from seconds.
/// - Parameters:
///     - time: Int representing seconds
/// - Returns: Tuple (hours, minutes, seconds)
///
func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

/// Formats an given int into HH:MM:SS format.
/// - Parameters:
///     - time: Int representing seconds
///
func formattedTime(time: (Int, Int, Int)) -> String {
    let (hours, minutes, seconds) = time
    let hoursString = hours
    var minutesString = "00"
    if minutes < 10 {
        minutesString = "0\(minutes)"
    } else {
        minutesString = String(minutes)
    }
    var secondsString = "00"
    if seconds < 10 {
        secondsString = "0\(seconds)"
    } else {
        secondsString = String(seconds)
    }
    if hours >= 1 {
        return "\(hoursString):\(minutesString):\(secondsString)"
    } else {
        return "\(minutesString):\(secondsString)"
    }
}

func save(_ dataToBeSaved: [Project], forKey: String) {
    let KeyForUserDefaults = forKey
    let data = dataToBeSaved.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
}

func load(forKey: String) -> [Project] {
    let KeyForUserDefaults = forKey
    guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
        return []
    }

    return encodedData.map { try! JSONDecoder().decode(Project.self, from: $0) }
}
