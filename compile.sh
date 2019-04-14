#!/bin/bash                                                                                                                                          
                                                                                                                                                     
ml icc                                                                                                                                               
                                                                                                                                                     
a="COMMON-AVX512 MIC-AVX512 CORE-AVX512 CORE-AVX2 CORE-AVX-I AVX SSE4.2 SSE4.1 SSSE3 SSE3 SSE2"                                                      
#a=`cat /proc/cpuinfo | grep flags | uniq | cut -d: -f2`                                                                                             
for i in $a                                                                                                                                          
do                                                                                                                                                   
        icc -qopt-report=2 -qopt-report-phase=vec -D NOALIAS -D ALIGNED -ipo code.cpp -o code6 -x$i                                                  
        if [ $? -eq 0 ]                                                                                                                              
        then                                                                                                                                         
                        echo "-------------------------------------------------">&2                                                                  
                        echo "Works for $i">&2                                                                                                       
                        time ./code6                                                                                                                 
                        echo "-------------------------------------------------">&2                                                                  
        fi                                                                                                                                           
done                                                                                                                                              
