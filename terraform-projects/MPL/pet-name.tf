resource "local_file" "my-pet" {
    filename = "/root/pet-name"
    content = "My pet is called finnegan!!"
}

resource "random_pet" "other-pet" {
  length = "1"
  prefix = "Mr"
  separator = "."
}
