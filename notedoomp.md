  RT @Six2dez1: So... this is Friday's weekly tip:

  Create bash function in your .${SHELL}rc to easily search for your wordlists by name on your preferred paths 😉

  function wordlists() { find -L ~/Tools/OneListForAll -type -f -iname "*$1*" }

