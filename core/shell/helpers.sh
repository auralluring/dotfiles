# various helpers, mostly for writing scripts and especially dotfile-management scripts.

PKG_MANAGER_REFRESH=true
PKG_MANAGER_UPGRADE=

function pkg-install() {
    local pkgname=${1:?ERR ($0): helper function $FUNCNAME not given valid argument (name of package(s) to install)}
    case $PKG_MANAGER in [
	pacman )
	    $PACKAGE_MANAGER -S ${PKG_MANAGER_REFRESH:+-y}
    ] esac
}
