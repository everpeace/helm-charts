#! /bin/bash
set -xe
set pipefail

for d in $(\ls -1F | grep '/$' | grep -v docs/); do
  helm package $d
  mv ${d////}-*.tgz docs/
done

helm repo index docs --url https://everpeace.github.io/helm-charts
