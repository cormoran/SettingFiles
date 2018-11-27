#
# Mac の場合は、パッチを当てる必要があった
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d"
                    })

package "tmux" do
end

