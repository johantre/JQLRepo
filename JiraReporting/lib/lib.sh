# get property 1 from property file 2
function prop {
    grep ${1} ${2}|cut -d'=' -f2
}
