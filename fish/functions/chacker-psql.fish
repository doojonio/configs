# Defined in - @ line 1
function chacker-psql --wraps='docker exec -ti chacker psql -U chacker' --description 'alias chacker-psql=docker exec -ti chacker psql -U chacker'
  docker exec -ti chacker psql -U chacker $argv;
end
