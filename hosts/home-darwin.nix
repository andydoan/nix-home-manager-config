{ lib, username, ... }:

{
    home.username = lib.mkForce "andydoan";
    home.homeDirectory = lib.mkForce "/Users/andydoan";
}