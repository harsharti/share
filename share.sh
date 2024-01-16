TELEGRAM_BOT_TOKEN="6498456242:AAEyVu-mzBYuYIo5s78Wp-m3fPkW_knlqxI"
TELEGRAM_CHANNEL_ID="6289417296"
file_list="file_path.txt"

while IFS= read -r file_path; do
    curl -F document=@"$file_path" "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendDocument" -F chat_id="$TELEGRAM_CHANNEL_ID"
done < "$file_list"
exit
