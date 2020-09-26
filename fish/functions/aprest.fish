# Defined in - @ line 1
function aprest --wraps=echo\ \'restarting\ apache...\'\;sudo\ systemctl\ restart\ apache2\;echo\ \'done\' --description alias\ aprest=echo\ \'restarting\ apache...\'\;sudo\ systemctl\ restart\ apache2\;echo\ \'done\'
  echo 'restarting apache...';sudo systemctl restart apache2;echo 'done' $argv;
end
