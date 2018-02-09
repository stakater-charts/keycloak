#!/usr/bin/groovy
@Library('github.com/stakater/fabric8-pipeline-library@master')

String chartPackageName = ""
String chartName = "keycloak"

clientsNode(clientsImage: 'stakater/pipeline-tools:dev') {
    container(name: 'clients') {
        def helm = new io.stakater.charts.Helm()
        def chartManager = new io.stakater.charts.ChartManager()
        stage('Checkout') {
            checkout scm
        }
        
        stage('Init Helm') {
            helm.init(true)
        }

        stage('Prepare Chart') {
            helm.lint(WORKSPACE, chartName)
            chartPackageName = helm.package(WORKSPACE, chartName)
        }

        stage('Upload Chart') {
            chartManager.uploadToChartMuseum(WORKSPACE, chartName, chartPackageName)
        }
    }
}
