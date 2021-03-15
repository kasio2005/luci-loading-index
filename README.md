# luci-loading-index
Replacing LuCI's index page

# This is a simple script of replacing index page of LuCI, the index page can be whatever you want.

~~**The install script files is not tested yet, it may not work properly**~~

**PLEASE FOLLOW INSTALL SCRIPT BELOW!**

# Install

1. Using `scp` to copy your custom designed index loading page to `/root` or it's children directory (and **DO NOT** copy it to `/www` directly in this step which may revert to default index page if upgrading LuCI.
2. Using `ssh` to access OpenWRT router.
3. Create a shell script under `/etc/init.d` which the source should be look like this:
```sh
#!/bin/sh

cp /path/to/custom_index/index.html /www/index.html
```
4. Run command `chmod +x /etc/init.d/<the_script_file_name>.sh && /etc/init.d/<the_script_file_name>.sh enable`
5. (Optional) You can manually copy file to `/www` now.

Welcome to fork

Click [here](https://rk0cc.github.io/luci-loading-index/) to preview page of `index.html`
