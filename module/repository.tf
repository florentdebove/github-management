resource "github_repository" "repository" {
   name         = var.reponame
   description  = "nom repository"

}

# Add a user to the organization
resource "github_membership" "newmember" {
  username = var.membername
  role     = "member"
}

resource "github_team" "newteam" {
    name = var.teamname
    privacy = "closed"
}

resource "github_team_membership" "addteammember" {
    team_id     = github_team.newteam.id
    username    = github_membership.newmember.username
    role = "member"
}

resource "github_team_repository" "addright" {
    team_id     = github_team.newteam.id
    repository  = github_repository.repository.name
    permission  = "push"
}

resource "github_branch_protection" "protection" {
    repository_id    = github_repository.repository.node_id

    pattern          = "main"
    enforce_admins   = true
    allows_deletions = true

    required_status_checks {
        strict   = true
    }

    
}
