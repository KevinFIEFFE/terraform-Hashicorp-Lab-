provider "random" {}

resource "random_pet" "name" {
  length = 3
}

variable "num_of_pets" {
  type        = number
  description = "how many pets do we want"
}

resource "random_pet" "alexandres_pet" {
  length = var.num_of_pets
}

output "pet_name_name" {
  value = random_pet.name
}
