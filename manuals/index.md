---
 layout: default
 title:  User Manuals
---

## Environment Setup

  - [Development environment setup](./env.html): 

## Core Elements and Features

  - [Create an emulator: the overall flow](./overall_flow.html)
  - [IP address assignment](./ip_address.html)
  - [BGP Peering and Connecting to Real World](./bgp.html) 
  - [Node customization](./node.html): install software, add startup command, assign hostname, etc.
  - [Compilation](./compiler.html): generate emulation files (docker files)
  - [Internal Routing](./routing.html): IBGP and OSPF setup 
  - [Generating docker images for different platforms](./platform.html): support AMD and ARM platforms
  - [Adding custom containers](./custom_container.html)
  - [IP anycast]({{ site.example-url }}/internet/B24_ip_anycast/)
  - [Let outside machines join emulation]({{ site.example-url }}/basic/A03_real_world/)
  - [Visualization](./visualization.html): visualize the emulated Internet



## Components

  - [Component and Binding](./component.html): the design philosophy
  - [DNS Infrastructure](./components/dns.html)
  - [Public Key Infrastructure (PKI)](./ca.html): Set up a PKI inside the emulator.
  - [DHCP server]({{ site.example-url }}/internet/B20_dhcp/): Set up DHCP server on a network
  - [Botnet]({{ site.example-url }}/internet/B22_botnet/)
  - [Darknet (Tor)]({{ site.example-url }}/internet/B23_darknet_tor/)
  - [The Hosts file (add IP-hostname mappings)]({{ site.example-url }}/internet/B21_etc_hosts/):
    This example shows how to add ip-hostname mappings to the `/etc/hosts` file. With this,
    we can use hostnames instead of IP addresses.
  - [IPFS (InterPlanetary File System)]({{ site.example-url }}/internet/B26_ipfs_kubo):
    This example shows how to set up an IPFS file system in the emulator.
  - [IPFS Kubo](./kubo.html)


