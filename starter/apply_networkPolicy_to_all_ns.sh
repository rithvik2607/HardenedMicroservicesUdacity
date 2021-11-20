#!bin/bash/ -e

for namespace in $(kubectl --kubeconfig kube_config_cluster.yml get namespaces -A -o json | jq -r '.items[].metadata.name'); do
    kubectl --kubeconfig kube_config_cluster.yml apply -f default-allow-all.yaml -n ${namespace}
done