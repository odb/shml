source clistrap.sh

## Examples

while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo -e "Please answer ${cs_f_green}yes${cs_e_fc} or ${cs_f_red}no${cs_e_fc}.";;
    esac
done

#echo -e "${cs_f_red}It's Spinning: `spinner $! &`${cs_efc}"

echo -e "${cs_br}";

echo -e " ${cs_f_red}${cs_heart} The Red Heart${cs_efc}";
echo -e " ${cs_f_green}${cs_apple} The Green Apple${cs_efc}";
echo -e " ${cs_f_CDCD00}${cs_sun} The Yellow Sun${cs_efc}";
echo -e " ${cs_f_l_blue}${cs_star} The Light Blue Star${cs_efc}";
echo -e " ${cs_f_white}${cs_music} See the music?${cs_efc}";


echo -e "${cs_br}";

echo -e "${cs_f_green}${cs_checkmark} Pass${cs_efc}";
echo -e "${cs_f_red}${cs_xmark} Fail${cs_efc}";
echo -e "${cs_br}";


echo -e "${cs_f_green}Green Text${cs_efc}";
echo -e "${cs_f_yellow}Yellow Text${cs_efc}";
echo -e "${cs_f_blue}Blue Text${cs_efc}";
echo -e "${cs_br}";
echo -e "${cs_f_green}${cs_hr}${cs_efc}"; # Green horizontal rule
echo -e "${cs_br}";
echo -e "${cs_b_green}${cs_f_white}White on Green${cs_ebc}";
echo -e "${cs_b_red}${cs_f_white}White on Red${cs_ebc}";
echo -e "${cs_f_green}${cs_hr_stars}${cs_efc}"; # Green horizontal rule with stars
echo -e "${cs_br}";
echo -e "Reading Rainbow: ${cs_g_rainbow}${cs_ebc}";
echo -e "Yellow Gradient: ${cs_g_yellow}${cs_ebc}";
