---
 layout: default
 title:  User Manuals
---


## Core Elements

  - [Create an emulator: the overall flow](./overall_flow.html)
  - [IP address assignment](./ip_address.html)
  - [BGP routers and Peering](./bgp.html) 
  - [Routing](./routing.html) 
  - [Node customization](./node.html): install software, add startup command, 
           assign hostname, etc.
  - [Visualization](./visualization.html): visualize the emulated Internet
  - [Compilation](./compiler.html): generate emulation files (docker files)
  - [Docker image](./docker.html): generate images for AMD and ARM platforms, 
           use custom images 


## Components

  - [Component and Binding](./component.html): bind virtual nodes in component 
           to physical nodes, filters 
  - [DNS Infrastructure](./components/dns.html)
  - [Public Key Infrastructure (PKI)](./ca.md): Set up a PKI inside the emulator.
  - [DHCP server](../../../examples/internet/B20_dhcp/)
  - [Botnet](../../../examples/internet/B22_botnet/)
  - [Darknet (Tor)](../../../examples/internet/B23_darknet_tor/)
  - [The Hosts file (add IP-hostname mappings)](../../../examples/internet/B21_etc_hosts/):
    This example shows how to add ip-hostname mappings to the `/etc/hosts` file. With this,
    we can use hostnames instead of IP addresses.
  - [IPFS (InterPlanetary File System)](../../../examples/internet/B26_ipfs_kubo):
    This example shows how to set up an IPFS file system in the emulator.
  - [IPFS Kubo](./kubo.md)

## Advanced Features

  - [Adding pre-built containers to emulator](./internet/adding_existing_container.html)
  - [Connect to the real world](../bgp.md#connect-to-realworld): Set up the BGP routing
    so the nodes inside the emulator can communicate with the real Internet.
  - [Allow outside machines to join the emulation](../../../examples/basic/A03_real_world/):
    This example shows how the outside machines (physical or virtual) can
    join the emulation via a layer-2 VPN.
  - [Support Apple Silicon machines (arm64)](../docker.md#platform): Generate emulator
    files for Apple Silicon machines.
  - [IP anycast](../../../examples/internet/B24_ip_anycast/)


## [Blockchain Emulator](./blockchain/index.html)

## Frequently Asked Questions (FAQ)
