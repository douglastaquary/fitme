import Danger


let danger = Danger()

let allSourceFiles = danger.git.modifiedFiles + danger.git.createdFiles

let changelogChanged = allSourceFiles.contains("CHANGELOG.md")

let sourcesChanges = allSourceFiles.first(where: { $0.hasPrefix("Sources") })

///PR is a work in progress and shouldn't be merged yet
if danger.github.pullRequest.title.contains("WIP") {
    warn("PR is classed as Work in Progress")
}

/// Warn when there is a big PR
if allSourceFiles.count > 500 {
    warn("Big PR, consider splitting into smaller")
}

///Mainly to encourage writing up some reasoning about the PR, rather than
///just leaving a title
if danger.github.pullRequest.body.count < 5 {
    warn("Big PR, consider splitting into smaller")
}

if !changelogChanged && sourcesChanges != nil {
    warn("No CHANGELOG entry added")
}

///If these are all empty something has gone wrong, better to raise it in a comment
if danger.git.modifiedFiles.isEmpty && danger.git.createdFiles.isEmpty && danger.git.deletedFiles.isEmpty {
    fail("This PR has no changes at all, this is likely an issue during development.")
}

///Leave a warning if Podfile changes
if danger.git.modifiedFiles.contains("Podfile") {
    warn("The `Podfile` was updated")
}

let hasAppChanges = !danger.git.modifiedFiles.filter({ $0.contains("Fit Me") }).isEmpty
let hasTestChanges = !danger.git.modifiedFiles.filter({ $0.contains("FitMeTests") }).isEmpty

// Loop through all new files, then
let swiftFilesWithCopyright = danger.git.createdFiles.filter {
    $0.fileType == .swift && danger.utils.readFile($0).contains("//  Created by")
}

if swiftFilesWithCopyright.count > 0 {
    let files = swiftFilesWithCopyright.joined(separator: ", ")
    warn("In Danger JS we don't include copyright headers, found them in: \(files)")
}

