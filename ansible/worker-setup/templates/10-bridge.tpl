{
        "cniVersion": "0.3.1",
        "name": "bridge",
        "type": "bridge",
        "bridge": "cnio0",
        "isGateway": true,
        "ipMasq": true,
        "ipam": {
            "type": "host-local",
            "ranges": [
            [{"subnet": "{{ terraform_subnet_id.stdout }}"}]
            ],
            "routes": [{"dst": "0.0.0.0/0"}]
        }
    }