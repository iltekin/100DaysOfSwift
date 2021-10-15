import UIKit

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2021)?.uppercased() ?? "unknown"
print("The album is \(album)")

enum WeatherTypes {
    case sun, cloud, rain, wind, snow
}

func weather(weather: WeatherTypes) -> String? {
    if weather == WeatherTypes.sun {
        return "I like it"
    } else {
        return nil
    }
}

weather(weather: WeatherTypes.wind)
