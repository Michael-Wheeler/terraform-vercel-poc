terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.14"
    }
  }
}

# provider "vercel" {
#   api_token = var.vercel_api_token
#   #   team = var.vercel_team_id
# }

resource "vercel_project" "infra_test" {
  name      = "infra-test-project"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "Michael-Wheeler/vercel-infra-test"
  }
}

resource "vercel_deployment" "infra_test" {
  project_id = vercel_project.infra_test.id
  ref        = "nonprod"
}
