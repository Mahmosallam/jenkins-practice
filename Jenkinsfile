node {
    stage('Clone Repo') {
        git branch: 'main', url: 'https://github.com/Mahmosallam/jenkins-practice.git'
    }

    stage('Build') {
        try {
            sh 'echo "build stage"'
            sh 'ls'
            sh 'pwd'
        } catch (Exception e) {
            sh 'echo "Exception found"'
            throw e
        }
    }

    stage('Test') {
        if (env.BRANCH_NAME == 'master') {
            sh 'echo "test stage"'
            sh 'echo "this is master branch"'
        } else {
            sh 'echo "this is not master branch"'
        }
    }
}
