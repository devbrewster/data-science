# **Windows**<br />

## For Windows machines:<br />

Download the `sqlite-tools-win32-x86-3200100.zip` file and unzip it.<br />
From your `git-bash terminal`, open the directory of the unzipped folder with `cd ~/Downloads/sqlite-tools-win32-x86-3200100/sqlite-tools-win32-x86-3200100/`.<br />
Try running sqlite with the command `winpty ./sqlite3.exe`. If that command opens a `sqlite>` prompt, congratulations! You’ve installed SQLite.<br />

We want to be able to access this command quickly from elsewhere, so we’re going to create an alias to the command. Exit the sqlite> prompt by typing in Ctrl + C, and in the same git-bash terminal without changing folders, run these commands:<br />

    echo "alias sqlite3=\"winpty ${PWD}/sqlite3.exe\"" >> ~/.bashrc

and<br />

    source ~/.bashrc

The first command will create the alias sqlite3 that you can use to open a database. The second command will refresh your terminal so that you can start using this command. Try typing in the command `sqlite3 newdb.sqlite`. If you’re presented with a `sqlite>` prompt, you’ve successfully created the sqlite3 command for your terminal. Enter `Ctrl + C` to quit. You can also exit by typing `.exit` in the prompt and pressing `Enter`.<br />
