## Install

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
