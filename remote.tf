terraform {
  backend "remote" {
    organization ="epsi-skhedim"
  
  workspaces{
    name ="tf-epsi-final"
   }
  }
  
}
