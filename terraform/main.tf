terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_network" {
  name = "app_network"
}

resource "docker_container" "backend" {
  name  = "backend"
  image = "assessment01-backend:latest"
  ports {
    internal = 8282
    external = 8282
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = "assessment01-frontend:latest"
  ports {
    internal = 80
    external = 8080
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_container" "reverse_proxy" {
  name  = "reverse_proxy"
  image = "nginx"
  ports {
    internal = 80
    external = 80
  }

  volumes {
    host_path      = "/c/Users/NAVEEN JAGALI/pro/Assessment01/nginx/nginx.conf"  # Absolute path to the nginx.conf file
    container_path = "/etc/nginx/nginx.conf"     # Target path inside the container
    read_only      = true
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

