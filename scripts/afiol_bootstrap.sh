
# Get or update rbenv

if [ ! -d $HOME/.rbenv ]; then
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
else
	cd ~/.rbenv && git pull
fi
cd ~/.rbenv && src/configure && make -C src
echo '' > ~/.bash_aliases
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_aliases
echo 'eval "$(rbenv init -)"' >> ~/.bash_aliases
echo 'export RAILS_ENV=production' >> ~/.bash_aliases
# necessary for puma
echo 'export RACK_ENV=production' >> ~/.bash_aliases
# remove annoying message
echo 'export LC_ALL=en_US.UTF-8' >> ~/.bash_aliases
source ~/.bash_aliases

echo '[[ -f ~/.bashrc ]] && . ~/.bashrc' > ~/.bash_profile
cp ~/afiol.info/prod_conf/bashrc ~/.bashrc

if [ ! -d $HOME/.rbenv/plugins/ruby-build ]; then
	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
else
	cd ~/.rbenv/plugins/ruby-build && git pull
fi


# the repo is cloned by the root bootstrap
rbenv install -v `cat ~/afiol.info/.ruby-version` -s

# Safe to be executed multiple times, as subsequent bootstrap will be ignored
mv ~/.env.production ~/afiol.info

# setup crontabs
cat << EOF > /tmp/cron.afiol
@daily /home/afiol/afiol.info/scripts/deploy.sh scheduled_jobs
EOF
crontab -r
crontab /tmp/cron.afiol

echo 'Remember to copy the config/master.key file from your local machine and add any necessary keys to config/credentials.yml.enc, then execute /home/afiol/afiol.info/scripts/deploy.sh bootstrap_rails'
