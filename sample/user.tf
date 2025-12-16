data "stackit_postgresflexalpha_user" "example" {
  project_id  = stackitalpha_postgresflexalpha_instance.ptlsdbsrv.project_id
  instance_id = stackitalpha_postgresflexalpha_instance.ptlsdbsrv.id
  user_id     = 1
}