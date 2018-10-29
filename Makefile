install:
	easy_install pip
	pip install --user -r requirements.txt

jenkins_test:
	testing/bin/nosetests app/ -v
