if [ $(type w > /dev/null; echo $?) = 0 ]; then
    echo -e "\e[38;5;131m*** Active session(s)\e[m"
    echo -n -e "\e[38;5;240m"
    w
    echo -e "\e[m"
fi