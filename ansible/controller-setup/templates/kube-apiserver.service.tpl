[Unit]
Description=Kubernetes API Server
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStart=/usr/local/bin/kube-apiserver \
        --admission-control=NamespaceLifecycle,NodeRestriction,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota \
        --advertise-address={{ master_priv_ip }} \
        --allow-privileged=true \
        --apiserver-count=3 \
        --audit-log-maxage=30 \
        --audit-log-maxbackup=3 \
        --audit-log-maxsize=100 \
        --audit-log-path=/var/log/audit.log \
        --authorization-mode=Node,RBAC \
        --bind-address=0.0.0.0 \
        --client-ca-file=/var/lib/kubernetes/ca.pem \
        --enable-swagger-ui=true \
        --etcd-cafile=/var/lib/kubernetes/ca.pem \
        --etcd-certfile=/var/lib/kubernetes/kubernetes.pem \
        --etcd-keyfile=/var/lib/kubernetes/kubernetes-key.pem \
        --etcd-servers=https://{{ master_priv_ip }}:2379 \
        --event-ttl=1h \
        --experimental-encryption-provider-config=/var/lib/kubernetes/encryption-config.yaml \
        --insecure-bind-address=127.0.0.1 \
        --kubelet-certificate-authority=/var/lib/kubernetes/ca.pem \
        --kubelet-client-certificate=/var/lib/kubernetes/kubernetes.pem \
        --kubelet-client-key=/var/lib/kubernetes/kubernetes-key.pem \
        --kubelet-https=true \
        --runtime-config=api/all \
        --service-account-key-file=/var/lib/kubernetes/ca-key.pem \
        --service-cluster-ip-range={{ terraform_subnet_cidr.stdout }} \
        --service-node-port-range=30000-32767 \
        --tls-cert-file=/var/lib/kubernetes/kubernetes.pem \
        --tls-private-key-file=/var/lib/kubernetes/kubernetes-key.pem \
        --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
