#!/bin/sh

echo "Creating python virtual environment..."
python -m venv .venv
pip=.venv/bin/pip

echo "Installing dependencies..."
$pip install -r requirements.txt

chmod +x sync_carddav.py

echo "Installing userscript..."

mkdir -p ~/.local/share/sxmo/userscripts # verify that the directory exists

# Get variables
printf "CardDAV URL: " && read -r url
printf "CardDAV username: " && read username
printf "CardDAV password (use an app password - will be stored as plaintext!): " && read password

printf "Userscript location [~/.local/share/sxmo/userscripts/sync_carddav.py]: " && read path

[ -z "$path" ] && path=~/.local/share/sxmo/userscripts/sync_carddav.sh

echo "#!/bin/sh" > "$path"
echo "# title=\"\$icon_usr Sync Contacts from CardDAV\"" >> "$path"
echo "sxmo_terminal.sh \"$PWD/.venv/bin/python\" \"$PWD/sync_carddav.py\" --user \"$username\" --password \"$password\" \"$url\"" >> "$path"

chmod 700 "$path" # Allow, executing, hide from other users

echo "Done."
