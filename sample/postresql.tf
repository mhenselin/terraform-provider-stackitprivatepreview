resource "stackitprivatepreview_postgresflexalpha_instance" "ptlsdbsrv" {
  project_id      = var.project_id
  name            = "pgsql-example-instance"
  backup_schedule = "0 0 * * *"
  retention_days = 33
  flavor = {
    cpu = 2
    ram = 4
    node_type = "Single"
  }
  replicas = 1
  storage = {
    class = "premium-perf2-stackit"
    size  = 5
  }
  encryption = {
    #    key_id = stackit_kms_key.key.key_id
    #    keyring_id = stackit_kms_keyring.keyring.keyring_id
    key_id = var.key_id
    keyring_id = var.keyring_id
    key_version = var.key_version
    service_account = var.sa_email
  }
  network = {
    acl             = ["0.0.0.0/0", "193.148.160.0/19"]
    access_scope = "SNA"
  }
  version = 14
}

data "stackitprivatepreview_postgresflexalpha_instance" "datapsql" {
  project_id = var.project_id
  instance_id = "fbcf351a-97e8-47fd-ac09-8af044bb1248"
  region = "eu01"
}

output "sample_psqlinstance" {
  value = data.stackitprivatepreview_postgresflexalpha_instance.datapsql
}
