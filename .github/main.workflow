workflow "on push to master" {
  on = "push"
  resolves = ["filter not deleted event"]
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

action "filter not deleted event" {
  uses = "actions/bin/filter@master"
  needs = ["cat event"]
  runs = "/github/workspace/.github/custom-filter.sh"
  args = "false"
  env = {
    CUSTOM_JQ_FILTER = ".deleted"
  }
}
