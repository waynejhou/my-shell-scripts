
# region functions

# region checker
function check_is_value(){
    if [[ $1 == \-* ]]; then
        return 1
    fi
    if [[ $1 == "" ]]; then
        return 1
    fi
    return 0
}
function check_is_flag(){
    if [[ $1 == \-* ]]; then
        return 0
    fi
    return 1
}
# endregion

# region colorize
RSET_ALL="\e[0m"
RSET_BLD="\e[21m"
RSET_DIM="\e[22m"
RSET_UDL="\e[24m"
RSET_BLK="\e[25m"
RSET_RVS="\e[27m"
RSET_HID="\e[28m"
RSET_FG="\e[39m"
RSET_BG="\e[49m"
ATTR_BLD="\e[1m"
ATTR_DIM="\e[2m"
ATTR_UDL="\e[4m"
ATTR_BLK="\e[5m"
ATTR_RVS="\e[7m"
ATTR_HID="\e[8m"
FG_BLK="\e[0;30m"
FG_RED="\e[0;31m"
FG_GRN="\e[0;32m"
FG_YEL="\e[0;33m"
FG_BLU="\e[0;34m"
FG_MAG="\e[0;35m"
FG_CYN="\e[0;36m"
FG_LGRY="\e[0;37m"
FG_DGRY="\e[0;90m"
FG_LRED="\e[0;91m"
FG_LGRN="\e[0;92m"
FG_LYEL="\e[0;93m"
FG_LBLU="\e[0;94m"
FG_LMAG="\e[0;95m"
FG_LCYN="\e[0;96m"
FG_WHT="\e[0;97m"
BG_BLK="\e[0;40m"
BG_RED="\e[0;41m"
BG_GRN="\e[0;42m"
BG_YEL="\e[0;43m"
BG_BLU="\e[0;44m"
BG_MAG="\e[0;45m"
BG_CYN="\e[0;46m"
BG_LGRY="\e[047m"
BG_DGRY="\e[0;100m"
BG_LRED="\e[0;101m"
BG_LGRN="\e[0;102m"
BG_LYEL="\e[0;103m"
BG_LBLU="\e[0;104m"
BG_LMAG="\e[0;105m"
BG_LCYN="\e[0;106m"
BG_WHT="\e[0;107m"
function fg_yel(){
    printf "${FG_YEL}${1}${RSET_FG}"
}
function fg_grn(){
    printf "${FG_GRN}${1}${RSET_FG}"
}
# endregion

# endregion

SOURCE=${HOME}/sample-path

CONST_ERROR="${FG_RED}ERROR:${RSET_FG}"
CONST_HELP="usage: `fg_grn $0` [`fg_yel -h`] [`fg_yel -src` <path>]

optional arguments:
    `fg_yel -h` / `fg_yel --help`  : show help and exit
    `fg_yel -path` <path> : specific path
                    default as \"${FG_LBLU}${ATTR_UDL}\${HOME}${RSET_FG}/sample-path${RSET_ALL}\"
"
position=0
while [[ $# -gt 0 ]]; do
  position=position+1
  key="$1"
  case $key in
    -h|--help)
      printf "$CONST_HELP"
      exit
      ;;
    -src)
      if ! check_is_value $2; then
          printf "${CONST_ERROR} need value for `fg_yel -src`\n"
          printf ""
          printf "$CONST_HELP"
          exit
      fi
      SOURCE="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
        printf "${CONST_ERROR} unknown option `fg_yel $1`\n"
        printf ""
        printf "$CONST_HELP"
        exit
      ;;
  esac
done

echo "Path = ${SOURCE}"
read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        ;;
    *)
        echo "Aborted by User"
        exit 1
        ;;
esac

