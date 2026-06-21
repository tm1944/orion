terraform {
    #Core TF version
    required_version = ">= 1.5.0"

    #Provider constraints
    required_providers {
      kind = {
        source = "tehcyx/kind"
        version = "~> 0.8"
      }
    }

}