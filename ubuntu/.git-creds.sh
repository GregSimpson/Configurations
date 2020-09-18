# https://stackoverflow.com/questions/35942754/how-to-save-username-and-password-in-git
git config --global user.name <user>
git config --global user.password <pswd>
# store it for 24 hours (60*60*24)
git config --global credential.helper 'cache --timeout=86400'
git config credential.helper store
