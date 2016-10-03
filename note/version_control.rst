Note: using the git in terminal is always fast and fun

// Done

1. Git
=========

The list is copied from 	https://confluence.atlassian.com/bitbucketserver/basic-git-commands-776639767.html

.. code-block:: html

	git config --global user.name "Sam Smith"
	git config --global user.email sam@example.com

	git init
	git clone /path/to/repository
	git clone username@host:/path/to/repository

	git add <filename>
	git add *

	git commit 
	git commit -a

	git push origin master
	
	git status

	git remote add origin <server>
	
	git remote -v
	git checkout -b <branchname>
	
	git branch
	git branch -d <branchname>
	git push origin <branchname>

	git push --all origin
	git push origin :<branchname>

	git pull
	git merge <branchname>

	git diff
	git diff --base <filename>
	git diff <sourcebranch> <targetbranch>

	git checkout -- <filename>
	git fetch origin
	git reset --hard origin/master

	# cache login detail for 2 hours
	git config --global credential.helper 'cache --timeout 7200'
	# save login detail
	git config credential.helper store
	git push
	

