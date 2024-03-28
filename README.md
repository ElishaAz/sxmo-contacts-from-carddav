## Usage

```commandline
$ ./sync_carddav.py --help
usage: sync_carddav.py [-h] [-u USER] [-p PASSWORD] [--no-cert-verify] [--digest] [-f TSV_FILE] url

positional arguments:
  url                   CardDav URL

options:
  -h, --help            show this help message and exit
  -u USER, --user USER  CardDav user
  -p PASSWORD, --password PASSWORD
                        CardDav password. Omit to prompt for password
  --no-cert-verify      Do not verify https certificate
  --digest              Use digest authentication
  -f TSV_FILE, --tsv-file TSV_FILE
                        Output TSV file name (defaults to "~/.config/sxmo/contacts.tsv")
```

## Install as an SXMO userscript

Install `pip` if it isn't installed: `sudo apk add py3-pip`.

Get your CardDAV address, username, and per-app password.

When using Nextcloud:

- Address from `Contacts->Contacts settings->Address books->Three dots->Copy link`
- Username and app password from `Profile->Settings->Security->Devices & sessions->Create a new app password` (input a name first)

And then:

```commandline
git clone https://github.com/ElishaAz/sxmo-contacts-from-carddav
cd sxmo-contacts-from-carddav
./install.sh
```

And input your info.
