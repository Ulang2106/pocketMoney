# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# others
JRE_HOME=/usr/java/default
CATALINA_HOME=/opt/tomcat/apache-tomcat-9.0.1
export JRE_HOME CATALINA_HOME
PATH=$HOME/.rbenv/bin:$PATH
PATH=$PATH:/bin/sh
export PATH

# alias

eval "$(rbenv init -)"
