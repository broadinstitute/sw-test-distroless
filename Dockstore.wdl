version 1.0

task picard_help {
    command {
        java -jar picardcloud.jar
    }
    
    output {
        File f_output = stdout()
    }
    
    runtime {
        docker: "quay.io/sidwekhande/distroless-test:v1.0.0"
    }
}

workflow picard_workflow {
    call picard_help
}
