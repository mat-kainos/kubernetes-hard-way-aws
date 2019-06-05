[Unit]
Description=etcd
Documentation=https://github.com/coreos

[Service]
ExecStart=/usr/local/bin/etcd \
    --name {{ host_name }} \
    --cert-file=/etc/etcd/kubernetes.pem \
    --key-file=/etc/etcd/kubernetes-key.pem \
    --peer-cert-file=/etc/etcd/kubernetes.pem \
    --peer-key-file=/etc/etcd/kubernetes-key.pem \
    --trusted-ca-file=/etc/etcd/ca.pem \
    --peer-trusted-ca-file=/etc/etcd/ca.pem \
    --peer-client-cert-auth \
    --client-cert-auth \
    --initial-advertise-peer-urls https://{{ master_priv_ip }}:2380 \
    --listen-peer-urls https://{{ master_priv_ip }}:2380 \
    --listen-client-urls https://{{ master_priv_ip }}:2379,http://127.0.0.1:2379 \
    --advertise-client-urls https://{{ master_priv_ip }}:2379 \
    --initial-cluster-token etcd-cluster-0 \
    --initial-cluster {{ host_name }}=https://{{ master_priv_ip }}:2380 \
    --initial-cluster-state new \
    --data-dir=/var/lib/etcd 
Restart=on-failure 
RestartSec=5

[Install]
WantedBy=multi-user.target