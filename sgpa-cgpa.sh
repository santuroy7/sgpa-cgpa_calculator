echo ""
printf "                \e[2;33m *****************************Welcome*****************************\n\e[0m"
sleep 1
printf "                        \e[1;31m Enter Your Name: \e[0m"
read name
printf "                        \e[1;31m Enter Your Reg.No: \e[0m"
read reg
printf "                        \e[2;36m Hello! $name Welcome To Result View System....\e[0m\n"
sleep 1
printf "                        \e[1;35m Enter the Number of Semester's: \e[0m"
read sem
printf "                        \e[1;35m Enter total subject's: \e[0m"
read sub
j=1
sgpas=()
while [ $j -le $sem ]
do
        res=()
        printf "                        \e[1;35m Enter Your Grades in $j's Semester: \e[0m"
                read -a gra
                for i in ${gra[*]}
                do
                        if [ "$i" = "O" ]||[ "$i" = "o" ]
                        then
                                res+=(10)
                        elif [ "$i" = "A" ]||[ "$i" = "a" ]
                        then
                                res+=(9)
                        elif [ "$i" = "B" ]||[ "$i" = "b" ]
                        then
                                res+=(8)
                        elif [ "$i" = "C" ]||[ "$i" = "c" ]
                        then
                                res+=(7)
                        elif [ "$i" = "D" ]||[ "$i" = "d" ]
                        then
                                res+=(6)
                        else
                                printf "                        \e[2;31m OPPS! You Failed!!!\n\e[0m"
                                exit 0
                        fi
                done
        printf "                        \e[1;35m Enter Your Credits in $j's Semester: \e[0m"
        read -a crad
        grade_points=(${res[*]})
        total_credits=0
        for k in ${crad[*]}
        do
                total_credits=$(( $total_credits + $k ))

        done
        temp=0
        for((l=0;l<sub;l++))
        do
                temp=$(( $temp + $(( ${crad[$l]} * ${grade_points[$l]} ))))

        done
        sgpa=`echo "scale=2;$temp/$total_credits"|bc -l`
        printf "                        \e[2;32m Your SGPA in $j's Semester is: $sgpa\n\n\e[0m"
        sgpas+=($sgpa)
        ((j++))
done
total_sgpa=0
sgpas_list=(${sgpas[*]})
for m in ${sgpas_list[*]}
do
 total_sgpa=`echo "scale=2;$total_sgpa+$m"|bc -l`
done
#echo $total_sgpa
cgpa=`echo "scale=2;$total_sgpa/$sem"|bc -l`
printf "                        \e[2;32m Your CGPA after $sem's Semester is $cgpa\n\e[0m"

echo -e "               \e[2;36m________________________Have A Good Day____________________________ \e[0m"
echo " "

