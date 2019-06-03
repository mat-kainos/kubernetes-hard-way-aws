[kthw-controller]
${kthw-controller_public_ip}

[kthw-worker-1]
${kthw-worker-1_public_ip}

[kthw-controller-priv]
${kthw-controller_private_ip}

[kthw-worker-1_priv]
${kthw-worker-1_private_ip}

[local]
127.0.0.1

[all:vars]
ansible_ssh_private_key_file = ${key_path}
ansible_ssh_user = ubuntu