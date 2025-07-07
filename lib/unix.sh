#!/bin/bash
#
# `lib/unix.sh`
#
# Copyright (C) 2025 Archetypum
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>
#
# `tum-bash` version:
#
declare VERSION="0.1"

#
# ANSI Color codes and text formating:
#
declare BLACK="\033[90m"
declare WHITE="\033[97m"
declare YELLOW="\033[93m"
declare ORANGE="\033[38;5;214m"
declare BLUE="\033[94m"
declare CYAN="\e[0;36m"
declare PURPLE="\033[95m"
declare GREEN="\033[92m"
declare RED="\033[91m"

declare BG_BLACK="\033[40m"
declare BG_RED="\033[41m"
declare BG_GREEN="\033[42m"
declare BG_ORANGE="\033[43m"
declare BG_BLUE="\033[44m"
declare BG_MAGENTA="\033[105m"
declare BG_CYAN="\033[46m"
declare BG_WHITE="\033[47m"

declare BOLD="\033[1m"
declare UNDERLINE="\033[4m"
declare REVERSED="\033[7m"
declare ITALIC="\033[3m"
declare CROSSED_OUT="\033[9m"
declare RESET="\033[0m"

#
# Supported Package Managers:
#
declare SUPPORTED_PMS=(
    "apt"                          # https://wiki.debian.org/Apt
    "apt-get"                      # https://manpages.debian.org/bookworm/apt/apt-get.8.en.html
    "apt-cache"                    # https://manpages.debian.org/bookworm/apt/apt-cache.8.en.html
    "apt-cdrom"                    # https://manpages.debian.org/bookworm/apt/apt-cdrom.8.en.html
    "apt-config"                   # https://manpages.debian.org/bookworm/apt/apt-config.8.en.html
    "apt-extracttemplates"         # https://manpages.debian.org/bookworm/apt-utils/apt-extracttemplates.1.en.html
    "apt-listchanges"              # https://manpages.debian.org/bookworm/apt-listchanges/apt-listchanges.1.en.html
    "apt-mark"                     # https://manpages.debian.org/bookworm/apt/apt-mark.8.en.html
    "apt-sortpkgs"                 # https://manpages.debian.org/bookworm/apt-utils/apt-sortpkgs.1.en.html
    "aptitude"                     # https://wiki.debian.org/Aptitude
    "aptitude-create-state-bundle" # https://manpages.debian.org/bookworm/aptitude-common/aptitude-create-state-bundle.1.en.html
    "aptitude-run-state-bundle"    # https://manpages.debian.org/bookworm/aptitude-common/aptitude-run-state-bundle.1.en.html
    "apk"                          # https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper
    "dnf"                          # https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html-single/managing_software_with_the_dnf_tool/index
    "dpkg"                         # https://wiki.debian.org/dpkg
    "guix"                         # https://guix.gnu.org/manual/en/html_node/Package-Management.html
    "homebrew"                     # https://brew.sh/
    "pkg"                          # https://man.freebsd.org/cgi/man.cgi?pkg
    "pkgin"                        # https://pkgin.net/
    "pkg_add"                      # https://man.openbsd.org/pkg_add
    "pkg_delete"                   # https://man.netbsd.org/pkg_delete.1
    "pkg_create"                   # https://man.netbsd.org/pkg_create.1
    "pkg_info"                     # https://man.netbsd.org/pkg_info.1
    "pacman"                       # https://wiki.archlinux.org/title/Pacman
    "yay"                          # https://aur.archlinux.org/packages/yay
    "pamac"                        # https://aur.archlinux.org/packages/pamac-aur
    "trizen"                       # https://packages.artixlinux.org/packages/galaxy/any/trizen/
    "portage"                      # https://wiki.gentoo.org/wiki/Portage
    "qi"                           # https://dragora.org/handbook/dragora-handbook.html#Introduction-to-Qi
    "slackpkg"                     # https://slackpkg.org/documentation.html
    "xbps"                         # https://docs.voidlinux.org/xbps/index.html
    "yum"                          # https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/deployment_guide/ch-yum
    "zypper"                       # https://documentation.suse.com/smart/systems-management/html/concept-zypper/index.html
    "zypper-log"                   # https://manpages.opensuse.org/Tumbleweed/zypper-log/zypper-log.8.en.html
)

