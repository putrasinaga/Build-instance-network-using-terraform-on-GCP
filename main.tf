provider "google" {
  project = "newserver-352107"
  region = "asia-southeast2"
}

resource "google_compute_network" "network-automated-with-terraform" {
    project = "newserver-352107"
    name = "network-automated-with-terraform"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnetwork-automated-with-terraform" {
    name = "subnetwork-automated-with-terraform"
    ip_cidr_range = "125.165.0.0/29"
    network = google_compute_network.network-automated-with-terraform.id
    region = "asia-southeast2"
  
}

resource "google_compute_instance" "instance-automated-with-terraform" {

    name =  "instance-automated-with-terraform"
    machine_type = "e2-micro"
    zone = "asia-southeast2-a"

    boot_disk {
    
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts-arm64"
      size = 10
    } 
}

network_interface {
  network = "default"
}
  
}


