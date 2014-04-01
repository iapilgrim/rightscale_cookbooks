#
# Cookbook Name:: db_postgres
#
# Copyright RightScale, Inc. All rights reserved.
# All access and use subject to the RightScale Terms of Service available at
# http://www.rightscale.com/terms.php and, if applicable, other agreements
# such as a RightScale Master Subscription Agreement.

# Setup default values for database resource

rightscale_marker

node[:db][:version] = "9.3"
node[:db][:provider] = "db_postgres"

log "  Setting DB PostgreSQL version to #{node[:db][:version]}"

# Set PostgreSQL 9.1 specific node variables in this recipe.
#




case node[:platform]
when "ubuntu"
  log "not supported"
when "centos", "redhat"
  node[:app][:packages] = [
    "http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm"
  ]

else
  log "Unrecognized distro #{node[:platform]}, exiting "
end

node[:db_postgres][:server_packages_install] = value_for_platform(
  ["centos", "redhat"] => {
    "default" => [
      "postgresql93-libs",
      "postgresql93",
      "postgresql93-devel",
      "postgresql93-server",
      "postgresql93-contrib"
    ]
  },
  "default" => []
)

node[:db_postgres][:service_name] = value_for_platform(
  ["centos", "redhat"] => {
    "default" => "postgresql-9.3"
  }
)

# Platform specific attributes
case node[:platform]
when "centos", "redhat"
  node[:db_postgres][:confdir] = "/var/lib/pgsql/9.3/data"
  node[:db_postgres][:datadir] = "/var/lib/pgsql/9.3/data"
  node[:db_postgres][:bindir] = "/usr/pgsql-9.3/bin"
else
  raise "Platform '#{node[:platform]}' is not supported by this recipe."
end

# Time out value set for backup operation.
node[:db][:init_timeout] = "600"

# PostgreSQL specific commands for db_sys_info.log file
node[:db][:info_file_options] = [
  "pg_config --version",
  "cat #{node[:db_postgres][:datadir]}/postgresql.conf"
]
node[:db][:info_file_location] = node[:db_postgres][:datadir]
