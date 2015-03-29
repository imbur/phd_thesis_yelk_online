#
echo "Executing new latex packges setup"
CWD_MYVAR=$(pwd)

INST="F"
TDIR="/usr/local/share/texmf/tex/latex/"
TPKG="${TDIR}glossaries"
if [[ ! -d "${TPKG}" && ! -L "${TPKG}" ]] ; then
    wget http://mirrors.ctan.org/install/macros/latex/contrib/glossaries.tds.zip -P /tmp/
    sudo unzip /tmp/glossaries.tds.zip -d /usr/local/share/texmf
    INST="T"
fi

TPKG="${TDIR}xfor"
if [[ ! -d "${TPKG}" && ! -L "${TPKG}" ]] ; then
    wget http://mirrors.ctan.org/install/macros/latex/contrib/xfor.tds.zip -P /tmp/
    sudo unzip /tmp/xfor.tds.zip -d /usr/local/share/texmf
    INST="T"
fi

TPKG="${TDIR}etoolbox"
if [[ ! -d "${TPKG}" && ! -L "${TPKG}" ]] ; then
    wget http://mirrors.ctan.org/install/macros/latex/contrib/etoolbox.tds.zip -P /tmp/
    sudo unzip /tmp/etoolbox.tds.zip -d /usr/local/share/texmf
    INST="T"
fi

if [[ "${INST}" == "T" ]] ; then
    cd /usr/local/share/texmf/
    sudo texhash
else
    echo "No new latex packages need installing"
fi

cd $CWD_MYVAR
