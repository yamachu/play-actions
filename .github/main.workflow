workflow "on push to master" {
  on = "push"
  resolves = ["filter head"]
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
  args = ["issue_comment", "'r\\? +@.*'"]
}

action "cat event" {
  uses = "actions/bin/sh@master"
  needs = ["filter branch master"]
  args = ["cat $GITHUB_EVENT_PATH"]
}

action "filter head" {
  uses = "actions/bin/filter@master"
  needs = ["cat event"]
  args = "ref refs/heads/master"
}
