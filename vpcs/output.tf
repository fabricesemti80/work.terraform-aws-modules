
output "vpc-ids" {
    value = values(module.vpc).*.vpc_id
}