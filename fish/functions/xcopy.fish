# Defined in - @ line 1
function xcopy --wraps='xclip -sel clip' --description 'alias xcopy=xclip -sel clip'
  xclip -sel clip $argv;
end
