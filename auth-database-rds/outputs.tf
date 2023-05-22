#outputs.tf
output "player_auth_db_instance" {
    value = aws_db_instance.default.db_name
    depends_on = [ aws_db_subnet_group.player-auth-db-subnet ]
}