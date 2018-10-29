install:
	virtualenv testing
	. testing/bin/activate
	pip install --user -r requirements.txt
jenkins_test:
	testing/bin/easy_install nose
	testing/bin/nosetests app/ -v
