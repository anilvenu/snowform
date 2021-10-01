terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.22.0"
    }
  }
}

provider "snowflake" {
  alias = "dmg_admin"
  role  = "DMG-D-D-SNW-APPADMIN"
}

resource "snowflake_database" "db" {
  provider = snowflake.dmg_admin
  name     = "D_DEMO_DB"
}

resource "snowflake_warehouse" "warehouse" {
  provider       = snowflake.dmg_admin
  name           = "DEMO_VWH"
  warehouse_size = "xsmall"
  auto_suspend = 60
}