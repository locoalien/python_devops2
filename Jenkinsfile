node {
    printMessage("Comenzando Pipeline")

    stage("Obteniendo codigo fuente") {
        git "https://github.com/locoalien/python_devops2"
    }

    dir('') {
        stage("Instalando dependencias") {
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
    }
    emailext (
    subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
    body: """<p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
    to: "santiagosk80@gmailcom",
    from: "santiagosk80@gmailcom"
)

    printMessage("Fin del Pipeline")
}

def printMessage(message) {
    echo "${message}"
}