#
# Supported Initialization systems:
#
declare SUPPORTED_INITS=(
    "sysvinit"   # https://wiki.gentoo.org/wiki/Sysvinit
    "openrc"     # https://wiki.gentoo.org/wiki/OpenRC
    "s6"         # https://skarnet.org/software/s6/
    "runit"      # https://smarden.org/runit/
    "systemd"    # https://systemd.io/
    "dinit"      # https://davmac.org/projects/dinit/
    "launchd"    # https://support.apple.com/guide/terminal/script-management-with-launchd-apdc6c1077b-5d5d-4d35-9c19-60f2397b2369/mac
)

#
# Supported UNIX distributions:
#
declare DEBIAN_BASED=(
    # The universal operating system.
    # <https://www.debian.org/>

    "debian" "ubuntu" "xubuntu" "linuxmint" "lmde" "trisquel" "devuan" "kali" "parrotos" "popos" "elementaryos"
    "mx" "antix" "crunchbag" "crunchbag++" "pureos" "deepin" "zorinos" "peppermintos" "lubuntu" "kubuntu" "wubuntu"
    "astra" "tails" "ututos" "ulteo" "aptosid" "canaima" "corel" "dreamlinux" "elive" "finnix" "gibraltar"
    "linex" "kanotix" "kurumin" "linspire" "maemo" "mepis" "vyatta" "solusos" "openzaurus" "cutefishos" "knoppix"
    "siduction" "psychos" "neptune" "doglinux" "armbian" "droidian" "mobian" "grml" "backbox" "blacklablinux" "mmabuntus"
    "galliumos" "linuxschools" "linuxliteos" "mythbuntu" "solydxk" "uberstudent" "q4os" "demolinux" "libranet" "omoikane"
    "eagle" "college" "blackrhino" "luinux" "bonzai" "oralux" "demudi" "brlspeak" "censornet" "bluewall" "antemium"
    "knoppel" "skolelinux" "natures" "debxpde" "catix" "brlix" "parsix" "b2d" "troppix" "ging" "zonecd" "archeos"
    "insigne" "dzongkha" "boss" "resulinux" "epidemic" "clonezilla" "inquisitor" "musix" "satux" "pelicanhpc" "minino"
    "avlinux" "tangostudio" "doudou" "saline" "rebellin" "rescatux" "forlex" "proxmox" "wmlive" "point" "tanglu"
    "openmediavault" "vyos" "steamos" "metamorphose" "robolinux" "whonix" "storm" "linuxin" "kinneret" "wienux" "olive"
    "hymera" "spezzos" "primtux" "rebeccablackos" "uninvention" "handy" "selks" "linuxbbq" "kwheezy" "volumio" "raspbian"
    "osmc" "pibang" "sparky" "exe" "semplice" "venenux" "descentos" "martiux" "turnkey" "privatix" "estrellaroja" "untangle"
    "blankon" "webconverger" "swecha" "myrinix" "thisk" "64studio" "gnewsense" "gparted" "pardus" "genieos" "2x" "taprobane"
    "paipix" "amber" "beatrix" "santafe" "userlinux" "sunwah" "erposs" "munjoy" "smartpeer" "euronode" "kalango" "overclockix"
    "danix" "aslinux" "sphinxos" "condorux" "indilinux" "morphix" "clusterix" "mockup" "nepalinux" "slotech" "gnustep" "freeducsup"
    "adamantix" "trx" "freeduc" "slix" "pequelin" "quantian" "shabdix" "defender" "phlak" "std" "zopix" "clusterknoppix" "beernix"
    "eduknoppix" "roslims" "knoppix64" "slynux" "kaella" "knosciences" "beafanatix" "snappix" "ogoknoppix" "penguinsleuth" "augustux"
    "julex" "vmknoppix" "insert" "evinux" "xarnoppix" "llgp" "pilot" "slavix" "linespa" "klustrix" "knoppixmame" "bioknoppix" "knopils"
    "las" "feather" "livux" "featherweight" "lamppix" "damnsmall" "biadix" "hikarunix" "luit" "arabbix" "youresale" "xandros" "bayanihan"
    "caixamagica" "squiggleos" "miko" "guadalinex" "max" "xfld" "helix" "gnix" "esun" "xevian" "voyager" "ozos" "lliurex" "edubuntu"
    "impi" "nubuntu" "fluxbuntu" "ufficiozero" "swift" "vast" "commodore" "ubuntuce" "tuquito" "kiwi" "gos" "ultimate" "symphony"
    "earos" "runtu" "abuledu" "baltix" "debris" "moonos" "caine" "superos" "mangaka" "cae" "monomaxos" "zentyal" "masonux" "asturix"
    "element" "gnacktrack" "xpud" "vinux" "okatux" "dreamstudio" "pear" "luniux" "bodhi" "hybryde" "iqunix" "ubuntudp" "ubuntukylin"
    "makulu" "lite" "linuxfx" "peachosi" "emmabuntus" "cub" "auroraos" "suriyan" "bella" "chaletos" "ubuntumate" "kxstudio" "salentos"
    "centrych" "chitwanix" "ubuntugnome" "ozunity" "redo" "biolinux" "leeenux" "superx" "snowlinux" "arios" "pinguy" "madbox" "ubuntupr"
    "jolios" "wattos" "nexentastor" "deft" "kuki" "remnux" "lxle" "karoshi" "ubunturescue" "easypeasy" "nova" "qimo" "zevenos" "progex"
    "bardlinux" "extix" "ulite" "maryan" "greenie" "opengeu" "sabily" "protech" "comfusion" "ubuntustudio" "artistx" "shift" "freespire"
    "arabian" "poseidon" "alinex" "gnoppix" "openlx" "dynebolic" "molinux" "apodio" "biglinux" "tilix" "imagicos" "pioneer" "ichthux"
    "klikit" "tupiserver" "geolivre" "dizinha" "ankur" "linuxlte" "esware" "progeny" "liis" "muriqui" "loco"
)

