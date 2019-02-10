import Danger
import Foundation
//import Yams 

 let danger = Danger()
 let allSourceFiles = danger.git.modifiedFiles + danger.git.createdFiles

 let changelogChanged = allSourceFiles.contains("CHANGELOG.md")
 let sourceChange = allSourceFiles.first(where: { $0.hasPrefix("Sources") })

if !changelogChanged && sourceChange != nil {
    warn("Something pretty bad, but not important enough to fail the build")
}

 //Ensure the CHANGELOG is right
//do {
//    let changelogYML = danger.utils.readFile("CHANGELOG.yml")
//    let loadedDictionary = try Yams.load(yaml: changelogYML) as? [String: Any]
//    // So that we don't accidentally copy & paste wrong
//    if let upcoming = loadedDictionary?["upcoming"] {
//        if upcoming is Array<Any> {
//            fail("Upcoming an array in the CHANGELOG")
//        }
//
//        // Deployments rely on this, to send info to reviewers
//        if upcoming is Dictionary<String, Any> {
//            let upcomingDict = upcoming as! Dictionary<String, Any>
//            if upcomingDict["user_facing"] == nil {
//                fail("There must be a `user_facing` section in the upcoming section of the CHANGELOG")
//            }
//        }
//    }
//} catch {
//    fail("The CHANGELOG is not valid YML")
//}

markdown("Free-form markdown that goes under the table, so you can do whatever.")

