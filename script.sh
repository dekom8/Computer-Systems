#!/bin/bash                                                                                                                                          
                                                                                                                                                     
ml icc                                                                                                                                               
                                                                                                                                                     
echo "-------------------------------------------------">&2                                                                                          
echo "g++:">&2                                                                                                                                       
echo "-------------------------------------------------">&2                                                                                          
g++ code.cpp -o code                                                                                                                                 
time ./code                                                                                                                                          
echo " "                                                                                                                                             
                                                                                                                                                     
echo "-------------------------------------------------">&2                                                                                          
echo "icc:">&2                                                                                                                                       
echo "-------------------------------------------------">&2                                                                                          
icc code.cpp -o code1                                                                                                                                
time ./code1                                                                                                                                         
echo " "                                                                                                                                             
                                                                                                                                                     
echo "-------------------------------------------------">&2                                                                                          
echo "icc NOFUNCCALL:">&2                                                                                                                            
echo "-------------------------------------------------">&2                                                                                          
icc -D NOFUNCCALL -qopt-report-phase=vec -qopt-report=1 code.cpp -o code2                                                                            
time ./code2                                                                                                                                         
echo " "                                                                                                                                             
                                                                                                                                                     
echo "-------------------------------------------------">&2                                                                                          
echo "icc NOALIAS">&2                                                                                                                                
echo "-------------------------------------------------">&2                                                                                          
icc -qopt-report=2 -qopt-report-phase=vec -D NOALIAS code.cpp -o code3                                                                               
time ./code3                                                                                                                                         
echo " "                                                                                                                                             
                                                                                                                                                     
echo "-------------------------------------------------">&2                                                                                          
echo "icc NOALIAS ALIGNED">&2                                                                                                                        
echo "-------------------------------------------------">&2                                                                                          
icc -qopt-report=4 -qopt-report-phase=vec -D NOALIAS -D ALIGNED code.cpp -o code4                                                                    
time ./code4                                                                                                                                         
echo " "                                                                                                                                             
                                                                                                                                                     
echo "-------------------------------------------------">&2                                                                                          
echo "icc NOALIAS ALIGNED ipo">&2                                                                                                                    
echo "-------------------------------------------------">&2                                                                                          
icc -qopt-report=2 -qopt-report-phase=vec -D NOALIAS -D ALIGNED -ipo code.cpp -o code5                                                               
time ./code5                                                                                                                                         
echo " "                                                                                                                                             
