# To create bookmark, `ln -s ~/.bookmarks/@<shortcut> ~/path/to/<shortcut>`

# Bookmarks for shell navigation
if [ -d "$HOME/.bookmarks" ]; then
  export CDPATH=".:$HOME/.bookmarks:/"
  alias goto="cd -P"
fi
