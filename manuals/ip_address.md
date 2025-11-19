---
 layout: default
 title:  IP Address Assignment
---

## Table of Contents 
{: .no_toc}

* will be replaced by ToC 
{:toc}

---

## Introduction

When creating an Internet emulator, we need to assign IP prefixes to networks and assign IP addresses to hosts. There are two methods to do this:

- automatic assignment (default): let the emulator decide the IP prefixes and addresses
- manual assignment: users have to provide IP prefixes and addresses



## Automatic IP Prefix/Address Assignment for Networks/Hosts

Inside the emulator, when we create a network or node (host or router),
default network prefix and IP address will be assigned to them. 
For networks inside an autonomous system or an Internet exchange, 
the default network prefix assignment uses the following scheme:

```
10.{asn}.{id}.0/24
```

The `asn` is the autonomous system number, and `{id}` is the nth network created. 
For example, for `AS150`, the first network is `10.150.0.0/24`, and the second one 
is `10.150.1.0/24`. For Internet exchanges, the `{id}` part is always `0`.
For example, the default prefix of `IX100` is `10.100.0.0/24`.


When a node is added to a network, the IP address for the host
is assigned with `AddressAssignmentConstraint`.
The default constraints are as follow:

- Host nodes: from 71 to 99
- Router nodes: from 254 to 200
- Router nodes in internet exchange: ASN

For example, in AS-150, if a host node joins a local network, its IP address
will be `10.150.0.71`; the next host joining the network will have IP address
`10.150.0.72`. If a router joins a local network, its IP address will be
`10.150.0.254`, and if the router joins an internet exchange network (say
IX100), its IP will be `10.100.0.150`.



## Manual Prefix Assignment for Networks

If the autonomous system number is greater than 255, the default network prefix assignment will not work. We need to explicitly set the network prefix when creating a network. See the following examples:


```python
# For the network in Internet exchanges
base.createInternetExchange(asn = 33108, prefix = '206.81.80.0/23')

# For the network in autonomous system
as350 = base.createAutonomousSystem(350)
as350.createNetwork(name='net0', prefix = '128.230.0.0/16')
```


## Manual IP addresses Assignment for Hosts

The automatic IP address assignment for hosts does not work in certain situations. For example, if the ASN is 350, when its BGP router joins a network in an Internet exchange (say IX100), it cannot use the automatic  assignment, because according to the assignment scheme, the IP address would be `10.100.0.350`, which is not a valid IP address. The `joinNetwork` API does take an `address` argument, allowing users to explicitly provide an IP address: 

```python
as350.createRouter('router0').joinNetwork('net0').joinNetwork(netname='ix100', address='10.100.0.35')
```


## Implement Another Automatic Assignment Scheme

The actual automatic assignment scheme is implemented in the `AddressAssignmentConstraint` class. If you want to implement your own automatic assignment scheme, you can derive from this class (i.e., implement a subclass), and then implement your own assignment scheme inside the class. Both `createInternetExchange` and `createNetwork` accept the `aac` argument, which takes an instance of the `AddressAssignmentConstraint` class. By default, `aac` is set to `None`, so the default implementation class is used. 

