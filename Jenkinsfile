node {
    printMessage("Comenzando Pipeline")

    stage("Obteniendo codigo fuente") {
        git "https://github.com/locoalien/python_devops2"
    }

    dir('') {
        stage("Instalando requerimientos") {
	    sh 'apk add py-pip'
	    sh 'pip install virtualenv'
            sh 'apk add python'
	    sh 'apk add make'
	    sh 'make install'
        }

        stage("Ejecutando Tests") {
            sh 'make jenkins_test'
        }

        stage("Deploy de la aplicación") {
            if (env.BRANCH_NAME == "master") {
                printMessage("Desplegando master branch")
            } else {
                printMessage("No se pudo desplegar al branch especificado")
            }
        }
        post {
        always {
            emailext body: 'A Test EMail', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
        }
    }
    }

    printMessage("Fin del Pipeline")
}

def printMessage(message) {
    echo "${message}"
}
