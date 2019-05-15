# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example

# Make a note about contributors not in the organization
unless github.api.organization_member?('Fit Me', github.pr_author)
  message "@#{github.pr_author} is not a contributor yet"
end

# Skip Danger for work-in-progress PRs
if github.mr_title.include?("[WIP]") || github.mr_title.include?("WIP:")
  return
end

def filterFiles(files)
  return files.select { |f| f.end_with? ".swift" }
end

message "Make sure to test your changes before moving your ticket to Code review."

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("MR is classed as Work in Progress") if github.mr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big MR") if git.lines_of_code > 500

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{gitlab.branch_for_base}'/ }
  fail "Please rebase to get rid of the merge commits in this PR"
end

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# If these are all empty something has gone wrong, better to raise it in a comment
if git.modified_files.empty? && git.added_files.empty? && git.deleted_files.empty?
  fail "This MR has no changes at all, this is likely an issue during development."
end

touched_paths.each do |p|
  next unless File.exist?(p)
  content = File.read(p)

  lines = content.split("\n")
  lines.each_with_index do |line, index|
    # warn if there are any TODOs or Log.d left in the touched files
    warn("`TODO` comment left", file: p, line: index + 1) if line.downcase =~ /\/\/\s?todo/
    warn("`FIXME` comment left", file: p, line: index + 1) if line.downcase =~ /\/\/\s?fixme/
    warn("`Log` left", file: p, line: index + 1) if line.downcase =~ /\sLog.d\(@"/
  end
end


xcov.report(
   scheme: 'Fit Me',
   workspace: 'Fit Me.xcodeproj',
   minimum_coverage_percentage: 10
)