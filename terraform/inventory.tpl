[kthw-controller]
${kthw-controller_public_ip} ansible_python_interpreter=/usr/bin/python3

[kthw-worker-1]
${kthw-worker-1_public_ip} ansible_python_interpreter=/usr/bin/python3

[kthw-controller-priv]
${kthw-controller_private_ip} ansible_python_interpreter=/usr/bin/python3

[kthw-worker-1-priv]
${kthw-worker-1_private_ip} ansible_python_interpreter=/usr/bin/python3

[local]
127.0.0.1

[all:vars]
ansible_ssh_private_key_file = ${key_path}
ansible_ssh_user = ubuntu