declare ARCH_BASED=(
    # A simple, lightweight distribution.
    # # <https://www.archlinux.org/>

    "arch" "artix" "manjaro" "endeavouros" "garuda" "parabola" "hyperbola" "archbang" "blackarch" "librewolf" "archlabs"
    "chakra" "archex" "archman" "arco" "bluestar" "chimeraos" "instantos" "kaos" "rebornos" "archhurd" "cyberos" "archcraft"
    "cachyos" "ctlos" "crystallinux" "msys2" "obarun" "parchlinux" "snal" "steamos3" "tearchlinux" "uboslinux" "linhes" "underground"
    "kdemar" "archie" "faunos" "firefly" "linuxgamers" "kahelos" "netrunner" "ctkarch" "bridge" "sonar" "poliarch" "antergos"
)

declare ALPINE_BASED=(
    # Small. Simple. Secure.
    # # <https://www.alpinelinux.org/>
    
    "alpine" "postmarket"
)

declare GENTOO_BASED=(
    # Welcome to Gentoo, a highly flexible, source-based Linux distribution.
    # <https://www.gentoo.org/>

    "gentoo" "argent" "pentoo" "funtoo" "calculate" "chromeosflex" "vidalinux" "knopperdisk" "gentoox" "sabayon" "chromiumos"
    "tinhatlinux" "ututo" "exgent" "flatcarlinux" "gentooplayer" "decibel" "liguros" "macaronilinux" "moccacinoos" "xenialinux"
    "redcorelinux" "porteuskiosk" "navynos" "ututo" "redwall" "papug" "toorox" "librete" "coreos" "shark" "zerahstar" "ibox"
    "gentooth" "mayix" "bicom" "bintoo" "phaeronix" "flash" "vlos" "systemrescue" "litrix" "iollix"
)

declare VOID_BASED=(
    # Void is a general purpose operating system, based on the monolithic Linux kernel.
    # <https://www.voidlinux.org/>

    "void" "argon" "shikake" "pristine" "projecttrident"
)

declare DRAGORA_BASED=(
    # Stable. Secure. Reliable.
    # <https://www.dragora.org/>

    "dragora"
)

