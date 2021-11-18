data "aws_arn" "peer" {
  #arn = aws_vpc.peer.arn
  arn = module.vpc.vpc_arn
}

resource "hcp_aws_network_peering" "peer" {
  hvn_id          = hcp_hvn.learn_hcp_vault_hvn.hvn_id
  peering_id      = var.peering_id
  peer_vpc_id     = module.vpc.vpc_id
  peer_account_id = module.vpc.vpc_owner_id
  peer_vpc_region = data.aws_arn.peer.region
  #peer_vpc_region = provider.aws.region
}

resource "hcp_hvn_route" "peer_route" {
  hvn_link         = hcp_hvn.learn_hcp_vault_hvn.self_link
  hvn_route_id     = var.route_id
  destination_cidr = module.vpc.vpc_cidr_block
  target_link      = hcp_aws_network_peering.peer.self_link
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
  auto_accept               = true
}
