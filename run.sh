#!/usr/bin/env bash
set -euo pipefail
sudo apt-get update
sudo apt-get install -y puppet-agent
PUPPET="$(command -v puppet || true)"
if [[ -z "$PUPPET" && -x /opt/puppetlabs/bin/puppet ]]; then PUPPET=/opt/puppetlabs/bin/puppet; fi
if [[ -z "$PUPPET" ]]; then echo "Puppet executable not found"; exit 1; fi
"$PUPPET" apply manifests/hello.pp
"$PUPPET" apply manifests/class.pp
"$PUPPET" apply -e "include labmodule" --modulepath=manifests/modules
"$PUPPET" apply -e "notify { upcase('hello puppet'): }"
"$PUPPET" apply -e "notify { String(length('PUPPET')): }"
"$PUPPET" apply -e "notify { join(['Devops', 'Puppet', 'Docker'], '-'): }"
echo "=== CREATED FILES ==="
cat /tmp/puppet-hello.txt
cat /tmp/puppet-class.txt
cat /tmp/puppet-module.txt
echo "RESULT: Puppet manifests, class, module and functions completed"
