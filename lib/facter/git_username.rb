Facter.add(:git_username) do
  confine :kernel do |value|
    value == 'Linux'
  end
  setcode "/bin/awk -F=\  '/name/{print $NF}' /home/centos/.gitconfig"
end
