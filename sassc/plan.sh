pkg_name=sassc
pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_version=3.6.1
pkg_source="https://github.com/sass/${pkg_name}/archive/${pkg_version}.tar.gz"
pkg_shasum=8cee391c49a102b4464f86fc40c4ceac3a2ada52a89c4c933d8348e3e4542a60
libsass_shasum=18d6e866ba2430cccae2551f384aca253a84592c692ce7146550f1d4f273b7d7
pkg_license=('MIT')
pkg_description='libsass command line driver'
pkg_upstream_url=https://github.com/sass/sassc
pkg_deps=(
  core/glibc
  core/gcc-libs
)
pkg_build_deps=(
  core/make
  core/gcc
  core/coreutils
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

do_download() {
  do_default_download
  download_file \
    "https://github.com/sass/libsass/archive/${pkg_version}.tar.gz" \
    "libsass.tar.gz" \
    "${libsass_shasum}"
}

do_verify() {
  do_default_verify
  verify_file \
    "libsass.tar.gz" \
    "${libsass_shasum}"
}

do_unpack() {
  do_default_unpack
  tar -xzf "${HAB_CACHE_SRC_PATH}/libsass.tar.gz" -C "${HAB_CACHE_SRC_PATH}"
}

do_build() {
  export SASS_LIBSASS_PATH="${HAB_CACHE_SRC_PATH}/libsass-${pkg_version}"
  echo "${pkg_version}" > "${HAB_CACHE_SRC_PATH}/sassc-${pkg_version}/VERSION"
  echo "${pkg_version}" > "${HAB_CACHE_SRC_PATH}/libsass-${pkg_version}/VERSION"
  make
}

do_install() {
  install -D ./bin/sassc "${pkg_prefix}/bin/sassc"
}
