#!/usr/bin/env bash
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
# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

#
# Disable Unicode for speed:
#
LC_ALL="C"
LANG="C"

#
# `tum-bash` version:
#
readonly VERSION="1.2.4-stable"

#
# ANSI Color Codes:
#
readonly YELLOW="\033[93m"
readonly ORANGE="\033[38;5;214m"
readonly GREEN="\033[92m"
readonly RED="\033[91m"

#
# Supported Package Managers:
#
readonly SUPPORTED_PMS=(
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
readonly SUPPORTED_INITS=(
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
readonly DEBIAN_BASED=(
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

readonly ARCH_BASED=(
    # A simple, lightweight distribution.
    # # <https://www.archlinux.org/>

    "arch" "artix" "manjaro" "endeavouros" "garuda" "parabola" "hyperbola" "archbang" "blackarch" "librewolf" "archlabs"
    "chakra" "archex" "archman" "arco" "bluestar" "chimeraos" "instantos" "kaos" "rebornos" "archhurd" "cyberos" "archcraft"
    "cachyos" "ctlos" "crystallinux" "msys2" "obarun" "parchlinux" "snal" "steamos3" "tearchlinux" "uboslinux" "linhes" "underground"
    "kdemar" "archie" "faunos" "firefly" "linuxgamers" "kahelos" "netrunner" "ctkarch" "bridge" "sonar" "poliarch" "antergos"
)

readonly ALPINE_BASED=(
    # Small. Simple. Secure.
    # # <https://www.alpinelinux.org/>
    
    "alpine" "postmarket"
)

readonly GENTOO_BASED=(
    # Welcome to Gentoo, a highly flexible, source-based Linux distribution.
    # <https://www.gentoo.org/>

    "gentoo" "argent" "pentoo" "funtoo" "calculate" "chromeosflex" "vidalinux" "knopperdisk" "gentoox" "sabayon" "chromiumos"
    "tinhatlinux" "ututo" "exgent" "flatcarlinux" "gentooplayer" "decibel" "liguros" "macaronilinux" "moccacinoos" "xenialinux"
    "redcorelinux" "porteuskiosk" "navynos" "ututo" "redwall" "papug" "toorox" "librete" "coreos" "shark" "zerahstar" "ibox"
    "gentooth" "mayix" "bicom" "bintoo" "phaeronix" "flash" "vlos" "systemrescue" "litrix" "iollix"
)

readonly VOID_BASED=(
    # Void is a general purpose operating system, based on the monolithic Linux kernel.
    # <https://www.voidlinux.org/>

    "void" "argon" "shikake" "pristine" "projecttrident"
)

readonly DRAGORA_BASED=(
    # Stable. Secure. Reliable.
    # <https://www.dragora.org/>

    "dragora"
)

readonly SLACKWARE_BASED=(
    # The Slackware Linux Project.
    # <http://www.slackware.com/>

    "slackware" "root" "evilentity" "blin" "stux" "jolinux" "netwosix" "connochaet" "salix" "ultima" "slackintosh" "slamd64" "easys"
    "topologilinux" "truva" "draco" "slackel" "cdlinux" "kongoni" "sms" "linvo" "rubix" "drinou" "bearops" "rip" "livecdrouter"
    "porteus" "austrumi" "wifislax" "absolute" "bluewhite64" "howtux" "pqui" "voltalinux" "slampp" "zenwalk" "zencafe" "imagineos"
    "darkstar" "openlab" "runt" "buffalo" "mutagenix" "klax" "lg3d" "nimblex" "dvl" "arudius" "alixe" "parslinux" "wolvix" "tumix"
    "saxenos" "nonux" "whoppix" "freepia" "slax" "supergamer" "vector" "plamo" "sentryfirewall"
)

readonly REDHAT_BASED=(
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

readonly OPENSUSE_BASED=(
    # The makers' choice for sysadmins, developers and desktop users.
    # <https://www.opensuse.org/>

    "opensuse" "suse" "geckolinux" "linuxkamarada" "united" "kmlinux" "sunjds" "urix" "sle" "karamad" "jacklab" "stresslinux"
)

readonly GUIX_BASED=(
    # A complete GNU operating system harnessing all the capabilities of the Guix software. Spawned bu Guix itself.
    # <https://guix.gnu.org/>

    "guix"
)

readonly FREEBSD_BASED=(
    # FreeBSD is an operating system used to power modern servers, desktops, and embedded platforms.
    # <https://www.freebsd.org/>

    "freebsd" "midnightbsd" "ghostbsd" "bastillebsd" "cheribsd" "dragonflybsd" "trueos" "hardenedbsd" "hellosystem" "picobsd" "nanobsd"
    "truenas" "nomadbsd" "clonos" "junosos" "xigmanas" "opnsense" "pfsense" "cellos" "orbisos" "zrouter" "ulbsd" "ravynos" "freenas"
    "fireflybsd" "freesbie" "desktopbsd" "frenzy" "rofreesbie" "ging" "triance" "gulicbsd" "monowall" "pcbsd" "nas4free" "bsdrp"
)

readonly OPENBSD_BASED=(
    # Only two remote holes in the default install, in a heck of a long time!
    # <https://www.openbsd.org/>

    "openbsd" "adj" "libertybsd" "bitrig" "bowlfish" "ekkobsd" "embsd" "fabbsd" "fuguita" "marbsd" "microbsd" "commixwall" "bsdanywhere"
    "miros" "olivebsd" "psygnat" "quetzal" "sonafr" "hyperbolabsd" "aeriebsd" "anonymos" "utmfw" "gnobsd"
)

readonly NETBSD_BASED=(
    # NetBSD is a free, fast, secure, and highly portable Unix-like Open Source operating system.
    # <https://www.netbsd.org/>

    "netbsd" "blackbsd" "edgebsd" "seos" "os108" "jibbed" "fdgw" "g4u" "irbsd" "smolbsd"
)

readonly SOLARIS_ILLUMOS_BASED=(
    # Oracle Solaris is the trusted business platform that you depend on. Oracle Solaris gives you consistent compatibility, is simple to use, and is designed to always be secure.
    # <https://www.oracle.com/solaris/solaris11/>
    #
    # Unix OS which provides next-generation features for downstream distros, including advanced system debugging, next generation filesystem, networking, and virtualization options. 
    # <https://www.illumos.org/>

    "solaris" "illumos" "opensolaris" "openindiana" "omnios" "tribblix" "smartos" "nexenta" "belenix" "milax" "nexentasor" "schillix"
    "xstreamos"
)

readonly MACOS_BASED=(
    # If you can dream it, Mac can do it.
    # <https://www.apple.com/macos>

    "macos" "darwin" "xnu" "osx" "ios" "watchos" "tvos" "visionos"
)

is_based_on()
{
    distro="$1"
    shift
    distro=$(printf "%s" "$distro" | tr "A-Z" "a-z")
    for base in "$@"; do [ "$distro" = "$base" ] && return; done
    return 1
}

is_debian_based()          { is_based_on "$1" "${DEBIAN_BASED[@]}";          }
is_arch_based()            { is_based_on "$1" "${ARCH_BASED[@]}";            }
is_alpine_based()          { is_based_on "$1" "${ALPINE_BASED[@]}";          }
is_gentoo_based()          { is_based_on "$1" "${GENTOO_BASED[@]}";          }
is_void_based()            { is_based_on "$1" "${VOID_BASED[@]}";            }
is_dragora_based()         { is_based_on "$1" "${DRAGORA_BASED[@]}";         }
is_slackware_based()       { is_based_on "$1" "${SLACKWARE_BASED[@]}";       }
is_redhat_based()          { is_based_on "$1" "${REDHAT_BASED[@]}";          }
is_guix_based()            { is_based_on "$1" "${GUIX_BASED[@]}";            }
is_freebsd_based()         { is_based_on "$1" "${FREEBSD_BASED[@]}";         }
is_openbsd_based()         { is_based_on "$1" "${OPENBSD_BASED[@]}";         }
is_netbsd_based()          { is_based_on "$1" "${NETBSD_BASED[@]}";          }
is_solaris_illumos_based() { is_based_on "$1" "${SOLARIS_ILLUMOS_BASED[@]}"; }
is_macos_based()           { is_based_on "$1" "${MACOS_BASED[@]}";           }

get_user_distro()
{
    has()
    {
        command -v "$1" >/dev/null 2>&1
    }

    strip_name()
    {
        name="$1"
        name="${name#\"}"
        name="${name%\"}"
        name="${name#\'}"
        name="${name%\'}"
        printf "$name"
    }

    distro=
    os=$(uname -s)

    case "$os" in
        "Linux")
            if has lsb_release; then
                raw=$(lsb_release -sd)
                distro=$(strip_name "$raw")
            elif [ -d /system/app ] && [ -d /system/priv-app ]; then
                distro="Android"
            elif [ -f /etc/os-release ]; then
                while IFS="=" read -r key val; do
                    if [ "$key" = "PRETTY_NAME" ]; then
                        distro=$(strip_name "$val")
                        break
                    fi
                done < /etc/os-release
            fi
            ;;

        "Darwin")
            product_name=$(defaults read /System/Library/CoreServices/SystemVersion ProductName 2>/dev/null)
            case "$product_name" in
                *iPhone*|*iPad*|*iOS*)
                    distro="iOS"
                    ;;
                *)
                    distro="macOS"
                    ;;
            esac
            ;;

        "Haiku")
            distro=$(uname -sv)
            ;;

        "Minix" | "DragonFly" | "OpenBSD" | "FreeBSD")
            distro="$os"
            ;;
    esac

    [ -z "$distro" ] && {
        printf "[!] Error: cannot detect your distribution.\n";
        printf "[==>] Enter your OS: ";
        read -r distro;
    }

    printf "$distro"
}

