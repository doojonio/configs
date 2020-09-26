# Defined in - @ line 1
function otrs-dcache --wraps='surs /opt/otrs/bin/otrs.Console.pl Maint::Cache::Delete' --description 'alias otrs-dcache=surs /opt/otrs/bin/otrs.Console.pl Maint::Cache::Delete'
  surs /opt/otrs/bin/otrs.Console.pl Maint::Cache::Delete $argv;
end
