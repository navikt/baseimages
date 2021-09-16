#!/usr/bin/env sh

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable

home_dir="${1:-/app}"

mkdir -p "${home_dir}"

. /etc/os-release

if [ "${ID}" = "alpine" ]; then
  echo "Adding user and group with addgroup/adduser on alpine"
  addgroup -S --gid 1069 apprunner
  adduser --system --uid 1069 --ingroup apprunner --home "${home_dir}" apprunner
elif [ "$(command -v groupadd)" ]; then
  echo "Adding user and group with groupadd/useradd"
  groupadd -S --gid 1069 apprunner
  useradd --system --home-dir "${home_dir}" --uid 1069 --gid apprunner apprunner
else
  echo "Don't know how to add user/group!!!"
  exit 1
fi

chown -R apprunner "${home_dir}"
chown -R apprunner /init-scripts
chown apprunner /run-*.sh
