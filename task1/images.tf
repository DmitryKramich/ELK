provider "google" {
  credentials = "terraform-admin.json"
  project     = var.project
  region      = var.region
}

# create server elasticsearch+kibana
resource "google_compute_instance" "ek_server" {
  name            = "ek"
  can_ip_forward  = true
  machine_type    = var.machine_type
  zone            = var.zone
  tags            = var.ek_server_tags 
  
  boot_disk {
    initialize_params {
	  size  = var.disk_size
	  type  = var.disk_type
	  image = var.images
    }
  }
  
  metadata_startup_script = file("elasticsearch+kibana.sh")
  
  network_interface {
	network    = var.network_custom_vpc
    subnetwork = var.subnetwork_custom_public
    access_config {}
  }
}

# create server logstash+tomcat
resource "google_compute_instance" "l_t_server" {
  name         = "l-t"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.l_t_server_tags

  boot_disk {
    initialize_params {
	  size  = var.disk_size
	  type  = var.disk_type
	  image = var.images
    }
  }
    metadata_startup_script = file("logstash+tomcat.sh")
	
  network_interface {
	network    = var.network_custom_vpc
    subnetwork = var.subnetwork_custom_public
	access_config {}
  }
}

