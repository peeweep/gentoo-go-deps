#!/bin/bash

if [[ x"${VENDORDIR}" != x"" ]]; then
  rm -rf go-mod
  if [[ -f go.work ]]; then
    go work vendor -modcacherw -o ${VENDORDIR}/vendor
  else
    go mod vendor -modcacherw -o ${VENDORDIR}/vendor
  fi
  tar --create --auto-compress --file /tmp/${P}-vendor.tar.xz ${VENDORDIR}/vendor
fi
