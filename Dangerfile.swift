import Danger

 let danger = Danger()
 let allSourceFiles = danger.git.modifiedFiles + danger.git.createdFiles

 let changelogChanged = allSourceFiles.contains("CHANGELOG.md")
 let sourceChange = allSourceFiles.first(where: { $0.hasPrefix("Sources") })

if !changelogChanged && sourceChange != nil {
    warn("Something pretty bad, but not important enough to fail the build")
}

markdown("Free-form markdown that goes under the table, so you can do whatever.")

