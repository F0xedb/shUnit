# Maintainer: Tom Meyers tom@pbfp.team
pkgname=shunit
pkgver=r18.0ccf95
pkgrel=1
pkgdesc="A basic unit testing framework for bash"
arch=(any)
url="https://github.com/F0xedb/shUnit"
_reponame="shUnit"
license=('GPL')

source=(
"git+https://github.com/F0xedb/shUnit.git")
md5sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    return 0;
}

package() {
        cd "$srcdir/$_reponame"
        install -Dm755 shunit "$pkgdir"/usr/bin/shunit
        install -Dm644 assert.sh "$pkgdir"/usr/bin/assert.sh
}
