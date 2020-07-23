pkg_name=envconsul
pkg_origin=core
pkg_version=0.9.2
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("MPL-2.0")
pkg_description="Launch a subprocess with environment variables using data from @HashiCorp Consul and Vault."
pkg_upstream_url=https://github.com/hashicorp/envconsul
pkg_source="https://releases.hashicorp.com/${pkg_name}/${pkg_version}/${pkg_name}_${pkg_version}_linux_amd64.zip"
pkg_shasum=bb9e9b786870dd19ef1ac9afebb37695da2f6d192a5320a351d6d398a29417a2
pkg_filename="${pkg_name}-${pkg_version}_linux_amd64.zip"
pkg_build_deps=(core/unzip)
pkg_bin_dirs=(bin)

do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  unzip "${pkg_filename}" -d "${pkg_name}-${pkg_version}"
}

do_build() {
  return 0
}

do_install() {
  install -D "${pkg_name}" "${pkg_prefix}/bin/${pkg_name}"
}
