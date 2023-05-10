locals {
  confbook_sample = "./sample.csv"
  sample_configuration_item_csv = local.confbook_sample
  sample_configuration_item     = csvdecode(file(local.sample_configuration_item_csv))
  sample_all                    = zipmap(local.sample_configuration_item[*].configuration_item, local.sample_configuration_item)
#  env_code                   = "development"
  env_code                   = "production"
  vars = {
    for k, v in local.sample_all :
    k => v[local.env_code]
  }
}

output "varfoo" {
  value = local.vars.VarFoo
}

output "varbar" {
  value = local.vars.VarBar
}