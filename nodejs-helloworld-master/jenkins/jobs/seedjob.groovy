// CI Job for NodeJS App
pipelineJob("build") {
    displayName 'Build'
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('rajbhavesh7/nodejs-helloworld', 'https')
                    }
                }
            }
        }
    }
}


// Deployment Job for NodeJS App
pipelineJob("deploy") {
    displayName 'Deploy'

    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('rajbhavesh7/nodejs-helloworld', 'https')
                    }
                }
            }
        }
    }
}