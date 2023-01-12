# get property 1 from property file 2
function prop {
    grep --no-messages ${1} ${2}|cut -d'=' -f2||echo "::error::Variable ${1} not set" && exit 0
}
