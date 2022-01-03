#!/usr/bin/env sh

# See https://github.com/autozimu/LanguageClient-neovim/wiki/Java

server=/usr/share/java/jdtls

# copy the configuration folder to tmp to be writable
tmp_dir="$(mktemp -d /tmp/jdtls.XXXXX)"
cp -R "${server}"/config_linux "${tmp_dir}"
# and ensure that it is removed on exit
trap '{ rm -rf "${tmp_dir}"; }' EXIT

"${JAVA_HOME}"/bin/java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -Dlog.protocol=true \
    -Dlog.level=ERROR \
    -noverify -Xmx1G -XX:+UseG1GC -XX:+UseStringDeduplication \
    -jar "${server}"/plugins/org.eclipse.equinox.launcher_1.*.jar \
    -configuration "${tmp_dir}"/config_linux \
    "$@"

