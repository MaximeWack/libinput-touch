# Maintainer: Maxime Wack <contact@maximewack.com>

pkgname=libinput-touch
pkgver=0.0.9
pkgrel=1
pkgdesc='Rich automations for touchpads and touchscreens'
arch=('any')
url='https://www.github.com/maximewack/${pkgname}'
license=('GPLv3')
depends=(
  'python'
  'python-libevdev'
  'libinput-tools'
)
makedepends=('git')
optdepends=('python-xlib: for per-application rules and screen rotation detection')
source=("${pkgname}::git+https://github.com/maximewack/${pkgname}.git#branch=touchscreen")
sha512sums=('SKIP')
install="${pkgname}.install"

backup=("etc/${pkgname}.conf")

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  make install "${pkgname}"
}