get_init_system()
{
    init_comm=$(get_pid1_comm)

    [[ "$init_comm" == "systemd" ]] && {
        printf "systemd";
        return;
    }

    [[ -d "/etc/init.d" ]] && { 
        [[ -e "/etc/init.d/openrc" ]] && {
            printf "openrc";
            return;
        }; 
            printf "sysvinit";
            return;
        };
    
    [[ "$init_comm" == "s6-svscan" ]] && { 
        printf "s6";
        return;
    }

    [[ "$init_comm" == "runit" ]] && { 
        printf "runit";
        return;
    }

    [[ "$init_comm" == "dinit" ]] && {
        printf "dinit"; 
        return;
    }

    [[ "$init_comm" == "shepherd" ]] && {
        printf "shepherd";
        return;
    }

    [[ "$init_comm" == "launchd" ]] && {
        printf "launchd";
        return;
    }
    
    printf "unknown"
    return
}

get_pid1_comm()
{
    comm=$(ps -p 1 -o comm= 2>/dev/null)
    printf "$comm"
}

clear_screen()
{
    clear
}

prompt_user()
{
    shopt -s extglob
    
    prompt="$1" default="${2:-N}" user_input
    default="${default,,}"
    
    read -rp "$prompt (y/n) [${default^^}]: " user_input
    user_input="${user_input,,}"
    user_input="${user_input##+([[:space:]])}"
    user_input="${user_input%%+([[:space:]])}"
    
    [[ -z "$user_input" ]] && user_input="$default"
    [[ "$user_input" =~ ^(y|ye|yes)$ ]] && return 0
    [[ "$user_input" =~ ^(n|no)$ ]] && return 1
    
    return 1
}

check_privileges()
{
    [ "$EUID" -ne 0 ] && { 
        printf "${RED}[!] Root privileges not present.${RESET}\n"; 
        return 1;
    } || {
        printf "${GREEN}[*] Root privileges are present.${RESET}\n";
        return 0;
    }
}

