terraform
---
- terraform doc
    - https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
    - local_file (resource)


1] terraform basics


terraform providers
---
$ terraform init

- registry.terraform.io
    - official
    - partner
    - community

- naming convention
    - [hostname /] organizational namespace / type

- name example
    - registry.terraform.io/hashicorp/local
    - hostname = registry.terraform.io
        - default (if ommited)



- variables
---
- config file
    - variables.tf
    ---
    variable "filename" {
        default = "/root/abc.txt"
    }



- using variables
---
- possibilities of defining a var
    - $ terraform apply -var "filename=/root/abc/txt" -var "separator=."
    - ENV vars
        - TF_VAR_filename="/root/abc.txt"
        - TF_VAR_separator="."
        $ export 
    - variable definition file
        - terraform.tfvars
        - terraform.tfvars.json

- "the order" how variables are taken into account
    1] ENV var
    2] terraform.tfvars
    3] *.auto.tfvars (alphabetic order)
    4] -var or --var-file (command-line flags)



- explicit dependencies
---
- depends_on = [ local_file.krill ]



- output variables
---
output var-name {
    value = resource-type.resource-name.id
    description = "describe the output var name"
}

$ terraform output
    - prints output vars

- used to provide outputs for eg ansible, shell scripts ..



2] terraform state
---

- intro
---
$ t apply
    - creates terraform.tfstate



- purpose of state
---
- to detect a change
- terraform.tfstate 
    - shall be saved to a central location, e.g
    - s3



3] terraform commands
---
$ terraform ...
    - validate
    - fmt
    - show -json
    - providers
    - output
    - output variable-name
    - refresh   # modifies a state file
    - plan      # runs refresh too
    - apply     # runs refresh too
    - graph     # DOT; could be visualized using "graphviz" tool -> "dot" command
        $ terraform graph | dot -Tsvg > graph.svg



- mutable vs immutable inf
---