declare SLACKWARE_BASED=(
    # The Slackware Linux Project.
    # <http://www.slackware.com/>

    "slackware" "root" "evilentity" "blin" "stux" "jolinux" "netwosix" "connochaet" "salix" "ultima" "slackintosh" "slamd64" "easys"
    "topologilinux" "truva" "draco" "slackel" "cdlinux" "kongoni" "sms" "linvo" "rubix" "drinou" "bearops" "rip" "livecdrouter"
    "porteus" "austrumi" "wifislax" "absolute" "bluewhite64" "howtux" "pqui" "voltalinux" "slampp" "zenwalk" "zencafe" "imagineos"
    "darkstar" "openlab" "runt" "buffalo" "mutagenix" "klax" "lg3d" "nimblex" "dvl" "arudius" "alixe" "parslinux" "wolvix" "tumix"
    "saxenos" "nonux" "whoppix" "freepia" "slax" "supergamer" "vector" "plamo" "sentryfirewall"
)

declare REDHAT_BASED=(
    # Red Hat is the leading provider of enterprise open source software solutions.
    # <https://www.redhat.com/>

    "rhel" "fedora" "mos" "rocky" "centos" "almalinux" "oraclelinux" "circlelinux" "clearos" "euleros" "nobara" "yellowdog" "bulinux"
    "elastix" "digantel" "nethserver" "baruwa" "stella" "asterisknow" "trixbox" "honeywall" "rockscluster" "smeserver" "tao" "niigata"
    "kondara" "laster5" "wow" "immunix" "startcom" "whitebox" "endian" "userful" "springdale" "holon" "superrescue" "lineox" "fermi"
    "scientific" "piebox" "wazobia" "tinysofa" "xos" "oeone" "planb" "voodoo" "medialab" "msc" "miracle" "hispafuentes" "mizi" "bluepoint"
    "redflag" "asianux" "cle" "linpus" "sot" "gelecek" "engarde" "thiz" "nuxone" "idms" "cool" "magic" "aurora" "lorma" "sulix" "ftosx"
    "hakin9" "opendesktop" "pingo" "freedows" "resala" "linare" "ingalum" "berry" "linuxxp" "atmission" "atomix" "nst" "ekaaty" "elpicx"
    "ezey" "korora" "olpc" "qubes" "bee" "fox" "dynasoft" "cpubuilders" "chapeau" "pidora" "hanthana" "fusion" "vortexbox" "ojuba" "mythdora"
    "asianlinux" "edulinux" "sci" "krud" "kore" "cobind" "happymac" "mylinux" "onet" "haansoft" "ezplanet" "rpmlive" "ares" "biobrew" "blag"
    "openna" "adios" "annyung" "linuxinstall" "phpsol" "aurox" "linuxplus" "jamd" "elx" "openwall" "k12linux" "asp" "tfm" "merdeka"
    "trustix" "wibni" "hancom" "xteam"
)

declare OPENSUSE_BASED=(
    # The makers' choice for sysadmins, developers and desktop users.
    # <https://www.opensuse.org/>

    "opensuse" "suse" "geckolinux" "linuxkamarada" "united" "kmlinux" "sunjds" "urix" "sle" "karamad" "jacklab" "stresslinux"
)

declare GUIX_BASED=(
    # A complete GNU operating system harnessing all the capabilities of the Guix software. Spawned bu Guix itself.
    # <https://guix.gnu.org/>

    "guix"
)

declare FREEBSD_BASED=(
    # FreeBSD is an operating system used to power modern servers, desktops, and embedded platforms.
    # <https://www.freebsd.org/>

    "freebsd" "midnightbsd" "ghostbsd" "bastillebsd" "cheribsd" "dragonflybsd" "trueos" "hardenedbsd" "hellosystem" "picobsd" "nanobsd"
    "truenas" "nomadbsd" "clonos" "junosos" "xigmanas" "opnsense" "pfsense" "cellos" "orbisos" "zrouter" "ulbsd" "ravynos" "freenas"
    "fireflybsd" "freesbie" "desktopbsd" "frenzy" "rofreesbie" "ging" "triance" "gulicbsd" "monowall" "pcbsd" "nas4free" "bsdrp"
)

declare OPENBSD_BASED=(
    # Only two remote holes in the default install, in a heck of a long time!
    # <https://www.openbsd.org/>

    "openbsd" "adj" "libertybsd" "bitrig" "bowlfish" "ekkobsd" "embsd" "fabbsd" "fuguita" "marbsd" "microbsd" "commixwall" "bsdanywhere"
    "miros" "olivebsd" "psygnat" "quetzal" "sonafr" "hyperbolabsd" "aeriebsd" "anonymos" "utmfw" "gnobsd"
)

