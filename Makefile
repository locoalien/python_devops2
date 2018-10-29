install:
	virtualenv testing
	. testing/bin/activate
	pip install --user -r requirements.txt
	ls
jenkins_test:
	testing/bin/nosetests app/ -v