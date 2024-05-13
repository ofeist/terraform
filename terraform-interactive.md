terraform
---
- terraform doc
    - https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
    - local_file (resource)

- The Study Guide 
    - https://developer.hashicorp.com/terraform/tutorials/certification/associate-study

- terraform flash cards
    - https://quizlet.com/quizlette81381405/folders/terraform-associate-exam/sets
---


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
- The lifecycle Meta-Argument
    - https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle



- data sources
---
data "local_file" "dog" {
    filename = "/root/dog.txt"
}


- count argument
---
resource "local file" "pet" {
    filename = var.filename
    count = 3
}

variable "filename" {
    default = "/roots/pets.txt"
}

--

resource "local file" "pet" {
    filename = var.filename[count.index]
    count = length(var.filename)
}

variable "filename" {
    default = "/roots/pets.txt"
    default = "/roots/dogs.txt"
}

output "pets" {
    value = local_file.pet
}

- this creates a list!


- for-each argument
---
resource "local file" "pet" {
    filename = each.value
    for_each = var.filename
}

variable "filename" {
    type=set(string)
    default = [
        "/roots/pets.txt",
        "/roots/dogs.txt"
    ]
}

- for_each works only with a
    - map, or a
    - set

- to fix, you could:
- type=set
    - cannot contain duplicate elements
- foreach = toset(var.filename)

- this creates a map!
    - check the output



- aws cli
---
--endpoint http://aws:4566

- aws --version

aws iam --endpoint http://aws:4566 list-users
aws iam --endpoint http://aws:4566 attach-user-policy help
aws iam --endpoint http://aws:4566 attach-user-policy --user-name mary --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam --endpoint http://aws:4566 create-group --group=name project-sapphire-developers
aws iam --endpoint http://aws:4566 add-user-to-group --group-name project-sapphire-developers --user-name jill
aws iam --endpoint http://aws:4566 attach-group-policy --group-name project-sapphire-developers --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess





















