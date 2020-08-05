terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "popa-org"

    workspaces {
      name = "tags-data-test"
    }
  }
}

data "external" "git_commit_author" {
  program     = ["/bin/bash", "-c", "echo \"{\\\"git_commit_author\\\":\\\"$(git log -1 | grep ^Author | cut -f 2 -d : | sed 's/^ //g')\\\"}\""]
  working_dir = path.root
}
