[kthw-controller]
${kthw-controller_public_ip}

[kthw-worker-1]
${kthw-worker-1_public_ip}

[kthw-controller-priv]
${kthw-controller_private_ip}

[kthw-controller-priv]
${kthw-controller_private_ip}

[all:vars]
ansible_ssh_private_key_file = ${key_path}
ansible_ssh_user = ubuntu