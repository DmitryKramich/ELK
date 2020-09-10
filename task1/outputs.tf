output "elasticsearch-kibana" {
  value = "http://${google_compute_instance.ek_server.network_interface.0.access_config.0.nat_ip}:5601"
}
output "logstash-tomcat" {
  value = "http://${google_compute_instance.l_t_server.network_interface.0.access_config.0.nat_ip}:8080"
}