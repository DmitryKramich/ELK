project       = "compact-retina-288017"
region        = "us-central1"
zone          = "us-central1-c"
machine_type  = "custom-1-4608"
disk_type     = "pd-ssd"
disk_size     = 35
images        = "centos-cloud/centos-7"

#network options 
student_name          = "dk"
external_http_ports   = ["80","443","8080"]
ssh_external_ports    = ["22"]
external_ranges       = ["0.0.0.0/0"]
elk_ports             = ["5601","9200"]
internal_ranges       = ["10.2.0.0/24"]
public_subnet         = "10.2.1.0/24"
private_subnet        = "10.2.2.0/24"
l_t_server_tags       = ["logstash-tomcat"]
ek_server_tags        = ["elasticsearch-kibana"]
elk_tags             =  ["logstash-tomcat","elasticsearch-kibana"]

network_custom_vpc        = "dk-vpc"
subnetwork_custom_public  = "public-subnet"
subnetwork_custom_private = "private-subnet"
