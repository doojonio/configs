# Defined in - @ line 1
function surs --wraps='sudo -u otrs' --description 'alias surs=sudo -u otrs'
  sudo -u otrs $argv;
end
