if [ -x /usr/bin/tac ] && [ -x /usr/bin/awk ]; then
   /usr/bin/tac $HOME/.bash_history \
       | /usr/bin/awk '!a[$0]++' \
       | tac > /tmp/bash_history \
       && mv /tmp/bash_history $HOME/.bash_history
fi
