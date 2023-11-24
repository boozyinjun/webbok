resource "aws_instance" "test" {
    ami                                  = "ami-06dd92ecc74fdfb36"
    associate_public_ip_address          = true
    availability_zone                    = "eu-central-1a"
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t2.micro"
    key_name                             = "myKeyAWS"
    monitoring                           = false
    placement_partition_number           = 0
    secondary_private_ips                = []
    security_groups                      = [
        "launch-wizard-4",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-08d386666a14baff7"
    tags                                 = {
        "Name" = "test"
    }
    tags_all                             = {
        "Name" = "test"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-0a682acd74c445d25",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = true
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

}
