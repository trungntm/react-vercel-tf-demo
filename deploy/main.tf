terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "react-vercel-tf" {
  name      = "react-vercel-tf-demo"
  framework = "vite"
  team_id   = "trungtmnguyen"
  git_repository = {
    type = "github"
    repo = "trungntm/react-vercel-tf-demo"
  }
}

data "vercel_project_directory" "react-vercel-tf-demo-dir" {
  path = "../../react-vercel-tf-demo"
}

resource "vercel_deployment" "react-vercel-tf-deployment" {
  project_id  = vercel_project.react-vercel-tf.id
  files       = data.vercel_project_directory.react-vercel-tf-demo-dir.files
  path_prefix = "../../react-vercel-tf-demo"
  production  = true
}

resource "vercel_project_domain" "react-vercel-tf-domain" {
  project_id = vercel_project.react-vercel-tf.id
  domain     = "react-vercel-tf.vercel.app"
}