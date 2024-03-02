terraform
---
- terraform doc
    - https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
    - local_file (resource)



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

