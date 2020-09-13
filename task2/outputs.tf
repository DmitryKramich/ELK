output "kibana" {
  value = "http://${google_compute_instance.ek-server.network_interface.0.access_config.0.nat_ip}:5601"
}

output "elasticsearch" {
  value = "http://${google_compute_instance.ek-server.network_interface.0.access_config.0.nat_ip}:9200/_cat/indices"
}

output "logstash-tomcat" {
  value = "http://${google_compute_instance.l-t-server.network_interface.0.access_config.0.nat_ip}:8080"
}
