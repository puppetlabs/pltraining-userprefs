Facter.add("git_username") do
  confine :kernel => 'Linux'
  setcode "/bin/awk '/name/{print $NF}' /home/centos/.gitconfig"
end