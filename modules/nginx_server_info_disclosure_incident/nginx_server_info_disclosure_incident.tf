resource "shoreline_notebook" "nginx_server_info_disclosure_incident" {
  name       = "nginx_server_info_disclosure_incident"
  data       = file("${path.module}/data/nginx_server_info_disclosure_incident.json")
  depends_on = [shoreline_action.invoke_ngnix_config_backup]
}

resource "shoreline_file" "ngnix_config_backup" {
  name             = "ngnix_config_backup"
  input_file       = "${path.module}/data/ngnix_config_backup.sh"
  md5              = filemd5("${path.module}/data/ngnix_config_backup.sh")
  description      = "Disable server signature: The server signature or header can be disabled in the NGINX configuration file to prevent the disclosure of sensitive server information."
  destination_path = "/tmp/ngnix_config_backup.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_ngnix_config_backup" {
  name        = "invoke_ngnix_config_backup"
  description = "Disable server signature: The server signature or header can be disabled in the NGINX configuration file to prevent the disclosure of sensitive server information."
  command     = "`chmod +x /tmp/ngnix_config_backup.sh && /tmp/ngnix_config_backup.sh`"
  params      = []
  file_deps   = ["ngnix_config_backup"]
  enabled     = true
  depends_on  = [shoreline_file.ngnix_config_backup]
}

