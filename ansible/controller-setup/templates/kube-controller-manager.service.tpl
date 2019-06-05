[Unit]
Description=Kubernetes Controller Manager
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStart=/usr/local/bin/kube-controller-manager \
    --address=0.0.0.0 \
    --cluster-cidr={{ terraform_vpc_cidr.stdout }} \
    --cluster-name=kubernetes \
    --cluster-signing-cert-file=/var/lib/kubernetes/ca.pem \
    --cluster-signing-key-file=/var/lib/kubernetes/ca-key.pem \
    --leader-elect=true \
    --master=http://127.0.0.1:8080 \
    --root-ca-file=/var/lib/kubernetes/ca.pem \
    --service-account-private-key-file=/var/lib/kubernetes/ca-key.pem \
    --service-cluster-ip-range={{ terraform_subnet_cidr.stdout }} \
    --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
