Project Management Toolsについて
===============================

さまざまなProject Management Toolsを使ってみた。
感想を述べる。

Team communication
---------------------

Slack
^^^^^^

全てのCommunicatioんツールを一つにする。
Skypeなどに入れるお金がない場合、Slackを用いるべきである。

"Slack brings all your communication together in one place. It's real-time messaging, archiving and search for modern teams.
"


Web-based, Suitable for large team
------------------------------------

OpenProject
^^^^^^^^^^^^^^^^^

Very powerful tool. Easy to install and easy to use.
`OpenProject <https://www.openproject.org/>`_

. Openproject is based on Readmine and Ruby on Rail.
Any server hosting which support ruby on rail can run openproject.

Weakness : use a lot of storage. Require at least 2GB of storage

Install openproject on OpenShift (Does not work on free account)

.. code-block:: html

    # http://blog.jam-it.nl/2015/11/running-openproject-on-openshift.html
    rhc create-app openprojectdb http://cartreflect-claytondev.rhcloud.com/github/xenonl/openshift-origin-cartridge-diy --no-git
    rhc cartridge add -a openprojectdb -c mysql-5.5
    rhc ssh openproject

    # export environment
    export RBENV_ROOT=$OPENSHIFT_DATA_DIR/.rbenv
    export PATH="$RBENV_ROOT/bin:$PATH"
    export NODENV_ROOT=$OPENSHIFT_DATA_DIR/.nodenv
    export PATH="$NODENV_ROOT/bin:$PATH"

    # install ruby using rbenv
    curl -L https://rawgithub.com/Seppone/openshift-rbenv-installer/master/bin/rbenv-installer | bash
    eval "$(rbenv init -)"
    RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install -v 2.1.6
    rbenv rehash
    rbenv global 2.1.6
    cd $OPENSHIFT_DATA_DIR/.rbenv/versions/2.1.6/lib/ruby/2.1.0/
    rm  resolv.rb
    wget https://raw.githubusercontent.com/xenonl/openshift-wget/master/ruby2.1/lib/resolv.rb
    gem install bundler --no-ri --no-rdoc --debug --backtrace --verbose --install-dir=$OPENSHIFT_DATA_DIR/.rbenv/versions/2.1.6/lib/ruby/gems/2.1.0/
    rbenv rehash

    # install node.js
    cd $OPENSHIFT_DATA_DIR
    wget https://github.com/OiNutter/nodenv/archive/master.zip
    unzip master.zip
    mv nodenv-master .nodenv
    rm master.zip
    export NODENV_ROOT=$OPENSHIFT_DATA_DIR/.nodenv
    export PATH="$NODENV_ROOT/bin:$PATH"
    eval "$(nodenv init -)"

    cd $NODENV_ROOT/versions
    wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz
    tar -xf node-v0.12.7-linux-x64.tar.gz
    rm node-v0.12.7-linux-x64.tar.gz
    mv node-v0.12.7-linux-x64 0.12.7
    nodenv rehash
    nodenv global 0.12.7

    # remember to run this
    eval "$(nodenv init -)"
    eval "$(rbenv init -)"

    mysql -e "ALTER DATABASE $OPENSHIFT_APP_NAME CHARACTER SET utf8"

    cd $OPENSHIFT_DATA_DIR
    wget https://github.com/opf/openproject/archive/v5.0.19.zip
    unzip v5.0.19.zip
    rm v5.0.19.zip
    mv openproject-5.0.19 openproject

    cd openproject
    gem install bundler --no-ri --no-rdoc --install-dir=$OPENSHIFT_DATA_DIR/.rbenv/versions/2.1.6/lib/ruby/gems/2.1.0/
    rbenv rehash
    bundle install --deployment --without postgres sqlite rmagick development test therubyracer

    # Install with --production --no-optional to minimize inodes
    npm config set strict-ssl false
    npm install --production --no-optional --loglevel verbose

    cd $OPENSHIFT_DATA_DIR/openproject/frontend
    ./node_modules/.bin/bower install jquery-ui

    # edit settings file
    cd $OPENSHIFT_DATA_DIR/openproject/config
    wget https://raw.githubusercontent.com/xenonl/openshift-wget/master/openproject/database.yml
    wget https://raw.githubusercontent.com/xenonl/openshift-wget/master/openproject/configuration.yml

    # then run
    cd $OPENSHIFT_DATA_DIR/openproject/
    bundle exec rake generate_secret_token
    RAILS_ENV="production" bundle exec rake db:migrate
    RAILS_ENV="production" bundle exec rake db:seed
    RAILS_ENV="production" bundle exec rake assets:precompile

    # add plugins
    # vi Gemfile.plugins
    gem "openproject-pdf_export", git: "https://github.com/finnlabs/openproject-pdf_export.git", :branch => "stable/5"
    gem "openproject-backlogs", git: "https://github.com/finnlabs/openproject-backlogs.git", :branch => "stable/5"

    # install with plugins
    bundle install --no-deployment --without postgres sqlite rmagick development test therubyracer
    RAILS_ENV="production" bundle exec rake db:migrate
    RAILS_ENV="production" bundle exec rake db:seed
    RAILS_ENV="production" bundle exec rake assets:precompile

    # Edit config/environments/production.rb
    # add this line
    config.serve_static_assets = true

    cd $OPENSHIFT_REPO_DIR/.openshift/action_hooks/
    rm start
    rm stop
    wget -O start https://raw.githubusercontent.com/xenonl/openshift-wget/master/openproject/.openshift/action_hooks/start-rackup
    wget -O stop https://raw.githubusercontent.com/xenonl/openshift-wget/master/openproject/.openshift/action_hooks/stop-rackup
    chmod 755 start
    chmod 755 stop

    # edit config/secrets.yml
    secret_key_base: $SECRET_KEY_BASE

    # use this to set the environment value
    rhc set-env SECRET_KEY_BASE='876ef78485dcd24f05e92e7bbb225dc9287e301354bb491edde5b48a98c4cc01bddb6858ed313b8468b8a5782a58403361626abb5fb5efff9c99b74c4cc754ab' -a openproject

    # use this command to clean up openshift storage
    rhc app-tidy -a openproject
    bundle clean --dry-run --force

Redmine
^^^^^^^^^^^

Not as strong as OpenShift.
Plugins cost and arm and a leg.

Cloud, suitable for small team, invidual
------------------------------------------

Trello
^^^^^^^^^^

`Trello <https://trello.com/>`_

Kanban-styled.　全ての

Can intergrate with github, etc (Cost money, Of course)

Zenhub
^^^^^^^^

`Zenhub <https://www.zenhub.com/>`_

"ZenHub turns GitHub into a robust project management platform. Add powerful collaboration features to your GitHub issues and pull requests!"

GithubやTrelloを簡単に結合する。
Browserのextension形でInstallするので、使い安い。

簡単にInstallでき、簡単に利用可能は主なポイントである。
お金はGithubの方だけにいれば良いので、投資金が少ない。

Offline, Suitable for small team, invidual
-------------------------------------------

ProjectLibre
^^^^^^^^^^^^^^^

`projectlibre <www.projectlibre.com/>`_

Excel-styled project management.
Style and workflows are as same as Microsoft's.

２０１６年12月の時点：データベースをまだサポートしないので、
チーム共有はまだ難しい。
管理者が少ない、個人の場合には，お勧め。


