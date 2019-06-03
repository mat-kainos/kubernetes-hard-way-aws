data "template_file" "inventory" {
    template = "${file("inventory.tpl")}"

    vars = {
        kthw-controller_public_ip = "${aws_instance.ec2[0].public_ip}"
        kthw-controller_private_ip = "${aws_instance.ec2[0].private_ip}"
        kthw-worker-1_public_ip = "${aws_instance.ec2[0].public_ip}"
        kthw-worker-1_private_ip = "${aws_instance.ec2[0].private_ip}"
        key_path = "${var.private_key_file_name}"
    }
}

resource "null_resource" "update_inventory" {

    triggers = {
        template = "${data.template_file.inventory.rendered}"
    }

    provisioner "local-exec" {
        command = "echo '${data.template_file.inventory.rendered}' > ../ansible/hosts"
    }
}