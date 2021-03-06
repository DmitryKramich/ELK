# create VPC
resource "google_compute_network" "vpc_network" {
  name                    = "${var.student_name}-vpc"
  auto_create_subnetworks = false
  description             = "custom-vpc-network"
}

# create public subnet
resource "google_compute_subnetwork" "public" {
  name          = "public-subnet"
  ip_cidr_range = var.public_subnet
  network       = google_compute_network.vpc_network.id
  description   = "public-subnet in ${var.student_name}-vpc"
  region        = var.region
}

# create private subnet
resource "google_compute_subnetwork" "private" {
  name                     = "private-subnet"
  ip_cidr_range            = var.private_subnet
  network                  = google_compute_network.vpc_network.id
  description              = "private-subnet in ${var.student_name}-vpc"
  private_ip_google_access = true
  region                   = var.region
}

# create firewall rules
resource "google_compute_firewall" "external-http-port" {
  name    = "${var.student_name}-fw-http-lb"
  network = google_compute_network.vpc_network.id
  allow {
    ports    = var.external_http_ports
	protocol = "tcp"
  }
  target_tags   = var.elk_tags
  description   = "rule for http/https ports"
}

resource "google_compute_firewall" "external-ssh-port" {
  name    = "${var.student_name}-fw-ssh"
  network = google_compute_network.vpc_network.id
  allow {
    ports    = var.ssh_external_ports
	protocol = "tcp"
  }
  target_tags   = var.elk_tags
  description   = "rule for ssh port"
}

resource "google_compute_firewall" "elk-ports" {
  name    = "${var.student_name}-fw-int-elk"
  network = google_compute_network.vpc_network.id
  allow {
    ports    = var.elk_ports
	protocol = "tcp"
  }
  allow {
    protocol = "icmp"
  }
  target_tags   = var.elk_tags
  description   = "rule for conections to elk"
}

