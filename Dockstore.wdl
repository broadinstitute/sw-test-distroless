version 1.0

task picard_help {
    command {
        java -jar picardcloud.jar
    }
    
    output {
        File f_output = stdout()
    }
    
    runtime {
        docker: "distroless_test"
    }
}

workflow picard_workflow {
    call picard_help
}
