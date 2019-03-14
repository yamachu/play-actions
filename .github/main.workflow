workflow "on push to master" {
  on = "push"
  resolves = ["filter branch master"]
}

action "filter branch master" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "branch master"
}

workflow "hook user comment" {
  on = "issue_comment"
  resolves = ["start with r?"]
}

action "start with r?" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = ["issue_comment", "'r\? +@.*'"]
}
