
def call(body) {
    def config= [:]
    body.resolveStrategy = Closure.DELEGATE_FIRST
    body.delegate = config
    body()


    pipeline {
        agent any
        
        options {
            buildDiscarder(logRotator(numToKeepStr: '2'))
            disableConcurrentBuilds()
            timestamps()
            ansiColor('xterm')
        }

        tools {
            jdk 'JDK8'
            maven 'MAVEN3.8.6'
        }

        environment {
            GITHUB_REPO_CRED = credentials(config.GITHUB_REPO_CRED)
            GITHUB_REPO_OWNER = config.GITHUB_REPO_OWNER
            GITHUB_REPO_NAME = config.GITHUB_REPO_NAME
            GITHUB_REPO_URL = config.GITHUB_REPO_URL
        }

        stages {
            stage('Checkout') {
                steps {
                    git branch: 'main', changelog: false, credentialsId: 'github-http', poll: false, url: config.GITHUB_REPO_URL
                }
            }
            stage('Prepare') {
                steps {
                    script {
                        func = load 'cicd/lesson13/func.groovy'
                        Integer parallel_executors = 2
                        def apps = readJSON file: config.APPS_LIST_FILE
                        buildStages = stagePrepare(apps, "build", parallel_executors)
                        uploadStages = stagePrepare(apps, "upload", parallel_executors)
                    }
                }
            }

            stage('Build') {
                steps {
                    script {
                        buildStages.each { build ->
                            parallel build
                        }
                    }
                }
            }

            stage('Upload') {
                steps {
                    script {
                        uploadStages.each { upload ->
                            parallel upload
                        }
                    }
                }
            }
        }
    }
}
