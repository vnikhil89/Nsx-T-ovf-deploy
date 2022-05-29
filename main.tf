provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_user
  password       = var.vsphere_password

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_host" "host" {
  name          = var.host_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
# Deployment of VM from Remote OVF
resource "vsphere_virtual_machine" "vmFromRemoteOvf" {
  name             = var.ovf_name
  datacenter_id    = data.vsphere_datacenter.dc.id
  datastore_id     = data.vsphere_datastore.datastore.id
  host_system_id   = data.vsphere_host.host.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
 

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  num_cpus                   = 4
  memory                     = 1024 * 24

  network_interface {
    network_id = data.vsphere_network.network.id
  }
  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = var.ovf_path
    disk_provisioning         = "thin"
    ovf_network_map           = {"Network 1" = data.vsphere_network.network.id}
  }
  vapp {
    properties = {
      "nsx_hostname"           = var.vm_name,
      "nsx_ip_0"               = var.vm_ip,
      "nsx_netmask_0"          = var.vm_subnet,
      "nsx_gateway_0"          = var.vm_gateway,
      "nsx_domain_0"           = var.vm_fqdn,
      "nsx_ntp_0"              = var.vm_ntp,
      "nsx_dns1_0"             = var.vm_dns,
      "nsx_passwd_0"           = var.vm_password,
      "nsx_cli_passwd_0"       = var.vm_password,
      "nsx_cli_audit_passwd_0" = var.vm_password,
      "nsx_isSSHEnabled"       = "True",
      "nsx_allowSSHRootLogin"  = "True"
    }
  }
}