declare NETBSD_BASED=(
    # NetBSD is a free, fast, secure, and highly portable Unix-like Open Source operating system.
    # <https://www.netbsd.org/>

    "netbsd" "blackbsd" "edgebsd" "seos" "os108" "jibbed" "fdgw" "g4u" "irbsd" "smolbsd"
)

declare SOLARIS_ILLUMOS_BASED=(
    # Oracle Solaris is the trusted business platform that you depend on. Oracle Solaris gives you consistent compatibility, is simple to use, and is designed to always be secure.
    # <https://www.oracle.com/solaris/solaris11/>
    #
    # Unix OS which provides next-generation features for downstream distros, including advanced system debugging, next generation filesystem, networking, and virtualization options. 
    # <https://www.illumos.org/>

    "solaris" "illumos" "opensolaris" "openindiana" "omnios" "tribblix" "smartos" "nexenta" "belenix" "milax" "nexentasor" "schillix"
    "xstreamos"
)

declare MACOS_BASED=(
    # If you can dream it, Mac can do it.
    # <https://www.apple.com/macos>

    "macos" "darwin" "xnu"
)

function is_debian_based()
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_arch_based()
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_alpine_based()
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_gentoo_based()
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_void_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_dragora_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_slackware_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_redhat_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_guix_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_freebsd_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_openbsd_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_netbsd_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function is_solaris_illumos_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function macos_based
{
    local base_distro
    local distro="${1,,}"
    shift

    for base_distro in "$@"; do
        if [[ "$distro" == "$base_distro" ]]; then
            return 0
        fi
    done

    return 1
}

function get_user_distro()
{	
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo "$ID"
    else
        echo -e "${RED}[!] Error: Cannot detect distribution from /etc/os-release.${RESET}"
        read -rp "[==>] Write your OS name yourself: " ID
        echo "$ID"
	fi
}

function get_init_system
{
    if [[ -d "/run/systemd/system" ]] || [[ "$(get_pid1_comm)" == "systemd" ]]; then
        echo "systemd"
        return
    fi

    if [[ -d "/etc/init.d" ]] && [[ -e "/etc/init.d/openrc" ]]; then
        echo "openrc"
        return
    fi

    if [[ -d "/etc/init.d" ]]; then
        echo "sysvinit"
        return
    fi

    if [[ -d "/etc/s6" ]]; then
        echo "s6"
        return
    fi

    if [[ -d "/etc/runit" ]]; then
        echo "runit"
        return
    fi

    if [[ "$(get_pid1_comm)" == "dinit" ]]; then
        echo "dinit"
        return
    fi

    if [[ "$(get_pid1_comm)" == "launchd" ]]; then
        echo "launchd"
        return
    fi

    echo "unknown"
}

function get_pid1_comm
{
    local COMM
    COMM=$(ps -p 1 -o COMM= 2>/dev/null)
    echo "${COMM}"
}

function clear_screen
{
    local CLEAR_COMMAND="clear"

    $CLEAR_COMMAND
}

function prompt_user()
{
    local PROMPT="$1"
    local DEFAULT="${2:-N}"
    local USER_INPUT

    read -rp "$PROMPT (y/n): " USER_INPUT
    USER_INPUT="${USER_INPUT,,}"
    USER_INPUT="${USER_INPUT##+([[:space:]])}"
    USER_INPUT="${USER_INPUT%%+([[:space:]])}"

    if [[ -z "$USER_INPUT" ]]; then
        USER_INPUT="${DEFAULT,,}"
    fi

    if [[ "$USER_INPUT" =~ ^(y|ye|yes)$ ]]; then
        return 0
    elif [[ "$USER_INPUT" =~ ^(n|no)$ ]]; then
        return 1
    fi

    return 1
}

function check_privileges()
{
    local UID_VALUE="$EUID"

    if [[ "$UID_VALUE" -eq 0 ]]; then
        return
    else
        echo -e "${RED}[!] Error: This script requires root privileges to work.${RESET}"
        exit 1
    fi
}
