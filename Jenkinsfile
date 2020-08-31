pipeline {
  agent {
    docker {
      args '-p 3000:3000'
      image 'salestrip/sfdx-cli'
    }

  }
  stages {
    stage('Preparation') {
      parallel {
        stage('Preparation') {
          steps {
            sh 'echo $SALESFORCE_DEVHUB_USERNAME'
            sh 'sfdx force:auth:jwt:grant -u $SALESFORCE_DEVHUB_USERNAME -f server.key -i $SALESFORCE_CONSUMER_KEY -r https://login.salesforce.com --setdefaultdevhubusername -a devhub'
          }
        }

        stage('Hello') {
          steps {
            input 'Proceed?'
          }
        }

      }
    }

    stage('Package') {
      steps {
        sh 'echo $(sfdx force:package:version:create -p "Fielo 2nd Gen Package Test - Father" -x --wait 120 --skipvalidation) >> ./creationmessage'
        sh 'echo $(cat ./creationmessage) | grep -Eo \'https://[^ >]+\' | head -1 >> ./packageurl'
        sh 'echo $(cat ./packageurl) | grep -Eo \'04t[^ >]+\' | head -1 >> ./packageid'
        sh '''PACKAGE_INFO=$(sfdx force:package:version:report -p $(cat ./packageid))
PACKAGE_INFO="${PACKAGE_INFO//\'%\'/\'%25\'}"
PACKAGE_INFO="${PACKAGE_INFO//$\'\\n\'/\'%0A\'}"
PACKAGE_INFO="${PACKAGE_INFO//$\'\\r\'/\'%0D\'}"
echo $PACKAGE_INFO >> ./packageinfo'''
      }
    }

  }
  environment {
    SALESFORCE_DEVHUB_USERNAME = credentials('SALESFORCE_DEVHUB_USERNAME')
    SALESFORCE_CONSUMER_KEY = credentials('SALESFORCE_CONSUMER_KEY')
    JWT_KEY = credentials('JWT_KEY')
  }
}