variable "project" {}

variable "region" {}

variable "zone" {}

variable "machine_type" {}

variable "disk_size" {}

variable "disk_type" {}

variable "images" {}

variable "student_name" {}

variable "external_ranges" {
	type = list
}

variable "external_http_ports" {
	type = list 
}

variable "ssh_external_ports" {
	type = list 
}

variable "elk_ports" {
	type = list
}

variable "internal_ranges" {
	type = list
}

variable "public_subnet" {}

variable "private_subnet" {}

variable "subnetwork_custom_public" {}

variable "subnetwork_custom_private" {}

variable "network_custom_vpc" {}

variable "elk_tags" {
	type    = list
}

variable "l_t_server_tags" {
	type    = list
}

variable "ek_server_tags" {
	type    = list
}
