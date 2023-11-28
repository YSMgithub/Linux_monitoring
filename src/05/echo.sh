#!/bin/bash

folder_count=$(find $1 -type d | wc -l)
file_count=$(find $1 -type f | wc -l)
conf_count=$(find $1 -name "*.conf" | wc -l)
text_count=$(find $1 -name "*.txt" | wc -l)
exe_count=$(find $1 -type f -executable | wc -l)
log_count=$(find $1 -name "*.log" | wc -l)
zip_count=$(find $1 -name "*.gz" | wc -l)
symlink_count=$(find $1 -type l | wc -l)


echo "Total number of folders (including all nested ones) = $folder_count"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
if [[ $folder_count -gt 5 ]]
then
    let "folder_count = 5"
fi
for (( i=1; i<=$folder_count; i++ ))
do
     echo "$i - $(du -Sh $1 | sort -rh | head -5 | awk 'NR=='$i' {
         bb = ", " 
         print $2 bb $1
         }')"
done

echo "Total number of files = $file_count"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_count"
echo "Text files = $text_count"
echo "Executable files = $exe_count"
echo "Log files (with the extension .log) = $log_count"
echo "Archive files = $zip_count"
echo "Symbolic links = $symlink_count"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
declare -i file_count
if [[ $file_count -gt 10 ]]
then
    let "file_count = 10"
fi

for (( i=1; i<=$file_count; i++ ))
do
     echo "$i - $(find $1 -type f -exec du -Sh {} + | sort -rh | head -n 10 | awk 'NR=='$i' {
         bb = ", " 
         print $2 bb $1
         }'), $(file -b $(find $1 -type f -exec du -Sh {} + | sort -rh | head -n 10 | awk 'NR=='$i' {print $2}') | awk '{print $1, $2, $3}')"
done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
if [[ $exe_count -gt 10 ]]
then
    let "exe_count = 10"
fi
for (( i=1; i<=$exe_count; i++ ))
do
    exeFile=$(find $1 -executable -type f -exec du -Sh {} + | sort -rh | head -n 10 | awk 'NR=='$i' {print $2}')
    echo "$i - $exeFile, $(du -h $exeFile | awk '{print $1}'), $(find $1 -type f -executable -exec md5sum {} + | awk 'NR=='$i' {print $1}')"
done
