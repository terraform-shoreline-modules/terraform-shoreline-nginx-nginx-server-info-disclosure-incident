
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# NGINX Server Info Disclosure Incident
---

NGINX Server Info Disclosure Incident is a type of security issue where sensitive information about the server and its configuration is leaked or disclosed to unauthorized users or attackers. This could include information such as server version, modules, and other details that could be used to exploit vulnerabilities in the system. The disclosure of this information could compromise the security of the server and the data it handles, and could lead to potential security breaches. It is important to address this type of incident promptly to prevent any further damage and secure the server.

### Parameters
```shell
export SERVER_URL="PLACEHOLDER"
```

## Debug

### Verify the NGINX server version
```shell
nginx -v
```

### Check the NGINX configuration file
```shell
cat /etc/nginx/nginx.conf
```

### List enabled NGINX modules
```shell
nginx -V 2>&1 | grep modules
```

### Check the NGINX access log
```shell
tail -n 100 /var/log/nginx/access.log
```

### Check the NGINX error log
```shell
tail -n 100 /var/log/nginx/error.log
```

### Check NGINX server response headers
```shell
curl -I ${SERVER_URL}
```

## Repair

### Disable server signature: The server signature or header can be disabled in the NGINX configuration file to prevent the disclosure of sensitive server information.
```shell


#!/bin/bash



# Backup the original configuration file

sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak



# Remove server signature from the configuration file

sudo sed -i 's/server_tokens .*;/server_tokens off;/' /etc/nginx/nginx.conf



# Restart NGINX service to apply the changes

sudo systemctl restart nginx


```