import Danger
import Foundation
import Yams

 let danger = Danger()

 let modified = danger.git.modifiedFiles

 let editedFiles = modified + danger.git.createdFiles //allSourceFiles.contains("CHANGELOG.md")
 message("These files have changed: \(editedFiles.joined())")


 markdown("Free-form markdown that goes under the table, so you can do whatever.")

