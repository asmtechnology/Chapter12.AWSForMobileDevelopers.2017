//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSEC2Resources.h"
#import <AWSCore/AWSLogging.h>

@interface AWSEC2Resources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSEC2Resources

+ (instancetype)sharedInstance {
    static AWSEC2Resources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSEC2Resources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-10-01\",\
    \"endpointPrefix\":\"ec2\",\
    \"protocol\":\"ec2\",\
    \"serviceAbbreviation\":\"Amazon EC2\",\
    \"serviceFullName\":\"Amazon Elastic Compute Cloud\",\
    \"signatureVersion\":\"v4\",\
    \"xmlNamespace\":\"http://ec2.amazonaws.com/doc/2015-10-01\"\
  },\
  \"operations\":{\
    \"AcceptVpcPeeringConnection\":{\
      \"name\":\"AcceptVpcPeeringConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AcceptVpcPeeringConnectionRequest\"},\
      \"output\":{\"shape\":\"AcceptVpcPeeringConnectionResult\"},\
      \"documentation\":\"<p>Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the <code>pending-acceptance</code> state, and you must be the owner of the peer VPC. Use the <code>DescribeVpcPeeringConnections</code> request to view your outstanding VPC peering connection requests.</p>\"\
    },\
    \"AllocateAddress\":{\
      \"name\":\"AllocateAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AllocateAddressRequest\"},\
      \"output\":{\"shape\":\"AllocateAddressResult\"},\
      \"documentation\":\"<p>Acquires an Elastic IP address.</p> <p>An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"AllocateHosts\":{\
      \"name\":\"AllocateHosts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AllocateHostsRequest\"},\
      \"output\":{\"shape\":\"AllocateHostsResult\"},\
      \"documentation\":\"<p>Allocates a Dedicated host to your account. At minimum you need to specify the instance size type, Availability Zone, and quantity of hosts you want to allocate.</p>\"\
    },\
    \"AssignPrivateIpAddresses\":{\
      \"name\":\"AssignPrivateIpAddresses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssignPrivateIpAddressesRequest\"},\
      \"documentation\":\"<p>Assigns one or more secondary private IP addresses to the specified network interface. You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about Elastic IP addresses, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>AssignPrivateIpAddresses is available only in EC2-VPC.</p>\"\
    },\
    \"AssociateAddress\":{\
      \"name\":\"AssociateAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateAddressRequest\"},\
      \"output\":{\"shape\":\"AssociateAddressResult\"},\
      \"documentation\":\"<p>Associates an Elastic IP address with an instance or a network interface.</p> <p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>[EC2-Classic, VPC in an EC2-VPC-only account] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance.</p> <p>[VPC in an EC2-Classic account] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation.</p> <p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>\"\
    },\
    \"AssociateDhcpOptions\":{\
      \"name\":\"AssociateDhcpOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateDhcpOptionsRequest\"},\
      \"documentation\":\"<p>Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC.</p> <p>After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html\\\">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"AssociateRouteTable\":{\
      \"name\":\"AssociateRouteTable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateRouteTableRequest\"},\
      \"output\":{\"shape\":\"AssociateRouteTableResult\"},\
      \"documentation\":\"<p>Associates a subnet with a route table. The subnet and route table must be in the same VPC. This association causes traffic originating from the subnet to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table from the subnet later. A route table can be associated with multiple subnets.</p> <p>For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"AttachClassicLinkVpc\":{\
      \"name\":\"AttachClassicLinkVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachClassicLinkVpcRequest\"},\
      \"output\":{\"shape\":\"AttachClassicLinkVpcResult\"},\
      \"documentation\":\"<p>Links an EC2-Classic instance to a ClassicLink-enabled VPC through one or more of the VPC's security groups. You cannot link an EC2-Classic instance to more than one VPC at a time. You can only link an instance that's in the <code>running</code> state. An instance is automatically unlinked from a VPC when it's stopped - you can link it to the VPC again when you restart it.</p> <p>After you've linked an instance, you cannot change the VPC security groups that are associated with it. To change the security groups, you must first unlink the instance, and then link it again. </p> <p>Linking your instance to a VPC is sometimes referred to as <i>attaching</i> your instance.</p>\"\
    },\
    \"AttachInternetGateway\":{\
      \"name\":\"AttachInternetGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachInternetGatewayRequest\"},\
      \"documentation\":\"<p>Attaches an Internet gateway to a VPC, enabling connectivity between the Internet and the VPC. For more information about your VPC and Internet gateway, see the <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/\\\">Amazon Virtual Private Cloud User Guide</a>.</p>\"\
    },\
    \"AttachNetworkInterface\":{\
      \"name\":\"AttachNetworkInterface\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachNetworkInterfaceRequest\"},\
      \"output\":{\"shape\":\"AttachNetworkInterfaceResult\"},\
      \"documentation\":\"<p>Attaches a network interface to an instance.</p>\"\
    },\
    \"AttachVolume\":{\
      \"name\":\"AttachVolume\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachVolumeRequest\"},\
      \"output\":{\"shape\":\"VolumeAttachment\"},\
      \"documentation\":\"<p>Attaches an EBS volume to a running or stopped instance and exposes it to the instance with the specified device name.</p> <p>Encrypted EBS volumes may only be attached to instances that support Amazon EBS encryption. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html\\\">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>For a list of supported device names, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html\\\">Attaching an EBS Volume to an Instance</a>. Any device names that aren't reserved for instance store volumes can be used for EBS volumes. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html\\\">Amazon EC2 Instance Store</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>If a volume has an AWS Marketplace product code:</p> <ul> <li> <p>The volume can be attached only to a stopped instance.</p> </li> <li> <p>AWS Marketplace product codes are copied from the volume to the instance.</p> </li> <li> <p>You must be subscribed to the product.</p> </li> <li> <p>The instance type and operating system of the instance must support the product. For example, you can't detach a volume from a Windows instance and attach it to a Linux instance.</p> </li> </ul> <p>For an overview of the AWS Marketplace, see <a href=\\\"https://aws.amazon.com/marketplace/help/200900000\\\">Introducing AWS Marketplace</a>.</p> <p>For more information about EBS volumes, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html\\\">Attaching Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"AttachVpnGateway\":{\
      \"name\":\"AttachVpnGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachVpnGatewayRequest\"},\
      \"output\":{\"shape\":\"AttachVpnGatewayResult\"},\
      \"documentation\":\"<p>Attaches a virtual private gateway to a VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"AuthorizeSecurityGroupEgress\":{\
      \"name\":\"AuthorizeSecurityGroupEgress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AuthorizeSecurityGroupEgressRequest\"},\
      \"documentation\":\"<p>[EC2-VPC only] Adds one or more egress rules to a security group for use with a VPC. Specifically, this action permits instances to send traffic to one or more destination CIDR IP address ranges, or to one or more destination security groups for the same VPC. This action doesn't apply to security groups for use in EC2-Classic. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html\\\">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <important> <p>You can have up to 50 rules per security group (covering both ingress and egress rules).</p> </important> <p>Each rule consists of the protocol (for example, TCP), plus either a CIDR range or a source group. For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes.</p> <p>Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur.</p>\"\
    },\
    \"AuthorizeSecurityGroupIngress\":{\
      \"name\":\"AuthorizeSecurityGroupIngress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AuthorizeSecurityGroupIngressRequest\"},\
      \"documentation\":\"<p>Adds one or more ingress rules to a security group.</p> <important> <p>EC2-Classic: You can have up to 100 rules per group.</p> <p>EC2-VPC: You can have up to 50 rules per group (covering both ingress and egress rules).</p> </important> <p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p> <p>[EC2-Classic] This action gives one or more CIDR IP address ranges permission to access a security group in your account, or gives one or more security groups (called the <i>source groups</i>) permission to access a security group for your account. A source group can be for your own AWS account, or another.</p> <p>[EC2-VPC] This action gives one or more CIDR IP address ranges permission to access a security group in your VPC, or gives one or more other security groups (called the <i>source groups</i>) permission to access a security group for your VPC. The security groups must all be for the same VPC.</p>\"\
    },\
    \"BundleInstance\":{\
      \"name\":\"BundleInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BundleInstanceRequest\"},\
      \"output\":{\"shape\":\"BundleInstanceResult\"},\
      \"documentation\":\"<p>Bundles an Amazon instance store-backed Windows instance.</p> <p>During bundling, only the root device volume (C:\\\\) is bundled. Data on other instance store volumes is not preserved.</p> <note> <p>This action is not applicable for Linux/Unix instances or Windows instances that are backed by Amazon EBS.</p> </note> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/Creating_InstanceStoreBacked_WinAMI.html\\\">Creating an Instance Store-Backed Windows AMI</a>.</p>\"\
    },\
    \"CancelBundleTask\":{\
      \"name\":\"CancelBundleTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelBundleTaskRequest\"},\
      \"output\":{\"shape\":\"CancelBundleTaskResult\"},\
      \"documentation\":\"<p>Cancels a bundling operation for an instance store-backed Windows instance.</p>\"\
    },\
    \"CancelConversionTask\":{\
      \"name\":\"CancelConversionTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelConversionRequest\"},\
      \"documentation\":\"<p>Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html\\\">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CancelExportTask\":{\
      \"name\":\"CancelExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelExportTaskRequest\"},\
      \"documentation\":\"<p>Cancels an active export task. The request removes all artifacts of the export, including any partially-created Amazon S3 objects. If the export task is complete or is in the process of transferring the final disk image, the command fails and returns an error.</p>\"\
    },\
    \"CancelImportTask\":{\
      \"name\":\"CancelImportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelImportTaskRequest\"},\
      \"output\":{\"shape\":\"CancelImportTaskResult\"},\
      \"documentation\":\"<p>Cancels an in-process import virtual machine or import snapshot task.</p>\"\
    },\
    \"CancelReservedInstancesListing\":{\
      \"name\":\"CancelReservedInstancesListing\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelReservedInstancesListingRequest\"},\
      \"output\":{\"shape\":\"CancelReservedInstancesListingResult\"},\
      \"documentation\":\"<p>Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html\\\">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CancelSpotFleetRequests\":{\
      \"name\":\"CancelSpotFleetRequests\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelSpotFleetRequestsRequest\"},\
      \"output\":{\"shape\":\"CancelSpotFleetRequestsResponse\"},\
      \"documentation\":\"<p>Cancels the specified Spot fleet requests.</p> <p>After you cancel a Spot fleet request, the Spot fleet launches no new Spot instances. You must specify whether the Spot fleet should also terminate its Spot instances. If you terminate the instances, the Spot fleet request enters the <code>cancelled_terminating</code> state. Otherwise, the Spot fleet request enters the <code>cancelled_running</code> state and the instances continue to run until they are interrupted or you terminate them manually.</p>\"\
    },\
    \"CancelSpotInstanceRequests\":{\
      \"name\":\"CancelSpotInstanceRequests\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelSpotInstanceRequestsRequest\"},\
      \"output\":{\"shape\":\"CancelSpotInstanceRequestsResult\"},\
      \"documentation\":\"<p>Cancels one or more Spot instance requests. Spot instances are instances that Amazon EC2 starts on your behalf when the bid price that you specify exceeds the current Spot price. Amazon EC2 periodically sets the Spot price based on available Spot instance capacity and current Spot instance requests. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html\\\">Spot Instance Requests</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <important> <p>Canceling a Spot instance request does not terminate running Spot instances associated with the request.</p> </important>\"\
    },\
    \"ConfirmProductInstance\":{\
      \"name\":\"ConfirmProductInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmProductInstanceRequest\"},\
      \"output\":{\"shape\":\"ConfirmProductInstanceResult\"},\
      \"documentation\":\"<p>Determines whether a product code is associated with an instance. This action can only be used by the owner of the product code. It is useful when a product code owner needs to verify whether another user's instance is eligible for support.</p>\"\
    },\
    \"CopyImage\":{\
      \"name\":\"CopyImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CopyImageRequest\"},\
      \"output\":{\"shape\":\"CopyImageResult\"},\
      \"documentation\":\"<p>Initiates the copy of an AMI from the specified source region to the current region. You specify the destination region by using its endpoint when making the request.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html\\\">Copying AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CopySnapshot\":{\
      \"name\":\"CopySnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CopySnapshotRequest\"},\
      \"output\":{\"shape\":\"CopySnapshotResult\"},\
      \"documentation\":\"<p>Copies a point-in-time snapshot of an EBS volume and stores it in Amazon S3. You can copy the snapshot within the same region or from one region to another. You can use the snapshot to create EBS volumes or Amazon Machine Images (AMIs). The snapshot is copied to the regional endpoint that you send the HTTP request to.</p> <p>Copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted, unless the <code>Encrypted</code> flag is specified during the snapshot copy operation. By default, encrypted snapshot copies use the default AWS Key Management Service (AWS KMS) customer master key (CMK); however, you can specify a non-default CMK with the <code>KmsKeyId</code> parameter.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html\\\">Copying an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateCustomerGateway\":{\
      \"name\":\"CreateCustomerGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCustomerGatewayRequest\"},\
      \"output\":{\"shape\":\"CreateCustomerGatewayResult\"},\
      \"documentation\":\"<p>Provides information to AWS about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the AWS side of the VPN connection is the virtual private gateway.) You must provide the Internet-routable IP address of the customer gateway's external interface. The IP address must be static and may be behind a device performing network address translation (NAT).</p> <p>For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range).</p> <note> <p>Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534, with the exception of 7224, which is reserved in the <code>us-east-1</code> region, and 9059, which is reserved in the <code>eu-west-1</code> region.</p> </note> <p>For more information about VPN customer gateways, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <important> <p>You cannot create more than one customer gateway with the same VPN type, IP address, and BGP ASN parameter values. If you run an identical request more than one time, the first request creates the customer gateway, and subsequent requests return information about the existing customer gateway. The subsequent requests do not create new customer gateway resources. </p> </important>\"\
    },\
    \"CreateDhcpOptions\":{\
      \"name\":\"CreateDhcpOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDhcpOptionsRequest\"},\
      \"output\":{\"shape\":\"CreateDhcpOptionsResult\"},\
      \"documentation\":\"<p>Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see <a href=\\\"http://www.ietf.org/rfc/rfc2132.txt\\\">RFC 2132</a>.</p> <ul> <li><p><code>domain-name-servers</code> - The IP addresses of up to four domain name servers, or AmazonProvidedDNS. The default DHCP option set specifies AmazonProvidedDNS. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas.</p></li> <li><p><code>domain-name</code> - If you're using AmazonProvidedDNS in \\\"us-east-1\\\", specify \\\"ec2.internal\\\". If you're using AmazonProvidedDNS in another region, specify \\\"region.compute.internal\\\" (for example, \\\"ap-northeast-1.compute.internal\\\"). Otherwise, specify a domain name (for example, \\\"MyCompany.com\\\"). <b>Important</b>: Some Linux operating systems accept multiple domain names separated by spaces. However, Windows and other Linux operating systems treat the value as a single domain, which results in unexpected behavior. If your DHCP options set is associated with a VPC that has instances with multiple operating systems, specify only one domain name.</p></li> <li><p><code>ntp-servers</code> - The IP addresses of up to four Network Time Protocol (NTP) servers.</p></li> <li><p><code>netbios-name-servers</code> - The IP addresses of up to four NetBIOS name servers.</p></li> <li><p><code>netbios-node-type</code> - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see <a href=\\\"http://www.ietf.org/rfc/rfc2132.txt\\\">RFC 2132</a>.</p></li> </ul> <p>Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an Internet gateway, make sure to set the <code>domain-name-servers</code> option either to <code>AmazonProvidedDNS</code> or to a domain name server of your choice. For more information about DHCP options, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html\\\">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateFlowLogs\":{\
      \"name\":\"CreateFlowLogs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateFlowLogsRequest\"},\
      \"output\":{\"shape\":\"CreateFlowLogsResult\"},\
      \"documentation\":\"<p>Creates one or more flow logs to capture IP traffic for a specific network interface, subnet, or VPC. Flow logs are delivered to a specified log group in Amazon CloudWatch Logs. If you specify a VPC or subnet in the request, a log stream is created in CloudWatch Logs for each network interface in the subnet or VPC. Log streams can include information about accepted and rejected traffic to a network interface. You can view the data in your log streams using Amazon CloudWatch Logs. </p> <p>In your request, you must also specify an IAM role that has permission to publish logs to CloudWatch Logs.</p>\"\
    },\
    \"CreateImage\":{\
      \"name\":\"CreateImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateImageRequest\"},\
      \"output\":{\"shape\":\"CreateImageResult\"},\
      \"documentation\":\"<p>Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.</p> <p>If you customized your instance with instance store volumes or EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html\\\">Creating Amazon EBS-Backed Linux AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateInstanceExportTask\":{\
      \"name\":\"CreateInstanceExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateInstanceExportTaskRequest\"},\
      \"output\":{\"shape\":\"CreateInstanceExportTaskResult\"},\
      \"documentation\":\"<p>Exports a running or stopped instance to an S3 bucket.</p> <p>For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ExportingEC2Instances.html\\\">Exporting EC2 Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateInternetGateway\":{\
      \"name\":\"CreateInternetGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateInternetGatewayRequest\"},\
      \"output\":{\"shape\":\"CreateInternetGatewayResult\"},\
      \"documentation\":\"<p>Creates an Internet gateway for use with a VPC. After creating the Internet gateway, you attach it to a VPC using <a>AttachInternetGateway</a>.</p> <p>For more information about your VPC and Internet gateway, see the <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/\\\">Amazon Virtual Private Cloud User Guide</a>.</p>\"\
    },\
    \"CreateKeyPair\":{\
      \"name\":\"CreateKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateKeyPairRequest\"},\
      \"output\":{\"shape\":\"KeyPair\"},\
      \"documentation\":\"<p>Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS#8 private key. If a key with the specified name already exists, Amazon EC2 returns an error.</p> <p>You can have up to five thousand key pairs per region.</p> <p>The key pair returned to you is available only in the region in which you create it. To create a key pair that is available in all regions, use <a>ImportKeyPair</a>.</p> <p>For more information about key pairs, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateNatGateway\":{\
      \"name\":\"CreateNatGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateNatGatewayRequest\"},\
      \"output\":{\"shape\":\"CreateNatGatewayResult\"},\
      \"documentation\":\"<p>Creates a NAT gateway in the specified subnet. A NAT gateway can be used to enable instances in a private subnet to connect to the Internet. This action creates a network interface in the specified subnet with a private IP address from the IP address range of the subnet. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-gateway.html\\\">NAT Gateways</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateNetworkAcl\":{\
      \"name\":\"CreateNetworkAcl\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateNetworkAclRequest\"},\
      \"output\":{\"shape\":\"CreateNetworkAclResult\"},\
      \"documentation\":\"<p>Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.</p> <p>For more information about network ACLs, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html\\\">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateNetworkAclEntry\":{\
      \"name\":\"CreateNetworkAclEntry\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateNetworkAclEntryRequest\"},\
      \"documentation\":\"<p>Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules.</p> <p>We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules.</p> <p>After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one.</p> <p>For more information about network ACLs, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html\\\">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateNetworkInterface\":{\
      \"name\":\"CreateNetworkInterface\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateNetworkInterfaceRequest\"},\
      \"output\":{\"shape\":\"CreateNetworkInterfaceResult\"},\
      \"documentation\":\"<p>Creates a network interface in the specified subnet.</p> <p>For more information about network interfaces, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html\\\">Elastic Network Interfaces</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreatePlacementGroup\":{\
      \"name\":\"CreatePlacementGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePlacementGroupRequest\"},\
      \"documentation\":\"<p>Creates a placement group that you launch cluster instances into. You must give the group a name that's unique within the scope of your account.</p> <p>For more information about placement groups and cluster instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html\\\">Cluster Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateReservedInstancesListing\":{\
      \"name\":\"CreateReservedInstancesListing\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateReservedInstancesListingRequest\"},\
      \"output\":{\"shape\":\"CreateReservedInstancesListingResult\"},\
      \"documentation\":\"<p>Creates a listing for Amazon EC2 Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Reserved Instance listing at a time. To get a list of your Reserved Instances, you can use the <a>DescribeReservedInstances</a> operation.</p> <p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p> <p>To sell your Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Reserved Instances, and specify the upfront price to receive for them. Your Reserved Instance listings then become available for purchase. To view the details of your Reserved Instance listing, you can use the <a>DescribeReservedInstancesListings</a> operation.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html\\\">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateRoute\":{\
      \"name\":\"CreateRoute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRouteRequest\"},\
      \"output\":{\"shape\":\"CreateRouteResult\"},\
      \"documentation\":\"<p>Creates a route in a route table within a VPC.</p> <p>You must specify one of the following targets: Internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, or network interface.</p> <p>When determining how to route traffic, we use the route with the most specific match. For example, let's say the traffic is destined for <code>192.0.2.3</code>, and the route table includes the following two routes:</p> <ul> <li> <p><code>192.0.2.0/24</code> (goes to some target A)</p> </li> <li> <p><code>192.0.2.0/28</code> (goes to some target B)</p> </li> </ul> <p>Both routes apply to the traffic destined for <code>192.0.2.3</code>. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.</p> <p>For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateRouteTable\":{\
      \"name\":\"CreateRouteTable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateRouteTableRequest\"},\
      \"output\":{\"shape\":\"CreateRouteTableResult\"},\
      \"documentation\":\"<p>Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet.</p> <p>For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateSecurityGroup\":{\
      \"name\":\"CreateSecurityGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSecurityGroupRequest\"},\
      \"output\":{\"shape\":\"CreateSecurityGroupResult\"},\
      \"documentation\":\"<p>Creates a security group.</p> <p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html\\\">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html\\\">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <important> <p>EC2-Classic: You can have up to 500 security groups.</p> <p>EC2-VPC: You can create up to 500 security groups per VPC.</p> </important> <p>When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name.</p> <p>You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other.</p> <p>You can add or remove rules from your security groups using <a>AuthorizeSecurityGroupIngress</a>, <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupIngress</a>, and <a>RevokeSecurityGroupEgress</a>.</p>\"\
    },\
    \"CreateSnapshot\":{\
      \"name\":\"CreateSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSnapshotRequest\"},\
      \"output\":{\"shape\":\"Snapshot\"},\
      \"documentation\":\"<p>Creates a snapshot of an EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of EBS volumes, and to save data before shutting down an instance.</p> <p>When a snapshot is created, any AWS Marketplace product codes that are associated with the source volume are propagated to the snapshot.</p> <p>You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your EBS volume at the time the snapshot command is issued; this may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is <code>pending</code>.</p> <p>To create a snapshot for EBS volumes that serve as root devices, you should stop the instance before taking the snapshot.</p> <p>Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html\\\">Amazon Elastic Block Store</a> and <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html\\\">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateSpotDatafeedSubscription\":{\
      \"name\":\"CreateSpotDatafeedSubscription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSpotDatafeedSubscriptionRequest\"},\
      \"output\":{\"shape\":\"CreateSpotDatafeedSubscriptionResult\"},\
      \"documentation\":\"<p>Creates a data feed for Spot instances, enabling you to view Spot instance usage logs. You can create one data feed per AWS account. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html\\\">Spot Instance Data Feed</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateSubnet\":{\
      \"name\":\"CreateSubnet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateSubnetRequest\"},\
      \"output\":{\"shape\":\"CreateSubnetResult\"},\
      \"documentation\":\"<p>Creates a subnet in an existing VPC.</p> <p>When you create each subnet, you provide the VPC ID and the CIDR block you want for the subnet. After you create a subnet, you can't change its CIDR block. The subnet's CIDR block can be the same as the VPC's CIDR block (assuming you want only a single subnet in the VPC), or a subset of the VPC's CIDR block. If you create more than one subnet in a VPC, the subnets' CIDR blocks must not overlap. The smallest subnet (and VPC) you can create uses a /28 netmask (16 IP addresses), and the largest uses a /16 netmask (65,536 IP addresses).</p> <important> <p>AWS reserves both the first four and the last IP address in each subnet's CIDR block. They're not available for use.</p> </important> <p>If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle.</p> <p>If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP address doesn't change if you stop and restart the instance (unlike a similar instance launched outside a VPC, which gets a new IP address when restarted). It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available.</p> <p>For more information about subnets, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html\\\">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateTags\":{\
      \"name\":\"CreateTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTagsRequest\"},\
      \"documentation\":\"<p>Adds or overwrites one or more tags for the specified Amazon EC2 resource or resources. Each resource can have a maximum of 10 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource.</p> <p>For more information about tags, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html\\\">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about creating IAM policies that control users' access to resources based on tags, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html\\\">Supported Resource-Level Permissions for Amazon EC2 API Actions</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateVolume\":{\
      \"name\":\"CreateVolume\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVolumeRequest\"},\
      \"output\":{\"shape\":\"Volume\"},\
      \"documentation\":\"<p>Creates an EBS volume that can be attached to an instance in the same Availability Zone. The volume is created in the regional endpoint that you send the HTTP request to. For more information see <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/rande.html\\\">Regions and Endpoints</a>.</p> <p>You can create a new empty volume or restore a volume from an EBS snapshot. Any AWS Marketplace product codes from the snapshot are propagated to the volume.</p> <p>You can create encrypted volumes with the <code>Encrypted</code> parameter. Encrypted volumes may only be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html\\\">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html\\\">Creating or Restoring an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"CreateVpc\":{\
      \"name\":\"CreateVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVpcRequest\"},\
      \"output\":{\"shape\":\"CreateVpcResult\"},\
      \"documentation\":\"<p>Creates a VPC with the specified CIDR block.</p> <p>The smallest VPC you can create uses a /28 netmask (16 IP addresses), and the largest uses a /16 netmask (65,536 IP addresses). To help you decide how big to make your VPC, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html\\\">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <p>By default, each instance you launch in the VPC has the default DHCP options, which includes only a default DNS server that we provide (AmazonProvidedDNS). For more information about DHCP options, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html\\\">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <p>You can specify the instance tenancy value for the VPC when you create it. You can't change this value for the VPC after you create it. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/dedicated-instance.html.html\\\">Dedicated Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateVpcEndpoint\":{\
      \"name\":\"CreateVpcEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVpcEndpointRequest\"},\
      \"output\":{\"shape\":\"CreateVpcEndpointResult\"},\
      \"documentation\":\"<p>Creates a VPC endpoint for a specified AWS service. An endpoint enables you to create a private connection between your VPC and another AWS service in your account. You can specify an endpoint policy to attach to the endpoint that will control access to the service from your VPC. You can also specify the VPC route tables that use the endpoint.</p> <p>Currently, only endpoints to Amazon S3 are supported.</p>\"\
    },\
    \"CreateVpcPeeringConnection\":{\
      \"name\":\"CreateVpcPeeringConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVpcPeeringConnectionRequest\"},\
      \"output\":{\"shape\":\"CreateVpcPeeringConnectionResult\"},\
      \"documentation\":\"<p>Requests a VPC peering connection between two VPCs: a requester VPC that you own and a peer VPC with which to create the connection. The peer VPC can belong to another AWS account. The requester VPC and peer VPC cannot have overlapping CIDR blocks.</p> <p>The owner of the peer VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected.</p> <p>A <code>CreateVpcPeeringConnection</code> request between VPCs with overlapping CIDR blocks results in the VPC peering connection having a status of <code>failed</code>.</p>\"\
    },\
    \"CreateVpnConnection\":{\
      \"name\":\"CreateVpnConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVpnConnectionRequest\"},\
      \"output\":{\"shape\":\"CreateVpnConnectionResult\"},\
      \"documentation\":\"<p>Creates a VPN connection between an existing virtual private gateway and a VPN customer gateway. The only supported connection type is <code>ipsec.1</code>.</p> <p>The response includes information that you need to give to your network administrator to configure your customer gateway.</p> <important> <p>We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway.</p> </important> <p>If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call.</p> <p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p> <p>For more information about VPN connections, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateVpnConnectionRoute\":{\
      \"name\":\"CreateVpnConnectionRoute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVpnConnectionRouteRequest\"},\
      \"documentation\":\"<p>Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p> <p>For more information about VPN connections, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"CreateVpnGateway\":{\
      \"name\":\"CreateVpnGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVpnGatewayRequest\"},\
      \"output\":{\"shape\":\"CreateVpnGatewayResult\"},\
      \"documentation\":\"<p>Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself.</p> <p>For more information about virtual private gateways, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DeleteCustomerGateway\":{\
      \"name\":\"DeleteCustomerGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCustomerGatewayRequest\"},\
      \"documentation\":\"<p>Deletes the specified customer gateway. You must delete the VPN connection before you can delete the customer gateway.</p>\"\
    },\
    \"DeleteDhcpOptions\":{\
      \"name\":\"DeleteDhcpOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDhcpOptionsRequest\"},\
      \"documentation\":\"<p>Deletes the specified set of DHCP options. You must disassociate the set of DHCP options before you can delete it. You can disassociate the set of DHCP options by associating either a new set of options or the default set of options with the VPC.</p>\"\
    },\
    \"DeleteFlowLogs\":{\
      \"name\":\"DeleteFlowLogs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteFlowLogsRequest\"},\
      \"output\":{\"shape\":\"DeleteFlowLogsResult\"},\
      \"documentation\":\"<p>Deletes one or more flow logs.</p>\"\
    },\
    \"DeleteInternetGateway\":{\
      \"name\":\"DeleteInternetGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteInternetGatewayRequest\"},\
      \"documentation\":\"<p>Deletes the specified Internet gateway. You must detach the Internet gateway from the VPC before you can delete it.</p>\"\
    },\
    \"DeleteKeyPair\":{\
      \"name\":\"DeleteKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteKeyPairRequest\"},\
      \"documentation\":\"<p>Deletes the specified key pair, by removing the public key from Amazon EC2.</p>\"\
    },\
    \"DeleteNatGateway\":{\
      \"name\":\"DeleteNatGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNatGatewayRequest\"},\
      \"output\":{\"shape\":\"DeleteNatGatewayResult\"},\
      \"documentation\":\"<p>Deletes the specified NAT gateway. Deleting a NAT gateway disassociates its Elastic IP address, but does not release the address from your account. Deleting a NAT gateway does not delete any NAT gateway routes in your route tables. </p>\"\
    },\
    \"DeleteNetworkAcl\":{\
      \"name\":\"DeleteNetworkAcl\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNetworkAclRequest\"},\
      \"documentation\":\"<p>Deletes the specified network ACL. You can't delete the ACL if it's associated with any subnets. You can't delete the default network ACL.</p>\"\
    },\
    \"DeleteNetworkAclEntry\":{\
      \"name\":\"DeleteNetworkAclEntry\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNetworkAclEntryRequest\"},\
      \"documentation\":\"<p>Deletes the specified ingress or egress entry (rule) from the specified network ACL.</p>\"\
    },\
    \"DeleteNetworkInterface\":{\
      \"name\":\"DeleteNetworkInterface\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNetworkInterfaceRequest\"},\
      \"documentation\":\"<p>Deletes the specified network interface. You must detach the network interface before you can delete it.</p>\"\
    },\
    \"DeletePlacementGroup\":{\
      \"name\":\"DeletePlacementGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeletePlacementGroupRequest\"},\
      \"documentation\":\"<p>Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information about placement groups and cluster instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html\\\">Cluster Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DeleteRoute\":{\
      \"name\":\"DeleteRoute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRouteRequest\"},\
      \"documentation\":\"<p>Deletes the specified route from the specified route table.</p>\"\
    },\
    \"DeleteRouteTable\":{\
      \"name\":\"DeleteRouteTable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRouteTableRequest\"},\
      \"documentation\":\"<p>Deletes the specified route table. You must disassociate the route table from any subnets before you can delete it. You can't delete the main route table.</p>\"\
    },\
    \"DeleteSecurityGroup\":{\
      \"name\":\"DeleteSecurityGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSecurityGroupRequest\"},\
      \"documentation\":\"<p>Deletes a security group.</p> <p>If you attempt to delete a security group that is associated with an instance, or is referenced by another security group, the operation fails with <code>InvalidGroup.InUse</code> in EC2-Classic or <code>DependencyViolation</code> in EC2-VPC.</p>\"\
    },\
    \"DeleteSnapshot\":{\
      \"name\":\"DeleteSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSnapshotRequest\"},\
      \"documentation\":\"<p>Deletes the specified snapshot.</p> <p>When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.</p> <p>You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html\\\">Deleting an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DeleteSpotDatafeedSubscription\":{\
      \"name\":\"DeleteSpotDatafeedSubscription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSpotDatafeedSubscriptionRequest\"},\
      \"documentation\":\"<p>Deletes the data feed for Spot instances.</p>\"\
    },\
    \"DeleteSubnet\":{\
      \"name\":\"DeleteSubnet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSubnetRequest\"},\
      \"documentation\":\"<p>Deletes the specified subnet. You must terminate all running instances in the subnet before you can delete the subnet.</p>\"\
    },\
    \"DeleteTags\":{\
      \"name\":\"DeleteTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTagsRequest\"},\
      \"documentation\":\"<p>Deletes the specified set of tags from the specified set of resources. This call is designed to follow a <code>DescribeTags</code> request.</p> <p>For more information about tags, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html\\\">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DeleteVolume\":{\
      \"name\":\"DeleteVolume\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVolumeRequest\"},\
      \"documentation\":\"<p>Deletes the specified EBS volume. The volume must be in the <code>available</code> state (not attached to an instance).</p> <note> <p>The volume may remain in the <code>deleting</code> state for several minutes.</p> </note> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html\\\">Deleting an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DeleteVpc\":{\
      \"name\":\"DeleteVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVpcRequest\"},\
      \"documentation\":\"<p>Deletes the specified VPC. You must detach or delete all gateways and resources that are associated with the VPC before you can delete it. For example, you must terminate all instances running in the VPC, delete all security groups associated with the VPC (except the default one), delete all route tables associated with the VPC (except the default one), and so on.</p>\"\
    },\
    \"DeleteVpcEndpoints\":{\
      \"name\":\"DeleteVpcEndpoints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVpcEndpointsRequest\"},\
      \"output\":{\"shape\":\"DeleteVpcEndpointsResult\"},\
      \"documentation\":\"<p>Deletes one or more specified VPC endpoints. Deleting the endpoint also deletes the endpoint routes in the route tables that were associated with the endpoint.</p>\"\
    },\
    \"DeleteVpcPeeringConnection\":{\
      \"name\":\"DeleteVpcPeeringConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVpcPeeringConnectionRequest\"},\
      \"output\":{\"shape\":\"DeleteVpcPeeringConnectionResult\"},\
      \"documentation\":\"<p>Deletes a VPC peering connection. Either the owner of the requester VPC or the owner of the peer VPC can delete the VPC peering connection if it's in the <code>active</code> state. The owner of the requester VPC can delete a VPC peering connection in the <code>pending-acceptance</code> state. </p>\"\
    },\
    \"DeleteVpnConnection\":{\
      \"name\":\"DeleteVpnConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVpnConnectionRequest\"},\
      \"documentation\":\"<p>Deletes the specified VPN connection.</p> <p>If you're deleting the VPC and its associated components, we recommend that you detach the virtual private gateway from the VPC and delete the VPC before deleting the VPN connection. If you believe that the tunnel credentials for your VPN connection have been compromised, you can delete the VPN connection and create a new one that has new keys, without needing to delete the VPC or virtual private gateway. If you create a new VPN connection, you must reconfigure the customer gateway using the new configuration information returned with the new VPN connection ID.</p>\"\
    },\
    \"DeleteVpnConnectionRoute\":{\
      \"name\":\"DeleteVpnConnectionRoute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVpnConnectionRouteRequest\"},\
      \"documentation\":\"<p>Deletes the specified static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p>\"\
    },\
    \"DeleteVpnGateway\":{\
      \"name\":\"DeleteVpnGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVpnGatewayRequest\"},\
      \"documentation\":\"<p>Deletes the specified virtual private gateway. We recommend that before you delete a virtual private gateway, you detach it from the VPC and delete the VPN connection. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.</p>\"\
    },\
    \"DeregisterImage\":{\
      \"name\":\"DeregisterImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeregisterImageRequest\"},\
      \"documentation\":\"<p>Deregisters the specified AMI. After you deregister an AMI, it can't be used to launch new instances.</p> <p>This command does not delete the AMI.</p>\"\
    },\
    \"DescribeAccountAttributes\":{\
      \"name\":\"DescribeAccountAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAccountAttributesRequest\"},\
      \"output\":{\"shape\":\"DescribeAccountAttributesResult\"},\
      \"documentation\":\"<p>Describes attributes of your AWS account. The following are the supported account attributes:</p> <ul> <li> <p><code>supported-platforms</code>: Indicates whether your account can launch instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.</p> </li> <li> <p><code>default-vpc</code>: The ID of the default VPC for your account, or <code>none</code>.</p> </li> <li> <p><code>max-instances</code>: The maximum number of On-Demand instances that you can run.</p> </li> <li> <p><code>vpc-max-security-groups-per-interface</code>: The maximum number of security groups that you can assign to a network interface.</p> </li> <li> <p><code>max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-Classic. </p> </li> <li> <p><code>vpc-max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-VPC.</p> </li> </ul>\"\
    },\
    \"DescribeAddresses\":{\
      \"name\":\"DescribeAddresses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAddressesRequest\"},\
      \"output\":{\"shape\":\"DescribeAddressesResult\"},\
      \"documentation\":\"<p>Describes one or more of your Elastic IP addresses.</p> <p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeAvailabilityZones\":{\
      \"name\":\"DescribeAvailabilityZones\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAvailabilityZonesRequest\"},\
      \"output\":{\"shape\":\"DescribeAvailabilityZonesResult\"},\
      \"documentation\":\"<p>Describes one or more of the Availability Zones that are available to you. The results include zones only for the region you're currently using. If there is an event impacting an Availability Zone, you can use this request to view the state and any provided message for that Availability Zone.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html\\\">Regions and Availability Zones</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeBundleTasks\":{\
      \"name\":\"DescribeBundleTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeBundleTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeBundleTasksResult\"},\
      \"documentation\":\"<p>Describes one or more of your bundling tasks.</p> <note><p>Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use <code>RegisterImage</code> with the Amazon S3 bucket name and image manifest name you provided to the bundle task.</p></note>\"\
    },\
    \"DescribeClassicLinkInstances\":{\
      \"name\":\"DescribeClassicLinkInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeClassicLinkInstancesRequest\"},\
      \"output\":{\"shape\":\"DescribeClassicLinkInstancesResult\"},\
      \"documentation\":\"<p>Describes one or more of your linked EC2-Classic instances. This request only returns information about EC2-Classic instances linked to a VPC through ClassicLink; you cannot use this request to return information about other instances.</p>\"\
    },\
    \"DescribeConversionTasks\":{\
      \"name\":\"DescribeConversionTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeConversionTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeConversionTasksResult\"},\
      \"documentation\":\"<p>Describes one or more of your conversion tasks. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html\\\">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>For information about the import manifest referenced by this API action, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html\\\">VM Import Manifest</a>.</p>\"\
    },\
    \"DescribeCustomerGateways\":{\
      \"name\":\"DescribeCustomerGateways\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCustomerGatewaysRequest\"},\
      \"output\":{\"shape\":\"DescribeCustomerGatewaysResult\"},\
      \"documentation\":\"<p>Describes one or more of your VPN customer gateways.</p> <p>For more information about VPN customer gateways, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeDhcpOptions\":{\
      \"name\":\"DescribeDhcpOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDhcpOptionsRequest\"},\
      \"output\":{\"shape\":\"DescribeDhcpOptionsResult\"},\
      \"documentation\":\"<p>Describes one or more of your DHCP options sets.</p> <p>For more information about DHCP options sets, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html\\\">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeExportTasks\":{\
      \"name\":\"DescribeExportTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeExportTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeExportTasksResult\"},\
      \"documentation\":\"<p>Describes one or more of your export tasks.</p>\"\
    },\
    \"DescribeFlowLogs\":{\
      \"name\":\"DescribeFlowLogs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeFlowLogsRequest\"},\
      \"output\":{\"shape\":\"DescribeFlowLogsResult\"},\
      \"documentation\":\"<p>Describes one or more flow logs. To view the information in your flow logs (the log streams for the network interfaces), you must use the CloudWatch Logs console or the CloudWatch Logs API.</p>\"\
    },\
    \"DescribeHosts\":{\
      \"name\":\"DescribeHosts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeHostsRequest\"},\
      \"output\":{\"shape\":\"DescribeHostsResult\"},\
      \"documentation\":\"<p>Describes one or more of your Dedicated hosts.</p> <p>The results describe only the Dedicated hosts in the region you're currently using. All listed instances consume capacity on your Dedicated host. Dedicated hosts that have recently been released will be listed with the state <code>released</code>.</p>\"\
    },\
    \"DescribeIdFormat\":{\
      \"name\":\"DescribeIdFormat\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeIdFormatRequest\"},\
      \"output\":{\"shape\":\"DescribeIdFormatResult\"},\
      \"documentation\":\"<p>Describes the ID format settings for your resources on a per-region basis, for example, to view which resource types are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. </p> <p>The following resource types support longer IDs: <code>instance</code> | <code>reservation</code> | <code>snapshot</code> | <code>volume</code>. </p> <p>These settings apply to the IAM user who makes the request; they do not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user, unless they explicitly override the settings by running the <a>ModifyIdFormat</a> command. Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>\"\
    },\
    \"DescribeImageAttribute\":{\
      \"name\":\"DescribeImageAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeImageAttributeRequest\"},\
      \"output\":{\"shape\":\"ImageAttribute\"},\
      \"documentation\":\"<p>Describes the specified attribute of the specified AMI. You can specify only one attribute at a time.</p>\"\
    },\
    \"DescribeImages\":{\
      \"name\":\"DescribeImages\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeImagesRequest\"},\
      \"output\":{\"shape\":\"DescribeImagesResult\"},\
      \"documentation\":\"<p>Describes one or more of the images (AMIs, AKIs, and ARIs) available to you. Images available to you include public images, private images that you own, and private images owned by other AWS accounts but for which you have explicit launch permissions.</p> <note><p>Deregistered images are included in the returned results for an unspecified interval after deregistration.</p></note>\"\
    },\
    \"DescribeImportImageTasks\":{\
      \"name\":\"DescribeImportImageTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeImportImageTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeImportImageTasksResult\"},\
      \"documentation\":\"<p>Displays details about an import virtual machine or import snapshot tasks that are already created.</p>\"\
    },\
    \"DescribeImportSnapshotTasks\":{\
      \"name\":\"DescribeImportSnapshotTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeImportSnapshotTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeImportSnapshotTasksResult\"},\
      \"documentation\":\"<p>Describes your import snapshot tasks.</p>\"\
    },\
    \"DescribeInstanceAttribute\":{\
      \"name\":\"DescribeInstanceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceAttributeRequest\"},\
      \"output\":{\"shape\":\"InstanceAttribute\"},\
      \"documentation\":\"<p>Describes the specified attribute of the specified instance. You can specify only one attribute at a time. Valid attribute values are: <code>instanceType</code> | <code>kernel</code> | <code>ramdisk</code> | <code>userData</code> | <code>disableApiTermination</code> | <code>instanceInitiatedShutdownBehavior</code> | <code>rootDeviceName</code> | <code>blockDeviceMapping</code> | <code>productCodes</code> | <code>sourceDestCheck</code> | <code>groupSet</code> | <code>ebsOptimized</code> | <code>sriovNetSupport</code></p>\"\
    },\
    \"DescribeInstanceStatus\":{\
      \"name\":\"DescribeInstanceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceStatusRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceStatusResult\"},\
      \"documentation\":\"<p>Describes the status of one or more instances. By default, only running instances are described, unless specified otherwise.</p> <p>Instance status includes the following components:</p> <ul> <li> <p><b>Status checks</b> - Amazon EC2 performs status checks on running EC2 instances to identify hardware and software issues. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html\\\">Status Checks for Your Instances</a> and <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html\\\">Troubleshooting Instances with Failed Status Checks</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li> <li> <p><b>Scheduled events</b> - Amazon EC2 can schedule events (such as reboot, stop, or terminate) for your instances related to hardware issues, software updates, or system maintenance. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html\\\">Scheduled Events for Your Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> </li> <li> <p><b>Instance state</b> - You can manage your instances from the moment you launch them through their termination. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html\\\">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> </li> </ul>\"\
    },\
    \"DescribeInstances\":{\
      \"name\":\"DescribeInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeInstancesRequest\"},\
      \"output\":{\"shape\":\"DescribeInstancesResult\"},\
      \"documentation\":\"<p>Describes one or more of your instances.</p> <p>If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the returned results.</p> <p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p>\"\
    },\
    \"DescribeInternetGateways\":{\
      \"name\":\"DescribeInternetGateways\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeInternetGatewaysRequest\"},\
      \"output\":{\"shape\":\"DescribeInternetGatewaysResult\"},\
      \"documentation\":\"<p>Describes one or more of your Internet gateways.</p>\"\
    },\
    \"DescribeKeyPairs\":{\
      \"name\":\"DescribeKeyPairs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeKeyPairsRequest\"},\
      \"output\":{\"shape\":\"DescribeKeyPairsResult\"},\
      \"documentation\":\"<p>Describes one or more of your key pairs.</p> <p>For more information about key pairs, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeMovingAddresses\":{\
      \"name\":\"DescribeMovingAddresses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeMovingAddressesRequest\"},\
      \"output\":{\"shape\":\"DescribeMovingAddressesResult\"},\
      \"documentation\":\"<p>Describes your Elastic IP addresses that are being moved to the EC2-VPC platform, or that are being restored to the EC2-Classic platform. This request does not return information about any other Elastic IP addresses in your account.</p>\"\
    },\
    \"DescribeNatGateways\":{\
      \"name\":\"DescribeNatGateways\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNatGatewaysRequest\"},\
      \"output\":{\"shape\":\"DescribeNatGatewaysResult\"},\
      \"documentation\":\"<p>Describes one or more of the your NAT gateways.</p>\"\
    },\
    \"DescribeNetworkAcls\":{\
      \"name\":\"DescribeNetworkAcls\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNetworkAclsRequest\"},\
      \"output\":{\"shape\":\"DescribeNetworkAclsResult\"},\
      \"documentation\":\"<p>Describes one or more of your network ACLs.</p> <p>For more information about network ACLs, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html\\\">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeNetworkInterfaceAttribute\":{\
      \"name\":\"DescribeNetworkInterfaceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNetworkInterfaceAttributeRequest\"},\
      \"output\":{\"shape\":\"DescribeNetworkInterfaceAttributeResult\"},\
      \"documentation\":\"<p>Describes a network interface attribute. You can specify only one attribute at a time.</p>\"\
    },\
    \"DescribeNetworkInterfaces\":{\
      \"name\":\"DescribeNetworkInterfaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNetworkInterfacesRequest\"},\
      \"output\":{\"shape\":\"DescribeNetworkInterfacesResult\"},\
      \"documentation\":\"<p>Describes one or more of your network interfaces.</p>\"\
    },\
    \"DescribePlacementGroups\":{\
      \"name\":\"DescribePlacementGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribePlacementGroupsRequest\"},\
      \"output\":{\"shape\":\"DescribePlacementGroupsResult\"},\
      \"documentation\":\"<p>Describes one or more of your placement groups. For more information about placement groups and cluster instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html\\\">Cluster Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribePrefixLists\":{\
      \"name\":\"DescribePrefixLists\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribePrefixListsRequest\"},\
      \"output\":{\"shape\":\"DescribePrefixListsResult\"},\
      \"documentation\":\"<p>Describes available AWS services in a prefix list format, which includes the prefix list name and prefix list ID of the service and the IP address range for the service. A prefix list ID is required for creating an outbound security group rule that allows traffic from a VPC to access an AWS service through a VPC endpoint.</p>\"\
    },\
    \"DescribeRegions\":{\
      \"name\":\"DescribeRegions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeRegionsRequest\"},\
      \"output\":{\"shape\":\"DescribeRegionsResult\"},\
      \"documentation\":\"<p>Describes one or more regions that are currently available to you.</p> <p>For a list of the regions supported by Amazon EC2, see <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region\\\">Regions and Endpoints</a>.</p>\"\
    },\
    \"DescribeReservedInstances\":{\
      \"name\":\"DescribeReservedInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReservedInstancesRequest\"},\
      \"output\":{\"shape\":\"DescribeReservedInstancesResult\"},\
      \"documentation\":\"<p>Describes one or more of the Reserved Instances that you purchased.</p> <p>For more information about Reserved Instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html\\\">Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeReservedInstancesListings\":{\
      \"name\":\"DescribeReservedInstancesListings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReservedInstancesListingsRequest\"},\
      \"output\":{\"shape\":\"DescribeReservedInstancesListingsResult\"},\
      \"documentation\":\"<p>Describes your account's Reserved Instance listings in the Reserved Instance Marketplace.</p> <p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances. </p> <p>As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase. </p> <p>As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html\\\">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeReservedInstancesModifications\":{\
      \"name\":\"DescribeReservedInstancesModifications\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReservedInstancesModificationsRequest\"},\
      \"output\":{\"shape\":\"DescribeReservedInstancesModificationsResult\"},\
      \"documentation\":\"<p>Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html\\\">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>\"\
    },\
    \"DescribeReservedInstancesOfferings\":{\
      \"name\":\"DescribeReservedInstancesOfferings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReservedInstancesOfferingsRequest\"},\
      \"output\":{\"shape\":\"DescribeReservedInstancesOfferingsResult\"},\
      \"documentation\":\"<p>Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used.</p> <p>If you have listed your own Reserved Instances for sale in the Reserved Instance Marketplace, they will be excluded from these results. This is to ensure that you do not purchase your own Reserved Instances.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html\\\">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeRouteTables\":{\
      \"name\":\"DescribeRouteTables\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeRouteTablesRequest\"},\
      \"output\":{\"shape\":\"DescribeRouteTablesResult\"},\
      \"documentation\":\"<p>Describes one or more of your route tables. </p> <p>Each subnet in your VPC must be associated with a route table. If a subnet is not explicitly associated with any route table, it is implicitly associated with the main route table. This command does not return the subnet ID for implicit associations.</p> <p>For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeScheduledInstanceAvailability\":{\
      \"name\":\"DescribeScheduledInstanceAvailability\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScheduledInstanceAvailabilityRequest\"},\
      \"output\":{\"shape\":\"DescribeScheduledInstanceAvailabilityResult\"},\
      \"documentation\":\"<p>Finds available schedules that meet the specified criteria.</p> <p>You can search for an available schedule no more than 3 months in advance. You must meet the minimum required duration of 1,200 hours per year. For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and the minimum monthly schedule is 100 hours.</p> <p>After you find a schedule that meets your needs, call <a>PurchaseScheduledInstances</a> to purchase Scheduled Instances with that schedule.</p>\"\
    },\
    \"DescribeScheduledInstances\":{\
      \"name\":\"DescribeScheduledInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScheduledInstancesRequest\"},\
      \"output\":{\"shape\":\"DescribeScheduledInstancesResult\"},\
      \"documentation\":\"<p>Describes one or more of your Scheduled Instances.</p>\"\
    },\
    \"DescribeSecurityGroupReferences\":{\
      \"name\":\"DescribeSecurityGroupReferences\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSecurityGroupReferencesRequest\"},\
      \"output\":{\"shape\":\"DescribeSecurityGroupReferencesResult\"},\
      \"documentation\":\"<p>[EC2-VPC only] Describes the VPCs on the other side of a VPC peering connection that are referencing the security groups you've specified in this request. </p>\"\
    },\
    \"DescribeSecurityGroups\":{\
      \"name\":\"DescribeSecurityGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSecurityGroupsRequest\"},\
      \"output\":{\"shape\":\"DescribeSecurityGroupsResult\"},\
      \"documentation\":\"<p>Describes one or more of your security groups.</p> <p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html\\\">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html\\\">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeSnapshotAttribute\":{\
      \"name\":\"DescribeSnapshotAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSnapshotAttributeRequest\"},\
      \"output\":{\"shape\":\"DescribeSnapshotAttributeResult\"},\
      \"documentation\":\"<p>Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time.</p> <p>For more information about EBS snapshots, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html'>Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeSnapshots\":{\
      \"name\":\"DescribeSnapshots\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSnapshotsRequest\"},\
      \"output\":{\"shape\":\"DescribeSnapshotsResult\"},\
      \"documentation\":\"<p>Describes one or more of the EBS snapshots available to you. Available snapshots include public snapshots available for any AWS account to launch, private snapshots that you own, and private snapshots owned by another AWS account but for which you've been given explicit create volume permissions.</p> <p>The create volume permissions fall into the following categories:</p> <ul> <li> <p><i>public</i>: The owner of the snapshot granted create volume permissions for the snapshot to the <code>all</code> group. All AWS accounts have create volume permissions for these snapshots.</p> </li> <li> <p><i>explicit</i>: The owner of the snapshot granted create volume permissions to a specific AWS account.</p> </li> <li> <p><i>implicit</i>: An AWS account has implicit create volume permissions for all snapshots it owns.</p> </li> </ul> <p>The list of snapshots returned can be modified by specifying snapshot IDs, snapshot owners, or AWS accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions.</p> <p>If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results.</p> <p>If you specify one or more snapshot owners, only snapshots from the specified owners and for which you have access are returned. The results can include the AWS account IDs of the specified owners, <code>amazon</code> for snapshots owned by Amazon, or <code>self</code> for snapshots that you own.</p> <p>If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify AWS account IDs (if you own the snapshots), <code>self</code> for snapshots for which you own or have explicit permissions, or <code>all</code> for public snapshots.</p> <p>If you are describing a long list of snapshots, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSnapshots</code> request to retrieve the remaining results.</p> <p>For more information about EBS snapshots, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html'>Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeSpotDatafeedSubscription\":{\
      \"name\":\"DescribeSpotDatafeedSubscription\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSpotDatafeedSubscriptionRequest\"},\
      \"output\":{\"shape\":\"DescribeSpotDatafeedSubscriptionResult\"},\
      \"documentation\":\"<p>Describes the data feed for Spot instances. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html\\\">Spot Instance Data Feed</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeSpotFleetInstances\":{\
      \"name\":\"DescribeSpotFleetInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSpotFleetInstancesRequest\"},\
      \"output\":{\"shape\":\"DescribeSpotFleetInstancesResponse\"},\
      \"documentation\":\"<p>Describes the running instances for the specified Spot fleet.</p>\"\
    },\
    \"DescribeSpotFleetRequestHistory\":{\
      \"name\":\"DescribeSpotFleetRequestHistory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSpotFleetRequestHistoryRequest\"},\
      \"output\":{\"shape\":\"DescribeSpotFleetRequestHistoryResponse\"},\
      \"documentation\":\"<p>Describes the events for the specified Spot fleet request during the specified time.</p> <p>Spot fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event.</p>\"\
    },\
    \"DescribeSpotFleetRequests\":{\
      \"name\":\"DescribeSpotFleetRequests\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSpotFleetRequestsRequest\"},\
      \"output\":{\"shape\":\"DescribeSpotFleetRequestsResponse\"},\
      \"documentation\":\"<p>Describes your Spot fleet requests.</p>\"\
    },\
    \"DescribeSpotInstanceRequests\":{\
      \"name\":\"DescribeSpotInstanceRequests\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSpotInstanceRequestsRequest\"},\
      \"output\":{\"shape\":\"DescribeSpotInstanceRequestsResult\"},\
      \"documentation\":\"<p>Describes the Spot instance requests that belong to your account. Spot instances are instances that Amazon EC2 launches when the bid price that you specify exceeds the current Spot price. Amazon EC2 periodically sets the Spot price based on available Spot instance capacity and current Spot instance requests. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html\\\">Spot Instance Requests</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>You can use <code>DescribeSpotInstanceRequests</code> to find a running Spot instance by examining the response. If the status of the Spot instance is <code>fulfilled</code>, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use <a>DescribeInstances</a> with a filter to look for instances where the instance lifecycle is <code>spot</code>.</p>\"\
    },\
    \"DescribeSpotPriceHistory\":{\
      \"name\":\"DescribeSpotPriceHistory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSpotPriceHistoryRequest\"},\
      \"output\":{\"shape\":\"DescribeSpotPriceHistoryResult\"},\
      \"documentation\":\"<p>Describes the Spot price history. The prices returned are listed in chronological order, from the oldest to the most recent, for up to the past 90 days. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html\\\">Spot Instance Pricing History</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>When you specify a start and end time, this operation returns the prices of the instance types within the time range that you specified and the time when the price changed. The price is valid within the time period that you specified; the response merely indicates the last time that the price changed.</p>\"\
    },\
    \"DescribeStaleSecurityGroups\":{\
      \"name\":\"DescribeStaleSecurityGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStaleSecurityGroupsRequest\"},\
      \"output\":{\"shape\":\"DescribeStaleSecurityGroupsResult\"},\
      \"documentation\":\"<p>[EC2-VPC only] Describes the stale security group rules for security groups in a specified VPC. Rules are stale when they reference a deleted security group in a peer VPC, or a security group in a peer VPC for which the VPC peering connection has been deleted. </p>\"\
    },\
    \"DescribeSubnets\":{\
      \"name\":\"DescribeSubnets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSubnetsRequest\"},\
      \"output\":{\"shape\":\"DescribeSubnetsResult\"},\
      \"documentation\":\"<p>Describes one or more of your subnets.</p> <p>For more information about subnets, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html\\\">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeTags\":{\
      \"name\":\"DescribeTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTagsRequest\"},\
      \"output\":{\"shape\":\"DescribeTagsResult\"},\
      \"documentation\":\"<p>Describes one or more of the tags for your EC2 resources.</p> <p>For more information about tags, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html\\\">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeVolumeAttribute\":{\
      \"name\":\"DescribeVolumeAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVolumeAttributeRequest\"},\
      \"output\":{\"shape\":\"DescribeVolumeAttributeResult\"},\
      \"documentation\":\"<p>Describes the specified attribute of the specified volume. You can specify only one attribute at a time.</p> <p>For more information about EBS volumes, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html'>Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeVolumeStatus\":{\
      \"name\":\"DescribeVolumeStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVolumeStatusRequest\"},\
      \"output\":{\"shape\":\"DescribeVolumeStatusResult\"},\
      \"documentation\":\"<p>Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event.</p> <p>The <code>DescribeVolumeStatus</code> operation provides the following information about the specified volumes:</p> <p><i>Status</i>: Reflects the current status of the volume. The possible values are <code>ok</code>, <code>impaired</code> , <code>warning</code>, or <code>insufficient-data</code>. If all checks pass, the overall status of the volume is <code>ok</code>. If the check fails, the overall status is <code>impaired</code>. If the status is <code>insufficient-data</code>, then the checks may still be taking place on your volume at the time. We recommend that you retry the request. For more information on volume status, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html\\\">Monitoring the Status of Your Volumes</a>.</p> <p><i>Events</i>: Reflect the cause of a volume status and may require you to take action. For example, if your volume returns an <code>impaired</code> status, then the volume event might be <code>potential-data-inconsistency</code>. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and may have inconsistent data.</p> <p><i>Actions</i>: Reflect the actions you may have to take in response to an event. For example, if the status of the volume is <code>impaired</code> and the volume event shows <code>potential-data-inconsistency</code>, then the action shows <code>enable-volume-io</code>. This means that you may want to enable the I/O operations for the volume by calling the <a>EnableVolumeIO</a> action and then check the volume for data consistency.</p> <note> <p>Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the <code>error</code> state (for example, when a volume is incapable of accepting I/O.)</p> </note>\"\
    },\
    \"DescribeVolumes\":{\
      \"name\":\"DescribeVolumes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVolumesRequest\"},\
      \"output\":{\"shape\":\"DescribeVolumesResult\"},\
      \"documentation\":\"<p>Describes the specified EBS volumes.</p> <p>If you are describing a long list of volumes, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeVolumes</code> request to retrieve the remaining results.</p> <p>For more information about EBS volumes, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html'>Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeVpcAttribute\":{\
      \"name\":\"DescribeVpcAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcAttributeRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcAttributeResult\"},\
      \"documentation\":\"<p>Describes the specified attribute of the specified VPC. You can specify only one attribute at a time.</p>\"\
    },\
    \"DescribeVpcClassicLink\":{\
      \"name\":\"DescribeVpcClassicLink\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcClassicLinkRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcClassicLinkResult\"},\
      \"documentation\":\"<p>Describes the ClassicLink status of one or more VPCs. </p>\"\
    },\
    \"DescribeVpcClassicLinkDnsSupport\":{\
      \"name\":\"DescribeVpcClassicLinkDnsSupport\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcClassicLinkDnsSupportRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcClassicLinkDnsSupportResult\"},\
      \"documentation\":\"<p>Describes the ClassicLink DNS support status of one or more VPCs. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information about ClassicLink, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the Amazon Elastic Compute Cloud User Guide.</p>\"\
    },\
    \"DescribeVpcEndpointServices\":{\
      \"name\":\"DescribeVpcEndpointServices\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcEndpointServicesRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcEndpointServicesResult\"},\
      \"documentation\":\"<p>Describes all supported AWS services that can be specified when creating a VPC endpoint.</p>\"\
    },\
    \"DescribeVpcEndpoints\":{\
      \"name\":\"DescribeVpcEndpoints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcEndpointsRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcEndpointsResult\"},\
      \"documentation\":\"<p>Describes one or more of your VPC endpoints.</p>\"\
    },\
    \"DescribeVpcPeeringConnections\":{\
      \"name\":\"DescribeVpcPeeringConnections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcPeeringConnectionsRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcPeeringConnectionsResult\"},\
      \"documentation\":\"<p>Describes one or more of your VPC peering connections.</p>\"\
    },\
    \"DescribeVpcs\":{\
      \"name\":\"DescribeVpcs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpcsRequest\"},\
      \"output\":{\"shape\":\"DescribeVpcsResult\"},\
      \"documentation\":\"<p>Describes one or more of your VPCs.</p>\"\
    },\
    \"DescribeVpnConnections\":{\
      \"name\":\"DescribeVpnConnections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpnConnectionsRequest\"},\
      \"output\":{\"shape\":\"DescribeVpnConnectionsResult\"},\
      \"documentation\":\"<p>Describes one or more of your VPN connections.</p> <p>For more information about VPN connections, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DescribeVpnGateways\":{\
      \"name\":\"DescribeVpnGateways\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeVpnGatewaysRequest\"},\
      \"output\":{\"shape\":\"DescribeVpnGatewaysResult\"},\
      \"documentation\":\"<p>Describes one or more of your virtual private gateways.</p> <p>For more information about virtual private gateways, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html\\\">Adding an IPsec Hardware VPN to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"DetachClassicLinkVpc\":{\
      \"name\":\"DetachClassicLinkVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachClassicLinkVpcRequest\"},\
      \"output\":{\"shape\":\"DetachClassicLinkVpcResult\"},\
      \"documentation\":\"<p>Unlinks (detaches) a linked EC2-Classic instance from a VPC. After the instance has been unlinked, the VPC security groups are no longer associated with it. An instance is automatically unlinked from a VPC when it's stopped.</p>\"\
    },\
    \"DetachInternetGateway\":{\
      \"name\":\"DetachInternetGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachInternetGatewayRequest\"},\
      \"documentation\":\"<p>Detaches an Internet gateway from a VPC, disabling connectivity between the Internet and the VPC. The VPC must not contain any running instances with Elastic IP addresses.</p>\"\
    },\
    \"DetachNetworkInterface\":{\
      \"name\":\"DetachNetworkInterface\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachNetworkInterfaceRequest\"},\
      \"documentation\":\"<p>Detaches a network interface from an instance.</p>\"\
    },\
    \"DetachVolume\":{\
      \"name\":\"DetachVolume\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachVolumeRequest\"},\
      \"output\":{\"shape\":\"VolumeAttachment\"},\
      \"documentation\":\"<p>Detaches an EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so results in the volume being stuck in a busy state while detaching.</p> <p>If an Amazon EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first.</p> <p>When a volume with an AWS Marketplace product code is detached from an instance, the product code is no longer associated with the instance.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html\\\">Detaching an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"DetachVpnGateway\":{\
      \"name\":\"DetachVpnGateway\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachVpnGatewayRequest\"},\
      \"documentation\":\"<p>Detaches a virtual private gateway from a VPC. You do this if you're planning to turn off the VPC and not use it anymore. You can confirm a virtual private gateway has been completely detached from a VPC by describing the virtual private gateway (any attachments to the virtual private gateway are also described).</p> <p>You must wait for the attachment's state to switch to <code>detached</code> before you can delete the VPC or attach a different VPC to the virtual private gateway.</p>\"\
    },\
    \"DisableVgwRoutePropagation\":{\
      \"name\":\"DisableVgwRoutePropagation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableVgwRoutePropagationRequest\"},\
      \"documentation\":\"<p>Disables a virtual private gateway (VGW) from propagating routes to a specified route table of a VPC.</p>\"\
    },\
    \"DisableVpcClassicLink\":{\
      \"name\":\"DisableVpcClassicLink\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableVpcClassicLinkRequest\"},\
      \"output\":{\"shape\":\"DisableVpcClassicLinkResult\"},\
      \"documentation\":\"<p>Disables ClassicLink for a VPC. You cannot disable ClassicLink for a VPC that has EC2-Classic instances linked to it.</p>\"\
    },\
    \"DisableVpcClassicLinkDnsSupport\":{\
      \"name\":\"DisableVpcClassicLinkDnsSupport\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableVpcClassicLinkDnsSupportRequest\"},\
      \"output\":{\"shape\":\"DisableVpcClassicLinkDnsSupportResult\"},\
      \"documentation\":\"<p>Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames resolve to public IP addresses when addressed between a linked EC2-Classic instance and instances in the VPC to which it's linked. For more information about ClassicLink, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the Amazon Elastic Compute Cloud User Guide.</p>\"\
    },\
    \"DisassociateAddress\":{\
      \"name\":\"DisassociateAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateAddressRequest\"},\
      \"documentation\":\"<p>Disassociates an Elastic IP address from the instance or network interface it's associated with.</p> <p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html\\\">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>\"\
    },\
    \"DisassociateRouteTable\":{\
      \"name\":\"DisassociateRouteTable\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateRouteTableRequest\"},\
      \"documentation\":\"<p>Disassociates a subnet from a route table.</p> <p>After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"EnableVgwRoutePropagation\":{\
      \"name\":\"EnableVgwRoutePropagation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableVgwRoutePropagationRequest\"},\
      \"documentation\":\"<p>Enables a virtual private gateway (VGW) to propagate routes to the specified route table of a VPC.</p>\"\
    },\
    \"EnableVolumeIO\":{\
      \"name\":\"EnableVolumeIO\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableVolumeIORequest\"},\
      \"documentation\":\"<p>Enables I/O operations for a volume that had I/O operations disabled because the data on the volume was potentially inconsistent.</p>\"\
    },\
    \"EnableVpcClassicLink\":{\
      \"name\":\"EnableVpcClassicLink\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableVpcClassicLinkRequest\"},\
      \"output\":{\"shape\":\"EnableVpcClassicLinkResult\"},\
      \"documentation\":\"<p>Enables a VPC for ClassicLink. You can then link EC2-Classic instances to your ClassicLink-enabled VPC to allow communication over private IP addresses. You cannot enable your VPC for ClassicLink if any of your VPC's route tables have existing routes for address ranges within the <code>10.0.0.0/8</code> IP address range, excluding local routes for VPCs in the <code>10.0.0.0/16</code> and <code>10.1.0.0/16</code> IP address ranges. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the Amazon Elastic Compute Cloud User Guide.</p>\"\
    },\
    \"EnableVpcClassicLinkDnsSupport\":{\
      \"name\":\"EnableVpcClassicLinkDnsSupport\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableVpcClassicLinkDnsSupportRequest\"},\
      \"output\":{\"shape\":\"EnableVpcClassicLinkDnsSupportResult\"},\
      \"documentation\":\"<p>Enables a VPC to support DNS hostname resolution for ClassicLink. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information about ClassicLink, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the Amazon Elastic Compute Cloud User Guide.</p>\"\
    },\
    \"GetConsoleOutput\":{\
      \"name\":\"GetConsoleOutput\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetConsoleOutputRequest\"},\
      \"output\":{\"shape\":\"GetConsoleOutputResult\"},\
      \"documentation\":\"<p>Gets the console output for the specified instance.</p> <p>Instances do not have a physical monitor through which you can view their console output. They also lack physical controls that allow you to power up, reboot, or shut them down. To allow these actions, we provide them through the Amazon EC2 API and command line interface.</p> <p>Instance console output is buffered and posted shortly after instance boot, reboot, and termination. Amazon EC2 preserves the most recent 64 KB output which is available for at least one hour after the most recent post.</p> <p>For Linux instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a computer. This output is buffered because the instance produces it and then posts it to a store where the instance's owner can retrieve it.</p> <p>For Windows instances, the instance console output includes output from the EC2Config service.</p>\"\
    },\
    \"GetPasswordData\":{\
      \"name\":\"GetPasswordData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPasswordDataRequest\"},\
      \"output\":{\"shape\":\"GetPasswordDataResult\"},\
      \"documentation\":\"<p>Retrieves the encrypted administrator password for an instance running Windows.</p> <p>The Windows password is generated at boot if the <code>EC2Config</code> service plugin, <code>Ec2SetPassword</code>, is enabled. This usually only happens the first time an AMI is launched, and then <code>Ec2SetPassword</code> is automatically disabled. The password is not generated for rebundled AMIs unless <code>Ec2SetPassword</code> is enabled before bundling.</p> <p>The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.</p> <p>Password generation and encryption takes a few moments. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.</p>\"\
    },\
    \"ImportImage\":{\
      \"name\":\"ImportImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportImageRequest\"},\
      \"output\":{\"shape\":\"ImportImageResult\"},\
      \"documentation\":\"<p>Import single or multi-volume disk images or EBS snapshots into an Amazon Machine Image (AMI).</p>\"\
    },\
    \"ImportInstance\":{\
      \"name\":\"ImportInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportInstanceRequest\"},\
      \"output\":{\"shape\":\"ImportInstanceResult\"},\
      \"documentation\":\"<p>Creates an import instance task using metadata from the specified disk image. <code>ImportInstance</code> only supports single-volume VMs. To import multi-volume VMs, use <a>ImportImage</a>. After importing the image, you then upload it using the <code>ec2-import-volume</code> command in the EC2 command line tools. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html\\\">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>For information about the import manifest referenced by this API action, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html\\\">VM Import Manifest</a>.</p>\"\
    },\
    \"ImportKeyPair\":{\
      \"name\":\"ImportKeyPair\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportKeyPairRequest\"},\
      \"output\":{\"shape\":\"ImportKeyPairResult\"},\
      \"documentation\":\"<p>Imports the public key from an RSA key pair that you created with a third-party tool. Compare this with <a>CreateKeyPair</a>, in which AWS creates the key pair and gives the keys to you (AWS keeps a copy of the public key). With ImportKeyPair, you create the key pair and give AWS just the public key. The private key is never transferred between you and AWS.</p> <p>For more information about key pairs, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"ImportSnapshot\":{\
      \"name\":\"ImportSnapshot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportSnapshotRequest\"},\
      \"output\":{\"shape\":\"ImportSnapshotResult\"},\
      \"documentation\":\"<p>Imports a disk into an EBS snapshot.</p>\"\
    },\
    \"ImportVolume\":{\
      \"name\":\"ImportVolume\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportVolumeRequest\"},\
      \"output\":{\"shape\":\"ImportVolumeResult\"},\
      \"documentation\":\"<p>Creates an import volume task using metadata from the specified disk image. After importing the image, you then upload it using the <code>ec2-import-volume</code> command in the Amazon EC2 command-line interface (CLI) tools. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html\\\">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>For information about the import manifest referenced by this API action, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html\\\">VM Import Manifest</a>.</p>\"\
    },\
    \"ModifyHosts\":{\
      \"name\":\"ModifyHosts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyHostsRequest\"},\
      \"output\":{\"shape\":\"ModifyHostsResult\"},\
      \"documentation\":\"<p>Modify the auto-placement setting of a Dedicated host. When auto-placement is enabled, AWS will place instances that you launch with a tenancy of <code>host</code>, but without targeting a specific host ID, onto any available Dedicated host in your account which has auto-placement enabled. When auto-placement is disabled, you need to provide a host ID if you want the instance to launch onto a specific host. If no host ID is provided, the instance will be launched onto a suitable host which has auto-placement enabled.</p>\"\
    },\
    \"ModifyIdFormat\":{\
      \"name\":\"ModifyIdFormat\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyIdFormatRequest\"},\
      \"documentation\":\"<p>Modifies the ID format for the specified resource on a per-region basis. You can specify that resources should receive longer IDs (17-character IDs) when they are created. The following resource types support longer IDs: <code>instance</code> | <code>reservation</code> | <code>snapshot</code> | <code>volume</code>.</p> <p>This setting applies to the IAM user who makes the request; it does not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user. If you're using this action as the root user or as an IAM role that has permission to use this action, then these settings apply to the entire account, unless an IAM user explicitly overrides these settings for themselves. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html#resource-ids-access\\\">Controlling Access to Longer ID Settings</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p> <p>Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>\"\
    },\
    \"ModifyImageAttribute\":{\
      \"name\":\"ModifyImageAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyImageAttributeRequest\"},\
      \"documentation\":\"<p>Modifies the specified attribute of the specified AMI. You can specify only one attribute at a time.</p> <note><p>AWS Marketplace product codes cannot be modified. Images with an AWS Marketplace product code cannot be made public.</p></note>\"\
    },\
    \"ModifyInstanceAttribute\":{\
      \"name\":\"ModifyInstanceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyInstanceAttributeRequest\"},\
      \"documentation\":\"<p>Modifies the specified attribute of the specified instance. You can specify only one attribute at a time.</p> <p>To modify some attributes, the instance must be stopped. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html\\\">Modifying Attributes of a Stopped Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"ModifyInstancePlacement\":{\
      \"name\":\"ModifyInstancePlacement\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyInstancePlacementRequest\"},\
      \"output\":{\"shape\":\"ModifyInstancePlacementResult\"},\
      \"documentation\":\"<p>Set the instance affinity value for a specific stopped instance and modify the instance tenancy setting.</p> <p>Instance affinity is disabled by default. When instance affinity is <code>host</code> and it is not associated with a specific Dedicated host, the next time it is launched it will automatically be associated with the host it lands on. This relationship will persist if the instance is stopped/started, or rebooted.</p> <p>You can modify the host ID associated with a stopped instance. If a stopped instance has a new host ID association, the instance will target that host when restarted.</p> <p>You can modify the tenancy of a stopped instance with a tenancy of <code>host</code> or <code>dedicated</code>.</p> <p>Affinity, hostID, and tenancy are not required parameters, but at least one of them must be specified in the request. Affinity and tenancy can be modified in the same request, but tenancy can only be modified on instances that are stopped.</p>\"\
    },\
    \"ModifyNetworkInterfaceAttribute\":{\
      \"name\":\"ModifyNetworkInterfaceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyNetworkInterfaceAttributeRequest\"},\
      \"documentation\":\"<p>Modifies the specified network interface attribute. You can specify only one attribute at a time.</p>\"\
    },\
    \"ModifyReservedInstances\":{\
      \"name\":\"ModifyReservedInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyReservedInstancesRequest\"},\
      \"output\":{\"shape\":\"ModifyReservedInstancesResult\"},\
      \"documentation\":\"<p>Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html\\\">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>\"\
    },\
    \"ModifySnapshotAttribute\":{\
      \"name\":\"ModifySnapshotAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifySnapshotAttributeRequest\"},\
      \"documentation\":\"<p>Adds or removes permission settings for the specified snapshot. You may add or remove specified AWS account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single API call. If you need to both add and remove account IDs for a snapshot, you must use multiple API calls.</p> <p>For more information on modifying snapshot permissions, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html\\\">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <note> <p>Snapshots with AWS Marketplace product codes cannot be made public.</p> </note>\"\
    },\
    \"ModifySpotFleetRequest\":{\
      \"name\":\"ModifySpotFleetRequest\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifySpotFleetRequestRequest\"},\
      \"output\":{\"shape\":\"ModifySpotFleetRequestResponse\"},\
      \"documentation\":\"<p>Modifies the specified Spot fleet request.</p> <p>While the Spot fleet request is being modified, it is in the <code>modifying</code> state.</p> <p>To scale up your Spot fleet, increase its target capacity. The Spot fleet launches the additional Spot instances according to the allocation strategy for the Spot fleet request. If the allocation strategy is <code>lowestPrice</code>, the Spot fleet launches instances using the Spot pool with the lowest price. If the allocation strategy is <code>diversified</code>, the Spot fleet distributes the instances across the Spot pools.</p> <p>To scale down your Spot fleet, decrease its target capacity. First, the Spot fleet cancels any open bids that exceed the new target capacity. You can request that the Spot fleet terminate Spot instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowestPrice</code>, the Spot fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>diversified</code>, the Spot fleet terminates instances across the Spot pools. Alternatively, you can request that the Spot fleet keep the fleet at its current size, but not replace any Spot instances that are interrupted or that you terminate manually.</p>\"\
    },\
    \"ModifySubnetAttribute\":{\
      \"name\":\"ModifySubnetAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifySubnetAttributeRequest\"},\
      \"documentation\":\"<p>Modifies a subnet attribute.</p>\"\
    },\
    \"ModifyVolumeAttribute\":{\
      \"name\":\"ModifyVolumeAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyVolumeAttributeRequest\"},\
      \"documentation\":\"<p>Modifies a volume attribute.</p> <p>By default, all I/O operations for the volume are suspended when the data on the volume is determined to be potentially inconsistent, to prevent undetectable, latent data corruption. The I/O access to the volume can be resumed by first enabling I/O access and then checking the data consistency on your volume.</p> <p>You can change the default behavior to resume I/O operations. We recommend that you change this only for boot volumes or for volumes that are stateless or disposable.</p>\"\
    },\
    \"ModifyVpcAttribute\":{\
      \"name\":\"ModifyVpcAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyVpcAttributeRequest\"},\
      \"documentation\":\"<p>Modifies the specified attribute of the specified VPC.</p>\"\
    },\
    \"ModifyVpcEndpoint\":{\
      \"name\":\"ModifyVpcEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyVpcEndpointRequest\"},\
      \"output\":{\"shape\":\"ModifyVpcEndpointResult\"},\
      \"documentation\":\"<p>Modifies attributes of a specified VPC endpoint. You can modify the policy associated with the endpoint, and you can add and remove route tables associated with the endpoint.</p>\"\
    },\
    \"ModifyVpcPeeringConnectionOptions\":{\
      \"name\":\"ModifyVpcPeeringConnectionOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ModifyVpcPeeringConnectionOptionsRequest\"},\
      \"output\":{\"shape\":\"ModifyVpcPeeringConnectionOptionsResult\"},\
      \"documentation\":\"<p>Modifies the VPC peering connection options on one side of a VPC peering connection. You can do the following:</p> <ul> <li><p>Enable/disable communication over the peering connection between an EC2-Classic instance that's linked to your VPC (using ClassicLink) and instances in the peer VPC. </p></li> <li><p>Enable/disable communication over the peering connection between instances in your VPC and an EC2-Classic instance that's linked to the peer VPC.</p></li> </ul> <p>If the peered VPCs are in different accounts, each owner must initiate a separate request to enable or disable communication in either direction, depending on whether their VPC was the requester or accepter for the VPC peering connection. If the peered VPCs are in the same account, you can modify the requester and accepter options in the same request. To confirm which VPC is the accepter and requester for a VPC peering connection, use the <a>DescribeVpcPeeringConnections</a> command.</p>\"\
    },\
    \"MonitorInstances\":{\
      \"name\":\"MonitorInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"MonitorInstancesRequest\"},\
      \"output\":{\"shape\":\"MonitorInstancesResult\"},\
      \"documentation\":\"<p>Enables monitoring for a running instance. For more information about monitoring instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html\\\">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"MoveAddressToVpc\":{\
      \"name\":\"MoveAddressToVpc\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"MoveAddressToVpcRequest\"},\
      \"output\":{\"shape\":\"MoveAddressToVpcResult\"},\
      \"documentation\":\"<p>Moves an Elastic IP address from the EC2-Classic platform to the EC2-VPC platform. The Elastic IP address must be allocated to your account for more than 24 hours, and it must not be associated with an instance. After the Elastic IP address is moved, it is no longer available for use in the EC2-Classic platform, unless you move it back using the <a>RestoreAddressToClassic</a> request. You cannot move an Elastic IP address that was originally allocated for use in the EC2-VPC platform to the EC2-Classic platform. You cannot migrate an Elastic IP address that's associated with a reverse DNS record. Contact AWS account and billing support to remove the reverse DNS record. </p>\"\
    },\
    \"PurchaseReservedInstancesOffering\":{\
      \"name\":\"PurchaseReservedInstancesOffering\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PurchaseReservedInstancesOfferingRequest\"},\
      \"output\":{\"shape\":\"PurchaseReservedInstancesOfferingResult\"},\
      \"documentation\":\"<p>Purchases a Reserved Instance for use with your account. With Reserved Instances, you obtain a capacity reservation for a certain instance configuration over a specified period of time and pay a lower hourly rate compared to On-Demand instance pricing.</p> <p>Use <a>DescribeReservedInstancesOfferings</a> to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with <a>DescribeReservedInstances</a>.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html\\\">Reserved Instances</a> and <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html\\\">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"PurchaseScheduledInstances\":{\
      \"name\":\"PurchaseScheduledInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PurchaseScheduledInstancesRequest\"},\
      \"output\":{\"shape\":\"PurchaseScheduledInstancesResult\"},\
      \"documentation\":\"<p>Purchases one or more Scheduled Instances with the specified schedule.</p> <p>Scheduled Instances enable you to purchase Amazon EC2 compute capacity by the hour for a one-year term. Before you can purchase a Scheduled Instance, you must call <a>DescribeScheduledInstanceAvailability</a> to check for available schedules and obtain a purchase token. After you purchase a Scheduled Instance, you must call <a>RunScheduledInstances</a> during each scheduled time period.</p> <p>After you purchase a Scheduled Instance, you can't cancel, modify, or resell your purchase.</p>\"\
    },\
    \"RebootInstances\":{\
      \"name\":\"RebootInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RebootInstancesRequest\"},\
      \"documentation\":\"<p>Requests a reboot of one or more instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored.</p> <p>If an instance does not cleanly shut down within four minutes, Amazon EC2 performs a hard reboot.</p> <p>For more information about troubleshooting, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html\\\">Getting Console Output and Rebooting Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"RegisterImage\":{\
      \"name\":\"RegisterImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterImageRequest\"},\
      \"output\":{\"shape\":\"RegisterImageResult\"},\
      \"documentation\":\"<p>Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html\\\">Creating Your Own AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <note><p>For Amazon EBS-backed instances, <a>CreateImage</a> creates and registers the AMI in a single request, so you don't have to register the AMI yourself.</p></note> <p>You can also use <code>RegisterImage</code> to create an Amazon EBS-backed Linux AMI from a snapshot of a root device volume. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_LaunchingInstanceFromSnapshot.html\\\">Launching an Instance from a Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <important> <p>Some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE Linux Enterprise Server (SLES), use the EC2 <code>billingProduct</code> code associated with an AMI to verify subscription status for package updates. Creating an AMI from an EBS snapshot does not maintain this billing code, and subsequent instances launched from such an AMI will not be able to connect to package update infrastructure.</p> <p>Similarly, although you can create a Windows AMI from a snapshot, you can't successfully launch an instance from the AMI.</p> <p>To create Windows AMIs or to create AMIs for Linux operating systems that must retain AMI billing codes to work properly, see <a>CreateImage</a>.</p> </important> <p>If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image.</p> <note><p>You can't register an image where a secondary (non-root) snapshot has AWS Marketplace product codes.</p></note>\"\
    },\
    \"RejectVpcPeeringConnection\":{\
      \"name\":\"RejectVpcPeeringConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RejectVpcPeeringConnectionRequest\"},\
      \"output\":{\"shape\":\"RejectVpcPeeringConnectionResult\"},\
      \"documentation\":\"<p>Rejects a VPC peering connection request. The VPC peering connection must be in the <code>pending-acceptance</code> state. Use the <a>DescribeVpcPeeringConnections</a> request to view your outstanding VPC peering connection requests. To delete an active VPC peering connection, or to delete a VPC peering connection request that you initiated, use <a>DeleteVpcPeeringConnection</a>.</p>\"\
    },\
    \"ReleaseAddress\":{\
      \"name\":\"ReleaseAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReleaseAddressRequest\"},\
      \"documentation\":\"<p>Releases the specified Elastic IP address.</p> <p>After releasing an Elastic IP address, it is released to the IP address pool and might be unavailable to you. Be sure to update your DNS records and any servers or devices that communicate with the address. If you attempt to release an Elastic IP address that you already released, you'll get an <code>AuthFailure</code> error if the address is already allocated to another AWS account.</p> <p>[EC2-Classic, default VPC] Releasing an Elastic IP address automatically disassociates it from any instance that it's associated with. To disassociate an Elastic IP address without releasing it, use <a>DisassociateAddress</a>.</p> <p>[Nondefault VPC] You must use <a>DisassociateAddress</a> to disassociate the Elastic IP address before you try to release it. Otherwise, Amazon EC2 returns an error (<code>InvalidIPAddress.InUse</code>).</p>\"\
    },\
    \"ReleaseHosts\":{\
      \"name\":\"ReleaseHosts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReleaseHostsRequest\"},\
      \"output\":{\"shape\":\"ReleaseHostsResult\"},\
      \"documentation\":\"<p>When you no longer want to use a Dedicated host it can be released. On-Demand billing is stopped and the host goes into <code>released</code> state. The host ID of Dedicated hosts that have been released can no longer be specified in another request, e.g., ModifyHosts. You must stop or terminate all instances on a host before it can be released.</p> <p>When Dedicated hosts are released, it make take some time for them to stop counting toward your limit and you may receive capacity errors when trying to allocate new Dedicated hosts. Try waiting a few minutes, and then try again. </p> <p>Released hosts will still appear in a DescribeHosts response.</p>\"\
    },\
    \"ReplaceNetworkAclAssociation\":{\
      \"name\":\"ReplaceNetworkAclAssociation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReplaceNetworkAclAssociationRequest\"},\
      \"output\":{\"shape\":\"ReplaceNetworkAclAssociationResult\"},\
      \"documentation\":\"<p>Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information about network ACLs, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html\\\">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"ReplaceNetworkAclEntry\":{\
      \"name\":\"ReplaceNetworkAclEntry\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReplaceNetworkAclEntryRequest\"},\
      \"documentation\":\"<p>Replaces an entry (rule) in a network ACL. For more information about network ACLs, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html\\\">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"ReplaceRoute\":{\
      \"name\":\"ReplaceRoute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReplaceRouteRequest\"},\
      \"documentation\":\"<p>Replaces an existing route within a route table in a VPC. You must provide only one of the following: Internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, or network interface.</p> <p>For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"ReplaceRouteTableAssociation\":{\
      \"name\":\"ReplaceRouteTableAssociation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReplaceRouteTableAssociationRequest\"},\
      \"output\":{\"shape\":\"ReplaceRouteTableAssociationResult\"},\
      \"documentation\":\"<p>Changes the route table associated with a given subnet in a VPC. After the operation completes, the subnet uses the routes in the new route table it's associated with. For more information about route tables, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html\\\">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <p>You can also use ReplaceRouteTableAssociation to change which table is the main route table in the VPC. You just specify the main route table's association ID and the route table to be the new main route table.</p>\"\
    },\
    \"ReportInstanceStatus\":{\
      \"name\":\"ReportInstanceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReportInstanceStatusRequest\"},\
      \"documentation\":\"<p>Submits feedback about the status of an instance. The instance must be in the <code>running</code> state. If your experience with the instance differs from the instance status returned by <a>DescribeInstanceStatus</a>, use <a>ReportInstanceStatus</a> to report your experience with the instance. Amazon EC2 collects this information to improve the accuracy of status checks.</p> <p>Use of this action does not change the value returned by <a>DescribeInstanceStatus</a>.</p>\"\
    },\
    \"RequestSpotFleet\":{\
      \"name\":\"RequestSpotFleet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RequestSpotFleetRequest\"},\
      \"output\":{\"shape\":\"RequestSpotFleetResponse\"},\
      \"documentation\":\"<p>Creates a Spot fleet request.</p> <p>You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p> <p>By default, the Spot fleet requests Spot instances in the Spot pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload.</p> <p>Alternatively, you can specify that the Spot fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot instances in your Spot fleet are in different Spot pools, you can improve the availability of your fleet.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html\\\">Spot Fleet Requests</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"RequestSpotInstances\":{\
      \"name\":\"RequestSpotInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RequestSpotInstancesRequest\"},\
      \"output\":{\"shape\":\"RequestSpotInstancesResult\"},\
      \"documentation\":\"<p>Creates a Spot instance request. Spot instances are instances that Amazon EC2 launches when the bid price that you specify exceeds the current Spot price. Amazon EC2 periodically sets the Spot price based on available Spot Instance capacity and current Spot instance requests. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html\\\">Spot Instance Requests</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"ResetImageAttribute\":{\
      \"name\":\"ResetImageAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResetImageAttributeRequest\"},\
      \"documentation\":\"<p>Resets an attribute of an AMI to its default value.</p> <note><p> The productCodes attribute can't be reset. </p></note>\"\
    },\
    \"ResetInstanceAttribute\":{\
      \"name\":\"ResetInstanceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResetInstanceAttributeRequest\"},\
      \"documentation\":\"<p>Resets an attribute of an instance to its default value. To reset the <code>kernel</code> or <code>ramdisk</code>, the instance must be in a stopped state. To reset the <code>sourceDestCheck</code>, the instance can be either running or stopped.</p> <p>The <code>sourceDestCheck</code> attribute controls whether source/destination checking is enabled. The default value is <code>true</code>, which means checking is enabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html\\\">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
    },\
    \"ResetNetworkInterfaceAttribute\":{\
      \"name\":\"ResetNetworkInterfaceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResetNetworkInterfaceAttributeRequest\"},\
      \"documentation\":\"<p>Resets a network interface attribute. You can specify only one attribute at a time.</p>\"\
    },\
    \"ResetSnapshotAttribute\":{\
      \"name\":\"ResetSnapshotAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResetSnapshotAttributeRequest\"},\
      \"documentation\":\"<p>Resets permission settings for the specified snapshot.</p> <p>For more information on modifying snapshot permissions, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html\\\">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"RestoreAddressToClassic\":{\
      \"name\":\"RestoreAddressToClassic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RestoreAddressToClassicRequest\"},\
      \"output\":{\"shape\":\"RestoreAddressToClassicResult\"},\
      \"documentation\":\"<p>Restores an Elastic IP address that was previously moved to the EC2-VPC platform back to the EC2-Classic platform. You cannot move an Elastic IP address that was originally allocated for use in EC2-VPC. The Elastic IP address must not be associated with an instance or network interface. You cannot restore an Elastic IP address that's associated with a reverse DNS record. Contact AWS account and billing support to remove the reverse DNS record. </p>\"\
    },\
    \"RevokeSecurityGroupEgress\":{\
      \"name\":\"RevokeSecurityGroupEgress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RevokeSecurityGroupEgressRequest\"},\
      \"documentation\":\"<p>[EC2-VPC only] Removes one or more egress rules from a security group for EC2-VPC. This action doesn't apply to security groups for use in EC2-Classic. The values that you specify in the revoke request (for example, ports) must match the existing rule's values for the rule to be revoked.</p> <p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code.</p> <p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>\"\
    },\
    \"RevokeSecurityGroupIngress\":{\
      \"name\":\"RevokeSecurityGroupIngress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RevokeSecurityGroupIngressRequest\"},\
      \"documentation\":\"<p>Removes one or more ingress rules from a security group. The values that you specify in the revoke request (for example, ports) must match the existing rule's values for the rule to be removed.</p> <p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code.</p> <p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>\"\
    },\
    \"RunInstances\":{\
      \"name\":\"RunInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RunInstancesRequest\"},\
      \"output\":{\"shape\":\"Reservation\"},\
      \"documentation\":\"<p>Launches the specified number of instances using an AMI for which you have permissions.</p> <p>When you launch an instance, it enters the <code>pending</code> state. After the instance is ready for you, it enters the <code>running</code> state. To check the state of your instance, call <a>DescribeInstances</a>.</p> <p>To ensure faster instance launches, break up large requests into smaller batches. For example, create five separate launch requests for 100 instances each instead of one launch request for 500 instances.</p> <p>If you don't specify a security group when launching an instance, Amazon EC2 uses the default security group. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html\\\">Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>[EC2-VPC only accounts] If you don't specify a subnet in the request, we choose a default subnet from your default VPC for you. </p> <p>[EC2-Classic accounts] If you're launching into EC2-Classic and you don't specify an Availability Zone, we choose one for you.</p> <p>Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>You can provide optional user data when launching an instance. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html\\\">Instance Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>If any of the AMIs have a product code attached for which the user has not subscribed, <code>RunInstances</code> fails.</p> <p>Some instance types can only be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID in the request, <code>RunInstances</code> fails. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types\\\">Instance Types Available Only in a VPC</a>.</p> <p>For more information about troubleshooting, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html\\\">What To Do If An Instance Immediately Terminates</a>, and <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html\\\">Troubleshooting Connecting to Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"RunScheduledInstances\":{\
      \"name\":\"RunScheduledInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RunScheduledInstancesRequest\"},\
      \"output\":{\"shape\":\"RunScheduledInstancesResult\"},\
      \"documentation\":\"<p>Launches the specified Scheduled Instances.</p> <p>Before you can launch a Scheduled Instance, you must purchase it and obtain an identifier using <a>PurchaseScheduledInstances</a>.</p> <p>You must launch a Scheduled Instance during its scheduled time period. You can't stop or reboot a Scheduled Instance, but you can terminate it as needed. If you terminate a Scheduled Instance before the current scheduled time period ends, you can launch it again after a few minutes. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html\\\">Scheduled Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"StartInstances\":{\
      \"name\":\"StartInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartInstancesRequest\"},\
      \"output\":{\"shape\":\"StartInstancesResult\"},\
      \"documentation\":\"<p>Starts an Amazon EBS-backed AMI that you've previously stopped.</p> <p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for hourly instance usage. However, your root partition Amazon EBS volume remains, continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Each time you transition an instance from stopped to started, Amazon EC2 charges a full instance hour, even if transitions happen multiple times within a single hour.</p> <p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p> <p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html\\\">Stopping Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"StopInstances\":{\
      \"name\":\"StopInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopInstancesRequest\"},\
      \"output\":{\"shape\":\"StopInstancesResult\"},\
      \"documentation\":\"<p>Stops an Amazon EBS-backed instance. </p> <p>We don't charge hourly usage for a stopped instance, or data transfer fees; however, your root partition Amazon EBS volume remains, continues to persist your data, and you are charged for Amazon EBS volume usage. Each time you transition an instance from stopped to started, Amazon EC2 charges a full instance hour, even if transitions happen multiple times within a single hour.</p> <p>You can't start or stop Spot instances, and you can't stop instance store-backed instances.</p> <p>When you stop an instance, we shut it down. You can restart your instance at any time. Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p> <p>Stopping an instance is different to rebooting or terminating it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between rebooting, stopping, and terminating instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html\\\">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>When you stop an instance, we attempt to shut it down forcibly after a short while. If your instance appears stuck in the stopping state after a period of time, there may be an issue with the underlying host computer. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html\\\">Troubleshooting Stopping Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"TerminateInstances\":{\
      \"name\":\"TerminateInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TerminateInstancesRequest\"},\
      \"output\":{\"shape\":\"TerminateInstancesResult\"},\
      \"documentation\":\"<p>Shuts down one or more instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds.</p> <p>Terminated instances remain visible after termination (for approximately one hour).</p> <p>By default, Amazon EC2 deletes all EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running.</p> <p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, any attached EBS volumes with the <code>DeleteOnTermination</code> block device mapping parameter set to <code>true</code> are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html\\\">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>For more information about troubleshooting, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html\\\">Troubleshooting Terminating Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    },\
    \"UnassignPrivateIpAddresses\":{\
      \"name\":\"UnassignPrivateIpAddresses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnassignPrivateIpAddressesRequest\"},\
      \"documentation\":\"<p>Unassigns one or more secondary private IP addresses from a network interface.</p>\"\
    },\
    \"UnmonitorInstances\":{\
      \"name\":\"UnmonitorInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UnmonitorInstancesRequest\"},\
      \"output\":{\"shape\":\"UnmonitorInstancesResult\"},\
      \"documentation\":\"<p>Disables monitoring for a running instance. For more information about monitoring instances, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html\\\">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AcceptVpcPeeringConnectionRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AcceptVpcPeeringConnection.</p>\"\
    },\
    \"AcceptVpcPeeringConnectionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcPeeringConnection\":{\
          \"shape\":\"VpcPeeringConnection\",\
          \"documentation\":\"<p>Information about the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnection\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AcceptVpcPeeringConnection.</p>\"\
    },\
    \"AccountAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the account attribute.</p>\",\
          \"locationName\":\"attributeName\"\
        },\
        \"AttributeValues\":{\
          \"shape\":\"AccountAttributeValueList\",\
          \"documentation\":\"<p>One or more values for the account attribute.</p>\",\
          \"locationName\":\"attributeValueSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes an account attribute.</p>\"\
    },\
    \"AccountAttributeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AccountAttribute\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"AccountAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"supported-platforms\",\
        \"default-vpc\"\
      ]\
    },\
    \"AccountAttributeNameStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AccountAttributeName\",\
        \"locationName\":\"attributeName\"\
      }\
    },\
    \"AccountAttributeValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the attribute.</p>\",\
          \"locationName\":\"attributeValue\"\
        }\
      },\
      \"documentation\":\"<p>Describes a value of an account attribute.</p>\"\
    },\
    \"AccountAttributeValueList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AccountAttributeValue\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ActiveInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"SpotInstanceRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot instance request.</p>\",\
          \"locationName\":\"spotInstanceRequestId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a running instance in a Spot fleet.</p>\"\
    },\
    \"ActiveInstanceSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ActiveInstance\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"Address\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance that the address is associated with (if any).</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID representing the allocation of the address for use with EC2-VPC.</p>\",\
          \"locationName\":\"allocationId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID representing the association of the address with an instance in a VPC.</p>\",\
          \"locationName\":\"associationId\"\
        },\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>Indicates whether this Elastic IP address is for use with instances in EC2-Classic (<code>standard</code>) or instances in a VPC (<code>vpc</code>).</p>\",\
          \"locationName\":\"domain\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"NetworkInterfaceOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AWS account that owns the network interface.</p>\",\
          \"locationName\":\"networkInterfaceOwnerId\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address associated with the Elastic IP address.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        }\
      },\
      \"documentation\":\"<p>Describes an Elastic IP address.</p>\"\
    },\
    \"AddressList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Address\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"Affinity\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"default\",\
        \"host\"\
      ]\
    },\
    \"AllocateAddressRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>Set to <code>vpc</code> to allocate the address for use with instances in a VPC.</p> <p>Default: The address is for use with instances in EC2-Classic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AllocateAddress.</p>\"\
    },\
    \"AllocateAddressResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>Indicates whether this Elastic IP address is for use with instances in EC2-Classic (<code>standard</code>) or instances in a VPC (<code>vpc</code>).</p>\",\
          \"locationName\":\"domain\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC.</p>\",\
          \"locationName\":\"allocationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AllocateAddress.</p>\"\
    },\
    \"AllocateHostsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceType\",\
        \"Quantity\",\
        \"AvailabilityZone\"\
      ],\
      \"members\":{\
        \"AutoPlacement\":{\
          \"shape\":\"AutoPlacement\",\
          \"documentation\":\"<p>This is enabled by default. This property allows instances to be automatically placed onto available Dedicated hosts, when you are launching instances without specifying a host ID.</p> <p>Default: Enabled</p>\",\
          \"locationName\":\"autoPlacement\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the instance type that you want your Dedicated hosts to be configured for. When you specify the instance type, that is the only instance type that you can launch onto that host.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Quantity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of Dedicated hosts you want to allocate to your account with these parameters.</p>\",\
          \"locationName\":\"quantity\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone for the Dedicated hosts.</p>\",\
          \"locationName\":\"availabilityZone\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AllocateHosts.</p>\"\
    },\
    \"AllocateHostsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HostIds\":{\
          \"shape\":\"ResponseHostIdList\",\
          \"documentation\":\"<p>The ID of the allocated Dedicated host. This is used when you want to launch an instance onto a specific host.</p>\",\
          \"locationName\":\"hostIdSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AllocateHosts.</p>\"\
    },\
    \"AllocationIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"AllocationId\"\
      }\
    },\
    \"AllocationState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"available\",\
        \"under-assessment\",\
        \"permanent-failure\",\
        \"released\",\
        \"released-permanent-failure\"\
      ]\
    },\
    \"AllocationStrategy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"lowestPrice\",\
        \"diversified\"\
      ]\
    },\
    \"ArchitectureValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"i386\",\
        \"x86_64\"\
      ]\
    },\
    \"AssignPrivateIpAddressesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NetworkInterfaceId\"],\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"PrivateIpAddresses\":{\
          \"shape\":\"PrivateIpAddressStringList\",\
          \"documentation\":\"<p>One or more IP addresses to be assigned as a secondary private IP address to the network interface. You can't specify this parameter when also specifying a number of secondary IP addresses.</p> <p>If you don't specify an IP address, Amazon EC2 automatically selects an IP address within the subnet range.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"SecondaryPrivateIpAddressCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of secondary IP addresses to assign to the network interface. You can't specify this parameter when also specifying private IP addresses.</p>\",\
          \"locationName\":\"secondaryPrivateIpAddressCount\"\
        },\
        \"AllowReassignment\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to allow an IP address that is already assigned to another network interface or instance to be reassigned to the specified network interface.</p>\",\
          \"locationName\":\"allowReassignment\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AssignPrivateIpAddresses.</p>\"\
    },\
    \"AssociateAddressRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance. This is required for EC2-Classic. For EC2-VPC, you can specify either the instance ID or the network interface ID, but not both. The operation fails if you specify an instance ID unless exactly one network interface is attached. </p>\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address. This is required for EC2-Classic.</p>\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The allocation ID. This is required for EC2-VPC.</p>\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"AllowReassociation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>[EC2-VPC] For a VPC in an EC2-Classic account, specify true to allow an Elastic IP address that is already associated with an instance or network interface to be reassociated with the specified instance or network interface. Otherwise, the operation fails. In a VPC in an EC2-VPC-only account, reassociation is automatic, therefore you can specify false to ensure the operation fails if the Elastic IP address is already associated with another resource.</p>\",\
          \"locationName\":\"allowReassociation\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AssociateAddress.</p>\"\
    },\
    \"AssociateAddressResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID that represents the association of the Elastic IP address with an instance.</p>\",\
          \"locationName\":\"associationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AssociateAddress.</p>\"\
    },\
    \"AssociateDhcpOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DhcpOptionsId\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"DhcpOptionsId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the DHCP options set, or <code>default</code> to associate no DHCP options with the VPC.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AssociateDhcpOptions.</p>\"\
    },\
    \"AssociateRouteTableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SubnetId\",\
        \"RouteTableId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\",\
          \"locationName\":\"routeTableId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AssociateRouteTable.</p>\"\
    },\
    \"AssociateRouteTableResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The route table association ID (needed to disassociate the route table).</p>\",\
          \"locationName\":\"associationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AssociateRouteTable.</p>\"\
    },\
    \"AttachClassicLinkVpcRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VpcId\",\
        \"Groups\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of an EC2-Classic instance to link to the ClassicLink-enabled VPC.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a ClassicLink-enabled VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdStringList\",\
          \"documentation\":\"<p>The ID of one or more of the VPC's security groups. You cannot specify security groups from a different VPC.</p>\",\
          \"locationName\":\"SecurityGroupId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AttachClassicLinkVpc.</p>\"\
    },\
    \"AttachClassicLinkVpcResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AttachClassicLinkVpc.</p>\"\
    },\
    \"AttachInternetGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InternetGatewayId\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InternetGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Internet gateway.</p>\",\
          \"locationName\":\"internetGatewayId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AttachInternetGateway.</p>\"\
    },\
    \"AttachNetworkInterfaceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NetworkInterfaceId\",\
        \"InstanceId\",\
        \"DeviceIndex\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"DeviceIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The index of the device for the network interface attachment.</p>\",\
          \"locationName\":\"deviceIndex\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AttachNetworkInterface.</p>\"\
    },\
    \"AttachNetworkInterfaceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttachmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface attachment.</p>\",\
          \"locationName\":\"attachmentId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AttachNetworkInterface.</p>\"\
    },\
    \"AttachVolumeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VolumeId\",\
        \"InstanceId\",\
        \"Device\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS volume. The volume and instance must be within the same Availability Zone.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"Device\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name to expose to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AttachVolume.</p>\"\
    },\
    \"AttachVpnGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpnGatewayId\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpnGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AttachVpnGateway.</p>\"\
    },\
    \"AttachVpnGatewayResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcAttachment\":{\
          \"shape\":\"VpcAttachment\",\
          \"documentation\":\"<p>Information about the attachment.</p>\",\
          \"locationName\":\"attachment\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of AttachVpnGateway.</p>\"\
    },\
    \"AttachmentStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"attaching\",\
        \"attached\",\
        \"detaching\",\
        \"detached\"\
      ]\
    },\
    \"AttributeBooleanValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Valid values are <code>true</code> or <code>false</code>.</p>\",\
          \"locationName\":\"value\"\
        }\
      },\
      \"documentation\":\"<p>The value to use when a resource attribute accepts a Boolean value.</p>\"\
    },\
    \"AttributeValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Valid values are case-sensitive and vary by action.</p>\",\
          \"locationName\":\"value\"\
        }\
      },\
      \"documentation\":\"<p>The value to use for a resource attribute.</p>\"\
    },\
    \"AuthorizeSecurityGroupEgressRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"GroupId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        },\
        \"SourceSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a destination security group. To authorize outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>\",\
          \"locationName\":\"sourceSecurityGroupName\"\
        },\
        \"SourceSecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account number for a destination security group. To authorize outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>\",\
          \"locationName\":\"sourceSecurityGroupOwnerId\"\
        },\
        \"IpProtocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol name or number. We recommend that you specify the protocol in a set of IP permissions instead.</p>\",\
          \"locationName\":\"ipProtocol\"\
        },\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>\",\
          \"locationName\":\"fromPort\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>\",\
          \"locationName\":\"toPort\"\
        },\
        \"CidrIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR IP address range. We recommend that you specify the CIDR range in a set of IP permissions instead.</p>\",\
          \"locationName\":\"cidrIp\"\
        },\
        \"IpPermissions\":{\
          \"shape\":\"IpPermissionList\",\
          \"documentation\":\"<p>A set of IP permissions. You can't specify a destination security group and a CIDR IP address range.</p>\",\
          \"locationName\":\"ipPermissions\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AuthorizeSecurityGroupEgress.</p>\"\
    },\
    \"AuthorizeSecurityGroupIngressRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic, default VPC] The name of the security group.</p>\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group. Required for a nondefault VPC.</p>\"\
        },\
        \"SourceSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic, default VPC] The name of the source security group. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the start of the port range, the IP protocol, and the end of the port range. Creates rules that grant full ICMP, UDP, and TCP access. To create a rule with a specific IP protocol and port range, use a set of IP permissions instead. For EC2-VPC, the source security group must be in the same VPC.</p>\"\
        },\
        \"SourceSecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic] The AWS account number for the source security group, if the source security group is in a different account. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the IP protocol, the start of the port range, and the end of the port range. Creates rules that grant full ICMP, UDP, and TCP access. To create a rule with a specific IP protocol and port range, use a set of IP permissions instead.</p>\"\
        },\
        \"IpProtocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href=\\\"http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml\\\">Protocol Numbers</a>). (VPC only) Use <code>-1</code> to specify all.</p>\"\
        },\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>\"\
        },\
        \"CidrIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>\"\
        },\
        \"IpPermissions\":{\
          \"shape\":\"IpPermissionList\",\
          \"documentation\":\"<p>A set of IP permissions. Can be used to specify multiple rules in a single command. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for AuthorizeSecurityGroupIngress.</p>\"\
    },\
    \"AutoPlacement\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"on\",\
        \"off\"\
      ]\
    },\
    \"AvailabilityZone\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ZoneName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the Availability Zone.</p>\",\
          \"locationName\":\"zoneName\"\
        },\
        \"State\":{\
          \"shape\":\"AvailabilityZoneState\",\
          \"documentation\":\"<p>The state of the Availability Zone.</p>\",\
          \"locationName\":\"zoneState\"\
        },\
        \"RegionName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the region.</p>\",\
          \"locationName\":\"regionName\"\
        },\
        \"Messages\":{\
          \"shape\":\"AvailabilityZoneMessageList\",\
          \"documentation\":\"<p>Any messages about the Availability Zone.</p>\",\
          \"locationName\":\"messageSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes an Availability Zone.</p>\"\
    },\
    \"AvailabilityZoneList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AvailabilityZone\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"AvailabilityZoneMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message about the Availability Zone.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes a message about an Availability Zone.</p>\"\
    },\
    \"AvailabilityZoneMessageList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AvailabilityZoneMessage\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"AvailabilityZoneState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"available\",\
        \"information\",\
        \"impaired\",\
        \"unavailable\"\
      ]\
    },\
    \"AvailableCapacity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailableInstanceCapacity\":{\
          \"shape\":\"AvailableInstanceCapacityList\",\
          \"documentation\":\"<p>The total number of instances that the Dedicated host supports.</p>\",\
          \"locationName\":\"availableInstanceCapacity\"\
        },\
        \"AvailableVCpus\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of vCPUs available on the Dedicated host.</p>\",\
          \"locationName\":\"availableVCpus\"\
        }\
      },\
      \"documentation\":\"<p>The capacity information for instances launched onto the Dedicated host.</p>\"\
    },\
    \"AvailableInstanceCapacityList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceCapacity\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"BatchState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"submitted\",\
        \"active\",\
        \"cancelled\",\
        \"failed\",\
        \"cancelled_running\",\
        \"cancelled_terminating\",\
        \"modifying\"\
      ]\
    },\
    \"Blob\":{\"type\":\"blob\"},\
    \"BlobAttributeValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Blob\",\
          \"locationName\":\"value\"\
        }\
      }\
    },\
    \"BlockDeviceMapping\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VirtualName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The virtual device name (<code>ephemeral</code>N). Instance store volumes are numbered starting from 0. An instance type with 2 available instance store volumes can specify mappings for <code>ephemeral0</code> and <code>ephemeral1</code>.The number of available instance store volumes depends on the instance type. After you connect to the instance, you must mount the volume.</p> <p>Constraints: For M3 instances, you must specify instance store volumes in the block device mapping for the instance. When you launch an M3 instance, we ignore any instance store volumes specified in the block device mapping for the AMI.</p>\",\
          \"locationName\":\"virtualName\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>\",\
          \"locationName\":\"deviceName\"\
        },\
        \"Ebs\":{\
          \"shape\":\"EbsBlockDevice\",\
          \"documentation\":\"<p>Parameters used to automatically set up EBS volumes when the instance is launched.</p>\",\
          \"locationName\":\"ebs\"\
        },\
        \"NoDevice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Suppresses the specified device included in the block device mapping of the AMI.</p>\",\
          \"locationName\":\"noDevice\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device mapping.</p>\"\
    },\
    \"BlockDeviceMappingList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"BlockDeviceMapping\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"BlockDeviceMappingRequestList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"BlockDeviceMapping\",\
        \"locationName\":\"BlockDeviceMapping\"\
      }\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BundleIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"BundleId\"\
      }\
    },\
    \"BundleInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Storage\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance to bundle.</p> <p>Type: String</p> <p>Default: None</p> <p>Required: Yes</p>\"\
        },\
        \"Storage\":{\
          \"shape\":\"Storage\",\
          \"documentation\":\"<p>The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for BundleInstance.</p>\"\
    },\
    \"BundleInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BundleTask\":{\
          \"shape\":\"BundleTask\",\
          \"documentation\":\"<p>Information about the bundle task.</p>\",\
          \"locationName\":\"bundleInstanceTask\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of BundleInstance.</p>\"\
    },\
    \"BundleTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance associated with this bundle task.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"BundleId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the bundle task.</p>\",\
          \"locationName\":\"bundleId\"\
        },\
        \"State\":{\
          \"shape\":\"BundleTaskState\",\
          \"documentation\":\"<p>The state of the task.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time this task started.</p>\",\
          \"locationName\":\"startTime\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time of the most recent update for the task.</p>\",\
          \"locationName\":\"updateTime\"\
        },\
        \"Storage\":{\
          \"shape\":\"Storage\",\
          \"documentation\":\"<p>The Amazon S3 storage locations.</p>\",\
          \"locationName\":\"storage\"\
        },\
        \"Progress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The level of task completion, as a percent (for example, 20%).</p>\",\
          \"locationName\":\"progress\"\
        },\
        \"BundleTaskError\":{\
          \"shape\":\"BundleTaskError\",\
          \"documentation\":\"<p>If the task fails, a description of the error.</p>\",\
          \"locationName\":\"error\"\
        }\
      },\
      \"documentation\":\"<p>Describes a bundle task.</p>\"\
    },\
    \"BundleTaskError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error code.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error message.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes an error for <a>BundleInstance</a>.</p>\"\
    },\
    \"BundleTaskList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"BundleTask\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"BundleTaskState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"waiting-for-shutdown\",\
        \"bundling\",\
        \"storing\",\
        \"cancelling\",\
        \"complete\",\
        \"failed\"\
      ]\
    },\
    \"CancelBatchErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"fleetRequestIdDoesNotExist\",\
        \"fleetRequestIdMalformed\",\
        \"fleetRequestNotInCancellableState\",\
        \"unexpectedError\"\
      ]\
    },\
    \"CancelBundleTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"BundleId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"BundleId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the bundle task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelBundleTask.</p>\"\
    },\
    \"CancelBundleTaskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BundleTask\":{\
          \"shape\":\"BundleTask\",\
          \"documentation\":\"<p>Information about the bundle task.</p>\",\
          \"locationName\":\"bundleInstanceTask\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CancelBundleTask.</p>\"\
    },\
    \"CancelConversionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConversionTaskId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ConversionTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the conversion task.</p>\",\
          \"locationName\":\"conversionTaskId\"\
        },\
        \"ReasonMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for canceling the conversion task.</p>\",\
          \"locationName\":\"reasonMessage\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelConversionTask.</p>\"\
    },\
    \"CancelExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ExportTaskId\"],\
      \"members\":{\
        \"ExportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the export task. This is the ID returned by <code>CreateInstanceExportTask</code>.</p>\",\
          \"locationName\":\"exportTaskId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelExportTask.</p>\"\
    },\
    \"CancelImportTaskRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"ImportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the import image or import snapshot task to be canceled.</p>\"\
        },\
        \"CancelReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for canceling the task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelImportTask.</p>\"\
    },\
    \"CancelImportTaskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the task being canceled.</p>\",\
          \"locationName\":\"importTaskId\"\
        },\
        \"State\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of the task being canceled.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"PreviousState\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of the task being canceled.</p>\",\
          \"locationName\":\"previousState\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for CancelImportTask.</p>\"\
    },\
    \"CancelReservedInstancesListingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReservedInstancesListingId\"],\
      \"members\":{\
        \"ReservedInstancesListingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance listing.</p>\",\
          \"locationName\":\"reservedInstancesListingId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelReservedInstancesListing.</p>\"\
    },\
    \"CancelReservedInstancesListingResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesListings\":{\
          \"shape\":\"ReservedInstancesListingList\",\
          \"documentation\":\"<p>The Reserved Instance listing.</p>\",\
          \"locationName\":\"reservedInstancesListingsSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CancelReservedInstancesListing.</p>\"\
    },\
    \"CancelSpotFleetRequestsError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Code\",\
        \"Message\"\
      ],\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"CancelBatchErrorCode\",\
          \"documentation\":\"<p>The error code.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description for the error code.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot fleet error.</p>\"\
    },\
    \"CancelSpotFleetRequestsErrorItem\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestId\",\
        \"Error\"\
      ],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"Error\":{\
          \"shape\":\"CancelSpotFleetRequestsError\",\
          \"documentation\":\"<p>The error.</p>\",\
          \"locationName\":\"error\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot fleet request that was not successfully canceled.</p>\"\
    },\
    \"CancelSpotFleetRequestsErrorSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CancelSpotFleetRequestsErrorItem\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"CancelSpotFleetRequestsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestIds\",\
        \"TerminateInstances\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotFleetRequestIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>The IDs of the Spot fleet requests.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"TerminateInstances\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to terminate instances for a Spot fleet request if it is canceled successfully.</p>\",\
          \"locationName\":\"terminateInstances\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelSpotFleetRequests.</p>\"\
    },\
    \"CancelSpotFleetRequestsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnsuccessfulFleetRequests\":{\
          \"shape\":\"CancelSpotFleetRequestsErrorSet\",\
          \"documentation\":\"<p>Information about the Spot fleet requests that are not successfully canceled.</p>\",\
          \"locationName\":\"unsuccessfulFleetRequestSet\"\
        },\
        \"SuccessfulFleetRequests\":{\
          \"shape\":\"CancelSpotFleetRequestsSuccessSet\",\
          \"documentation\":\"<p>Information about the Spot fleet requests that are successfully canceled.</p>\",\
          \"locationName\":\"successfulFleetRequestSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CancelSpotFleetRequests.</p>\"\
    },\
    \"CancelSpotFleetRequestsSuccessItem\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestId\",\
        \"CurrentSpotFleetRequestState\",\
        \"PreviousSpotFleetRequestState\"\
      ],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"CurrentSpotFleetRequestState\":{\
          \"shape\":\"BatchState\",\
          \"documentation\":\"<p>The current state of the Spot fleet request.</p>\",\
          \"locationName\":\"currentSpotFleetRequestState\"\
        },\
        \"PreviousSpotFleetRequestState\":{\
          \"shape\":\"BatchState\",\
          \"documentation\":\"<p>The previous state of the Spot fleet request.</p>\",\
          \"locationName\":\"previousSpotFleetRequestState\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot fleet request that was successfully canceled.</p>\"\
    },\
    \"CancelSpotFleetRequestsSuccessSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CancelSpotFleetRequestsSuccessItem\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"CancelSpotInstanceRequestState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"open\",\
        \"closed\",\
        \"cancelled\",\
        \"completed\"\
      ]\
    },\
    \"CancelSpotInstanceRequestsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotInstanceRequestIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotInstanceRequestIds\":{\
          \"shape\":\"SpotInstanceRequestIdList\",\
          \"documentation\":\"<p>One or more Spot instance request IDs.</p>\",\
          \"locationName\":\"SpotInstanceRequestId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CancelSpotInstanceRequests.</p>\"\
    },\
    \"CancelSpotInstanceRequestsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CancelledSpotInstanceRequests\":{\
          \"shape\":\"CancelledSpotInstanceRequestList\",\
          \"documentation\":\"<p>One or more Spot instance requests.</p>\",\
          \"locationName\":\"spotInstanceRequestSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CancelSpotInstanceRequests.</p>\"\
    },\
    \"CancelledSpotInstanceRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotInstanceRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot instance request.</p>\",\
          \"locationName\":\"spotInstanceRequestId\"\
        },\
        \"State\":{\
          \"shape\":\"CancelSpotInstanceRequestState\",\
          \"documentation\":\"<p>The state of the Spot instance request.</p>\",\
          \"locationName\":\"state\"\
        }\
      },\
      \"documentation\":\"<p>Describes a request to cancel a Spot instance.</p>\"\
    },\
    \"CancelledSpotInstanceRequestList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CancelledSpotInstanceRequest\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ClassicLinkDnsSupport\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"ClassicLinkDnsSupported\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether ClassicLink DNS support is enabled for the VPC.</p>\",\
          \"locationName\":\"classicLinkDnsSupported\"\
        }\
      },\
      \"documentation\":\"<p>Describes the ClassicLink DNS support status of a VPC.</p>\"\
    },\
    \"ClassicLinkDnsSupportList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ClassicLinkDnsSupport\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ClassicLinkInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>A list of security groups.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the instance.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a linked EC2-Classic instance.</p>\"\
    },\
    \"ClassicLinkInstanceList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ClassicLinkInstance\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ClientData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UploadStart\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time that the disk upload starts.</p>\"\
        },\
        \"UploadEnd\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time that the disk upload ends.</p>\"\
        },\
        \"UploadSize\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The size of the uploaded disk image, in GiB.</p>\"\
        },\
        \"Comment\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A user-defined comment about the disk upload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the client-specific data.</p>\"\
    },\
    \"ConfirmProductInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProductCode\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ProductCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The product code. This must be a product code that you own.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ConfirmProductInstance.</p>\"\
    },\
    \"ConfirmProductInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the instance owner. This is only present if the product code is attached to the instance.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The return value of the request. Returns <code>true</code> if the specified product code is owned by the requester and associated with the specified instance.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ConfirmProductInstance.</p>\"\
    },\
    \"ContainerFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\"ova\"]\
    },\
    \"ConversionIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ConversionTask\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConversionTaskId\",\
        \"State\"\
      ],\
      \"members\":{\
        \"ConversionTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the conversion task.</p>\",\
          \"locationName\":\"conversionTaskId\"\
        },\
        \"ExpirationTime\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The time when the task expires. If the upload isn't complete before the expiration time, we automatically cancel the task.</p>\",\
          \"locationName\":\"expirationTime\"\
        },\
        \"ImportInstance\":{\
          \"shape\":\"ImportInstanceTaskDetails\",\
          \"documentation\":\"<p>If the task is for importing an instance, this contains information about the import instance task.</p>\",\
          \"locationName\":\"importInstance\"\
        },\
        \"ImportVolume\":{\
          \"shape\":\"ImportVolumeTaskDetails\",\
          \"documentation\":\"<p>If the task is for importing a volume, this contains information about the import volume task.</p>\",\
          \"locationName\":\"importVolume\"\
        },\
        \"State\":{\
          \"shape\":\"ConversionTaskState\",\
          \"documentation\":\"<p>The state of the conversion task.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status message related to the conversion task.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the task.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a conversion task.</p>\"\
    },\
    \"ConversionTaskState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"cancelling\",\
        \"cancelled\",\
        \"completed\"\
      ]\
    },\
    \"CopyImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceRegion\",\
        \"SourceImageId\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SourceRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the region that contains the AMI to copy.</p>\"\
        },\
        \"SourceImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI to copy.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the new AMI in the destination region.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the new AMI in the destination region.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the destination snapshots of the copied image should be encrypted. The default CMK for EBS is used unless a non-default AWS Key Management Service (AWS KMS) CMK is specified with <code>KmsKeyId</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html\\\">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"encrypted\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full ARN of the AWS Key Management Service (AWS KMS) CMK to use when encrypting the snapshots of an image during a copy operation. This parameter is only required if you want to use a non-default CMK; if this parameter is not specified, the default CMK for EBS is used. The ARN contains the <code>arn:aws:kms</code> namespace, followed by the region of the CMK, the AWS account ID of the CMK owner, the <code>key</code> namespace, and then the CMK ID. For example, arn:aws:kms:<i>us-east-1</i>:<i>012345678910</i>:key/<i>abcd1234-a123-456a-a12b-a123b4cd56ef</i>. The specified CMK must exist in the region that the snapshot is being copied to. If a <code>KmsKeyId</code> is specified, the <code>Encrypted</code> flag must also be set.</p>\",\
          \"locationName\":\"kmsKeyId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CopyImage.</p>\"\
    },\
    \"CopyImageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new AMI.</p>\",\
          \"locationName\":\"imageId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CopyImage.</p>\"\
    },\
    \"CopySnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceRegion\",\
        \"SourceSnapshotId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SourceRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the region that contains the snapshot to be copied.</p>\"\
        },\
        \"SourceSnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS snapshot to copy.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the EBS snapshot.</p>\"\
        },\
        \"DestinationRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The destination region to use in the <code>PresignedUrl</code> parameter of a snapshot copy operation. This parameter is only valid for specifying the destination region in a <code>PresignedUrl</code> parameter, where it is required.</p> <note> <p><code>CopySnapshot</code> sends the snapshot copy to the regional endpoint that you send the HTTP request to, such as <code>ec2.us-east-1.amazonaws.com</code> (in the AWS CLI, this is specified with the <code>--region</code> parameter or the default region in your AWS configuration file).</p> </note>\",\
          \"locationName\":\"destinationRegion\"\
        },\
        \"PresignedUrl\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pre-signed URL that facilitates copying an encrypted snapshot. This parameter is only required when copying an encrypted snapshot with the Amazon EC2 Query API; it is available as an optional parameter in all other cases. The <code>PresignedUrl</code> should use the snapshot source endpoint, the <code>CopySnapshot</code> action, and include the <code>SourceRegion</code>, <code>SourceSnapshotId</code>, and <code>DestinationRegion</code> parameters. The <code>PresignedUrl</code> must be signed using AWS Signature Version 4. Because EBS snapshots are stored in Amazon S3, the signing algorithm for this parameter uses the same logic that is described in <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html\\\">Authenticating Requests by Using Query Parameters (AWS Signature Version 4)</a> in the <i>Amazon Simple Storage Service API Reference</i>. An invalid or improperly signed <code>PresignedUrl</code> will cause the copy operation to fail asynchronously, and the snapshot will move to an <code>error</code> state.</p>\",\
          \"locationName\":\"presignedUrl\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the destination snapshot should be encrypted. There is no way to create an unencrypted snapshot copy from an encrypted snapshot; however, you can encrypt a copy of an unencrypted snapshot with this flag. The default CMK for EBS is used unless a non-default AWS Key Management Service (AWS KMS) CMK is specified with <code>KmsKeyId</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html\\\">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"encrypted\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full ARN of the AWS Key Management Service (AWS KMS) CMK to use when creating the snapshot copy. This parameter is only required if you want to use a non-default CMK; if this parameter is not specified, the default CMK for EBS is used. The ARN contains the <code>arn:aws:kms</code> namespace, followed by the region of the CMK, the AWS account ID of the CMK owner, the <code>key</code> namespace, and then the CMK ID. For example, arn:aws:kms:<i>us-east-1</i>:<i>012345678910</i>:key/<i>abcd1234-a123-456a-a12b-a123b4cd56ef</i>. The specified CMK must exist in the region that the snapshot is being copied to. If a <code>KmsKeyId</code> is specified, the <code>Encrypted</code> flag must also be set.</p>\",\
          \"locationName\":\"kmsKeyId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CopySnapshot.</p>\"\
    },\
    \"CopySnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new snapshot.</p>\",\
          \"locationName\":\"snapshotId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CopySnapshot.</p>\"\
    },\
    \"CreateCustomerGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"PublicIp\",\
        \"BgpAsn\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Type\":{\
          \"shape\":\"GatewayType\",\
          \"documentation\":\"<p>The type of VPN connection that this customer gateway supports (<code>ipsec.1</code>).</p>\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Internet-routable IP address for the customer gateway's outside interface. The address must be static.</p>\",\
          \"locationName\":\"IpAddress\"\
        },\
        \"BgpAsn\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>For devices that support BGP, the customer gateway's BGP ASN.</p> <p>Default: 65000</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateCustomerGateway.</p>\"\
    },\
    \"CreateCustomerGatewayResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomerGateway\":{\
          \"shape\":\"CustomerGateway\",\
          \"documentation\":\"<p>Information about the customer gateway.</p>\",\
          \"locationName\":\"customerGateway\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateCustomerGateway.</p>\"\
    },\
    \"CreateDhcpOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DhcpConfigurations\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"DhcpConfigurations\":{\
          \"shape\":\"NewDhcpConfigurationList\",\
          \"documentation\":\"<p>A DHCP configuration option.</p>\",\
          \"locationName\":\"dhcpConfiguration\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateDhcpOptions.</p>\"\
    },\
    \"CreateDhcpOptionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DhcpOptions\":{\
          \"shape\":\"DhcpOptions\",\
          \"documentation\":\"<p>A set of DHCP options.</p>\",\
          \"locationName\":\"dhcpOptions\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateDhcpOptions.</p>\"\
    },\
    \"CreateFlowLogsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceIds\",\
        \"ResourceType\",\
        \"TrafficType\",\
        \"LogGroupName\",\
        \"DeliverLogsPermissionArn\"\
      ],\
      \"members\":{\
        \"ResourceIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more subnet, network interface, or VPC IDs.</p> <p>Constraints: Maximum of 1000 resources</p>\",\
          \"locationName\":\"ResourceId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"FlowLogsResourceType\",\
          \"documentation\":\"<p>The type of resource on which to create the flow log.</p>\"\
        },\
        \"TrafficType\":{\
          \"shape\":\"TrafficType\",\
          \"documentation\":\"<p>The type of traffic to log.</p>\"\
        },\
        \"LogGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the CloudWatch log group.</p>\"\
        },\
        \"DeliverLogsPermissionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateFlowLogs.</p>\"\
    },\
    \"CreateFlowLogsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FlowLogIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>The IDs of the flow logs.</p>\",\
          \"locationName\":\"flowLogIdSet\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request.</p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"Unsuccessful\":{\
          \"shape\":\"UnsuccessfulItemSet\",\
          \"documentation\":\"<p>Information about the flow logs that could not be created successfully.</p>\",\
          \"locationName\":\"unsuccessful\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateFlowLogs.</p>\"\
    },\
    \"CreateImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for the new image.</p> <p>Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ), periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)</p>\",\
          \"locationName\":\"name\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the new image.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"NoReboot\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>By default, Amazon EC2 attempts to shut down and reboot the instance before creating the image. If the 'No Reboot' option is set, Amazon EC2 doesn't shut down the instance before creating the image. When this option is used, file system integrity on the created image can't be guaranteed.</p>\",\
          \"locationName\":\"noReboot\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingRequestList\",\
          \"documentation\":\"<p>Information about one or more block device mappings.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateImage.</p>\"\
    },\
    \"CreateImageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new AMI.</p>\",\
          \"locationName\":\"imageId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateImage.</p>\"\
    },\
    \"CreateInstanceExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the conversion task or the resource being exported. The maximum length is 255 bytes.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"TargetEnvironment\":{\
          \"shape\":\"ExportEnvironment\",\
          \"documentation\":\"<p>The target virtualization environment.</p>\",\
          \"locationName\":\"targetEnvironment\"\
        },\
        \"ExportToS3Task\":{\
          \"shape\":\"ExportToS3TaskSpecification\",\
          \"documentation\":\"<p>The format and location for an instance export task.</p>\",\
          \"locationName\":\"exportToS3\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateInstanceExportTask.</p>\"\
    },\
    \"CreateInstanceExportTaskResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExportTask\":{\
          \"shape\":\"ExportTask\",\
          \"documentation\":\"<p>Information about the instance export task.</p>\",\
          \"locationName\":\"exportTask\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for CreateInstanceExportTask.</p>\"\
    },\
    \"CreateInternetGatewayRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateInternetGateway.</p>\"\
    },\
    \"CreateInternetGatewayResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InternetGateway\":{\
          \"shape\":\"InternetGateway\",\
          \"documentation\":\"<p>Information about the Internet gateway.</p>\",\
          \"locationName\":\"internetGateway\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateInternetGateway.</p>\"\
    },\
    \"CreateKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyName\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique name for the key pair.</p> <p>Constraints: Up to 255 ASCII characters</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateKeyPair.</p>\"\
    },\
    \"CreateNatGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SubnetId\",\
        \"AllocationId\"\
      ],\
      \"members\":{\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The subnet in which to create the NAT gateway.</p>\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The allocation ID of an Elastic IP address to associate with the NAT gateway. If the Elastic IP address is associated with another resource, you must first disassociate it.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a>.</p> <p>Constraint: Maximum 64 ASCII characters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateNatGateway.</p>\"\
    },\
    \"CreateNatGatewayResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NatGateway\":{\
          \"shape\":\"NatGateway\",\
          \"documentation\":\"<p>Information about the NAT gateway.</p>\",\
          \"locationName\":\"natGateway\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a client token was provided in the request.</p>\",\
          \"locationName\":\"clientToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateNatGateway.</p>\"\
    },\
    \"CreateNetworkAclEntryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NetworkAclId\",\
        \"RuleNumber\",\
        \"Protocol\",\
        \"RuleAction\",\
        \"Egress\",\
        \"CidrBlock\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network ACL.</p>\",\
          \"locationName\":\"networkAclId\"\
        },\
        \"RuleNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The rule number for the entry (for example, 100). ACL entries are processed in ascending order by rule number.</p> <p>Constraints: Positive integer from 1 to 32766</p>\",\
          \"locationName\":\"ruleNumber\"\
        },\
        \"Protocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The protocol. A value of -1 means all protocols.</p>\",\
          \"locationName\":\"protocol\"\
        },\
        \"RuleAction\":{\
          \"shape\":\"RuleAction\",\
          \"documentation\":\"<p>Indicates whether to allow or deny the traffic that matches the rule.</p>\",\
          \"locationName\":\"ruleAction\"\
        },\
        \"Egress\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet).</p>\",\
          \"locationName\":\"egress\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network range to allow or deny, in CIDR notation (for example <code>172.16.0.0/24</code>).</p>\",\
          \"locationName\":\"cidrBlock\"\
        },\
        \"IcmpTypeCode\":{\
          \"shape\":\"IcmpTypeCode\",\
          \"documentation\":\"<p>ICMP protocol: The ICMP type and code. Required if specifying ICMP for the protocol.</p>\",\
          \"locationName\":\"Icmp\"\
        },\
        \"PortRange\":{\
          \"shape\":\"PortRange\",\
          \"documentation\":\"<p>TCP or UDP protocols: The range of ports the rule applies to.</p>\",\
          \"locationName\":\"portRange\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateNetworkAclEntry.</p>\"\
    },\
    \"CreateNetworkAclRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateNetworkAcl.</p>\"\
    },\
    \"CreateNetworkAclResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkAcl\":{\
          \"shape\":\"NetworkAcl\",\
          \"documentation\":\"<p>Information about the network ACL.</p>\",\
          \"locationName\":\"networkAcl\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateNetworkAcl.</p>\"\
    },\
    \"CreateNetworkInterfaceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubnetId\"],\
      \"members\":{\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet to associate with the network interface.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the network interface.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The primary private IP address of the network interface. If you don't specify an IP address, Amazon EC2 selects one for you from the subnet range. If you specify an IP address, you cannot indicate any IP addresses specified in <code>privateIpAddresses</code> as primary (only one IP address can be designated as primary).</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"Groups\":{\
          \"shape\":\"SecurityGroupIdStringList\",\
          \"documentation\":\"<p>The IDs of one or more security groups.</p>\",\
          \"locationName\":\"SecurityGroupId\"\
        },\
        \"PrivateIpAddresses\":{\
          \"shape\":\"PrivateIpAddressSpecificationList\",\
          \"documentation\":\"<p>One or more private IP addresses.</p>\",\
          \"locationName\":\"privateIpAddresses\"\
        },\
        \"SecondaryPrivateIpAddressCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of secondary private IP addresses to assign to a network interface. When you specify a number of secondary IP addresses, Amazon EC2 selects these IP addresses within the subnet range. You can't specify this option and specify more than one private IP address using <code>privateIpAddresses</code>.</p> <p>The number of IP addresses you can assign to a network interface varies by instance type. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI\\\">Private IP Addresses Per ENI Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"secondaryPrivateIpAddressCount\"\
        },\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateNetworkInterface.</p>\"\
    },\
    \"CreateNetworkInterfaceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterface\":{\
          \"shape\":\"NetworkInterface\",\
          \"documentation\":\"<p>Information about the network interface.</p>\",\
          \"locationName\":\"networkInterface\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateNetworkInterface.</p>\"\
    },\
    \"CreatePlacementGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"Strategy\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for the placement group.</p> <p>Constraints: Up to 255 ASCII characters</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"Strategy\":{\
          \"shape\":\"PlacementStrategy\",\
          \"documentation\":\"<p>The placement strategy.</p>\",\
          \"locationName\":\"strategy\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreatePlacementGroup.</p>\"\
    },\
    \"CreateReservedInstancesListingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReservedInstancesId\",\
        \"InstanceCount\",\
        \"PriceSchedules\",\
        \"ClientToken\"\
      ],\
      \"members\":{\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the active Reserved Instance.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of instances that are a part of a Reserved Instance account to be listed in the Reserved Instance Marketplace. This number should be less than or equal to the instance count associated with the Reserved Instance ID specified in this call.</p>\",\
          \"locationName\":\"instanceCount\"\
        },\
        \"PriceSchedules\":{\
          \"shape\":\"PriceScheduleSpecificationList\",\
          \"documentation\":\"<p>A list specifying the price of the Reserved Instance for each month remaining in the Reserved Instance term.</p>\",\
          \"locationName\":\"priceSchedules\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"locationName\":\"clientToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateReservedInstancesListing.</p>\"\
    },\
    \"CreateReservedInstancesListingResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesListings\":{\
          \"shape\":\"ReservedInstancesListingList\",\
          \"documentation\":\"<p>Information about the Reserved Instance listing.</p>\",\
          \"locationName\":\"reservedInstancesListingsSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateReservedInstancesListing.</p>\"\
    },\
    \"CreateRouteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RouteTableId\",\
        \"DestinationCidrBlock\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table for the route.</p>\",\
          \"locationName\":\"routeTableId\"\
        },\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR address block used for the destination match. Routing decisions are based on the most specific match.</p>\",\
          \"locationName\":\"destinationCidrBlock\"\
        },\
        \"GatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of an Internet gateway or virtual private gateway attached to your VPC.</p>\",\
          \"locationName\":\"gatewayId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a NAT instance in your VPC. The operation fails if you specify an instance ID unless exactly one network interface is attached.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        },\
        \"NatGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a NAT gateway.</p>\",\
          \"locationName\":\"natGatewayId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateRoute.</p>\"\
    },\
    \"CreateRouteResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateRoute.</p>\"\
    },\
    \"CreateRouteTableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateRouteTable.</p>\"\
    },\
    \"CreateRouteTableResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RouteTable\":{\
          \"shape\":\"RouteTable\",\
          \"documentation\":\"<p>Information about the route table.</p>\",\
          \"locationName\":\"routeTable\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateRouteTable.</p>\"\
    },\
    \"CreateSecurityGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the security group.</p> <p>Constraints: Up to 255 characters in length</p> <p>Constraints for EC2-Classic: ASCII characters</p> <p>Constraints for EC2-VPC: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=<![CDATA[&amp;]]>;{}!$*</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the security group. This is informational only.</p> <p>Constraints: Up to 255 characters in length</p> <p>Constraints for EC2-Classic: ASCII characters</p> <p>Constraints for EC2-VPC: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=<![CDATA[&amp;]]>;{}!$*</p>\",\
          \"locationName\":\"GroupDescription\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the VPC. Required for EC2-VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateSecurityGroup.</p>\"\
    },\
    \"CreateSecurityGroupResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateSecurityGroup.</p>\"\
    },\
    \"CreateSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS volume.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateSnapshot.</p>\"\
    },\
    \"CreateSpotDatafeedSubscriptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Bucket\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon S3 bucket in which to store the Spot instance data feed.</p>\",\
          \"locationName\":\"bucket\"\
        },\
        \"Prefix\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A prefix for the data feed file names.</p>\",\
          \"locationName\":\"prefix\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateSpotDatafeedSubscription.</p>\"\
    },\
    \"CreateSpotDatafeedSubscriptionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotDatafeedSubscription\":{\
          \"shape\":\"SpotDatafeedSubscription\",\
          \"documentation\":\"<p>The Spot instance data feed subscription.</p>\",\
          \"locationName\":\"spotDatafeedSubscription\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateSpotDatafeedSubscription.</p>\"\
    },\
    \"CreateSubnetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpcId\",\
        \"CidrBlock\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network range for the subnet, in CIDR notation. For example, <code>10.0.0.0/24</code>.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone for the subnet.</p> <p>Default: AWS selects one for you. If you create more than one subnet in your VPC, we may not necessarily select a different zone for each subnet. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateSubnet.</p>\"\
    },\
    \"CreateSubnetResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subnet\":{\
          \"shape\":\"Subnet\",\
          \"documentation\":\"<p>Information about the subnet.</p>\",\
          \"locationName\":\"subnet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateSubnet.</p>\"\
    },\
    \"CreateTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Resources\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Resources\":{\
          \"shape\":\"ResourceIdList\",\
          \"documentation\":\"<p>The IDs of one or more resources to tag. For example, ami-1a2b3c4d.</p>\",\
          \"locationName\":\"ResourceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags. The <code>value</code> parameter is required, but if you don't want the tag to have a value, specify the parameter with no value, and we set the value to an empty string. </p>\",\
          \"locationName\":\"Tag\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateTags.</p>\"\
    },\
    \"CreateVolumePermission\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The specific AWS account ID that is to be added or removed from a volume's list of create volume permissions.</p>\",\
          \"locationName\":\"userId\"\
        },\
        \"Group\":{\
          \"shape\":\"PermissionGroup\",\
          \"documentation\":\"<p>The specific group that is to be added or removed from a volume's list of create volume permissions.</p>\",\
          \"locationName\":\"group\"\
        }\
      },\
      \"documentation\":\"<p>Describes the user or group to be added or removed from the permissions for a volume.</p>\"\
    },\
    \"CreateVolumePermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CreateVolumePermission\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"CreateVolumePermissionModifications\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Add\":{\
          \"shape\":\"CreateVolumePermissionList\",\
          \"documentation\":\"<p>Adds a specific AWS account ID or group to a volume's list of create volume permissions.</p>\"\
        },\
        \"Remove\":{\
          \"shape\":\"CreateVolumePermissionList\",\
          \"documentation\":\"<p>Removes a specific AWS account ID or group from a volume's list of create volume permissions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes modifications to the permissions for a volume.</p>\"\
    },\
    \"CreateVolumeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AvailabilityZone\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Size\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the volume, in GiBs.</p> <p>Constraints: 1-16384 for <code>gp2</code>, 4-16384 for <code>io1</code>, 500-16384 for <code>st1</code>, 500-16384 for <code>sc1</code>, and 1-1024 for <code>standard</code>. If you specify a snapshot, the volume size must be equal to or larger than the snapshot size.</p> <p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The snapshot from which to create the volume.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone in which to create the volume. Use <a>DescribeAvailabilityZones</a> to list the Availability Zones that are currently available to you.</p>\"\
        },\
        \"VolumeType\":{\
          \"shape\":\"VolumeType\",\
          \"documentation\":\"<p>The volume type. This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for Magnetic volumes.</p> <p>Default: <code>standard</code></p>\"\
        },\
        \"Iops\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Only valid for Provisioned IOPS SSD volumes. The number of I/O operations per second (IOPS) to provision for the volume, with a maximum ratio of 30 IOPS/GiB.</p> <p>Constraint: Range is 100 to 20000 for Provisioned IOPS SSD volumes </p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the volume should be encrypted. Encrypted Amazon EBS volumes may only be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are automatically encrypted. There is no way to create an encrypted volume from an unencrypted snapshot or vice versa. If your AMI uses encrypted volumes, you can only launch it on supported instance types. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html\\\">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"encrypted\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) to use when creating the encrypted volume. This parameter is only required if you want to use a non-default CMK; if this parameter is not specified, the default CMK for EBS is used. The ARN contains the <code>arn:aws:kms</code> namespace, followed by the region of the CMK, the AWS account ID of the CMK owner, the <code>key</code> namespace, and then the CMK ID. For example, arn:aws:kms:<i>us-east-1</i>:<i>012345678910</i>:key/<i>abcd1234-a123-456a-a12b-a123b4cd56ef</i>. If a <code>KmsKeyId</code> is specified, the <code>Encrypted</code> flag must also be set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVolume.</p>\"\
    },\
    \"CreateVpcEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpcId\",\
        \"ServiceName\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC in which the endpoint will be used.</p>\"\
        },\
        \"ServiceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS service name, in the form <code>com.amazonaws.<i>region</i>.<i>service</i></code>. To get a list of available services, use the <a>DescribeVpcEndpointServices</a> request.</p>\"\
        },\
        \"PolicyDocument\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A policy to attach to the endpoint that controls access to the service. The policy must be in valid JSON format. If this parameter is not specified, we attach a default policy that allows full access to the service. </p>\"\
        },\
        \"RouteTableIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more route table IDs.</p>\",\
          \"locationName\":\"RouteTableId\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVpcEndpoint.</p>\"\
    },\
    \"CreateVpcEndpointResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcEndpoint\":{\
          \"shape\":\"VpcEndpoint\",\
          \"documentation\":\"<p>Information about the endpoint.</p>\",\
          \"locationName\":\"vpcEndpoint\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request.</p>\",\
          \"locationName\":\"clientToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateVpcEndpoint.</p>\"\
    },\
    \"CreateVpcPeeringConnectionRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the requester VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"PeerVpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC with which you are creating the VPC peering connection.</p>\",\
          \"locationName\":\"peerVpcId\"\
        },\
        \"PeerOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the peer VPC.</p> <p>Default: Your AWS account ID</p>\",\
          \"locationName\":\"peerOwnerId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVpcPeeringConnection.</p>\"\
    },\
    \"CreateVpcPeeringConnectionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcPeeringConnection\":{\
          \"shape\":\"VpcPeeringConnection\",\
          \"documentation\":\"<p>Information about the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnection\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateVpcPeeringConnection.</p>\"\
    },\
    \"CreateVpcRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CidrBlock\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network range for the VPC, in CIDR notation. For example, <code>10.0.0.0/16</code>.</p>\"\
        },\
        \"InstanceTenancy\":{\
          \"shape\":\"Tenancy\",\
          \"documentation\":\"<p>The tenancy options for instances launched into the VPC. For <code>default</code>, instances are launched with shared tenancy by default. You can launch instances with any tenancy into a shared tenancy VPC. For <code>dedicated</code>, instances are launched as dedicated tenancy instances by default. You can only launch instances with a tenancy of <code>dedicated</code> or <code>host</code> into a dedicated tenancy VPC. </p> <p><b>Important:</b> The <code>host</code> value cannot be used with this parameter. Use the <code>default</code> or <code>dedicated</code> values only.</p> <p>Default: <code>default</code></p>\",\
          \"locationName\":\"instanceTenancy\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVpc.</p>\"\
    },\
    \"CreateVpcResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Vpc\":{\
          \"shape\":\"Vpc\",\
          \"documentation\":\"<p>Information about the VPC.</p>\",\
          \"locationName\":\"vpc\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateVpc.</p>\"\
    },\
    \"CreateVpnConnectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"CustomerGatewayId\",\
        \"VpnGatewayId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of VPN connection (<code>ipsec.1</code>).</p>\"\
        },\
        \"CustomerGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the customer gateway.</p>\"\
        },\
        \"VpnGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\"\
        },\
        \"Options\":{\
          \"shape\":\"VpnConnectionOptionsSpecification\",\
          \"documentation\":\"<p>Indicates whether the VPN connection requires static routes. If you are creating a VPN connection for a device that does not support BGP, you must specify <code>true</code>.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"options\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVpnConnection.</p>\"\
    },\
    \"CreateVpnConnectionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpnConnection\":{\
          \"shape\":\"VpnConnection\",\
          \"documentation\":\"<p>Information about the VPN connection.</p>\",\
          \"locationName\":\"vpnConnection\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateVpnConnection.</p>\"\
    },\
    \"CreateVpnConnectionRouteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpnConnectionId\",\
        \"DestinationCidrBlock\"\
      ],\
      \"members\":{\
        \"VpnConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPN connection.</p>\"\
        },\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block associated with the local subnet of the customer network.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVpnConnectionRoute.</p>\"\
    },\
    \"CreateVpnGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Type\":{\
          \"shape\":\"GatewayType\",\
          \"documentation\":\"<p>The type of VPN connection this virtual private gateway supports.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone for the virtual private gateway.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for CreateVpnGateway.</p>\"\
    },\
    \"CreateVpnGatewayResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpnGateway\":{\
          \"shape\":\"VpnGateway\",\
          \"documentation\":\"<p>Information about the virtual private gateway.</p>\",\
          \"locationName\":\"vpnGateway\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of CreateVpnGateway.</p>\"\
    },\
    \"CurrencyCodeValues\":{\
      \"type\":\"string\",\
      \"enum\":[\"USD\"]\
    },\
    \"CustomerGateway\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomerGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the customer gateway.</p>\",\
          \"locationName\":\"customerGatewayId\"\
        },\
        \"State\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The current state of the customer gateway (<code>pending | available | deleting | deleted</code>).</p>\",\
          \"locationName\":\"state\"\
        },\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of VPN connection the customer gateway supports (<code>ipsec.1</code>).</p>\",\
          \"locationName\":\"type\"\
        },\
        \"IpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Internet-routable IP address of the customer gateway's outside interface.</p>\",\
          \"locationName\":\"ipAddress\"\
        },\
        \"BgpAsn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN).</p>\",\
          \"locationName\":\"bgpAsn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the customer gateway.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a customer gateway.</p>\"\
    },\
    \"CustomerGatewayIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"CustomerGatewayId\"\
      }\
    },\
    \"CustomerGatewayList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"CustomerGateway\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"DatafeedSubscriptionState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Active\",\
        \"Inactive\"\
      ]\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteCustomerGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomerGatewayId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"CustomerGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the customer gateway.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteCustomerGateway.</p>\"\
    },\
    \"DeleteDhcpOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DhcpOptionsId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"DhcpOptionsId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the DHCP options set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteDhcpOptions.</p>\"\
    },\
    \"DeleteFlowLogsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FlowLogIds\"],\
      \"members\":{\
        \"FlowLogIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more flow log IDs.</p>\",\
          \"locationName\":\"FlowLogId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteFlowLogs.</p>\"\
    },\
    \"DeleteFlowLogsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Unsuccessful\":{\
          \"shape\":\"UnsuccessfulItemSet\",\
          \"documentation\":\"<p>Information about the flow logs that could not be deleted successfully.</p>\",\
          \"locationName\":\"unsuccessful\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DeleteFlowLogs.</p>\"\
    },\
    \"DeleteInternetGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InternetGatewayId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InternetGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Internet gateway.</p>\",\
          \"locationName\":\"internetGatewayId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteInternetGateway.</p>\"\
    },\
    \"DeleteKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"KeyName\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteKeyPair.</p>\"\
    },\
    \"DeleteNatGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NatGatewayId\"],\
      \"members\":{\
        \"NatGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the NAT gateway.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteNatGateway.</p>\"\
    },\
    \"DeleteNatGatewayResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NatGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the NAT gateway.</p>\",\
          \"locationName\":\"natGatewayId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DeleteNatGateway.</p>\"\
    },\
    \"DeleteNetworkAclEntryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NetworkAclId\",\
        \"RuleNumber\",\
        \"Egress\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network ACL.</p>\",\
          \"locationName\":\"networkAclId\"\
        },\
        \"RuleNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The rule number of the entry to delete.</p>\",\
          \"locationName\":\"ruleNumber\"\
        },\
        \"Egress\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the rule is an egress rule.</p>\",\
          \"locationName\":\"egress\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteNetworkAclEntry.</p>\"\
    },\
    \"DeleteNetworkAclRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NetworkAclId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network ACL.</p>\",\
          \"locationName\":\"networkAclId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteNetworkAcl.</p>\"\
    },\
    \"DeleteNetworkInterfaceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NetworkInterfaceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteNetworkInterface.</p>\"\
    },\
    \"DeletePlacementGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"GroupName\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the placement group.</p>\",\
          \"locationName\":\"groupName\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeletePlacementGroup.</p>\"\
    },\
    \"DeleteRouteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RouteTableId\",\
        \"DestinationCidrBlock\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\",\
          \"locationName\":\"routeTableId\"\
        },\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR range for the route. The value you specify must match the CIDR for the route exactly.</p>\",\
          \"locationName\":\"destinationCidrBlock\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteRoute.</p>\"\
    },\
    \"DeleteRouteTableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RouteTableId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\",\
          \"locationName\":\"routeTableId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteRouteTable.</p>\"\
    },\
    \"DeleteSecurityGroupRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic, default VPC] The name of the security group. You can specify either the security group name or the security group ID.</p>\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group. Required for a nondefault VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteSecurityGroup.</p>\"\
    },\
    \"DeleteSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SnapshotId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteSnapshot.</p>\"\
    },\
    \"DeleteSpotDatafeedSubscriptionRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteSpotDatafeedSubscription.</p>\"\
    },\
    \"DeleteSubnetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubnetId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteSubnet.</p>\"\
    },\
    \"DeleteTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Resources\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Resources\":{\
          \"shape\":\"ResourceIdList\",\
          \"documentation\":\"<p>The ID of the resource. For example, ami-1a2b3c4d. You can specify more than one resource ID.</p>\",\
          \"locationName\":\"resourceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>One or more tags to delete. If you omit the <code>value</code> parameter, we delete the tag regardless of its value. If you specify this parameter with an empty string as the value, we delete the key only if its value is an empty string.</p>\",\
          \"locationName\":\"tag\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteTags.</p>\"\
    },\
    \"DeleteVolumeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVolume.</p>\"\
    },\
    \"DeleteVpcEndpointsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcEndpointIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"VpcEndpointIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more endpoint IDs.</p>\",\
          \"locationName\":\"VpcEndpointId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVpcEndpoints.</p>\"\
    },\
    \"DeleteVpcEndpointsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Unsuccessful\":{\
          \"shape\":\"UnsuccessfulItemSet\",\
          \"documentation\":\"<p>Information about the endpoints that were not successfully deleted.</p>\",\
          \"locationName\":\"unsuccessful\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DeleteVpcEndpoints.</p>\"\
    },\
    \"DeleteVpcPeeringConnectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcPeeringConnectionId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVpcPeeringConnection.</p>\"\
    },\
    \"DeleteVpcPeeringConnectionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DeleteVpcPeeringConnection.</p>\"\
    },\
    \"DeleteVpcRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVpc.</p>\"\
    },\
    \"DeleteVpnConnectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpnConnectionId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpnConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPN connection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVpnConnection.</p>\"\
    },\
    \"DeleteVpnConnectionRouteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpnConnectionId\",\
        \"DestinationCidrBlock\"\
      ],\
      \"members\":{\
        \"VpnConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPN connection.</p>\"\
        },\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block associated with the local subnet of the customer network.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVpnConnectionRoute.</p>\"\
    },\
    \"DeleteVpnGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpnGatewayId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpnGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeleteVpnGateway.</p>\"\
    },\
    \"DeregisterImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ImageId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DeregisterImage.</p>\"\
    },\
    \"DescribeAccountAttributesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"AttributeNames\":{\
          \"shape\":\"AccountAttributeNameStringList\",\
          \"documentation\":\"<p>One or more account attribute names.</p>\",\
          \"locationName\":\"attributeName\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeAccountAttributes.</p>\"\
    },\
    \"DescribeAccountAttributesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountAttributes\":{\
          \"shape\":\"AccountAttributeList\",\
          \"documentation\":\"<p>Information about one or more account attributes.</p>\",\
          \"locationName\":\"accountAttributeSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeAccountAttributes.</p>\"\
    },\
    \"DescribeAddressesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"PublicIps\":{\
          \"shape\":\"PublicIpStringList\",\
          \"documentation\":\"<p>[EC2-Classic] One or more Elastic IP addresses.</p> <p>Default: Describes all your Elastic IP addresses.</p>\",\
          \"locationName\":\"PublicIp\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters. Filter names and values are case-sensitive.</p> <ul> <li> <p><code>allocation-id</code> - [EC2-VPC] The allocation ID for the address.</p> </li> <li> <p><code>association-id</code> - [EC2-VPC] The association ID for the address.</p> </li> <li> <p><code>domain</code> - Indicates whether the address is for use in EC2-Classic (<code>standard</code>) or in a VPC (<code>vpc</code>).</p> </li> <li> <p><code>instance-id</code> - The ID of the instance the address is associated with, if any.</p> </li> <li> <p><code>network-interface-id</code> - [EC2-VPC] The ID of the network interface that the address is associated with, if any.</p> </li> <li> <p><code>network-interface-owner-id</code> - The AWS account ID of the owner.</p> </li> <li> <p><code>private-ip-address</code> - [EC2-VPC] The private IP address associated with the Elastic IP address.</p> </li> <li> <p><code>public-ip</code> - The Elastic IP address.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"AllocationIds\":{\
          \"shape\":\"AllocationIdList\",\
          \"documentation\":\"<p>[EC2-VPC] One or more allocation IDs.</p> <p>Default: Describes all your Elastic IP addresses.</p>\",\
          \"locationName\":\"AllocationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeAddresses.</p>\"\
    },\
    \"DescribeAddressesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Addresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>Information about one or more Elastic IP addresses.</p>\",\
          \"locationName\":\"addressesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeAddresses.</p>\"\
    },\
    \"DescribeAvailabilityZonesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ZoneNames\":{\
          \"shape\":\"ZoneNameStringList\",\
          \"documentation\":\"<p>The names of one or more Availability Zones.</p>\",\
          \"locationName\":\"ZoneName\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>message</code> - Information about the Availability Zone.</p> </li> <li> <p><code>region-name</code> - The name of the region for the Availability Zone (for example, <code>us-east-1</code>).</p> </li> <li> <p><code>state</code> - The state of the Availability Zone (<code>available</code> | <code>information</code> | <code>impaired</code> | <code>unavailable</code>).</p> </li> <li> <p><code>zone-name</code> - The name of the Availability Zone (for example, <code>us-east-1a</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeAvailabilityZones.</p>\"\
    },\
    \"DescribeAvailabilityZonesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZoneList\",\
          \"documentation\":\"<p>Information about one or more Availability Zones.</p>\",\
          \"locationName\":\"availabilityZoneInfo\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeAvailabiltyZones.</p>\"\
    },\
    \"DescribeBundleTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"BundleIds\":{\
          \"shape\":\"BundleIdStringList\",\
          \"documentation\":\"<p>One or more bundle task IDs.</p> <p>Default: Describes all your bundle tasks.</p>\",\
          \"locationName\":\"BundleId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>bundle-id</code> - The ID of the bundle task.</p> </li> <li> <p><code>error-code</code> - If the task failed, the error code returned.</p> </li> <li> <p><code>error-message</code> - If the task failed, the error message returned.</p> </li> <li> <p><code>instance-id</code> - The ID of the instance.</p> </li> <li> <p><code>progress</code> - The level of task completion, as a percentage (for example, 20%).</p> </li> <li> <p><code>s3-bucket</code> - The Amazon S3 bucket to store the AMI.</p> </li> <li> <p><code>s3-prefix</code> - The beginning of the AMI name.</p> </li> <li> <p><code>start-time</code> - The time the task started (for example, 2013-09-15T17:15:20.000Z).</p> </li> <li> <p><code>state</code> - The state of the task (<code>pending</code> | <code>waiting-for-shutdown</code> | <code>bundling</code> | <code>storing</code> | <code>cancelling</code> | <code>complete</code> | <code>failed</code>).</p> </li> <li> <p><code>update-time</code> - The time of the most recent update for the task.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeBundleTasks.</p>\"\
    },\
    \"DescribeBundleTasksResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BundleTasks\":{\
          \"shape\":\"BundleTaskList\",\
          \"documentation\":\"<p>Information about one or more bundle tasks.</p>\",\
          \"locationName\":\"bundleInstanceTasksSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeBundleTasks.</p>\"\
    },\
    \"DescribeClassicLinkInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs. Must be instances linked to a VPC through ClassicLink.</p>\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li><p><code>group-id</code> - The ID of a VPC security group that's associated with the instance.</p></li> <li> <p><code>instance-id</code> - The ID of the instance.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC that the instance is linked to.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. You cannot specify this parameter and the instance IDs parameter in the same request.</p> <p>Constraint: If the value is greater than 1000, we return only 1000 items.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeClassicLinkInstances.</p>\"\
    },\
    \"DescribeClassicLinkInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Instances\":{\
          \"shape\":\"ClassicLinkInstanceList\",\
          \"documentation\":\"<p>Information about one or more linked EC2-Classic instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeClassicLinkInstances.</p>\"\
    },\
    \"DescribeConversionTaskList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ConversionTask\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"DescribeConversionTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p>\",\
          \"locationName\":\"filter\"\
        },\
        \"ConversionTaskIds\":{\
          \"shape\":\"ConversionIdStringList\",\
          \"documentation\":\"<p>One or more conversion task IDs.</p>\",\
          \"locationName\":\"conversionTaskId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeConversionTasks.</p>\"\
    },\
    \"DescribeConversionTasksResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConversionTasks\":{\
          \"shape\":\"DescribeConversionTaskList\",\
          \"documentation\":\"<p>Information about the conversion tasks.</p>\",\
          \"locationName\":\"conversionTasks\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeConversionTasks.</p>\"\
    },\
    \"DescribeCustomerGatewaysRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"CustomerGatewayIds\":{\
          \"shape\":\"CustomerGatewayIdStringList\",\
          \"documentation\":\"<p>One or more customer gateway IDs.</p> <p>Default: Describes all your customer gateways.</p>\",\
          \"locationName\":\"CustomerGatewayId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>bgp-asn</code> - The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN).</p> </li> <li> <p><code>customer-gateway-id</code> - The ID of the customer gateway.</p> </li> <li> <p><code>ip-address</code> - The IP address of the customer gateway's Internet-routable external interface.</p> </li> <li> <p><code>state</code> - The state of the customer gateway (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p> </li> <li> <p><code>type</code> - The type of customer gateway. Currently, the only supported type is <code>ipsec.1</code>.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeCustomerGateways.</p>\"\
    },\
    \"DescribeCustomerGatewaysResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomerGateways\":{\
          \"shape\":\"CustomerGatewayList\",\
          \"documentation\":\"<p>Information about one or more customer gateways.</p>\",\
          \"locationName\":\"customerGatewaySet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeCustomerGateways.</p>\"\
    },\
    \"DescribeDhcpOptionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"DhcpOptionsIds\":{\
          \"shape\":\"DhcpOptionsIdStringList\",\
          \"documentation\":\"<p>The IDs of one or more DHCP options sets.</p> <p>Default: Describes all your DHCP options sets.</p>\",\
          \"locationName\":\"DhcpOptionsId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>dhcp-options-id</code> - The ID of a set of DHCP options.</p> </li> <li> <p><code>key</code> - The key for one of the options (for example, <code>domain-name</code>).</p> </li> <li> <p><code>value</code> - The value for one of the options.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeDhcpOptions.</p>\"\
    },\
    \"DescribeDhcpOptionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DhcpOptions\":{\
          \"shape\":\"DhcpOptionsList\",\
          \"documentation\":\"<p>Information about one or more DHCP options sets.</p>\",\
          \"locationName\":\"dhcpOptionsSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeDhcpOptions.</p>\"\
    },\
    \"DescribeExportTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExportTaskIds\":{\
          \"shape\":\"ExportTaskIdStringList\",\
          \"documentation\":\"<p>One or more export task IDs.</p>\",\
          \"locationName\":\"exportTaskId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeExportTasks.</p>\"\
    },\
    \"DescribeExportTasksResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExportTasks\":{\
          \"shape\":\"ExportTaskList\",\
          \"documentation\":\"<p>Information about the export tasks.</p>\",\
          \"locationName\":\"exportTaskSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeExportTasks.</p>\"\
    },\
    \"DescribeFlowLogsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FlowLogIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more flow log IDs.</p>\",\
          \"locationName\":\"FlowLogId\"\
        },\
        \"Filter\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li><p><code>deliver-log-status</code> - The status of the logs delivery (<code>SUCCESS</code> | <code>FAILED</code>).</p></li> <li><p><code>flow-log-id</code> - The ID of the flow log.</p></li> <li><p><code>log-group-name</code> - The name of the log group.</p></li> <li><p><code>resource-id</code> - The ID of the VPC, subnet, or network interface.</p></li> <li><p><code>traffic-type</code> - The type of traffic (<code>ACCEPT</code> | <code>REJECT</code> | <code>ALL</code>)</p></li> </ul>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return for the request in a single page. The remaining results can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. You cannot specify this parameter and the flow log IDs parameter in the same request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeFlowLogs.</p>\"\
    },\
    \"DescribeFlowLogsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FlowLogs\":{\
          \"shape\":\"FlowLogSet\",\
          \"documentation\":\"<p>Information about the flow logs.</p>\",\
          \"locationName\":\"flowLogSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeFlowLogs.</p>\"\
    },\
    \"DescribeHostsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HostIds\":{\
          \"shape\":\"RequestHostIdList\",\
          \"documentation\":\"<p>The IDs of the Dedicated hosts. The IDs are used for targeted instance launches.</p>\",\
          \"locationName\":\"hostId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return for the request in a single page. The remaining results can be seen by sending another request with the returned <code>nextToken</code> value. This value can be between 5 and 500; if <code>maxResults</code> is given a larger value than 500, you will receive an error. You cannot specify this parameter and the host IDs parameter in the same request.</p>\",\
          \"locationName\":\"maxResults\"\
        },\
        \"Filter\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li><p><code>instance-type</code> - The instance type size that the Dedicated host is configured to support.</p></li> <li><p><code>auto-placement</code> - Whether auto-placement is enabled or disabled (<code>on</code> | <code>off</code>).</p></li> <li><p><code>host-reservation-id</code> - The ID of the reservation associated with this host.</p></li> <li><p><code>client-token</code> - The idempotency token you provided when you launched the instance</p></li> <li><p><code>state</code>- The allocation state of the Dedicated host (<code>available</code> | <code>under-assessment</code> | <code>permanent-failure</code> | <code>released</code> | <code>released-permanent-failure</code>).</p></li> <li><p><code>availability-zone</code> - The Availability Zone of the host.</p> </li> </ul>\",\
          \"locationName\":\"filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeHosts.</p>\"\
    },\
    \"DescribeHostsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Hosts\":{\
          \"shape\":\"HostList\",\
          \"documentation\":\"<p>Information about the Dedicated hosts.</p>\",\
          \"locationName\":\"hostSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeHosts.</p>\"\
    },\
    \"DescribeIdFormatRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeIdFormat.</p>\"\
    },\
    \"DescribeIdFormatResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Statuses\":{\
          \"shape\":\"IdFormatList\",\
          \"documentation\":\"<p>Information about the ID format for the resource.</p>\",\
          \"locationName\":\"statusSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeIdFormat.</p>\"\
    },\
    \"DescribeImageAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ImageId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"ImageAttributeName\",\
          \"documentation\":\"<p>The AMI attribute.</p> <p><b>Note</b>: Depending on your account privileges, the <code>blockDeviceMapping</code> attribute may return a <code>Client.AuthFailure</code> error. If this happens, use <a>DescribeImages</a> to get information about the block device mapping for the AMI.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeImageAttribute.</p>\"\
    },\
    \"DescribeImagesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageIds\":{\
          \"shape\":\"ImageIdStringList\",\
          \"documentation\":\"<p>One or more image IDs.</p> <p>Default: Describes all images available to you.</p>\",\
          \"locationName\":\"ImageId\"\
        },\
        \"Owners\":{\
          \"shape\":\"OwnerStringList\",\
          \"documentation\":\"<p>Filters the images by the owner. Specify an AWS account ID, <code>amazon</code> (owner is Amazon), <code>aws-marketplace</code> (owner is AWS Marketplace), <code>self</code> (owner is the sender of the request). Omitting this option returns all images for which you have launch permissions, regardless of ownership.</p>\",\
          \"locationName\":\"Owner\"\
        },\
        \"ExecutableUsers\":{\
          \"shape\":\"ExecutableByStringList\",\
          \"documentation\":\"<p>Scopes the images by users with explicit launch permissions. Specify an AWS account ID, <code>self</code> (the sender of the request), or <code>all</code> (public AMIs).</p>\",\
          \"locationName\":\"ExecutableBy\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>architecture</code> - The image architecture (<code>i386</code> | <code>x86_64</code>).</p> </li> <li> <p><code>block-device-mapping.delete-on-termination</code> - A Boolean value that indicates whether the Amazon EBS volume is deleted on instance termination.</p> </li> <li> <p><code>block-device-mapping.device-name</code> - The device name for the EBS volume (for example, <code>/dev/sdh</code>).</p> </li> <li> <p><code>block-device-mapping.snapshot-id</code> - The ID of the snapshot used for the EBS volume.</p> </li> <li> <p><code>block-device-mapping.volume-size</code> - The volume size of the EBS volume, in GiB.</p> </li> <li> <p><code>block-device-mapping.volume-type</code> - The volume type of the EBS volume (<code>gp2</code> | <code>io1</code> | <code>st1 </code>| <code>sc1</code> | <code>standard</code>).</p> </li> <li> <p><code>description</code> - The description of the image (provided during image creation).</p> </li> <li> <p><code>hypervisor</code> - The hypervisor type (<code>ovm</code> | <code>xen</code>).</p> </li> <li> <p><code>image-id</code> - The ID of the image.</p> </li> <li> <p><code>image-type</code> - The image type (<code>machine</code> | <code>kernel</code> | <code>ramdisk</code>).</p> </li> <li> <p><code>is-public</code> - A Boolean that indicates whether the image is public.</p> </li> <li> <p><code>kernel-id</code> - The kernel ID.</p> </li> <li> <p><code>manifest-location</code> - The location of the image manifest.</p> </li> <li> <p><code>name</code> - The name of the AMI (provided during image creation).</p> </li> <li> <p><code>owner-alias</code> - The AWS account alias (for example, <code>amazon</code>).</p> </li> <li> <p><code>owner-id</code> - The AWS account ID of the image owner.</p> </li> <li> <p><code>platform</code> - The platform. To only list Windows-based AMIs, use <code>windows</code>.</p> </li> <li> <p><code>product-code</code> - The product code.</p> </li> <li> <p><code>product-code.type</code> - The type of the product code (<code>devpay</code> | <code>marketplace</code>).</p> </li> <li> <p><code>ramdisk-id</code> - The RAM disk ID.</p> </li> <li> <p><code>root-device-name</code> - The name of the root device volume (for example, <code>/dev/sda1</code>).</p> </li> <li> <p><code>root-device-type</code> - The type of the root device volume (<code>ebs</code> | <code>instance-store</code>).</p> </li> <li> <p><code>state</code> - The state of the image (<code>available</code> | <code>pending</code> | <code>failed</code>).</p> </li> <li> <p><code>state-reason-code</code> - The reason code for the state change.</p> </li> <li> <p><code>state-reason-message</code> - The message for the state change.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the tag-value filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>virtualization-type</code> - The virtualization type (<code>paravirtual</code> | <code>hvm</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeImages.</p>\"\
    },\
    \"DescribeImagesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Images\":{\
          \"shape\":\"ImageList\",\
          \"documentation\":\"<p>Information about one or more images.</p>\",\
          \"locationName\":\"imagesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeImages.</p>\"\
    },\
    \"DescribeImportImageTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"ImportTaskIds\":{\
          \"shape\":\"ImportTaskIdList\",\
          \"documentation\":\"<p>A list of import image task IDs.</p>\",\
          \"locationName\":\"ImportTaskId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A token that indicates the next page of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>Filter tasks using the <code>task-state</code> filter and one of the following values: active, completed, deleting, deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeImportImageTasks.</p>\"\
    },\
    \"DescribeImportImageTasksResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportImageTasks\":{\
          \"shape\":\"ImportImageTaskList\",\
          \"documentation\":\"<p>A list of zero or more import image tasks that are currently active or were completed or canceled in the previous 7 days.</p>\",\
          \"locationName\":\"importImageTaskSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to get the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeImportImageTasks.</p>\"\
    },\
    \"DescribeImportSnapshotTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"ImportTaskIds\":{\
          \"shape\":\"ImportTaskIdList\",\
          \"documentation\":\"<p>A list of import snapshot task IDs.</p>\",\
          \"locationName\":\"ImportTaskId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A token that indicates the next page of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeImportSnapshotTasks.</p>\"\
    },\
    \"DescribeImportSnapshotTasksResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportSnapshotTasks\":{\
          \"shape\":\"ImportSnapshotTaskList\",\
          \"documentation\":\"<p>A list of zero or more import snapshot tasks that are currently active or were completed or canceled in the previous 7 days.</p>\",\
          \"locationName\":\"importSnapshotTaskSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to get the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeImportSnapshotTasks.</p>\"\
    },\
    \"DescribeInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Attribute\":{\
          \"shape\":\"InstanceAttributeName\",\
          \"documentation\":\"<p>The instance attribute.</p>\",\
          \"locationName\":\"attribute\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeInstanceAttribute.</p>\"\
    },\
    \"DescribeInstanceStatusRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p> <p>Default: Describes all your instances.</p> <p>Constraints: Maximum 100 explicitly specified instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone</code> - The Availability Zone of the instance.</p> </li> <li> <p><code>event.code</code> - The code for the scheduled event (<code>instance-reboot</code> | <code>system-reboot</code> | <code>system-maintenance</code> | <code>instance-retirement</code> | <code>instance-stop</code>).</p> </li> <li> <p><code>event.description</code> - A description of the event.</p> </li> <li> <p><code>event.not-after</code> - The latest end time for the scheduled event (for example, <code>2014-09-15T17:15:20.000Z</code>).</p> </li> <li> <p><code>event.not-before</code> - The earliest start time for the scheduled event (for example, <code>2014-09-15T17:15:20.000Z</code>).</p> </li> <li> <p><code>instance-state-code</code> - The code for the instance state, as a 16-bit unsigned integer. The high byte is an opaque internal value and should be ignored. The low byte is set based on the state represented. The valid values are 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).</p> </li> <li> <p><code>instance-state-name</code> - The state of the instance (<code>pending</code> | <code>running</code> | <code>shutting-down</code> | <code>terminated</code> | <code>stopping</code> | <code>stopped</code>).</p> </li> <li> <p><code>instance-status.reachability</code> - Filters on instance status where the name is <code>reachability</code> (<code>passed</code> | <code>failed</code> | <code>initializing</code> | <code>insufficient-data</code>).</p> </li> <li> <p><code>instance-status.status</code> - The status of the instance (<code>ok</code> | <code>impaired</code> | <code>initializing</code> | <code>insufficient-data</code> | <code>not-applicable</code>).</p> </li> <li> <p><code>system-status.reachability</code> - Filters on system status where the name is <code>reachability</code> (<code>passed</code> | <code>failed</code> | <code>initializing</code> | <code>insufficient-data</code>).</p> </li> <li> <p><code>system-status.status</code> - The system status of the instance (<code>ok</code> | <code>impaired</code> | <code>initializing</code> | <code>insufficient-data</code> | <code>not-applicable</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value. This value can be between 5 and 1000. You cannot specify this parameter and the instance IDs parameter in the same call.</p>\"\
        },\
        \"IncludeAllInstances\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>When <code>true</code>, includes the health status for all instances. When <code>false</code>, includes the health status for running instances only.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"includeAllInstances\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeInstanceStatus.</p>\"\
    },\
    \"DescribeInstanceStatusResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceStatuses\":{\
          \"shape\":\"InstanceStatusList\",\
          \"documentation\":\"<p>One or more instance status descriptions.</p>\",\
          \"locationName\":\"instanceStatusSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeInstanceStatus.</p>\"\
    },\
    \"DescribeInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p> <p>Default: Describes all your instances.</p>\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>affinity</code> - The affinity setting for an instance running on a Dedicated host (<code>default</code> | <code>host</code>).</p> </li> <li> <p><code>architecture</code> - The instance architecture (<code>i386</code> | <code>x86_64</code>).</p> </li> <li> <p><code>availability-zone</code> - The Availability Zone of the instance.</p> </li> <li> <p><code>block-device-mapping.attach-time</code> - The attach time for an EBS volume mapped to the instance, for example, <code>2010-09-15T17:15:20.000Z</code>.</p> </li> <li> <p><code>block-device-mapping.delete-on-termination</code> - A Boolean that indicates whether the EBS volume is deleted on instance termination.</p> </li> <li> <p><code>block-device-mapping.device-name</code> - The device name for the EBS volume (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p> </li> <li> <p><code>block-device-mapping.status</code> - The status for the EBS volume (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p> </li> <li> <p><code>block-device-mapping.volume-id</code> - The volume ID of the EBS volume.</p> </li> <li> <p><code>client-token</code> - The idempotency token you provided when you launched the instance.</p> </li> <li> <p><code>dns-name</code> - The public DNS name of the instance.</p> </li> <li> <p><code>group-id</code> - The ID of the security group for the instance. EC2-Classic only.</p> </li> <li> <p><code>group-name</code> - The name of the security group for the instance. EC2-Classic only.</p> </li> <li> <p><code>host-Id</code> - The ID of the Dedicated host on which the instance is running, if applicable.</p> </li> <li> <p><code>hypervisor</code> - The hypervisor type of the instance (<code>ovm</code> | <code>xen</code>).</p> </li> <li> <p><code>iam-instance-profile.arn</code> - The instance profile associated with the instance. Specified as an ARN.</p> </li> <li> <p><code>image-id</code> - The ID of the image used to launch the instance.</p> </li> <li> <p><code>instance-id</code> - The ID of the instance.</p> </li> <li> <p><code>instance-lifecycle</code> - Indicates whether this is a Spot Instance or a Scheduled Instance (<code>spot</code> | <code>scheduled</code>).</p> </li> <li> <p><code>instance-state-code</code> - The state of the instance, as a 16-bit unsigned integer. The high byte is an opaque internal value and should be ignored. The low byte is set based on the state represented. The valid values are: 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).</p> </li> <li> <p><code>instance-state-name</code> - The state of the instance (<code>pending</code> | <code>running</code> | <code>shutting-down</code> | <code>terminated</code> | <code>stopping</code> | <code>stopped</code>).</p> </li> <li> <p><code>instance-type</code> - The type of instance (for example, <code>t2.micro</code>).</p> </li> <li> <p><code>instance.group-id</code> - The ID of the security group for the instance. </p> </li> <li> <p><code>instance.group-name</code> - The name of the security group for the instance. </p> </li> <li> <p><code>ip-address</code> - The public IP address of the instance.</p> </li> <li> <p><code>kernel-id</code> - The kernel ID.</p> </li> <li> <p><code>key-name</code> - The name of the key pair used when the instance was launched.</p> </li> <li> <p><code>launch-index</code> - When launching multiple instances, this is the index for the instance in the launch group (for example, 0, 1, 2, and so on). </p> </li> <li> <p><code>launch-time</code> - The time when the instance was launched.</p> </li> <li> <p><code>monitoring-state</code> - Indicates whether monitoring is enabled for the instance (<code>disabled</code> | <code>enabled</code>).</p> </li> <li> <p><code>owner-id</code> - The AWS account ID of the instance owner.</p> </li> <li> <p><code>placement-group-name</code> - The name of the placement group for the instance.</p> </li> <li> <p><code>platform</code> - The platform. Use <code>windows</code> if you have Windows instances; otherwise, leave blank.</p> </li> <li> <p><code>private-dns-name</code> - The private DNS name of the instance.</p> </li> <li> <p><code>private-ip-address</code> - The private IP address of the instance.</p> </li> <li> <p><code>product-code</code> - The product code associated with the AMI used to launch the instance.</p> </li> <li> <p><code>product-code.type</code> - The type of product code (<code>devpay</code> | <code>marketplace</code>).</p> </li> <li> <p><code>ramdisk-id</code> - The RAM disk ID.</p> </li> <li> <p><code>reason</code> - The reason for the current state of the instance (for example, shows \\\"User Initiated [date]\\\" when you stop or terminate the instance). Similar to the state-reason-code filter.</p> </li> <li> <p><code>requester-id</code> - The ID of the entity that launched the instance on your behalf (for example, AWS Management Console, Auto Scaling, and so on).</p> </li> <li> <p><code>reservation-id</code> - The ID of the instance's reservation. A reservation ID is created any time you launch an instance. A reservation ID has a one-to-one relationship with an instance launch request, but can be associated with more than one instance if you launch multiple instances using the same launch request. For example, if you launch one instance, you'll get one reservation ID. If you launch ten instances using the same launch request, you'll also get one reservation ID.</p> </li> <li> <p><code>root-device-name</code> - The name of the root device for the instance (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p> </li> <li> <p><code>root-device-type</code> - The type of root device that the instance uses (<code>ebs</code> | <code>instance-store</code>).</p> </li> <li> <p><code>source-dest-check</code> - Indicates whether the instance performs source/destination checking. A value of <code>true</code> means that checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the instance to perform network address translation (NAT) in your VPC. </p> </li> <li> <p><code>spot-instance-request-id</code> - The ID of the Spot instance request.</p> </li> <li> <p><code>state-reason-code</code> - The reason code for the state change.</p> </li> <li> <p><code>state-reason-message</code> - A message that describes the state change.</p> </li> <li> <p><code>subnet-id</code> - The ID of the subnet for the instance.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource, where <code>tag</code>:<i>key</i> is the tag's key. </p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>tenancy</code> - The tenancy of an instance (<code>dedicated</code> | <code>default</code> | <code>host</code>).</p> </li> <li> <p><code>virtualization-type</code> - The virtualization type of the instance (<code>paravirtual</code> | <code>hvm</code>).</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC that the instance is running in.</p> </li> <li> <p><code>network-interface.description</code> - The description of the network interface.</p> </li> <li> <p><code>network-interface.subnet-id</code> - The ID of the subnet for the network interface.</p> </li> <li> <p><code>network-interface.vpc-id</code> - The ID of the VPC for the network interface.</p> </li> <li> <p><code>network-interface.network-interface-id</code> - The ID of the network interface.</p> </li> <li> <p><code>network-interface.owner-id</code> - The ID of the owner of the network interface.</p> </li> <li> <p><code>network-interface.availability-zone</code> - The Availability Zone for the network interface.</p> </li> <li> <p><code>network-interface.requester-id</code> - The requester ID for the network interface.</p> </li> <li> <p><code>network-interface.requester-managed</code> - Indicates whether the network interface is being managed by AWS.</p> </li> <li> <p><code>network-interface.status</code> - The status of the network interface (<code>available</code>) | <code>in-use</code>).</p> </li> <li> <p><code>network-interface.mac-address</code> - The MAC address of the network interface.</p> </li> <li> <p><code>network-interface.private-dns-name</code> - The private DNS name of the network interface.</p> </li> <li> <p><code>network-interface.source-dest-check</code> - Whether the network interface performs source/destination checking. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the network interface to perform network address translation (NAT) in your VPC.</p> </li> <li> <p><code>network-interface.group-id</code> - The ID of a security group associated with the network interface.</p> </li> <li> <p><code>network-interface.group-name</code> - The name of a security group associated with the network interface.</p> </li> <li> <p><code>network-interface.attachment.attachment-id</code> - The ID of the interface attachment.</p> </li> <li> <p><code>network-interface.attachment.instance-id</code> - The ID of the instance to which the network interface is attached.</p> </li> <li> <p><code>network-interface.attachment.instance-owner-id</code> - The owner ID of the instance to which the network interface is attached.</p> </li> <li> <p><code>network-interface.addresses.private-ip-address</code> - The private IP address associated with the network interface.</p> </li> <li> <p><code>network-interface.attachment.device-index</code> - The device index to which the network interface is attached.</p> </li> <li> <p><code>network-interface.attachment.status</code> - The status of the attachment (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p> </li> <li> <p><code>network-interface.attachment.attach-time</code> - The time that the network interface was attached to an instance.</p> </li> <li> <p><code>network-interface.attachment.delete-on-termination</code> - Specifies whether the attachment is deleted when an instance is terminated.</p> </li> <li> <p><code>network-interface.addresses.primary</code> - Specifies whether the IP address of the network interface is the primary private IP address.</p> </li> <li> <p><code>network-interface.addresses.association.public-ip</code> - The ID of the association of an Elastic IP address with a network interface.</p> </li> <li> <p><code>network-interface.addresses.association.ip-owner-id</code> - The owner ID of the private IP address associated with the network interface.</p> </li> <li> <p><code>association.public-ip</code> - The address of the Elastic IP address bound to the network interface.</p> </li> <li> <p><code>association.ip-owner-id</code> - The owner of the Elastic IP address associated with the network interface.</p> </li> <li> <p><code>association.allocation-id</code> - The allocation ID returned when you allocated the Elastic IP address for your network interface.</p> </li> <li> <p><code>association.association-id</code> - The association ID returned when the network interface was associated with an IP address.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to request the next page of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value. This value can be between 5 and 1000. You cannot specify this parameter and the instance IDs parameter in the same call.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeInstances.</p>\"\
    },\
    \"DescribeInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Reservations\":{\
          \"shape\":\"ReservationList\",\
          \"documentation\":\"<p>Zero or more reservations.</p>\",\
          \"locationName\":\"reservationSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeInstances.</p>\"\
    },\
    \"DescribeInternetGatewaysRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InternetGatewayIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more Internet gateway IDs.</p> <p>Default: Describes all your Internet gateways.</p>\",\
          \"locationName\":\"internetGatewayId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>attachment.state</code> - The current state of the attachment between the gateway and the VPC (<code>available</code>). Present only if a VPC is attached.</p> </li> <li> <p><code>attachment.vpc-id</code> - The ID of an attached VPC.</p> </li> <li> <p><code>internet-gateway-id</code> - The ID of the Internet gateway.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeInternetGateways.</p>\"\
    },\
    \"DescribeInternetGatewaysResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InternetGateways\":{\
          \"shape\":\"InternetGatewayList\",\
          \"documentation\":\"<p>Information about one or more Internet gateways.</p>\",\
          \"locationName\":\"internetGatewaySet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeInternetGateways.</p>\"\
    },\
    \"DescribeKeyPairsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"KeyNames\":{\
          \"shape\":\"KeyNameStringList\",\
          \"documentation\":\"<p>One or more key pair names.</p> <p>Default: Describes all your key pairs.</p>\",\
          \"locationName\":\"KeyName\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>fingerprint</code> - The fingerprint of the key pair.</p> </li> <li> <p><code>key-name</code> - The name of the key pair.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeKeyPairs.</p>\"\
    },\
    \"DescribeKeyPairsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPairs\":{\
          \"shape\":\"KeyPairList\",\
          \"documentation\":\"<p>Information about one or more key pairs.</p>\",\
          \"locationName\":\"keySet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeKeyPairs.</p>\"\
    },\
    \"DescribeMovingAddressesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"PublicIps\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more Elastic IP addresses.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>moving-status</code> - The status of the Elastic IP address (<code>MovingToVpc</code> | <code>RestoringToClassic</code>).</p> </li> </ul>\",\
          \"locationName\":\"filter\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value outside of this range, an error is returned.</p> <p>Default: If no value is provided, the default is 1000.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeMovingAddresses.</p>\"\
    },\
    \"DescribeMovingAddressesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MovingAddressStatuses\":{\
          \"shape\":\"MovingAddressStatusSet\",\
          \"documentation\":\"<p>The status for each Elastic IP address.</p>\",\
          \"locationName\":\"movingAddressStatusSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeMovingAddresses.</p>\"\
    },\
    \"DescribeNatGatewaysRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NatGatewayIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more NAT gateway IDs.</p>\",\
          \"locationName\":\"NatGatewayId\"\
        },\
        \"Filter\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>nat-gateway-id</code> - The ID of the NAT gateway.</p> </li> <li> <p><code>state</code> - The state of the NAT gateway (<code>pending</code> | <code>failed</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p> </li> <li> <p><code>subnet-id</code> - The ID of the subnet in which the NAT gateway resides.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC in which the NAT gateway resides.</p> </li> </ul>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p> <p>Constraint: If the value specified is greater than 1000, we return only 1000 items.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeNatGateways.</p>\"\
    },\
    \"DescribeNatGatewaysResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NatGateways\":{\
          \"shape\":\"NatGatewayList\",\
          \"documentation\":\"<p>Information about the NAT gateways.</p>\",\
          \"locationName\":\"natGatewaySet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeNatGateways.</p>\"\
    },\
    \"DescribeNetworkAclsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkAclIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more network ACL IDs.</p> <p>Default: Describes all your network ACLs.</p>\",\
          \"locationName\":\"NetworkAclId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>association.association-id</code> - The ID of an association ID for the ACL.</p> </li> <li> <p><code>association.network-acl-id</code> - The ID of the network ACL involved in the association.</p> </li> <li> <p><code>association.subnet-id</code> - The ID of the subnet involved in the association.</p> </li> <li> <p><code>default</code> - Indicates whether the ACL is the default network ACL for the VPC.</p> </li> <li> <p><code>entry.cidr</code> - The CIDR range specified in the entry.</p> </li> <li> <p><code>entry.egress</code> - Indicates whether the entry applies to egress traffic.</p> </li> <li> <p><code>entry.icmp.code</code> - The ICMP code specified in the entry, if any.</p> </li> <li> <p><code>entry.icmp.type</code> - The ICMP type specified in the entry, if any.</p> </li> <li> <p><code>entry.port-range.from</code> - The start of the port range specified in the entry. </p> </li> <li> <p><code>entry.port-range.to</code> - The end of the port range specified in the entry. </p> </li> <li> <p><code>entry.protocol</code> - The protocol specified in the entry (<code>tcp</code> | <code>udp</code> | <code>icmp</code> or a protocol number).</p> </li> <li> <p><code>entry.rule-action</code> - Allows or denies the matching traffic (<code>allow</code> | <code>deny</code>).</p> </li> <li> <p><code>entry.rule-number</code> - The number of an entry (in other words, rule) in the ACL's set of entries.</p> </li> <li> <p><code>network-acl-id</code> - The ID of the network ACL.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC for the network ACL.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeNetworkAcls.</p>\"\
    },\
    \"DescribeNetworkAclsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkAcls\":{\
          \"shape\":\"NetworkAclList\",\
          \"documentation\":\"<p>Information about one or more network ACLs.</p>\",\
          \"locationName\":\"networkAclSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeNetworkAcls.</p>\"\
    },\
    \"DescribeNetworkInterfaceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NetworkInterfaceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"Attribute\":{\
          \"shape\":\"NetworkInterfaceAttribute\",\
          \"documentation\":\"<p>The attribute of the network interface.</p>\",\
          \"locationName\":\"attribute\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeNetworkInterfaceAttribute.</p>\"\
    },\
    \"DescribeNetworkInterfaceAttributeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"Description\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The description of the network interface.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether source/destination checking is enabled.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>The security groups associated with the network interface.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"Attachment\":{\
          \"shape\":\"NetworkInterfaceAttachment\",\
          \"documentation\":\"<p>The attachment (if any) of the network interface.</p>\",\
          \"locationName\":\"attachment\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeNetworkInterfaceAttribute.</p>\"\
    },\
    \"DescribeNetworkInterfacesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkInterfaceIds\":{\
          \"shape\":\"NetworkInterfaceIdList\",\
          \"documentation\":\"<p>One or more network interface IDs.</p> <p>Default: Describes all your network interfaces.</p>\",\
          \"locationName\":\"NetworkInterfaceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>addresses.private-ip-address</code> - The private IP addresses associated with the network interface.</p> </li> <li> <p><code>addresses.primary</code> - Whether the private IP address is the primary IP address associated with the network interface. </p> </li> <li> <p><code>addresses.association.public-ip</code> - The association ID returned when the network interface was associated with the Elastic IP address.</p> </li> <li> <p><code>addresses.association.owner-id</code> - The owner ID of the addresses associated with the network interface.</p> </li> <li> <p><code>association.association-id</code> - The association ID returned when the network interface was associated with an IP address.</p> </li> <li> <p><code>association.allocation-id</code> - The allocation ID returned when you allocated the Elastic IP address for your network interface.</p> </li> <li> <p><code>association.ip-owner-id</code> - The owner of the Elastic IP address associated with the network interface.</p> </li> <li> <p><code>association.public-ip</code> - The address of the Elastic IP address bound to the network interface.</p> </li> <li> <p><code>association.public-dns-name</code> - The public DNS name for the network interface.</p> </li> <li> <p><code>attachment.attachment-id</code> - The ID of the interface attachment.</p> </li> <li> <p><code>attachment.attach.time</code> - The time that the network interface was attached to an instance.</p> </li> <li> <p><code>attachment.delete-on-termination</code> - Indicates whether the attachment is deleted when an instance is terminated.</p> </li> <li> <p><code>attachment.device-index</code> - The device index to which the network interface is attached.</p> </li> <li> <p><code>attachment.instance-id</code> - The ID of the instance to which the network interface is attached.</p> </li> <li> <p><code>attachment.instance-owner-id</code> - The owner ID of the instance to which the network interface is attached.</p> </li> <li> <p><code>attachment.nat-gateway-id</code> - The ID of the NAT gateway to which the network interface is attached.</p> </li> <li> <p><code>attachment.status</code> - The status of the attachment (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p> </li> <li> <p><code>availability-zone</code> - The Availability Zone of the network interface.</p> </li> <li> <p><code>description</code> - The description of the network interface.</p> </li> <li> <p><code>group-id</code> - The ID of a security group associated with the network interface.</p> </li> <li> <p><code>group-name</code> - The name of a security group associated with the network interface.</p> </li> <li> <p><code>mac-address</code> - The MAC address of the network interface.</p> </li> <li> <p><code>network-interface-id</code> - The ID of the network interface.</p> </li> <li> <p><code>owner-id</code> - The AWS account ID of the network interface owner.</p> </li> <li> <p><code>private-ip-address</code> - The private IP address or addresses of the network interface.</p> </li> <li> <p><code>private-dns-name</code> - The private DNS name of the network interface.</p> </li> <li> <p><code>requester-id</code> - The ID of the entity that launched the instance on your behalf (for example, AWS Management Console, Auto Scaling, and so on).</p> </li> <li> <p><code>requester-managed</code> - Indicates whether the network interface is being managed by an AWS service (for example, AWS Management Console, Auto Scaling, and so on).</p> </li> <li> <p><code>source-desk-check</code> - Indicates whether the network interface performs source/destination checking. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the network interface to perform network address translation (NAT) in your VPC. </p> </li> <li> <p><code>status</code> - The status of the network interface. If the network interface is not attached to an instance, the status is <code>available</code>; if a network interface is attached to an instance the status is <code>in-use</code>.</p> </li> <li> <p><code>subnet-id</code> - The ID of the subnet for the network interface.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC for the network interface.</p> </li> </ul>\",\
          \"locationName\":\"filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeNetworkInterfaces.</p>\"\
    },\
    \"DescribeNetworkInterfacesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterfaces\":{\
          \"shape\":\"NetworkInterfaceList\",\
          \"documentation\":\"<p>Information about one or more network interfaces.</p>\",\
          \"locationName\":\"networkInterfaceSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeNetworkInterfaces.</p>\"\
    },\
    \"DescribePlacementGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupNames\":{\
          \"shape\":\"PlacementGroupStringList\",\
          \"documentation\":\"<p>One or more placement group names.</p> <p>Default: Describes all your placement groups, or only those otherwise specified.</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>group-name</code> - The name of the placement group.</p> </li> <li> <p><code>state</code> - The state of the placement group (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p> </li> <li> <p><code>strategy</code> - The strategy of the placement group (<code>cluster</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribePlacementGroups.</p>\"\
    },\
    \"DescribePlacementGroupsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PlacementGroups\":{\
          \"shape\":\"PlacementGroupList\",\
          \"documentation\":\"<p>One or more placement groups.</p>\",\
          \"locationName\":\"placementGroupSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribePlacementGroups.</p>\"\
    },\
    \"DescribePrefixListsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"PrefixListIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more prefix list IDs.</p>\",\
          \"locationName\":\"PrefixListId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>prefix-list-id</code>: The ID of a prefix list.</p> </li> <li> <p><code>prefix-list-name</code>: The name of a prefix list.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p> <p>Constraint: If the value specified is greater than 1000, we return only 1000 items.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a prior call.)</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribePrefixLists.</p>\"\
    },\
    \"DescribePrefixListsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrefixLists\":{\
          \"shape\":\"PrefixListSet\",\
          \"documentation\":\"<p>All available prefix lists.</p>\",\
          \"locationName\":\"prefixListSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribePrefixLists.</p>\"\
    },\
    \"DescribeRegionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"RegionNames\":{\
          \"shape\":\"RegionNameStringList\",\
          \"documentation\":\"<p>The names of one or more regions.</p>\",\
          \"locationName\":\"RegionName\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>endpoint</code> - The endpoint of the region (for example, <code>ec2.us-east-1.amazonaws.com</code>).</p> </li> <li> <p><code>region-name</code> - The name of the region (for example, <code>us-east-1</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeRegions.</p>\"\
    },\
    \"DescribeRegionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Regions\":{\
          \"shape\":\"RegionList\",\
          \"documentation\":\"<p>Information about one or more regions.</p>\",\
          \"locationName\":\"regionInfo\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeRegions.</p>\"\
    },\
    \"DescribeReservedInstancesListingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>One or more Reserved Instance IDs.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        },\
        \"ReservedInstancesListingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>One or more Reserved Instance listing IDs.</p>\",\
          \"locationName\":\"reservedInstancesListingId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>reserved-instances-id</code> - The ID of the Reserved Instances.</p> </li> <li> <p><code>reserved-instances-listing-id</code> - The ID of the Reserved Instances listing.</p> </li> <li> <p><code>status</code> - The status of the Reserved Instance listing (<code>pending</code> | <code>active</code> | <code>cancelled</code> | <code>closed</code>).</p> </li> <li> <p><code>status-message</code> - The reason for the status.</p> </li> </ul>\",\
          \"locationName\":\"filters\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeReservedInstancesListings.</p>\"\
    },\
    \"DescribeReservedInstancesListingsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesListings\":{\
          \"shape\":\"ReservedInstancesListingList\",\
          \"documentation\":\"<p>Information about the Reserved Instance listing.</p>\",\
          \"locationName\":\"reservedInstancesListingsSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeReservedInstancesListings.</p>\"\
    },\
    \"DescribeReservedInstancesModificationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesModificationIds\":{\
          \"shape\":\"ReservedInstancesModificationIdStringList\",\
          \"documentation\":\"<p>IDs for the submitted modification request.</p>\",\
          \"locationName\":\"ReservedInstancesModificationId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results. </p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>client-token</code> - The idempotency token for the modification request.</p> </li> <li> <p><code>create-date</code> - The time when the modification request was created.</p> </li> <li> <p><code>effective-date</code> - The time when the modification becomes effective.</p> </li> <li> <p><code>modification-result.reserved-instances-id</code> - The ID for the Reserved Instances created as part of the modification request. This ID is only available when the status of the modification is <code>fulfilled</code>.</p> </li> <li> <p><code>modification-result.target-configuration.availability-zone</code> - The Availability Zone for the new Reserved Instances.</p> </li> <li> <p><code>modification-result.target-configuration.instance-count </code> - The number of new Reserved Instances.</p> </li> <li> <p><code>modification-result.target-configuration.instance-type</code> - The instance type of the new Reserved Instances.</p> </li> <li> <p><code>modification-result.target-configuration.platform</code> - The network platform of the new Reserved Instances (<code>EC2-Classic</code> | <code>EC2-VPC</code>).</p> </li> <li> <p><code>reserved-instances-id</code> - The ID of the Reserved Instances modified.</p> </li> <li> <p><code>reserved-instances-modification-id</code> - The ID of the modification request.</p> </li> <li> <p><code>status</code> - The status of the Reserved Instances modification request (<code>processing</code> | <code>fulfilled</code> | <code>failed</code>).</p> </li> <li> <p><code>status-message</code> - The reason for the status.</p> </li> <li> <p><code>update-date</code> - The time when the modification request was last updated.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeReservedInstancesModifications.</p>\"\
    },\
    \"DescribeReservedInstancesModificationsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesModifications\":{\
          \"shape\":\"ReservedInstancesModificationList\",\
          \"documentation\":\"<p>The Reserved Instance modification information.</p>\",\
          \"locationName\":\"reservedInstancesModificationsSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeReservedInstancesModifications.</p>\"\
    },\
    \"DescribeReservedInstancesOfferingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ReservedInstancesOfferingIds\":{\
          \"shape\":\"ReservedInstancesOfferingIdStringList\",\
          \"documentation\":\"<p>One or more Reserved Instances offering IDs.</p>\",\
          \"locationName\":\"ReservedInstancesOfferingId\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type that the reservation will cover (for example, <code>m1.small</code>). For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone in which the Reserved Instance can be used.</p>\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"RIProductDescription\",\
          \"documentation\":\"<p>The Reserved Instance product platform description. Instances that include <code>(Amazon VPC)</code> in the description are for use with Amazon VPC.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone</code> - The Availability Zone where the Reserved Instance can be used.</p> </li> <li> <p><code>duration</code> - The duration of the Reserved Instance (for example, one year or three years), in seconds (<code>31536000</code> | <code>94608000</code>).</p> </li> <li> <p><code>fixed-price</code> - The purchase price of the Reserved Instance (for example, 9800.0).</p> </li> <li> <p><code>instance-type</code> - The instance type that is covered by the reservation.</p> </li> <li> <p><code>marketplace</code> - Set to <code>true</code> to show only Reserved Instance Marketplace offerings. When this filter is not used, which is the default behavior, all offerings from both AWS and the Reserved Instance Marketplace are listed.</p> </li> <li> <p><code>product-description</code> - The Reserved Instance product platform description. Instances that include <code>(Amazon VPC)</code> in the product platform description will only be displayed to EC2-Classic account holders and are for use with Amazon VPC. (<code>Linux/UNIX</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Red Hat Enterprise Linux</code> | <code>Red Hat Enterprise Linux (Amazon VPC)</code> | <code>Windows</code> | <code>Windows (Amazon VPC)</code> | <code>Windows with SQL Server Standard</code> | <code>Windows with SQL Server Standard (Amazon VPC)</code> | <code>Windows with SQL Server Web</code> | <code> Windows with SQL Server Web (Amazon VPC)</code> | <code>Windows with SQL Server Enterprise</code> | <code>Windows with SQL Server Enterprise (Amazon VPC)</code>) </p> </li> <li> <p><code>reserved-instances-offering-id</code> - The Reserved Instances offering ID.</p> </li> <li> <p><code>usage-price</code> - The usage price of the Reserved Instance, per hour (for example, 0.84).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"InstanceTenancy\":{\
          \"shape\":\"Tenancy\",\
          \"documentation\":\"<p>The tenancy of the instances covered by the reservation. A Reserved Instance with a tenancy of <code>dedicated</code> is applied to instances that run in a VPC on single-tenant hardware (i.e., Dedicated Instances).</p> <p>Default: <code>default</code></p>\",\
          \"locationName\":\"instanceTenancy\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"OfferingTypeValues\",\
          \"documentation\":\"<p>The Reserved Instance offering type. If you are using tools that predate the 2011-11-01 API version, you only have access to the <code>Medium Utilization</code> Reserved Instance offering type. </p>\",\
          \"locationName\":\"offeringType\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results. </p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. The maximum is 100.</p> <p>Default: 100</p>\",\
          \"locationName\":\"maxResults\"\
        },\
        \"IncludeMarketplace\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Include Reserved Instance Marketplace offerings in the response.</p>\"\
        },\
        \"MinDuration\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The minimum duration (in seconds) to filter when searching for offerings.</p> <p>Default: 2592000 (1 month)</p>\"\
        },\
        \"MaxDuration\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The maximum duration (in seconds) to filter when searching for offerings.</p> <p>Default: 94608000 (3 years)</p>\"\
        },\
        \"MaxInstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of instances to filter when searching for offerings.</p> <p>Default: 20</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeReservedInstancesOfferings.</p>\"\
    },\
    \"DescribeReservedInstancesOfferingsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesOfferings\":{\
          \"shape\":\"ReservedInstancesOfferingList\",\
          \"documentation\":\"<p>A list of Reserved Instances offerings.</p>\",\
          \"locationName\":\"reservedInstancesOfferingsSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeReservedInstancesOfferings.</p>\"\
    },\
    \"DescribeReservedInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ReservedInstancesIds\":{\
          \"shape\":\"ReservedInstancesIdStringList\",\
          \"documentation\":\"<p>One or more Reserved Instance IDs.</p> <p>Default: Describes all your Reserved Instances, or only those otherwise specified.</p>\",\
          \"locationName\":\"ReservedInstancesId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone</code> - The Availability Zone where the Reserved Instance can be used.</p> </li> <li> <p><code>duration</code> - The duration of the Reserved Instance (one year or three years), in seconds (<code>31536000</code> | <code>94608000</code>).</p> </li> <li> <p><code>end</code> - The time when the Reserved Instance expires (for example, 2015-08-07T11:54:42.000Z).</p> </li> <li> <p><code>fixed-price</code> - The purchase price of the Reserved Instance (for example, 9800.0).</p> </li> <li> <p><code>instance-type</code> - The instance type that is covered by the reservation.</p> </li> <li> <p><code>product-description</code> - The Reserved Instance product platform description. Instances that include <code>(Amazon VPC)</code> in the product platform description will only be displayed to EC2-Classic account holders and are for use with Amazon VPC (<code>Linux/UNIX</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Red Hat Enterprise Linux</code> | <code>Red Hat Enterprise Linux (Amazon VPC)</code> | <code>Windows</code> | <code>Windows (Amazon VPC)</code> | <code>Windows with SQL Server Standard</code> | <code>Windows with SQL Server Standard (Amazon VPC)</code> | <code>Windows with SQL Server Web</code> | <code>Windows with SQL Server Web (Amazon VPC)</code> | <code>Windows with SQL Server Enterprise</code> | <code>Windows with SQL Server Enterprise (Amazon VPC)</code>).</p> </li> <li> <p><code>reserved-instances-id</code> - The ID of the Reserved Instance.</p> </li> <li> <p><code>start</code> - The time at which the Reserved Instance purchase request was placed (for example, 2014-08-07T11:54:42.000Z).</p> </li> <li> <p><code>state</code> - The state of the Reserved Instance (<code>payment-pending</code> | <code>active</code> | <code>payment-failed</code> | <code>retired</code>).</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>usage-price</code> - The usage price of the Reserved Instance, per hour (for example, 0.84).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"OfferingTypeValues\",\
          \"documentation\":\"<p>The Reserved Instance offering type. If you are using tools that predate the 2011-11-01 API version, you only have access to the <code>Medium Utilization</code> Reserved Instance offering type. </p>\",\
          \"locationName\":\"offeringType\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeReservedInstances.</p>\"\
    },\
    \"DescribeReservedInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstances\":{\
          \"shape\":\"ReservedInstancesList\",\
          \"documentation\":\"<p>A list of Reserved Instances.</p>\",\
          \"locationName\":\"reservedInstancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for DescribeReservedInstances.</p>\"\
    },\
    \"DescribeRouteTablesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"RouteTableIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more route table IDs.</p> <p>Default: Describes all your route tables.</p>\",\
          \"locationName\":\"RouteTableId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>association.route-table-association-id</code> - The ID of an association ID for the route table.</p> </li> <li> <p><code>association.route-table-id</code> - The ID of the route table involved in the association.</p> </li> <li> <p><code>association.subnet-id</code> - The ID of the subnet involved in the association.</p> </li> <li> <p><code>association.main</code> - Indicates whether the route table is the main route table for the VPC (<code>true</code> | <code>false</code>).</p> </li> <li> <p><code>route-table-id</code> - The ID of the route table.</p> </li> <li> <p><code>route.destination-cidr-block</code> - The CIDR range specified in a route in the table.</p> </li> <li> <p><code>route.destination-prefix-list-id</code> - The ID (prefix) of the AWS service specified in a route in the table.</p> </li> <li> <p><code>route.gateway-id</code> - The ID of a gateway specified in a route in the table.</p> </li> <li> <p><code>route.instance-id</code> - The ID of an instance specified in a route in the table.</p> </li> <li> <p><code>route.nat-gateway-id</code> - The ID of a NAT gateway.</p> </li> <li> <p><code>route.origin</code> - Describes how the route was created. <code>CreateRouteTable</code> indicates that the route was automatically created when the route table was created; <code>CreateRoute</code> indicates that the route was manually added to the route table; <code>EnableVgwRoutePropagation</code> indicates that the route was propagated by route propagation.</p> </li> <li> <p><code>route.state</code> - The state of a route in the route table (<code>active</code> | <code>blackhole</code>). The blackhole state indicates that the route's target isn't available (for example, the specified gateway isn't attached to the VPC, the specified NAT instance has been terminated, and so on).</p> </li> <li> <p><code>route.vpc-peering-connection-id</code> - The ID of a VPC peering connection specified in a route in the table.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC for the route table.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeRouteTables.</p>\"\
    },\
    \"DescribeRouteTablesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RouteTables\":{\
          \"shape\":\"RouteTableList\",\
          \"documentation\":\"<p>Information about one or more route tables. </p>\",\
          \"locationName\":\"routeTableSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeRouteTables.</p>\"\
    },\
    \"DescribeScheduledInstanceAvailabilityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Recurrence\",\
        \"FirstSlotStartTimeRange\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"Recurrence\":{\
          \"shape\":\"ScheduledInstanceRecurrenceRequest\",\
          \"documentation\":\"<p>The schedule recurrence.</p>\"\
        },\
        \"FirstSlotStartTimeRange\":{\
          \"shape\":\"SlotDateTimeRangeRequest\",\
          \"documentation\":\"<p>The time period for the first schedule to start.</p>\"\
        },\
        \"MinSlotDurationInHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The minimum available duration, in hours. The minimum required duration is 1,200 hours per year. For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and the minimum monthly schedule is 100 hours.</p>\"\
        },\
        \"MaxSlotDurationInHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum available duration, in hours. This value must be greater than <code>MinSlotDurationInHours</code> and less than 1,720.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. This value can be between 5 and 300. The default value is 300. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone</code> - The Availability Zone (for example, <code>us-west-2a</code>).</p> </li> <li> <p><code>instance-type</code> - The instance type (for example, <code>c4.large</code>).</p> </li> <li> <p><code>network-platform</code> - The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p> </li> <li> <p><code>platform</code> - The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeScheduledInstanceAvailability.</p>\"\
    },\
    \"DescribeScheduledInstanceAvailabilityResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"ScheduledInstanceAvailabilitySet\":{\
          \"shape\":\"ScheduledInstanceAvailabilitySet\",\
          \"documentation\":\"<p>Information about the available Scheduled Instances.</p>\",\
          \"locationName\":\"scheduledInstanceAvailabilitySet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeScheduledInstanceAvailability.</p>\"\
    },\
    \"DescribeScheduledInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"ScheduledInstanceIds\":{\
          \"shape\":\"ScheduledInstanceIdRequestSet\",\
          \"documentation\":\"<p>One or more Scheduled Instance IDs.</p>\",\
          \"locationName\":\"ScheduledInstanceId\"\
        },\
        \"SlotStartTimeRange\":{\
          \"shape\":\"SlotStartTimeRangeRequest\",\
          \"documentation\":\"<p>The time period for the first schedule to start.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. This value can be between 5 and 300. The default value is 100. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone</code> - The Availability Zone (for example, <code>us-west-2a</code>).</p> </li> <li> <p><code>instance-type</code> - The instance type (for example, <code>c4.large</code>).</p> </li> <li> <p><code>network-platform</code> - The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p> </li> <li> <p><code>platform</code> - The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeScheduledInstances.</p>\"\
    },\
    \"DescribeScheduledInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"ScheduledInstanceSet\":{\
          \"shape\":\"ScheduledInstanceSet\",\
          \"documentation\":\"<p>Information about the Scheduled Instances.</p>\",\
          \"locationName\":\"scheduledInstanceSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeScheduledInstances.</p>\"\
    },\
    \"DescribeSecurityGroupReferencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"GroupId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the operation, without actually making the request, and provides an error response. If you have the required permissions, the error response is DryRunOperation. Otherwise, it is UnauthorizedOperation.</p>\"\
        },\
        \"GroupId\":{\
          \"shape\":\"GroupIds\",\
          \"documentation\":\"<p>One or more security group IDs in your account.</p>\"\
        }\
      }\
    },\
    \"DescribeSecurityGroupReferencesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityGroupReferenceSet\":{\
          \"shape\":\"SecurityGroupReferences\",\
          \"documentation\":\"<p>Information about the VPCs with the referencing security groups.</p>\",\
          \"locationName\":\"securityGroupReferenceSet\"\
        }\
      }\
    },\
    \"DescribeSecurityGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupNames\":{\
          \"shape\":\"GroupNameStringList\",\
          \"documentation\":\"<p>[EC2-Classic and default VPC only] One or more security group names. You can specify either the security group name or the security group ID. For security groups in a nondefault VPC, use the <code>group-name</code> filter to describe security groups by name.</p> <p>Default: Describes all your security groups.</p>\",\
          \"locationName\":\"GroupName\"\
        },\
        \"GroupIds\":{\
          \"shape\":\"GroupIdStringList\",\
          \"documentation\":\"<p>One or more security group IDs. Required for security groups in a nondefault VPC.</p> <p>Default: Describes all your security groups.</p>\",\
          \"locationName\":\"GroupId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters. If using multiple filters for rules, the results include security groups for which any combination of rules - not necessarily a single rule - match all filters.</p> <ul> <li> <p><code>description</code> - The description of the security group.</p> </li> <li> <p><code>egress.ip-permission.prefix-list-id</code> - The ID (prefix) of the AWS service to which the security group allows access.</p> </li> <li> <p><code>group-id</code> - The ID of the security group. </p> </li> <li> <p><code>group-name</code> - The name of the security group.</p> </li> <li> <p><code>ip-permission.cidr</code> - A CIDR range that has been granted permission.</p> </li> <li> <p><code>ip-permission.from-port</code> - The start of port range for the TCP and UDP protocols, or an ICMP type number.</p> </li> <li> <p><code>ip-permission.group-id</code> - The ID of a security group that has been granted permission.</p> </li> <li> <p><code>ip-permission.group-name</code> - The name of a security group that has been granted permission.</p> </li> <li> <p><code>ip-permission.protocol</code> - The IP protocol for the permission (<code>tcp</code> | <code>udp</code> | <code>icmp</code> or a protocol number).</p> </li> <li> <p><code>ip-permission.to-port</code> - The end of port range for the TCP and UDP protocols, or an ICMP code.</p> </li> <li> <p><code>ip-permission.user-id</code> - The ID of an AWS account that has been granted permission.</p> </li> <li> <p><code>owner-id</code> - The AWS account ID of the owner of the security group.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the security group.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the security group.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC specified when the security group was created.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSecurityGroups.</p>\"\
    },\
    \"DescribeSecurityGroupsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroupList\",\
          \"documentation\":\"<p>Information about one or more security groups.</p>\",\
          \"locationName\":\"securityGroupInfo\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSecurityGroups.</p>\"\
    },\
    \"DescribeSnapshotAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SnapshotId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS snapshot.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"SnapshotAttributeName\",\
          \"documentation\":\"<p>The snapshot attribute you would like to view.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSnapshotAttribute.</p>\"\
    },\
    \"DescribeSnapshotAttributeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS snapshot.</p>\",\
          \"locationName\":\"snapshotId\"\
        },\
        \"CreateVolumePermissions\":{\
          \"shape\":\"CreateVolumePermissionList\",\
          \"documentation\":\"<p>A list of permissions for creating volumes from the snapshot.</p>\",\
          \"locationName\":\"createVolumePermission\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeList\",\
          \"documentation\":\"<p>A list of product codes.</p>\",\
          \"locationName\":\"productCodes\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSnapshotAttribute.</p>\"\
    },\
    \"DescribeSnapshotsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SnapshotIds\":{\
          \"shape\":\"SnapshotIdStringList\",\
          \"documentation\":\"<p>One or more snapshot IDs.</p> <p>Default: Describes snapshots for which you have launch permissions.</p>\",\
          \"locationName\":\"SnapshotId\"\
        },\
        \"OwnerIds\":{\
          \"shape\":\"OwnerStringList\",\
          \"documentation\":\"<p>Returns the snapshots owned by the specified owner. Multiple owners can be specified.</p>\",\
          \"locationName\":\"Owner\"\
        },\
        \"RestorableByUserIds\":{\
          \"shape\":\"RestorableByStringList\",\
          \"documentation\":\"<p>One or more AWS accounts IDs that can create volumes from the snapshot.</p>\",\
          \"locationName\":\"RestorableBy\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>description</code> - A description of the snapshot.</p> </li> <li> <p><code>owner-alias</code> - The AWS account alias (for example, <code>amazon</code>) that owns the snapshot.</p> </li> <li> <p><code>owner-id</code> - The ID of the AWS account that owns the snapshot.</p> </li> <li> <p><code>progress</code> - The progress of the snapshot, as a percentage (for example, 80%).</p> </li> <li> <p><code>snapshot-id</code> - The snapshot ID.</p> </li> <li> <p><code>start-time</code> - The time stamp when the snapshot was initiated.</p> </li> <li> <p><code>status</code> - The status of the snapshot (<code>pending</code> | <code>completed</code> | <code>error</code>).</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>volume-id</code> - The ID of the volume the snapshot is for.</p> </li> <li> <p><code>volume-size</code> - The size of the volume, in GiB.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <code>NextToken</code> value returned from a previous paginated <code>DescribeSnapshots</code> request where <code>MaxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>NextToken</code> value. This value is <code>null</code> when there are no more results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of snapshot results returned by <code>DescribeSnapshots</code> in paginated output. When this parameter is used, <code>DescribeSnapshots</code> only returns <code>MaxResults</code> results in a single page along with a <code>NextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeSnapshots</code> request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. If this parameter is not used, then <code>DescribeSnapshots</code> returns all results. You cannot specify this parameter and the snapshot IDs parameter in the same request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSnapshots.</p>\"\
    },\
    \"DescribeSnapshotsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Snapshots\":{\
          \"shape\":\"SnapshotList\",\
          \"documentation\":\"<p>Information about the snapshots.</p>\",\
          \"locationName\":\"snapshotSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <code>NextToken</code> value to include in a future <code>DescribeSnapshots</code> request. When the results of a <code>DescribeSnapshots</code> request exceed <code>MaxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSnapshots.</p>\"\
    },\
    \"DescribeSpotDatafeedSubscriptionRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSpotDatafeedSubscription.</p>\"\
    },\
    \"DescribeSpotDatafeedSubscriptionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotDatafeedSubscription\":{\
          \"shape\":\"SpotDatafeedSubscription\",\
          \"documentation\":\"<p>The Spot instance data feed subscription.</p>\",\
          \"locationName\":\"spotDatafeedSubscription\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSpotDatafeedSubscription.</p>\"\
    },\
    \"DescribeSpotFleetInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotFleetRequestId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSpotFleetInstances.</p>\"\
    },\
    \"DescribeSpotFleetInstancesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestId\",\
        \"ActiveInstances\"\
      ],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"ActiveInstances\":{\
          \"shape\":\"ActiveInstanceSet\",\
          \"documentation\":\"<p>The running instances. Note that this list is refreshed periodically and might be out of date.</p>\",\
          \"locationName\":\"activeInstanceSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSpotFleetInstances.</p>\"\
    },\
    \"DescribeSpotFleetRequestHistoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestId\",\
        \"StartTime\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"EventType\":{\
          \"shape\":\"EventType\",\
          \"documentation\":\"<p>The type of events to describe. By default, all events are described.</p>\",\
          \"locationName\":\"eventType\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The starting date and time for the events, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"startTime\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSpotFleetRequestHistory.</p>\"\
    },\
    \"DescribeSpotFleetRequestHistoryResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestId\",\
        \"StartTime\",\
        \"LastEvaluatedTime\",\
        \"HistoryRecords\"\
      ],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The starting date and time for the events, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"startTime\"\
        },\
        \"LastEvaluatedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The last date and time for the events, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). All records up to this time were retrieved.</p> <p>If <code>nextToken</code> indicates that there are more results, this value is not present.</p>\",\
          \"locationName\":\"lastEvaluatedTime\"\
        },\
        \"HistoryRecords\":{\
          \"shape\":\"HistoryRecords\",\
          \"documentation\":\"<p>Information about the events in the history of the Spot fleet request.</p>\",\
          \"locationName\":\"historyRecordSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSpotFleetRequestHistory.</p>\"\
    },\
    \"DescribeSpotFleetRequestsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotFleetRequestIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>The IDs of the Spot fleet requests.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSpotFleetRequests.</p>\"\
    },\
    \"DescribeSpotFleetRequestsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotFleetRequestConfigs\"],\
      \"members\":{\
        \"SpotFleetRequestConfigs\":{\
          \"shape\":\"SpotFleetRequestConfigSet\",\
          \"documentation\":\"<p>Information about the configuration of your Spot fleet.</p>\",\
          \"locationName\":\"spotFleetRequestConfigSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSpotFleetRequests.</p>\"\
    },\
    \"DescribeSpotInstanceRequestsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotInstanceRequestIds\":{\
          \"shape\":\"SpotInstanceRequestIdList\",\
          \"documentation\":\"<p>One or more Spot instance request IDs.</p>\",\
          \"locationName\":\"SpotInstanceRequestId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone-group</code> - The Availability Zone group.</p> </li> <li> <p><code>create-time</code> - The time stamp when the Spot instance request was created.</p> </li> <li> <p><code>fault-code</code> - The fault code related to the request.</p> </li> <li> <p><code>fault-message</code> - The fault message related to the request.</p> </li> <li> <p><code>instance-id</code> - The ID of the instance that fulfilled the request.</p> </li> <li> <p><code>launch-group</code> - The Spot instance launch group.</p> </li> <li> <p><code>launch.block-device-mapping.delete-on-termination</code> - Indicates whether the Amazon EBS volume is deleted on instance termination.</p> </li> <li> <p><code>launch.block-device-mapping.device-name</code> - The device name for the Amazon EBS volume (for example, <code>/dev/sdh</code>).</p> </li> <li> <p><code>launch.block-device-mapping.snapshot-id</code> - The ID of the snapshot used for the Amazon EBS volume.</p> </li> <li> <p><code>launch.block-device-mapping.volume-size</code> - The size of the Amazon EBS volume, in GiB.</p> </li> <li> <p><code>launch.block-device-mapping.volume-type</code> - The type of the Amazon EBS volume: <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code>for Cold HDD, or <code>standard</code> for Magnetic.</p> </li> <li> <p><code>launch.group-id</code> - The security group for the instance.</p> </li> <li> <p><code>launch.image-id</code> - The ID of the AMI.</p> </li> <li> <p><code>launch.instance-type</code> - The type of instance (for example, <code>m3.medium</code>).</p> </li> <li> <p><code>launch.kernel-id</code> - The kernel ID.</p> </li> <li> <p><code>launch.key-name</code> - The name of the key pair the instance launched with.</p> </li> <li> <p><code>launch.monitoring-enabled</code> - Whether monitoring is enabled for the Spot instance.</p> </li> <li> <p><code>launch.ramdisk-id</code> - The RAM disk ID.</p> </li> <li> <p><code>network-interface.network-interface-id</code> - The ID of the network interface.</p> </li> <li> <p><code>network-interface.device-index</code> - The index of the device for the network interface attachment on the instance.</p> </li> <li> <p><code>network-interface.subnet-id</code> - The ID of the subnet for the instance.</p> </li> <li> <p><code>network-interface.description</code> - A description of the network interface.</p> </li> <li> <p><code>network-interface.private-ip-address</code> - The primary private IP address of the network interface.</p> </li> <li> <p><code>network-interface.delete-on-termination</code> - Indicates whether the network interface is deleted when the instance is terminated.</p> </li> <li> <p><code>network-interface.group-id</code> - The ID of the security group associated with the network interface.</p> </li> <li> <p><code>network-interface.group-name</code> - The name of the security group associated with the network interface.</p> </li> <li> <p><code>network-interface.addresses.primary</code> - Indicates whether the IP address is the primary private IP address.</p> </li> <li> <p><code>product-description</code> - The product description associated with the instance (<code>Linux/UNIX</code> | <code>Windows</code>).</p> </li> <li> <p><code>spot-instance-request-id</code> - The Spot instance request ID.</p> </li> <li> <p><code>spot-price</code> - The maximum hourly price for any Spot instance launched to fulfill the request.</p> </li> <li> <p><code>state</code> - The state of the Spot instance request (<code>open</code> | <code>active</code> | <code>closed</code> | <code>cancelled</code> | <code>failed</code>). Spot bid status information can help you track your Amazon EC2 Spot instance requests. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-bid-status.html\\\">Spot Bid Status</a> in the Amazon Elastic Compute Cloud User Guide.</p> </li> <li> <p><code>status-code</code> - The short code describing the most recent evaluation of your Spot instance request.</p> </li> <li> <p><code>status-message</code> - The message explaining the status of the Spot instance request.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>type</code> - The type of Spot instance request (<code>one-time</code> | <code>persistent</code>).</p> </li> <li> <p><code>launched-availability-zone</code> - The Availability Zone in which the bid is launched.</p> </li> <li> <p><code>valid-from</code> - The start date of the request.</p> </li> <li> <p><code>valid-until</code> - The end date of the request.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSpotInstanceRequests.</p>\"\
    },\
    \"DescribeSpotInstanceRequestsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotInstanceRequests\":{\
          \"shape\":\"SpotInstanceRequestList\",\
          \"documentation\":\"<p>One or more Spot instance requests.</p>\",\
          \"locationName\":\"spotInstanceRequestSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSpotInstanceRequests.</p>\"\
    },\
    \"DescribeSpotPriceHistoryRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time, up to the past 90 days, from which to start retrieving the price history data, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"startTime\"\
        },\
        \"EndTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time, up to the current date, from which to stop retrieving the price history data, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"endTime\"\
        },\
        \"InstanceTypes\":{\
          \"shape\":\"InstanceTypeList\",\
          \"documentation\":\"<p>Filters the results by the specified instance types.</p>\",\
          \"locationName\":\"InstanceType\"\
        },\
        \"ProductDescriptions\":{\
          \"shape\":\"ProductDescriptionList\",\
          \"documentation\":\"<p>Filters the results by the specified basic product descriptions.</p>\",\
          \"locationName\":\"ProductDescription\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availability-zone</code> - The Availability Zone for which prices should be returned.</p> </li> <li> <p><code>instance-type</code> - The type of instance (for example, <code>m3.medium</code>).</p> </li> <li> <p><code>product-description</code> - The product description for the Spot price (<code>Linux/UNIX</code> | <code>SUSE Linux</code> | <code>Windows</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Windows (Amazon VPC)</code>).</p> </li> <li> <p><code>spot-price</code> - The Spot price. The value must match exactly (or use wildcards; greater than or less than comparison is not supported).</p> </li> <li> <p><code>timestamp</code> - The timestamp of the Spot price history, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). You can use wildcards (* and ?). Greater than or less than comparison is not supported.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Filters the results by the specified Availability Zone.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of results.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSpotPriceHistory.</p>\"\
    },\
    \"DescribeSpotPriceHistoryResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotPriceHistory\":{\
          \"shape\":\"SpotPriceHistoryList\",\
          \"documentation\":\"<p>The historical Spot prices.</p>\",\
          \"locationName\":\"spotPriceHistorySet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSpotPriceHistory.</p>\"\
    },\
    \"DescribeStaleSecurityGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the operation, without actually making the request, and provides an error response. If you have the required permissions, the error response is DryRunOperation. Otherwise, it is UnauthorizedOperation.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a prior call.)</p>\"\
        }\
      }\
    },\
    \"DescribeStaleSecurityGroupsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StaleSecurityGroupSet\":{\
          \"shape\":\"StaleSecurityGroupSet\",\
          \"documentation\":\"<p>Information about the stale security groups.</p>\",\
          \"locationName\":\"staleSecurityGroupSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"DescribeSubnetsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIdStringList\",\
          \"documentation\":\"<p>One or more subnet IDs.</p> <p>Default: Describes all your subnets.</p>\",\
          \"locationName\":\"SubnetId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>availabilityZone</code> - The Availability Zone for the subnet. You can also use <code>availability-zone</code> as the filter name.</p> </li> <li> <p><code>available-ip-address-count</code> - The number of IP addresses in the subnet that are available.</p> </li> <li> <p><code>cidrBlock</code> - The CIDR block of the subnet. The CIDR block you specify must exactly match the subnet's CIDR block for information to be returned for the subnet. You can also use <code>cidr</code> or <code>cidr-block</code> as the filter names.</p> </li> <li> <p><code>defaultForAz</code> - Indicates whether this is the default subnet for the Availability Zone. You can also use <code>default-for-az</code> as the filter name.</p> </li> <li> <p><code>state</code> - The state of the subnet (<code>pending</code> | <code>available</code>).</p> </li> <li> <p><code>subnet-id</code> - The ID of the subnet.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC for the subnet.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeSubnets.</p>\"\
    },\
    \"DescribeSubnetsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Subnets\":{\
          \"shape\":\"SubnetList\",\
          \"documentation\":\"<p>Information about one or more subnets.</p>\",\
          \"locationName\":\"subnetSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeSubnets.</p>\"\
    },\
    \"DescribeTagsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>key</code> - The tag key.</p> </li> <li> <p><code>resource-id</code> - The resource ID.</p> </li> <li> <p><code>resource-type</code> - The resource type (<code>customer-gateway</code> | <code>dhcp-options</code> | <code>image</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-interface</code> | <code>reserved-instances</code> | <code>route-table</code> | <code>security-group</code> | <code>snapshot</code> | <code>spot-instances-request</code> | <code>subnet</code> | <code>volume</code> | <code>vpc</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>).</p> </li> <li> <p><code>value</code> - The tag value.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of results to return in a single call. This value can be between 5 and 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to retrieve the next page of results.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeTags.</p>\"\
    },\
    \"DescribeTagsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagDescriptionList\",\
          \"documentation\":\"<p>A list of tags.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return..</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeTags.</p>\"\
    },\
    \"DescribeVolumeAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"VolumeAttributeName\",\
          \"documentation\":\"<p>The instance attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVolumeAttribute.</p>\"\
    },\
    \"DescribeVolumeAttributeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"AutoEnableIO\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>The state of <code>autoEnableIO</code> attribute.</p>\",\
          \"locationName\":\"autoEnableIO\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeList\",\
          \"documentation\":\"<p>A list of product codes.</p>\",\
          \"locationName\":\"productCodes\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVolumeAttribute.</p>\"\
    },\
    \"DescribeVolumeStatusRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeIds\":{\
          \"shape\":\"VolumeIdStringList\",\
          \"documentation\":\"<p>One or more volume IDs.</p> <p>Default: Describes all your volumes.</p>\",\
          \"locationName\":\"VolumeId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>action.code</code> - The action code for the event (for example, <code>enable-volume-io</code>).</p> </li> <li> <p><code>action.description</code> - A description of the action.</p> </li> <li> <p><code>action.event-id</code> - The event ID associated with the action.</p> </li> <li> <p><code>availability-zone</code> - The Availability Zone of the instance.</p> </li> <li> <p><code>event.description</code> - A description of the event.</p> </li> <li> <p><code>event.event-id</code> - The event ID.</p> </li> <li> <p><code>event.event-type</code> - The event type (for <code>io-enabled</code>: <code>passed</code> | <code>failed</code>; for <code>io-performance</code>: <code>io-performance:degraded</code> | <code>io-performance:severely-degraded</code> | <code>io-performance:stalled</code>).</p> </li> <li> <p><code>event.not-after</code> - The latest end time for the event.</p> </li> <li> <p><code>event.not-before</code> - The earliest start time for the event.</p> </li> <li> <p><code>volume-status.details-name</code> - The cause for <code>volume-status.status</code> (<code>io-enabled</code> | <code>io-performance</code>).</p> </li> <li> <p><code>volume-status.details-status</code> - The status of <code>volume-status.details-name</code> (for <code>io-enabled</code>: <code>passed</code> | <code>failed</code>; for <code>io-performance</code>: <code>normal</code> | <code>degraded</code> | <code>severely-degraded</code> | <code>stalled</code>).</p> </li> <li> <p><code>volume-status.status</code> - The status of the volume (<code>ok</code> | <code>impaired</code> | <code>warning</code> | <code>insufficient-data</code>).</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <code>NextToken</code> value to include in a future <code>DescribeVolumeStatus</code> request. When the results of the request exceed <code>MaxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of volume results returned by <code>DescribeVolumeStatus</code> in paginated output. When this parameter is used, the request only returns <code>MaxResults</code> results in a single page along with a <code>NextToken</code> response element. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. If this parameter is not used, then <code>DescribeVolumeStatus</code> returns all results. You cannot specify this parameter and the volume IDs parameter in the same request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVolumeStatus.</p>\"\
    },\
    \"DescribeVolumeStatusResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeStatuses\":{\
          \"shape\":\"VolumeStatusList\",\
          \"documentation\":\"<p>A list of volumes.</p>\",\
          \"locationName\":\"volumeStatusSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVolumeStatus.</p>\"\
    },\
    \"DescribeVolumesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeIds\":{\
          \"shape\":\"VolumeIdStringList\",\
          \"documentation\":\"<p>One or more volume IDs.</p>\",\
          \"locationName\":\"VolumeId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>attachment.attach-time</code> - The time stamp when the attachment initiated.</p> </li> <li> <p><code>attachment.delete-on-termination</code> - Whether the volume is deleted on instance termination.</p> </li> <li> <p><code>attachment.device</code> - The device name that is exposed to the instance (for example, <code>/dev/sda1</code>).</p> </li> <li> <p><code>attachment.instance-id</code> - The ID of the instance the volume is attached to.</p> </li> <li> <p><code>attachment.status</code> - The attachment state (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p> </li> <li> <p><code>availability-zone</code> - The Availability Zone in which the volume was created.</p> </li> <li> <p><code>create-time</code> - The time stamp when the volume was created.</p> </li> <li> <p><code>encrypted</code> - The encryption status of the volume.</p> </li> <li> <p><code>size</code> - The size of the volume, in GiB.</p> </li> <li> <p><code>snapshot-id</code> - The snapshot from which the volume was created.</p> </li> <li> <p><code>status</code> - The status of the volume (<code>creating</code> | <code>available</code> | <code>in-use</code> | <code>deleting</code> | <code>deleted</code> | <code>error</code>).</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>volume-id</code> - The volume ID.</p> </li> <li> <p><code>volume-type</code> - The Amazon EBS volume type. This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for Magnetic volumes.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <code>NextToken</code> value returned from a previous paginated <code>DescribeVolumes</code> request where <code>MaxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>NextToken</code> value. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of volume results returned by <code>DescribeVolumes</code> in paginated output. When this parameter is used, <code>DescribeVolumes</code> only returns <code>MaxResults</code> results in a single page along with a <code>NextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeVolumes</code> request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. If this parameter is not used, then <code>DescribeVolumes</code> returns all results. You cannot specify this parameter and the volume IDs parameter in the same request.</p>\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVolumes.</p>\"\
    },\
    \"DescribeVolumesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Volumes\":{\
          \"shape\":\"VolumeList\",\
          \"documentation\":\"<p>Information about the volumes.</p>\",\
          \"locationName\":\"volumeSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The <code>NextToken</code> value to include in a future <code>DescribeVolumes</code> request. When the results of a <code>DescribeVolumes</code> request exceed <code>MaxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVolumes.</p>\"\
    },\
    \"DescribeVpcAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpcId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"VpcAttributeName\",\
          \"documentation\":\"<p>The VPC attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcAttribute.</p>\"\
    },\
    \"DescribeVpcAttributeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"EnableDnsSupport\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether DNS resolution is enabled for the VPC. If this attribute is <code>true</code>, the Amazon DNS server resolves DNS hostnames for your instances to their corresponding IP addresses; otherwise, it does not.</p>\",\
          \"locationName\":\"enableDnsSupport\"\
        },\
        \"EnableDnsHostnames\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether the instances launched in the VPC get DNS hostnames. If this attribute is <code>true</code>, instances in the VPC get DNS hostnames; otherwise, they do not.</p>\",\
          \"locationName\":\"enableDnsHostnames\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcAttribute.</p>\"\
    },\
    \"DescribeVpcClassicLinkDnsSupportRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcIds\":{\
          \"shape\":\"VpcClassicLinkIdList\",\
          \"documentation\":\"<p>One or more VPC IDs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p>\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a prior call.)</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcClassicLinkDnsSupport.</p>\"\
    },\
    \"DescribeVpcClassicLinkDnsSupportResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Vpcs\":{\
          \"shape\":\"ClassicLinkDnsSupportList\",\
          \"documentation\":\"<p>Information about the ClassicLink DNS support status of the VPCs.</p>\",\
          \"locationName\":\"vpcs\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcClassicLinkDnsSupport.</p>\"\
    },\
    \"DescribeVpcClassicLinkRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcIds\":{\
          \"shape\":\"VpcClassicLinkIdList\",\
          \"documentation\":\"<p>One or more VPCs for which you want to describe the ClassicLink status.</p>\",\
          \"locationName\":\"VpcId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>is-classic-link-enabled</code> - Whether the VPC is enabled for ClassicLink (<code>true</code> | <code>false</code>).</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcClassicLink.</p>\"\
    },\
    \"DescribeVpcClassicLinkResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Vpcs\":{\
          \"shape\":\"VpcClassicLinkList\",\
          \"documentation\":\"<p>The ClassicLink status of one or more VPCs.</p>\",\
          \"locationName\":\"vpcSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcClassicLink.</p>\"\
    },\
    \"DescribeVpcEndpointServicesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p> <p>Constraint: If the value is greater than 1000, we return only 1000 items.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a prior call.)</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcEndpointServices.</p>\"\
    },\
    \"DescribeVpcEndpointServicesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ServiceNames\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>A list of supported AWS services.</p>\",\
          \"locationName\":\"serviceNameSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcEndpointServices.</p>\"\
    },\
    \"DescribeVpcEndpointsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"VpcEndpointIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more endpoint IDs.</p>\",\
          \"locationName\":\"VpcEndpointId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>service-name</code>: The name of the AWS service.</p> </li> <li> <p><code>vpc-id</code>: The ID of the VPC in which the endpoint resides.</p> </li> <li> <p><code>vpc-endpoint-id</code>: The ID of the endpoint.</p> </li> <li> <p><code>vpc-endpoint-state</code>: The state of the endpoint. (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>)</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p> <p>Constraint: If the value is greater than 1000, we return only 1000 items.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a prior call.)</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcEndpoints.</p>\"\
    },\
    \"DescribeVpcEndpointsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcEndpoints\":{\
          \"shape\":\"VpcEndpointSet\",\
          \"documentation\":\"<p>Information about the endpoints.</p>\",\
          \"locationName\":\"vpcEndpointSet\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>\",\
          \"locationName\":\"nextToken\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcEndpoints.</p>\"\
    },\
    \"DescribeVpcPeeringConnectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcPeeringConnectionIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more VPC peering connection IDs.</p> <p>Default: Describes all your VPC peering connections.</p>\",\
          \"locationName\":\"VpcPeeringConnectionId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>accepter-vpc-info.cidr-block</code> - The CIDR block of the peer VPC.</p> </li> <li> <p><code>accepter-vpc-info.owner-id</code> - The AWS account ID of the owner of the peer VPC.</p> </li> <li> <p><code>accepter-vpc-info.vpc-id</code> - The ID of the peer VPC.</p> </li> <li> <p><code>expiration-time</code> - The expiration date and time for the VPC peering connection.</p> </li> <li> <p><code>requester-vpc-info.cidr-block</code> - The CIDR block of the requester&apos;s VPC.</p> </li> <li> <p><code>requester-vpc-info.owner-id</code> - The AWS account ID of the owner of the requester VPC.</p> </li> <li> <p><code>requester-vpc-info.vpc-id</code> - The ID of the requester VPC.</p> </li> <li> <p><code>status-code</code> - The status of the VPC peering connection (<code>pending-acceptance</code> | <code>failed</code> | <code>expired</code> | <code>provisioning</code> | <code>active</code> | <code>deleted</code> | <code>rejected</code>).</p> </li> <li> <p><code>status-message</code> - A message that provides more information about the status of the VPC peering connection, if applicable.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-peering-connection-id</code> - The ID of the VPC peering connection.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcPeeringConnections.</p>\"\
    },\
    \"DescribeVpcPeeringConnectionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcPeeringConnections\":{\
          \"shape\":\"VpcPeeringConnectionList\",\
          \"documentation\":\"<p>Information about the VPC peering connections.</p>\",\
          \"locationName\":\"vpcPeeringConnectionSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcPeeringConnections.</p>\"\
    },\
    \"DescribeVpcsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcIds\":{\
          \"shape\":\"VpcIdStringList\",\
          \"documentation\":\"<p>One or more VPC IDs.</p> <p>Default: Describes all your VPCs.</p>\",\
          \"locationName\":\"VpcId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>cidr</code> - The CIDR block of the VPC. The CIDR block you specify must exactly match the VPC's CIDR block for information to be returned for the VPC. Must contain the slash followed by one or two digits (for example, <code>/28</code>).</p> </li> <li> <p><code>dhcp-options-id</code> - The ID of a set of DHCP options.</p> </li> <li> <p><code>isDefault</code> - Indicates whether the VPC is the default VPC.</p> </li> <li> <p><code>state</code> - The state of the VPC (<code>pending</code> | <code>available</code>).</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>vpc-id</code> - The ID of the VPC.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpcs.</p>\"\
    },\
    \"DescribeVpcsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Vpcs\":{\
          \"shape\":\"VpcList\",\
          \"documentation\":\"<p>Information about one or more VPCs.</p>\",\
          \"locationName\":\"vpcSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpcs.</p>\"\
    },\
    \"DescribeVpnConnectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpnConnectionIds\":{\
          \"shape\":\"VpnConnectionIdStringList\",\
          \"documentation\":\"<p>One or more VPN connection IDs.</p> <p>Default: Describes your VPN connections.</p>\",\
          \"locationName\":\"VpnConnectionId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>customer-gateway-configuration</code> - The configuration information for the customer gateway.</p> </li> <li> <p><code>customer-gateway-id</code> - The ID of a customer gateway associated with the VPN connection.</p> </li> <li> <p><code>state</code> - The state of the VPN connection (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p> </li> <li> <p><code>option.static-routes-only</code> - Indicates whether the connection has static routes only. Used for devices that do not support Border Gateway Protocol (BGP).</p> </li> <li> <p><code>route.destination-cidr-block</code> - The destination CIDR block. This corresponds to the subnet used in a customer data center.</p> </li> <li> <p><code>bgp-asn</code> - The BGP Autonomous System Number (ASN) associated with a BGP device.</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>type</code> - The type of VPN connection. Currently the only supported type is <code>ipsec.1</code>.</p> </li> <li> <p><code>vpn-connection-id</code> - The ID of the VPN connection.</p> </li> <li> <p><code>vpn-gateway-id</code> - The ID of a virtual private gateway associated with the VPN connection.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpnConnections.</p>\"\
    },\
    \"DescribeVpnConnectionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpnConnections\":{\
          \"shape\":\"VpnConnectionList\",\
          \"documentation\":\"<p>Information about one or more VPN connections.</p>\",\
          \"locationName\":\"vpnConnectionSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpnConnections.</p>\"\
    },\
    \"DescribeVpnGatewaysRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpnGatewayIds\":{\
          \"shape\":\"VpnGatewayIdStringList\",\
          \"documentation\":\"<p>One or more virtual private gateway IDs.</p> <p>Default: Describes all your virtual private gateways.</p>\",\
          \"locationName\":\"VpnGatewayId\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>One or more filters.</p> <ul> <li> <p><code>attachment.state</code> - The current state of the attachment between the gateway and the VPC (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p> </li> <li> <p><code>attachment.vpc-id</code> - The ID of an attached VPC.</p> </li> <li> <p><code>availability-zone</code> - The Availability Zone for the virtual private gateway (if applicable).</p> </li> <li> <p><code>state</code> - The state of the virtual private gateway (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p> </li> <li> <p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p> </li> <li> <p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter \\\"tag-key=Purpose\\\" and the filter \\\"tag-value=X\\\", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p> </li> <li> <p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p> </li> <li> <p><code>type</code> - The type of virtual private gateway. Currently the only supported type is <code>ipsec.1</code>.</p> </li> <li> <p><code>vpn-gateway-id</code> - The ID of the virtual private gateway.</p> </li> </ul>\",\
          \"locationName\":\"Filter\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DescribeVpnGateways.</p>\"\
    },\
    \"DescribeVpnGatewaysResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpnGateways\":{\
          \"shape\":\"VpnGatewayList\",\
          \"documentation\":\"<p>Information about one or more virtual private gateways.</p>\",\
          \"locationName\":\"vpnGatewaySet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DescribeVpnGateways.</p>\"\
    },\
    \"DetachClassicLinkVpcRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance to unlink from the VPC.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> The ID of the VPC to which the instance is linked.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DetachClassicLinkVpc.</p>\"\
    },\
    \"DetachClassicLinkVpcResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DetachClassicLinkVpc.</p>\"\
    },\
    \"DetachInternetGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InternetGatewayId\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InternetGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Internet gateway.</p>\",\
          \"locationName\":\"internetGatewayId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DetachInternetGateway.</p>\"\
    },\
    \"DetachNetworkInterfaceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AttachmentId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"AttachmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the attachment.</p>\",\
          \"locationName\":\"attachmentId\"\
        },\
        \"Force\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether to force a detachment.</p>\",\
          \"locationName\":\"force\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DetachNetworkInterface.</p>\"\
    },\
    \"DetachVolumeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"Device\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name.</p>\"\
        },\
        \"Force\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Forces detachment if the previous detachment attempt did not occur cleanly (for example, logging into an instance, unmounting the volume, and detaching normally). This option can lead to data loss or a corrupted file system. Use this option only as a last resort to detach a volume from a failed instance. The instance won't have an opportunity to flush file system caches or file system metadata. If you use this option, you must perform file system check and repair procedures.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DetachVolume.</p>\"\
    },\
    \"DetachVpnGatewayRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VpnGatewayId\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpnGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DetachVpnGateway.</p>\"\
    },\
    \"DeviceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ebs\",\
        \"instance-store\"\
      ]\
    },\
    \"DhcpConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a DHCP option.</p>\",\
          \"locationName\":\"key\"\
        },\
        \"Values\":{\
          \"shape\":\"DhcpConfigurationValueList\",\
          \"documentation\":\"<p>One or more values for the DHCP option.</p>\",\
          \"locationName\":\"valueSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a DHCP configuration option.</p>\"\
    },\
    \"DhcpConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"DhcpConfiguration\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"DhcpConfigurationValueList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"AttributeValue\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"DhcpOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DhcpOptionsId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the set of DHCP options.</p>\",\
          \"locationName\":\"dhcpOptionsId\"\
        },\
        \"DhcpConfigurations\":{\
          \"shape\":\"DhcpConfigurationList\",\
          \"documentation\":\"<p>One or more DHCP options in the set.</p>\",\
          \"locationName\":\"dhcpConfigurationSet\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the DHCP options set.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a set of DHCP options.</p>\"\
    },\
    \"DhcpOptionsIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"DhcpOptionsId\"\
      }\
    },\
    \"DhcpOptionsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"DhcpOptions\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"DisableVgwRoutePropagationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RouteTableId\",\
        \"GatewayId\"\
      ],\
      \"members\":{\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\"\
        },\
        \"GatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DisableVgwRoutePropagation.</p>\"\
    },\
    \"DisableVpcClassicLinkDnsSupportRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DisableVpcClassicLinkDnsSupport.</p>\"\
    },\
    \"DisableVpcClassicLinkDnsSupportResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DisableVpcClassicLinkDnsSupport.</p>\"\
    },\
    \"DisableVpcClassicLinkRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DisableVpcClassicLink.</p>\"\
    },\
    \"DisableVpcClassicLinkResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of DisableVpcClassicLink.</p>\"\
    },\
    \"DisassociateAddressRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic] The Elastic IP address. Required for EC2-Classic.</p>\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The association ID. Required for EC2-VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DisassociateAddress.</p>\"\
    },\
    \"DisassociateRouteTableRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AssociationId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The association ID representing the current association between the route table and subnet.</p>\",\
          \"locationName\":\"associationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for DisassociateRouteTable.</p>\"\
    },\
    \"DiskImage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"DiskImageDetail\",\
          \"documentation\":\"<p>Information about the disk image.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the disk image.</p>\"\
        },\
        \"Volume\":{\
          \"shape\":\"VolumeDetail\",\
          \"documentation\":\"<p>Information about the volume.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a disk image.</p>\"\
    },\
    \"DiskImageDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Format\",\
        \"Size\",\
        \"ImportManifestUrl\"\
      ],\
      \"members\":{\
        \"Format\":{\
          \"shape\":\"DiskImageFormat\",\
          \"documentation\":\"<p>The disk image format.</p>\",\
          \"locationName\":\"format\"\
        },\
        \"Size\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the disk image, in GiB.</p>\",\
          \"locationName\":\"size\"\
        },\
        \"ImportManifestUrl\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A presigned URL for the import manifest stored in Amazon S3. For information about creating a presigned URL for an Amazon S3 object, read the \\\"Query String Request Authentication Alternative\\\" section of the <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html\\\">Authenticating REST Requests</a> topic in the <i>Amazon Simple Storage Service Developer Guide</i>.</p> <p>For information about the import manifest referenced by this API action, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html\\\">VM Import Manifest</a>.</p>\",\
          \"locationName\":\"importManifestUrl\"\
        },\
        \"Checksum\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The checksum computed for the disk image.</p>\",\
          \"locationName\":\"checksum\"\
        }\
      },\
      \"documentation\":\"<p>Describes a disk image.</p>\"\
    },\
    \"DiskImageDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Format\",\
        \"Bytes\",\
        \"ImportManifestUrl\"\
      ],\
      \"members\":{\
        \"Format\":{\
          \"shape\":\"DiskImageFormat\",\
          \"documentation\":\"<p>The disk image format.</p>\",\
          \"locationName\":\"format\"\
        },\
        \"Bytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the disk image, in GiB.</p>\",\
          \"locationName\":\"bytes\"\
        },\
        \"ImportManifestUrl\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A presigned URL for the import manifest stored in Amazon S3 and presented here as an Amazon S3 presigned URL. For information about creating a presigned URL for an Amazon S3 object, read the \\\"Query String Request Authentication Alternative\\\" section of the <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html\\\">Authenticating REST Requests</a> topic in the <i>Amazon Simple Storage Service Developer Guide</i>.</p> <p>For information about the import manifest referenced by this API action, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html\\\">VM Import Manifest</a>.</p>\",\
          \"locationName\":\"importManifestUrl\"\
        }\
      },\
      \"documentation\":\"<p>Describes a disk image.</p>\"\
    },\
    \"DiskImageFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"VMDK\",\
        \"RAW\",\
        \"VHD\"\
      ]\
    },\
    \"DiskImageList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DiskImage\"}\
    },\
    \"DiskImageVolumeDescription\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Size\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the volume, in GiB.</p>\",\
          \"locationName\":\"size\"\
        },\
        \"Id\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The volume identifier.</p>\",\
          \"locationName\":\"id\"\
        }\
      },\
      \"documentation\":\"<p>Describes a disk image volume.</p>\"\
    },\
    \"DomainType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"vpc\",\
        \"standard\"\
      ]\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"EbsBlockDevice\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the snapshot.</p>\",\
          \"locationName\":\"snapshotId\"\
        },\
        \"VolumeSize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the volume, in GiB.</p> <p>Constraints: 1-16384 for General Purpose SSD (<code>gp2</code>), 4-16384 for Provisioned IOPS SSD (<code>io1</code>), 500-16384 for Throughput Optimized HDD (<code>st1</code>), 500-16384 for Cold HDD (<code>sc1</code>), and 1-1024 for Magnetic (<code>standard</code>) volumes. If you specify a snapshot, the volume size must be equal to or larger than the snapshot size.</p> <p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>\",\
          \"locationName\":\"volumeSize\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the EBS volume is deleted on instance termination.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        },\
        \"VolumeType\":{\
          \"shape\":\"VolumeType\",\
          \"documentation\":\"<p>The volume type: <code>gp2</code>, <code>io1</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code>.</p> <p>Default: <code>standard</code></p>\",\
          \"locationName\":\"volumeType\"\
        },\
        \"Iops\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of I/O operations per second (IOPS) that the volume supports. For io1, this represents the number of IOPS that are provisioned for the volume. For <code>gp2</code>, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. For more information on General Purpose SSD baseline performance, I/O credits, and bursting, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html\\\">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>Constraint: Range is 100-20000 IOPS for io1 volumes and 100-10000 IOPS for <code>gp2</code> volumes.</p> <p>Condition: This parameter is required for requests to create <code><code>io1</code></code> volumes; it is not used in requests to create <code>gp2</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code> volumes.</p>\",\
          \"locationName\":\"iops\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the EBS volume is encrypted. Encrypted Amazon EBS volumes may only be attached to instances that support Amazon EBS encryption.</p>\",\
          \"locationName\":\"encrypted\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device for an EBS volume.</p>\"\
    },\
    \"EbsInstanceBlockDevice\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS volume.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"Status\":{\
          \"shape\":\"AttachmentStatus\",\
          \"documentation\":\"<p>The attachment state.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"AttachTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time stamp when the attachment initiated.</p>\",\
          \"locationName\":\"attachTime\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the volume is deleted on instance termination.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        }\
      },\
      \"documentation\":\"<p>Describes a parameter used to set up an EBS volume in a block device mapping.</p>\"\
    },\
    \"EbsInstanceBlockDeviceSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS volume.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the volume is deleted on instance termination.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used to set up an EBS volume specified in a block device mapping.</p>\"\
    },\
    \"EnableVgwRoutePropagationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RouteTableId\",\
        \"GatewayId\"\
      ],\
      \"members\":{\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\"\
        },\
        \"GatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for EnableVgwRoutePropagation.</p>\"\
    },\
    \"EnableVolumeIORequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\",\
          \"locationName\":\"volumeId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for EnableVolumeIO.</p>\"\
    },\
    \"EnableVpcClassicLinkDnsSupportRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for EnableVpcClassicLinkDnsSupport.</p>\"\
    },\
    \"EnableVpcClassicLinkDnsSupportResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of EnableVpcClassicLinkDnsSupport.</p>\"\
    },\
    \"EnableVpcClassicLinkRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for EnableVpcClassicLink.</p>\"\
    },\
    \"EnableVpcClassicLinkResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of EnableVpcClassicLink.</p>\"\
    },\
    \"EventCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"instance-reboot\",\
        \"system-reboot\",\
        \"system-maintenance\",\
        \"instance-retirement\",\
        \"instance-stop\"\
      ]\
    },\
    \"EventInformation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance. This information is available only for <code>instanceChange</code> events.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"EventSubType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The event.</p> <p>The following are the <code>error</code> events.</p> <ul> <li> <p><code>iamFleetRoleInvalid</code> - The Spot fleet did not have the required permissions either to launch or terminate an instance.</p> </li> <li> <p><code>launchSpecTemporarilyBlacklisted</code> - The configuration is not valid and several attempts to launch instances have failed. For more information, see the description of the event.</p> </li> <li> <p><code>spotFleetRequestConfigurationInvalid</code> - The configuration is not valid. For more information, see the description of the event.</p> </li> <li> <p><code>spotInstanceCountLimitExceeded</code> - You've reached the limit on the number of Spot instances that you can launch.</p> </li> </ul> <p>The following are the <code>fleetRequestChange</code> events.</p> <ul> <li> <p><code>active</code> - The Spot fleet has been validated and Amazon EC2 is attempting to maintain the target number of running Spot instances.</p> </li> <li> <p><code>cancelled</code> - The Spot fleet is canceled and has no running Spot instances. The Spot fleet will be deleted two days after its instances were terminated.</p> </li> <li> <p><code>cancelled_running</code> - The Spot fleet is canceled and will not launch additional Spot instances, but its existing Spot instances continue to run until they are interrupted or terminated.</p> </li> <li> <p><code>cancelled_terminating</code> - The Spot fleet is canceled and its Spot instances are terminating.</p> </li> <li> <p><code>expired</code> - The Spot fleet request has expired. A subsequent event indicates that the instances were terminated, if the request was created with <code>TerminateInstancesWithExpiration</code> set.</p> </li> <li> <p><code>modify_in_progress</code> - A request to modify the Spot fleet request was accepted and is in progress.</p> </li> <li> <p><code>modify_successful</code> - The Spot fleet request was modified.</p> </li> <li> <p><code>price_update</code> - The bid price for a launch configuration was adjusted because it was too high. This change is permanent.</p> </li> <li> <p><code>submitted</code> - The Spot fleet request is being evaluated and Amazon EC2 is preparing to launch the target number of Spot instances.</p> </li> </ul> <p>The following are the <code>instanceChange</code> events.</p> <ul> <li> <p><code>launched</code> - A bid was fulfilled and a new instance was launched.</p> </li> <li> <p><code>terminated</code> - An instance was terminated by the user.</p> </li> </ul>\",\
          \"locationName\":\"eventSubType\"\
        },\
        \"EventDescription\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the event.</p>\",\
          \"locationName\":\"eventDescription\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot fleet event.</p>\"\
    },\
    \"EventType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"instanceChange\",\
        \"fleetRequestChange\",\
        \"error\"\
      ]\
    },\
    \"ExcessCapacityTerminationPolicy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"noTermination\",\
        \"default\"\
      ]\
    },\
    \"ExecutableByStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ExecutableBy\"\
      }\
    },\
    \"ExportEnvironment\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"citrix\",\
        \"vmware\",\
        \"microsoft\"\
      ]\
    },\
    \"ExportTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the export task.</p>\",\
          \"locationName\":\"exportTaskId\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the resource being exported.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"State\":{\
          \"shape\":\"ExportTaskState\",\
          \"documentation\":\"<p>The state of the export task.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status message related to the export task.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"InstanceExportDetails\":{\
          \"shape\":\"InstanceExportDetails\",\
          \"documentation\":\"<p>Information about the instance to export.</p>\",\
          \"locationName\":\"instanceExport\"\
        },\
        \"ExportToS3Task\":{\
          \"shape\":\"ExportToS3Task\",\
          \"documentation\":\"<p>Information about the export task.</p>\",\
          \"locationName\":\"exportToS3\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance export task.</p>\"\
    },\
    \"ExportTaskIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ExportTaskId\"\
      }\
    },\
    \"ExportTaskList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ExportTask\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ExportTaskState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"cancelling\",\
        \"cancelled\",\
        \"completed\"\
      ]\
    },\
    \"ExportToS3Task\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DiskImageFormat\":{\
          \"shape\":\"DiskImageFormat\",\
          \"documentation\":\"<p>The format for the exported image.</p>\",\
          \"locationName\":\"diskImageFormat\"\
        },\
        \"ContainerFormat\":{\
          \"shape\":\"ContainerFormat\",\
          \"documentation\":\"<p>The container format used to combine disk images with metadata (such as OVF). If absent, only the disk image is exported.</p>\",\
          \"locationName\":\"containerFormat\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The S3 bucket for the destination image. The destination bucket must exist and grant WRITE and READ_ACP permissions to the AWS account <code>vm-import-export@amazon.com</code>.</p>\",\
          \"locationName\":\"s3Bucket\"\
        },\
        \"S3Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The encryption key for your S3 bucket.</p>\",\
          \"locationName\":\"s3Key\"\
        }\
      },\
      \"documentation\":\"<p>Describes the format and location for an instance export task.</p>\"\
    },\
    \"ExportToS3TaskSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DiskImageFormat\":{\
          \"shape\":\"DiskImageFormat\",\
          \"documentation\":\"<p>The format for the exported image.</p>\",\
          \"locationName\":\"diskImageFormat\"\
        },\
        \"ContainerFormat\":{\
          \"shape\":\"ContainerFormat\",\
          \"documentation\":\"<p>The container format used to combine disk images with metadata (such as OVF). If absent, only the disk image is exported.</p>\",\
          \"locationName\":\"containerFormat\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The S3 bucket for the destination image. The destination bucket must exist and grant WRITE and READ_ACP permissions to the AWS account <code>vm-import-export@amazon.com</code>.</p>\",\
          \"locationName\":\"s3Bucket\"\
        },\
        \"S3Prefix\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The image is written to a single object in the S3 bucket at the S3 key s3prefix + exportTaskId + '.' + diskImageFormat.</p>\",\
          \"locationName\":\"s3Prefix\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance export task.</p>\"\
    },\
    \"Filter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the filter. Filter names are case-sensitive.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more filter values. Filter values are case-sensitive.</p>\",\
          \"locationName\":\"Value\"\
        }\
      },\
      \"documentation\":\"<p>A filter name and value pair that is used to return a more specific list of results. Filters can be used to match a set of resources by various criteria, such as tags, attributes, or IDs.</p>\"\
    },\
    \"FilterList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Filter\",\
        \"locationName\":\"Filter\"\
      }\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"FlowLog\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the flow log was created.</p>\",\
          \"locationName\":\"creationTime\"\
        },\
        \"FlowLogId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The flow log ID.</p>\",\
          \"locationName\":\"flowLogId\"\
        },\
        \"FlowLogStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the flow log (<code>ACTIVE</code>).</p>\",\
          \"locationName\":\"flowLogStatus\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the resource on which the flow log was created.</p>\",\
          \"locationName\":\"resourceId\"\
        },\
        \"TrafficType\":{\
          \"shape\":\"TrafficType\",\
          \"documentation\":\"<p>The type of traffic captured for the flow log.</p>\",\
          \"locationName\":\"trafficType\"\
        },\
        \"LogGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the flow log group.</p>\",\
          \"locationName\":\"logGroupName\"\
        },\
        \"DeliverLogsStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the logs delivery (<code>SUCCESS</code> | <code>FAILED</code>).</p>\",\
          \"locationName\":\"deliverLogsStatus\"\
        },\
        \"DeliverLogsErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Information about the error that occurred. <code>Rate limited</code> indicates that CloudWatch logs throttling has been applied for one or more network interfaces, or that you've reached the limit on the number of CloudWatch Logs log groups that you can create. <code>Access error</code> indicates that the IAM role associated with the flow log does not have sufficient permissions to publish to CloudWatch Logs. <code>Unknown error</code> indicates an internal error.</p>\",\
          \"locationName\":\"deliverLogsErrorMessage\"\
        },\
        \"DeliverLogsPermissionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the IAM role that posts logs to CloudWatch Logs.</p>\",\
          \"locationName\":\"deliverLogsPermissionArn\"\
        }\
      },\
      \"documentation\":\"<p>Describes a flow log.</p>\"\
    },\
    \"FlowLogSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"FlowLog\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"FlowLogsResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"VPC\",\
        \"Subnet\",\
        \"NetworkInterface\"\
      ]\
    },\
    \"GatewayType\":{\
      \"type\":\"string\",\
      \"enum\":[\"ipsec.1\"]\
    },\
    \"GetConsoleOutputRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for GetConsoleOutput.</p>\"\
    },\
    \"GetConsoleOutputResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time the output was last updated.</p>\",\
          \"locationName\":\"timestamp\"\
        },\
        \"Output\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The console output, Base64 encoded. If using a command line tool, the tools decode the output for you. </p>\",\
          \"locationName\":\"output\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of GetConsoleOutput.</p>\"\
    },\
    \"GetPasswordDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Windows instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for GetPasswordData.</p>\"\
    },\
    \"GetPasswordDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Windows instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time the data was last updated.</p>\",\
          \"locationName\":\"timestamp\"\
        },\
        \"PasswordData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The password of the instance.</p>\",\
          \"locationName\":\"passwordData\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of GetPasswordData.</p>\"\
    },\
    \"GroupIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"groupId\"\
      }\
    },\
    \"GroupIdentifier\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the security group.</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a security group.</p>\"\
    },\
    \"GroupIdentifierList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"GroupIdentifier\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"GroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"GroupNameStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"GroupName\"\
      }\
    },\
    \"HistoryRecord\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Timestamp\",\
        \"EventType\",\
        \"EventInformation\"\
      ],\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time of the event, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"timestamp\"\
        },\
        \"EventType\":{\
          \"shape\":\"EventType\",\
          \"documentation\":\"<p>The event type.</p> <ul> <li> <p><code>error</code> - Indicates an error with the Spot fleet request.</p> </li> <li> <p><code>fleetRequestChange</code> - Indicates a change in the status or configuration of the Spot fleet request.</p> </li> <li> <p><code>instanceChange</code> - Indicates that an instance was launched or terminated.</p> </li> </ul>\",\
          \"locationName\":\"eventType\"\
        },\
        \"EventInformation\":{\
          \"shape\":\"EventInformation\",\
          \"documentation\":\"<p>Information about the event.</p>\",\
          \"locationName\":\"eventInformation\"\
        }\
      },\
      \"documentation\":\"<p>Describes an event in the history of the Spot fleet request.</p>\"\
    },\
    \"HistoryRecords\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HistoryRecord\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"Host\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HostId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Dedicated host.</p>\",\
          \"locationName\":\"hostId\"\
        },\
        \"AutoPlacement\":{\
          \"shape\":\"AutoPlacement\",\
          \"documentation\":\"<p>Whether auto-placement is on or off.</p>\",\
          \"locationName\":\"autoPlacement\"\
        },\
        \"HostReservationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reservation ID of the Dedicated host. This returns a <code>null</code> response if the Dedicated host doesn't have an associated reservation.</p>\",\
          \"locationName\":\"hostReservationId\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"HostProperties\":{\
          \"shape\":\"HostProperties\",\
          \"documentation\":\"<p>The hardware specifications of the Dedicated host.</p>\",\
          \"locationName\":\"hostProperties\"\
        },\
        \"State\":{\
          \"shape\":\"AllocationState\",\
          \"documentation\":\"<p>The Dedicated host's state.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone of the Dedicated host.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Instances\":{\
          \"shape\":\"HostInstanceList\",\
          \"documentation\":\"<p>The IDs and instance type that are currently running on the Dedicated host.</p>\",\
          \"locationName\":\"instances\"\
        },\
        \"AvailableCapacity\":{\
          \"shape\":\"AvailableCapacity\",\
          \"documentation\":\"<p>The number of new instances that can be launched onto the Dedicated host.</p>\",\
          \"locationName\":\"availableCapacity\"\
        }\
      },\
      \"documentation\":\"<p>Describes the properties of the Dedicated host.</p>\"\
    },\
    \"HostInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>the IDs of instances that are running on the Dedicated host.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type size (for example, m3.medium) of the running instance.</p>\",\
          \"locationName\":\"instanceType\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance running on a Dedicated host.</p>\"\
    },\
    \"HostInstanceList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"HostInstance\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"HostList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Host\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"HostProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Sockets\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of sockets on the Dedicated host.</p>\",\
          \"locationName\":\"sockets\"\
        },\
        \"Cores\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of cores on the Dedicated host.</p>\",\
          \"locationName\":\"cores\"\
        },\
        \"TotalVCpus\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of vCPUs on the Dedicated host.</p>\",\
          \"locationName\":\"totalVCpus\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type size that the Dedicated host supports (for example, m3.medium).</p>\",\
          \"locationName\":\"instanceType\"\
        }\
      },\
      \"documentation\":\"<p>Describes properties of a Dedicated host.</p>\"\
    },\
    \"HostTenancy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"dedicated\",\
        \"host\"\
      ]\
    },\
    \"HypervisorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ovm\",\
        \"xen\"\
      ]\
    },\
    \"IamInstanceProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance profile.</p>\",\
          \"locationName\":\"arn\"\
        },\
        \"Id\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance profile.</p>\",\
          \"locationName\":\"id\"\
        }\
      },\
      \"documentation\":\"<p>Describes an IAM instance profile.</p>\"\
    },\
    \"IamInstanceProfileSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance profile.</p>\",\
          \"locationName\":\"arn\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the instance profile.</p>\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>Describes an IAM instance profile.</p>\"\
    },\
    \"IcmpTypeCode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The ICMP code. A value of -1 means all codes for the specified ICMP type.</p>\",\
          \"locationName\":\"type\"\
        },\
        \"Code\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The ICMP type. A value of -1 means all types.</p>\",\
          \"locationName\":\"code\"\
        }\
      },\
      \"documentation\":\"<p>Describes the ICMP type and code.</p>\"\
    },\
    \"IdFormat\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of resource.</p>\",\
          \"locationName\":\"resource\"\
        },\
        \"UseLongIds\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether longer IDs (17-character IDs) are enabled for the resource.</p>\",\
          \"locationName\":\"useLongIds\"\
        },\
        \"Deadline\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date in UTC at which you are permanently switched over to using longer IDs. If a deadline is not yet available for this resource type, this field is not returned.</p>\",\
          \"locationName\":\"deadline\"\
        }\
      },\
      \"documentation\":\"<p>Describes the ID format for a resource.</p>\"\
    },\
    \"IdFormatList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"IdFormat\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"Image\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"ImageLocation\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The location of the AMI.</p>\",\
          \"locationName\":\"imageLocation\"\
        },\
        \"State\":{\
          \"shape\":\"ImageState\",\
          \"documentation\":\"<p>The current state of the AMI. If the state is <code>available</code>, the image is successfully registered and can be used to launch an instance.</p>\",\
          \"locationName\":\"imageState\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the image owner.</p>\",\
          \"locationName\":\"imageOwnerId\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The date and time the image was created.</p>\",\
          \"locationName\":\"creationDate\"\
        },\
        \"Public\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the image has public launch permissions. The value is <code>true</code> if this image has public launch permissions or <code>false</code> if it has only implicit and explicit launch permissions.</p>\",\
          \"locationName\":\"isPublic\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeList\",\
          \"documentation\":\"<p>Any product codes associated with the AMI.</p>\",\
          \"locationName\":\"productCodes\"\
        },\
        \"Architecture\":{\
          \"shape\":\"ArchitectureValues\",\
          \"documentation\":\"<p>The architecture of the image.</p>\",\
          \"locationName\":\"architecture\"\
        },\
        \"ImageType\":{\
          \"shape\":\"ImageTypeValues\",\
          \"documentation\":\"<p>The type of image.</p>\",\
          \"locationName\":\"imageType\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The kernel associated with the image, if any. Only applicable for machine images.</p>\",\
          \"locationName\":\"kernelId\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The RAM disk associated with the image, if any. Only applicable for machine images.</p>\",\
          \"locationName\":\"ramdiskId\"\
        },\
        \"Platform\":{\
          \"shape\":\"PlatformValues\",\
          \"documentation\":\"<p>The value is <code>Windows</code> for Windows AMIs; otherwise blank.</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"SriovNetSupport\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies whether enhanced networking is enabled.</p>\",\
          \"locationName\":\"sriovNetSupport\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>The reason for the state change.</p>\",\
          \"locationName\":\"stateReason\"\
        },\
        \"ImageOwnerAlias\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account alias (for example, <code>amazon</code>, <code>self</code>) or the AWS account ID of the AMI owner.</p>\",\
          \"locationName\":\"imageOwnerAlias\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the AMI that was provided during image creation.</p>\",\
          \"locationName\":\"name\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the AMI that was provided during image creation.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"RootDeviceType\":{\
          \"shape\":\"DeviceType\",\
          \"documentation\":\"<p>The type of root device used by the AMI. The AMI can use an EBS volume or an instance store volume.</p>\",\
          \"locationName\":\"rootDeviceType\"\
        },\
        \"RootDeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name of the root device (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p>\",\
          \"locationName\":\"rootDeviceName\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingList\",\
          \"documentation\":\"<p>Any block device mapping entries.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"VirtualizationType\":{\
          \"shape\":\"VirtualizationType\",\
          \"documentation\":\"<p>The type of virtualization of the AMI.</p>\",\
          \"locationName\":\"virtualizationType\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the image.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"Hypervisor\":{\
          \"shape\":\"HypervisorType\",\
          \"documentation\":\"<p>The hypervisor type of the image.</p>\",\
          \"locationName\":\"hypervisor\"\
        }\
      },\
      \"documentation\":\"<p>Describes an image.</p>\"\
    },\
    \"ImageAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"LaunchPermissions\":{\
          \"shape\":\"LaunchPermissionList\",\
          \"documentation\":\"<p>One or more launch permissions.</p>\",\
          \"locationName\":\"launchPermission\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeList\",\
          \"documentation\":\"<p>One or more product codes.</p>\",\
          \"locationName\":\"productCodes\"\
        },\
        \"KernelId\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The kernel ID.</p>\",\
          \"locationName\":\"kernel\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The RAM disk ID.</p>\",\
          \"locationName\":\"ramdisk\"\
        },\
        \"Description\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>A description for the AMI.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"SriovNetSupport\":{\
          \"shape\":\"AttributeValue\",\
          \"locationName\":\"sriovNetSupport\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingList\",\
          \"documentation\":\"<p>One or more block device mapping entries.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        }\
      },\
      \"documentation\":\"<p>Describes an image attribute.</p>\"\
    },\
    \"ImageAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"description\",\
        \"kernel\",\
        \"ramdisk\",\
        \"launchPermission\",\
        \"productCodes\",\
        \"blockDeviceMapping\",\
        \"sriovNetSupport\"\
      ]\
    },\
    \"ImageDiskContainer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the disk image.</p>\"\
        },\
        \"Format\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The format of the disk image being imported.</p> <p>Valid values: <code>RAW</code> | <code>VHD</code> | <code>VMDK</code> | <code>OVA</code></p>\"\
        },\
        \"Url\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URL to the Amazon S3-based disk image being imported. The URL can either be a https URL (https://..) or an Amazon S3 URL (s3://..)</p>\"\
        },\
        \"UserBucket\":{\
          \"shape\":\"UserBucket\",\
          \"documentation\":\"<p>The S3 bucket for the disk image.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The block device mapping for the disk.</p>\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the EBS snapshot to be used for importing the snapshot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the disk container object for an import image task.</p>\"\
    },\
    \"ImageDiskContainerList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ImageDiskContainer\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ImageIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ImageId\"\
      }\
    },\
    \"ImageList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Image\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ImageState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"available\",\
        \"invalid\",\
        \"deregistered\",\
        \"transient\",\
        \"failed\",\
        \"error\"\
      ]\
    },\
    \"ImageTypeValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"machine\",\
        \"kernel\",\
        \"ramdisk\"\
      ]\
    },\
    \"ImportImageRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description string for the import image task.</p>\"\
        },\
        \"DiskContainers\":{\
          \"shape\":\"ImageDiskContainerList\",\
          \"documentation\":\"<p>Information about the disk containers.</p>\",\
          \"locationName\":\"DiskContainer\"\
        },\
        \"LicenseType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The license type to be used for the Amazon Machine Image (AMI) after importing.</p> <p><b>Note:</b> You may only use BYOL if you have existing licenses with rights to use these licenses in a third party cloud like AWS. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/VMImportPrerequisites.html\\\">VM Import/Export Prerequisites</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>Valid values: <code>AWS</code> | <code>BYOL</code></p>\"\
        },\
        \"Hypervisor\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The target hypervisor platform.</p> <p>Valid values: <code>xen</code></p>\"\
        },\
        \"Architecture\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The architecture of the virtual machine.</p> <p>Valid values: <code>i386</code> | <code>x86_64</code></p>\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The operating system of the virtual machine.</p> <p>Valid values: <code>Windows</code> | <code>Linux</code></p>\"\
        },\
        \"ClientData\":{\
          \"shape\":\"ClientData\",\
          \"documentation\":\"<p>The client-specific data.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The token to enable idempotency for VM import requests.</p>\"\
        },\
        \"RoleName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the role to use when not using the default role, 'vmimport'.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ImportImage.</p>\"\
    },\
    \"ImportImageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The task ID of the import image task.</p>\",\
          \"locationName\":\"importTaskId\"\
        },\
        \"Architecture\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The architecture of the virtual machine.</p>\",\
          \"locationName\":\"architecture\"\
        },\
        \"LicenseType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The license type of the virtual machine.</p>\",\
          \"locationName\":\"licenseType\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The operating system of the virtual machine.</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"Hypervisor\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The target hypervisor of the import task.</p>\",\
          \"locationName\":\"hypervisor\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the import task.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"SnapshotDetails\":{\
          \"shape\":\"SnapshotDetailList\",\
          \"documentation\":\"<p>Information about the snapshots.</p>\",\
          \"locationName\":\"snapshotDetailSet\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI) created by the import task.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"Progress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The progress of the task.</p>\",\
          \"locationName\":\"progress\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A detailed status message of the import task.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A brief status of the task.</p>\",\
          \"locationName\":\"status\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for ImportImage.</p>\"\
    },\
    \"ImportImageTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the import image task.</p>\",\
          \"locationName\":\"importTaskId\"\
        },\
        \"Architecture\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The architecture of the virtual machine.</p> <p>Valid values: <code>i386</code> | <code>x86_64</code></p>\",\
          \"locationName\":\"architecture\"\
        },\
        \"LicenseType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The license type of the virtual machine.</p>\",\
          \"locationName\":\"licenseType\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description string for the import image task.</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"Hypervisor\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The target hypervisor for the import task.</p> <p>Valid values: <code>xen</code></p>\",\
          \"locationName\":\"hypervisor\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the import task.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"SnapshotDetails\":{\
          \"shape\":\"SnapshotDetailList\",\
          \"documentation\":\"<p>Information about the snapshots.</p>\",\
          \"locationName\":\"snapshotDetailSet\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI) of the imported virtual machine.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"Progress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The percentage of progress of the import image task.</p>\",\
          \"locationName\":\"progress\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A descriptive status message for the import image task.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A brief status for the import image task.</p>\",\
          \"locationName\":\"status\"\
        }\
      },\
      \"documentation\":\"<p>Describes an import image task.</p>\"\
    },\
    \"ImportImageTaskList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ImportImageTask\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ImportInstanceLaunchSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Architecture\":{\
          \"shape\":\"ArchitectureValues\",\
          \"documentation\":\"<p>The architecture of the instance.</p>\",\
          \"locationName\":\"architecture\"\
        },\
        \"GroupNames\":{\
          \"shape\":\"SecurityGroupStringList\",\
          \"documentation\":\"<p>One or more security group names.</p>\",\
          \"locationName\":\"GroupName\"\
        },\
        \"GroupIds\":{\
          \"shape\":\"SecurityGroupIdStringList\",\
          \"documentation\":\"<p>One or more security group IDs.</p>\",\
          \"locationName\":\"GroupId\"\
        },\
        \"AdditionalInfo\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Reserved.</p>\",\
          \"locationName\":\"additionalInfo\"\
        },\
        \"UserData\":{\
          \"shape\":\"UserData\",\
          \"documentation\":\"<p>The Base64-encoded MIME user data to be made available to the instance.</p>\",\
          \"locationName\":\"userData\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type. For more information about the instance types that you can import, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/VMImportPrerequisites.html\\\">Before You Get Started</a> in the Amazon Elastic Compute Cloud User Guide.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Placement\":{\
          \"shape\":\"Placement\",\
          \"documentation\":\"<p>The placement information for the instance.</p>\",\
          \"locationName\":\"placement\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether monitoring is enabled.</p>\",\
          \"locationName\":\"monitoring\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the subnet in which to launch the instance.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"InstanceInitiatedShutdownBehavior\":{\
          \"shape\":\"ShutdownBehavior\",\
          \"documentation\":\"<p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>\",\
          \"locationName\":\"instanceInitiatedShutdownBehavior\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] An available IP address from the IP address range of the subnet.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        }\
      },\
      \"documentation\":\"<p>Describes the launch specification for VM import.</p>\"\
    },\
    \"ImportInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Platform\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the instance being imported.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"LaunchSpecification\":{\
          \"shape\":\"ImportInstanceLaunchSpecification\",\
          \"documentation\":\"<p>The launch specification.</p>\",\
          \"locationName\":\"launchSpecification\"\
        },\
        \"DiskImages\":{\
          \"shape\":\"DiskImageList\",\
          \"documentation\":\"<p>The disk image.</p>\",\
          \"locationName\":\"diskImage\"\
        },\
        \"Platform\":{\
          \"shape\":\"PlatformValues\",\
          \"documentation\":\"<p>The instance operating system.</p>\",\
          \"locationName\":\"platform\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ImportInstance.</p>\"\
    },\
    \"ImportInstanceResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConversionTask\":{\
          \"shape\":\"ConversionTask\",\
          \"documentation\":\"<p>Information about the conversion task.</p>\",\
          \"locationName\":\"conversionTask\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for ImportInstance.</p>\"\
    },\
    \"ImportInstanceTaskDetails\":{\
      \"type\":\"structure\",\
      \"required\":[\"Volumes\"],\
      \"members\":{\
        \"Volumes\":{\
          \"shape\":\"ImportInstanceVolumeDetailSet\",\
          \"documentation\":\"<p>One or more volumes.</p>\",\
          \"locationName\":\"volumes\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Platform\":{\
          \"shape\":\"PlatformValues\",\
          \"documentation\":\"<p>The instance operating system.</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the task.</p>\",\
          \"locationName\":\"description\"\
        }\
      },\
      \"documentation\":\"<p>Describes an import instance task.</p>\"\
    },\
    \"ImportInstanceVolumeDetailItem\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BytesConverted\",\
        \"AvailabilityZone\",\
        \"Image\",\
        \"Volume\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"BytesConverted\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of bytes converted so far.</p>\",\
          \"locationName\":\"bytesConverted\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone where the resulting instance will reside.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Image\":{\
          \"shape\":\"DiskImageDescription\",\
          \"documentation\":\"<p>The image.</p>\",\
          \"locationName\":\"image\"\
        },\
        \"Volume\":{\
          \"shape\":\"DiskImageVolumeDescription\",\
          \"documentation\":\"<p>The volume.</p>\",\
          \"locationName\":\"volume\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the import of this particular disk image.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status information or errors related to the disk image.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the task.</p>\",\
          \"locationName\":\"description\"\
        }\
      },\
      \"documentation\":\"<p>Describes an import volume task.</p>\"\
    },\
    \"ImportInstanceVolumeDetailSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ImportInstanceVolumeDetailItem\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ImportKeyPairRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"KeyName\",\
        \"PublicKeyMaterial\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique name for the key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"PublicKeyMaterial\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The public key. For API calls, the text must be base64-encoded. For command line tools, base64 encoding is performed for you.</p>\",\
          \"locationName\":\"publicKeyMaterial\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ImportKeyPair.</p>\"\
    },\
    \"ImportKeyPairResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The key pair name you provided.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"KeyFingerprint\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The MD5 public key fingerprint as specified in section 4 of RFC 4716.</p>\",\
          \"locationName\":\"keyFingerprint\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ImportKeyPair.</p>\"\
    },\
    \"ImportSnapshotRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description string for the import snapshot task.</p>\"\
        },\
        \"DiskContainer\":{\
          \"shape\":\"SnapshotDiskContainer\",\
          \"documentation\":\"<p>Information about the disk container.</p>\"\
        },\
        \"ClientData\":{\
          \"shape\":\"ClientData\",\
          \"documentation\":\"<p>The client-specific data.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Token to enable idempotency for VM import requests.</p>\"\
        },\
        \"RoleName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the role to use when not using the default role, 'vmimport'.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ImportSnapshot.</p>\"\
    },\
    \"ImportSnapshotResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the import snapshot task.</p>\",\
          \"locationName\":\"importTaskId\"\
        },\
        \"SnapshotTaskDetail\":{\
          \"shape\":\"SnapshotTaskDetail\",\
          \"documentation\":\"<p>Information about the import snapshot task.</p>\",\
          \"locationName\":\"snapshotTaskDetail\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the import snapshot task.</p>\",\
          \"locationName\":\"description\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for ImportSnapshot.</p>\"\
    },\
    \"ImportSnapshotTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImportTaskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the import snapshot task.</p>\",\
          \"locationName\":\"importTaskId\"\
        },\
        \"SnapshotTaskDetail\":{\
          \"shape\":\"SnapshotTaskDetail\",\
          \"documentation\":\"<p>Describes an import snapshot task.</p>\",\
          \"locationName\":\"snapshotTaskDetail\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the import snapshot task.</p>\",\
          \"locationName\":\"description\"\
        }\
      },\
      \"documentation\":\"<p>Describes an import snapshot task.</p>\"\
    },\
    \"ImportSnapshotTaskList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ImportSnapshotTask\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ImportTaskIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ImportTaskId\"\
      }\
    },\
    \"ImportVolumeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AvailabilityZone\",\
        \"Image\",\
        \"Volume\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone for the resulting EBS volume.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Image\":{\
          \"shape\":\"DiskImageDetail\",\
          \"documentation\":\"<p>The disk image.</p>\",\
          \"locationName\":\"image\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the volume.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"Volume\":{\
          \"shape\":\"VolumeDetail\",\
          \"documentation\":\"<p>The volume size.</p>\",\
          \"locationName\":\"volume\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ImportVolume.</p>\"\
    },\
    \"ImportVolumeResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConversionTask\":{\
          \"shape\":\"ConversionTask\",\
          \"documentation\":\"<p>Information about the conversion task.</p>\",\
          \"locationName\":\"conversionTask\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output for ImportVolume.</p>\"\
    },\
    \"ImportVolumeTaskDetails\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BytesConverted\",\
        \"AvailabilityZone\",\
        \"Image\",\
        \"Volume\"\
      ],\
      \"members\":{\
        \"BytesConverted\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of bytes converted so far.</p>\",\
          \"locationName\":\"bytesConverted\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone where the resulting volume will reside.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description you provided when starting the import volume task.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"Image\":{\
          \"shape\":\"DiskImageDescription\",\
          \"documentation\":\"<p>The image.</p>\",\
          \"locationName\":\"image\"\
        },\
        \"Volume\":{\
          \"shape\":\"DiskImageVolumeDescription\",\
          \"documentation\":\"<p>The volume.</p>\",\
          \"locationName\":\"volume\"\
        }\
      },\
      \"documentation\":\"<p>Describes an import volume task.</p>\"\
    },\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI used to launch the instance.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"State\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The current state of the instance.</p>\",\
          \"locationName\":\"instanceState\"\
        },\
        \"PrivateDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private DNS name assigned to the instance. This DNS name can only be used inside the Amazon EC2 network. This name is not available until the instance enters the <code>running</code> state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC.</p>\",\
          \"locationName\":\"privateDnsName\"\
        },\
        \"PublicDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public DNS name assigned to the instance. This name is not available until the instance enters the <code>running</code> state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC.</p>\",\
          \"locationName\":\"dnsName\"\
        },\
        \"StateTransitionReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for the most recent state transition. This might be an empty string.</p>\",\
          \"locationName\":\"reason\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair, if this instance was launched with an associated key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"AmiLaunchIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The AMI launch index, which can be used to find this instance in the launch group.</p>\",\
          \"locationName\":\"amiLaunchIndex\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeList\",\
          \"documentation\":\"<p>The product codes attached to this instance, if applicable.</p>\",\
          \"locationName\":\"productCodes\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"LaunchTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time the instance was launched.</p>\",\
          \"locationName\":\"launchTime\"\
        },\
        \"Placement\":{\
          \"shape\":\"Placement\",\
          \"documentation\":\"<p>The location where the instance launched, if applicable.</p>\",\
          \"locationName\":\"placement\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The kernel associated with this instance, if applicable.</p>\",\
          \"locationName\":\"kernelId\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The RAM disk associated with this instance, if applicable.</p>\",\
          \"locationName\":\"ramdiskId\"\
        },\
        \"Platform\":{\
          \"shape\":\"PlatformValues\",\
          \"documentation\":\"<p>The value is <code>Windows</code> for Windows instances; otherwise blank.</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"Monitoring\",\
          \"documentation\":\"<p>The monitoring information for the instance.</p>\",\
          \"locationName\":\"monitoring\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the subnet in which the instance is running.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the VPC in which the instance is running.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address assigned to the instance.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"PublicIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public IP address assigned to the instance, if applicable.</p>\",\
          \"locationName\":\"ipAddress\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>The reason for the most recent state transition.</p>\",\
          \"locationName\":\"stateReason\"\
        },\
        \"Architecture\":{\
          \"shape\":\"ArchitectureValues\",\
          \"documentation\":\"<p>The architecture of the image.</p>\",\
          \"locationName\":\"architecture\"\
        },\
        \"RootDeviceType\":{\
          \"shape\":\"DeviceType\",\
          \"documentation\":\"<p>The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.</p>\",\
          \"locationName\":\"rootDeviceType\"\
        },\
        \"RootDeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The root device name (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p>\",\
          \"locationName\":\"rootDeviceName\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"InstanceBlockDeviceMappingList\",\
          \"documentation\":\"<p>Any block device mapping entries for the instance.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"VirtualizationType\":{\
          \"shape\":\"VirtualizationType\",\
          \"documentation\":\"<p>The virtualization type of the instance.</p>\",\
          \"locationName\":\"virtualizationType\"\
        },\
        \"InstanceLifecycle\":{\
          \"shape\":\"InstanceLifecycleType\",\
          \"documentation\":\"<p>Indicates whether this is a Spot instance or a Scheduled Instance.</p>\",\
          \"locationName\":\"instanceLifecycle\"\
        },\
        \"SpotInstanceRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the request is a Spot instance request, the ID of the request.</p>\",\
          \"locationName\":\"spotInstanceRequestId\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The idempotency token you provided when you launched the instance, if applicable.</p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the instance.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>One or more security groups for the instance.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether to enable an instance launched in a VPC to perform NAT. This controls whether source/destination checking is enabled on the instance. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the instance to perform NAT. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html\\\">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        },\
        \"Hypervisor\":{\
          \"shape\":\"HypervisorType\",\
          \"documentation\":\"<p>The hypervisor type of the instance.</p>\",\
          \"locationName\":\"hypervisor\"\
        },\
        \"NetworkInterfaces\":{\
          \"shape\":\"InstanceNetworkInterfaceList\",\
          \"documentation\":\"<p>[EC2-VPC] One or more network interfaces for the instance.</p>\",\
          \"locationName\":\"networkInterfaceSet\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"IamInstanceProfile\",\
          \"documentation\":\"<p>The IAM instance profile associated with the instance, if applicable.</p>\",\
          \"locationName\":\"iamInstanceProfile\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p>\",\
          \"locationName\":\"ebsOptimized\"\
        },\
        \"SriovNetSupport\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies whether enhanced networking is enabled. </p>\",\
          \"locationName\":\"sriovNetSupport\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance.</p>\"\
    },\
    \"InstanceAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"KernelId\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The kernel ID.</p>\",\
          \"locationName\":\"kernel\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The RAM disk ID.</p>\",\
          \"locationName\":\"ramdisk\"\
        },\
        \"UserData\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The Base64-encoded MIME user data.</p>\",\
          \"locationName\":\"userData\"\
        },\
        \"DisableApiTermination\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>If the value is <code>true</code>, you can't terminate the instance through the Amazon EC2 console, CLI, or API; otherwise, you can.</p>\",\
          \"locationName\":\"disableApiTermination\"\
        },\
        \"InstanceInitiatedShutdownBehavior\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>\",\
          \"locationName\":\"instanceInitiatedShutdownBehavior\"\
        },\
        \"RootDeviceName\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>The name of the root device (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p>\",\
          \"locationName\":\"rootDeviceName\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"InstanceBlockDeviceMappingList\",\
          \"documentation\":\"<p>The block device mapping of the instance.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeList\",\
          \"documentation\":\"<p>A list of product codes.</p>\",\
          \"locationName\":\"productCodes\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether the instance is optimized for EBS I/O.</p>\",\
          \"locationName\":\"ebsOptimized\"\
        },\
        \"SriovNetSupport\":{\
          \"shape\":\"AttributeValue\",\
          \"locationName\":\"sriovNetSupport\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether source/destination checking is enabled. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>The security groups associated with the instance.</p>\",\
          \"locationName\":\"groupSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance attribute.</p>\"\
    },\
    \"InstanceAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"instanceType\",\
        \"kernel\",\
        \"ramdisk\",\
        \"userData\",\
        \"disableApiTermination\",\
        \"instanceInitiatedShutdownBehavior\",\
        \"rootDeviceName\",\
        \"blockDeviceMapping\",\
        \"productCodes\",\
        \"sourceDestCheck\",\
        \"groupSet\",\
        \"ebsOptimized\",\
        \"sriovNetSupport\"\
      ]\
    },\
    \"InstanceBlockDeviceMapping\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>\",\
          \"locationName\":\"deviceName\"\
        },\
        \"Ebs\":{\
          \"shape\":\"EbsInstanceBlockDevice\",\
          \"documentation\":\"<p>Parameters used to automatically set up EBS volumes when the instance is launched.</p>\",\
          \"locationName\":\"ebs\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device mapping.</p>\"\
    },\
    \"InstanceBlockDeviceMappingList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceBlockDeviceMapping\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceBlockDeviceMappingSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>\",\
          \"locationName\":\"deviceName\"\
        },\
        \"Ebs\":{\
          \"shape\":\"EbsInstanceBlockDeviceSpecification\",\
          \"documentation\":\"<p>Parameters used to automatically set up EBS volumes when the instance is launched.</p>\",\
          \"locationName\":\"ebs\"\
        },\
        \"VirtualName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The virtual device name.</p>\",\
          \"locationName\":\"virtualName\"\
        },\
        \"NoDevice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>suppress the specified device included in the block device mapping.</p>\",\
          \"locationName\":\"noDevice\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device mapping entry.</p>\"\
    },\
    \"InstanceBlockDeviceMappingSpecificationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceBlockDeviceMappingSpecification\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceCapacity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type size supported by the Dedicated host.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"AvailableCapacity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of instances that can still be launched onto the Dedicated host.</p>\",\
          \"locationName\":\"availableCapacity\"\
        },\
        \"TotalCapacity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The total number of instances that can be launched onto the Dedicated host.</p>\",\
          \"locationName\":\"totalCapacity\"\
        }\
      },\
      \"documentation\":\"<p>Information about the instance type that the Dedicated host supports.</p>\"\
    },\
    \"InstanceCount\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"ListingState\",\
          \"documentation\":\"<p>The states of the listed Reserved Instances.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of listed Reserved Instances in the state specified by the <code>state</code>.</p>\",\
          \"locationName\":\"instanceCount\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Reserved Instance listing state.</p>\"\
    },\
    \"InstanceCountList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceCount\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceExportDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the resource being exported.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"TargetEnvironment\":{\
          \"shape\":\"ExportEnvironment\",\
          \"documentation\":\"<p>The target virtualization environment.</p>\",\
          \"locationName\":\"targetEnvironment\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance to export.</p>\"\
    },\
    \"InstanceIdSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"InstanceId\"\
      }\
    },\
    \"InstanceLifecycleType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"spot\",\
        \"scheduled\"\
      ]\
    },\
    \"InstanceList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Instance\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceMonitoring\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"Monitoring\",\
          \"documentation\":\"<p>The monitoring information.</p>\",\
          \"locationName\":\"monitoring\"\
        }\
      },\
      \"documentation\":\"<p>Describes the monitoring information of the instance.</p>\"\
    },\
    \"InstanceMonitoringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceMonitoring\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceNetworkInterface\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AWS account that created the network interface.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"Status\":{\
          \"shape\":\"NetworkInterfaceStatus\",\
          \"documentation\":\"<p>The status of the network interface.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"MacAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The MAC address.</p>\",\
          \"locationName\":\"macAddress\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP address of the network interface within the subnet.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"PrivateDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private DNS name.</p>\",\
          \"locationName\":\"privateDnsName\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to validate network traffic to or from this network interface.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>One or more security groups.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"Attachment\":{\
          \"shape\":\"InstanceNetworkInterfaceAttachment\",\
          \"documentation\":\"<p>The network interface attachment.</p>\",\
          \"locationName\":\"attachment\"\
        },\
        \"Association\":{\
          \"shape\":\"InstanceNetworkInterfaceAssociation\",\
          \"documentation\":\"<p>The association information for an Elastic IP associated with the network interface.</p>\",\
          \"locationName\":\"association\"\
        },\
        \"PrivateIpAddresses\":{\
          \"shape\":\"InstancePrivateIpAddressList\",\
          \"documentation\":\"<p>The private IP addresses associated with the network interface.</p>\",\
          \"locationName\":\"privateIpAddressesSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network interface.</p>\"\
    },\
    \"InstanceNetworkInterfaceAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public IP address or Elastic IP address bound to the network interface.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"PublicDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public DNS name.</p>\",\
          \"locationName\":\"publicDnsName\"\
        },\
        \"IpOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the owner of the Elastic IP address.</p>\",\
          \"locationName\":\"ipOwnerId\"\
        }\
      },\
      \"documentation\":\"<p>Describes association information for an Elastic IP address.</p>\"\
    },\
    \"InstanceNetworkInterfaceAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttachmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface attachment.</p>\",\
          \"locationName\":\"attachmentId\"\
        },\
        \"DeviceIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The index of the device on the instance for the network interface attachment.</p>\",\
          \"locationName\":\"deviceIndex\"\
        },\
        \"Status\":{\
          \"shape\":\"AttachmentStatus\",\
          \"documentation\":\"<p>The attachment state.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"AttachTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time stamp when the attachment initiated.</p>\",\
          \"locationName\":\"attachTime\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the network interface is deleted when the instance is terminated.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network interface attachment.</p>\"\
    },\
    \"InstanceNetworkInterfaceList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceNetworkInterface\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceNetworkInterfaceSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"DeviceIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The index of the device on the instance for the network interface attachment. If you are specifying a network interface in a <a>RunInstances</a> request, you must provide the device index.</p>\",\
          \"locationName\":\"deviceIndex\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet associated with the network string. Applies only if creating a network interface when launching an instance.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the network interface. Applies only if creating a network interface when launching an instance.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address of the network interface. Applies only if creating a network interface when launching an instance.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"Groups\":{\
          \"shape\":\"SecurityGroupIdStringList\",\
          \"documentation\":\"<p>The IDs of the security groups for the network interface. Applies only if creating a network interface when launching an instance.</p>\",\
          \"locationName\":\"SecurityGroupId\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If set to <code>true</code>, the interface is deleted when the instance is terminated. You can specify <code>true</code> only if creating a new network interface when launching an instance.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        },\
        \"PrivateIpAddresses\":{\
          \"shape\":\"PrivateIpAddressSpecificationList\",\
          \"documentation\":\"<p>One or more private IP addresses to assign to the network interface. Only one private IP address can be designated as primary.</p>\",\
          \"locationName\":\"privateIpAddressesSet\",\
          \"queryName\":\"PrivateIpAddresses\"\
        },\
        \"SecondaryPrivateIpAddressCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of secondary private IP addresses. You can't specify this option and specify more than one private IP address using the private IP addresses option.</p>\",\
          \"locationName\":\"secondaryPrivateIpAddressCount\"\
        },\
        \"AssociatePublicIpAddress\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to assign a public IP address to an instance you launch in a VPC. The public IP address can only be assigned to a network interface for eth0, and can only be assigned to a new network interface, not an existing one. You cannot specify more than one network interface in the request. If launching into a default subnet, the default value is <code>true</code>.</p>\",\
          \"locationName\":\"associatePublicIpAddress\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network interface.</p>\"\
    },\
    \"InstanceNetworkInterfaceSpecificationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceNetworkInterfaceSpecification\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstancePrivateIpAddress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address of the network interface.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"PrivateDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private DNS name.</p>\",\
          \"locationName\":\"privateDnsName\"\
        },\
        \"Primary\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this IP address is the primary private IP address of the network interface.</p>\",\
          \"locationName\":\"primary\"\
        },\
        \"Association\":{\
          \"shape\":\"InstanceNetworkInterfaceAssociation\",\
          \"documentation\":\"<p>The association information for an Elastic IP address for the network interface.</p>\",\
          \"locationName\":\"association\"\
        }\
      },\
      \"documentation\":\"<p>Describes a private IP address.</p>\"\
    },\
    \"InstancePrivateIpAddressList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstancePrivateIpAddress\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The low byte represents the state. The high byte is an opaque internal value and should be ignored.</p> <ul> <li> <p><code>0</code> : <code>pending</code></p> </li> <li> <p><code>16</code> : <code>running</code></p> </li> <li> <p><code>32</code> : <code>shutting-down</code></p> </li> <li> <p><code>48</code> : <code>terminated</code></p> </li> <li> <p><code>64</code> : <code>stopping</code></p> </li> <li> <p><code>80</code> : <code>stopped</code></p> </li> </ul>\",\
          \"locationName\":\"code\"\
        },\
        \"Name\":{\
          \"shape\":\"InstanceStateName\",\
          \"documentation\":\"<p>The current state of the instance.</p>\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>Describes the current state of the instance.</p>\"\
    },\
    \"InstanceStateChange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"CurrentState\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The current state of the instance.</p>\",\
          \"locationName\":\"currentState\"\
        },\
        \"PreviousState\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The previous state of the instance.</p>\",\
          \"locationName\":\"previousState\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance state change.</p>\"\
    },\
    \"InstanceStateChangeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceStateChange\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceStateName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"running\",\
        \"shutting-down\",\
        \"terminated\",\
        \"stopping\",\
        \"stopped\"\
      ]\
    },\
    \"InstanceStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone of the instance.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Events\":{\
          \"shape\":\"InstanceStatusEventList\",\
          \"documentation\":\"<p>Any scheduled events associated with the instance.</p>\",\
          \"locationName\":\"eventsSet\"\
        },\
        \"InstanceState\":{\
          \"shape\":\"InstanceState\",\
          \"documentation\":\"<p>The intended state of the instance. <a>DescribeInstanceStatus</a> requires that an instance be in the <code>running</code> state.</p>\",\
          \"locationName\":\"instanceState\"\
        },\
        \"SystemStatus\":{\
          \"shape\":\"InstanceStatusSummary\",\
          \"documentation\":\"<p>Reports impaired functionality that stems from issues related to the systems that support an instance, such as hardware failures and network connectivity problems.</p>\",\
          \"locationName\":\"systemStatus\"\
        },\
        \"InstanceStatus\":{\
          \"shape\":\"InstanceStatusSummary\",\
          \"documentation\":\"<p>Reports impaired functionality that stems from issues internal to the instance, such as impaired reachability.</p>\",\
          \"locationName\":\"instanceStatus\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of an instance.</p>\"\
    },\
    \"InstanceStatusDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StatusName\",\
          \"documentation\":\"<p>The type of instance status.</p>\",\
          \"locationName\":\"name\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusType\",\
          \"documentation\":\"<p>The status.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"ImpairedSince\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when a status check failed. For an instance that was launched and impaired, this is the time when the instance was launched.</p>\",\
          \"locationName\":\"impairedSince\"\
        }\
      },\
      \"documentation\":\"<p>Describes the instance status.</p>\"\
    },\
    \"InstanceStatusDetailsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceStatusDetails\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceStatusEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"EventCode\",\
          \"documentation\":\"<p>The event code.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the event.</p> <p>After a scheduled event is completed, it can still be described for up to a week. If the event has been completed, this description starts with the following text: [Completed].</p>\",\
          \"locationName\":\"description\"\
        },\
        \"NotBefore\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The earliest scheduled start time for the event.</p>\",\
          \"locationName\":\"notBefore\"\
        },\
        \"NotAfter\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The latest scheduled end time for the event.</p>\",\
          \"locationName\":\"notAfter\"\
        }\
      },\
      \"documentation\":\"<p>Describes a scheduled event for an instance.</p>\"\
    },\
    \"InstanceStatusEventList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceStatusEvent\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InstanceStatus\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InstanceStatusSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"SummaryStatus\",\
          \"documentation\":\"<p>The status.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"Details\":{\
          \"shape\":\"InstanceStatusDetailsList\",\
          \"documentation\":\"<p>The system instance health or application instance health.</p>\",\
          \"locationName\":\"details\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of an instance.</p>\"\
    },\
    \"InstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"t1.micro\",\
        \"m1.small\",\
        \"m1.medium\",\
        \"m1.large\",\
        \"m1.xlarge\",\
        \"m3.medium\",\
        \"m3.large\",\
        \"m3.xlarge\",\
        \"m3.2xlarge\",\
        \"m4.large\",\
        \"m4.xlarge\",\
        \"m4.2xlarge\",\
        \"m4.4xlarge\",\
        \"m4.10xlarge\",\
        \"t2.nano\",\
        \"t2.micro\",\
        \"t2.small\",\
        \"t2.medium\",\
        \"t2.large\",\
        \"m2.xlarge\",\
        \"m2.2xlarge\",\
        \"m2.4xlarge\",\
        \"cr1.8xlarge\",\
        \"i2.xlarge\",\
        \"i2.2xlarge\",\
        \"i2.4xlarge\",\
        \"i2.8xlarge\",\
        \"hi1.4xlarge\",\
        \"hs1.8xlarge\",\
        \"c1.medium\",\
        \"c1.xlarge\",\
        \"c3.large\",\
        \"c3.xlarge\",\
        \"c3.2xlarge\",\
        \"c3.4xlarge\",\
        \"c3.8xlarge\",\
        \"c4.large\",\
        \"c4.xlarge\",\
        \"c4.2xlarge\",\
        \"c4.4xlarge\",\
        \"c4.8xlarge\",\
        \"cc1.4xlarge\",\
        \"cc2.8xlarge\",\
        \"g2.2xlarge\",\
        \"g2.8xlarge\",\
        \"cg1.4xlarge\",\
        \"r3.large\",\
        \"r3.xlarge\",\
        \"r3.2xlarge\",\
        \"r3.4xlarge\",\
        \"r3.8xlarge\",\
        \"d2.xlarge\",\
        \"d2.2xlarge\",\
        \"d2.4xlarge\",\
        \"d2.8xlarge\"\
      ]\
    },\
    \"InstanceTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceType\"}\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InternetGateway\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InternetGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Internet gateway.</p>\",\
          \"locationName\":\"internetGatewayId\"\
        },\
        \"Attachments\":{\
          \"shape\":\"InternetGatewayAttachmentList\",\
          \"documentation\":\"<p>Any VPCs attached to the Internet gateway.</p>\",\
          \"locationName\":\"attachmentSet\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the Internet gateway.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes an Internet gateway.</p>\"\
    },\
    \"InternetGatewayAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"State\":{\
          \"shape\":\"AttachmentStatus\",\
          \"documentation\":\"<p>The current state of the attachment.</p>\",\
          \"locationName\":\"state\"\
        }\
      },\
      \"documentation\":\"<p>Describes the attachment of a VPC to an Internet gateway.</p>\"\
    },\
    \"InternetGatewayAttachmentList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InternetGatewayAttachment\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"InternetGatewayList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"InternetGateway\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"IpPermission\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IpProtocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol name (for <code>tcp</code>, <code>udp</code>, and <code>icmp</code>) or number (see <a href=\\\"http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml\\\">Protocol Numbers</a>). </p> <p>[EC2-VPC only] When you authorize or revoke security group rules, you can use <code>-1</code> to specify all.</p>\",\
          \"locationName\":\"ipProtocol\"\
        },\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types.</p>\",\
          \"locationName\":\"fromPort\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of port range for the TCP and UDP protocols, or an ICMP code. A value of <code>-1</code> indicates all ICMP codes for the specified ICMP type.</p>\",\
          \"locationName\":\"toPort\"\
        },\
        \"UserIdGroupPairs\":{\
          \"shape\":\"UserIdGroupPairList\",\
          \"documentation\":\"<p>One or more security group and AWS account ID pairs.</p>\",\
          \"locationName\":\"groups\"\
        },\
        \"IpRanges\":{\
          \"shape\":\"IpRangeList\",\
          \"documentation\":\"<p>One or more IP ranges.</p>\",\
          \"locationName\":\"ipRanges\"\
        },\
        \"PrefixListIds\":{\
          \"shape\":\"PrefixListIdList\",\
          \"documentation\":\"<p>(Valid for <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupEgress</a> and <a>DescribeSecurityGroups</a> only) One or more prefix list IDs for an AWS service. In an <a>AuthorizeSecurityGroupEgress</a> request, this is the AWS service that you want to access through a VPC endpoint from instances associated with the security group.</p>\",\
          \"locationName\":\"prefixListIds\"\
        }\
      },\
      \"documentation\":\"<p>Describes a security group rule.</p>\"\
    },\
    \"IpPermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"IpPermission\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"IpRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CidrIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR range. You can either specify a CIDR range or a source security group, not both.</p>\",\
          \"locationName\":\"cidrIp\"\
        }\
      },\
      \"documentation\":\"<p>Describes an IP range.</p>\"\
    },\
    \"IpRangeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"IpRange\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"IpRanges\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"KeyNameStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"KeyName\"\
      }\
    },\
    \"KeyPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"KeyFingerprint\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The SHA-1 digest of the DER encoded private key.</p>\",\
          \"locationName\":\"keyFingerprint\"\
        },\
        \"KeyMaterial\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>An unencrypted PEM encoded RSA private key.</p>\",\
          \"locationName\":\"keyMaterial\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key pair.</p>\"\
    },\
    \"KeyPairInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"KeyFingerprint\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If you used <a>CreateKeyPair</a> to create the key pair, this is the SHA-1 digest of the DER encoded private key. If you used <a>ImportKeyPair</a> to provide AWS the public key, this is the MD5 public key fingerprint as specified in section 4 of RFC4716.</p>\",\
          \"locationName\":\"keyFingerprint\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key pair.</p>\"\
    },\
    \"KeyPairList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"KeyPairInfo\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"LaunchPermission\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID.</p>\",\
          \"locationName\":\"userId\"\
        },\
        \"Group\":{\
          \"shape\":\"PermissionGroup\",\
          \"documentation\":\"<p>The name of the group.</p>\",\
          \"locationName\":\"group\"\
        }\
      },\
      \"documentation\":\"<p>Describes a launch permission.</p>\"\
    },\
    \"LaunchPermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"LaunchPermission\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"LaunchPermissionModifications\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Add\":{\
          \"shape\":\"LaunchPermissionList\",\
          \"documentation\":\"<p>The AWS account ID to add to the list of launch permissions for the AMI.</p>\"\
        },\
        \"Remove\":{\
          \"shape\":\"LaunchPermissionList\",\
          \"documentation\":\"<p>The AWS account ID to remove from the list of launch permissions for the AMI.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a launch permission modification.</p>\"\
    },\
    \"LaunchSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>One or more security groups. When requesting instances in a VPC, you must specify the IDs of the security groups. When requesting instances in EC2-Classic, you can specify the names or the IDs of the security groups.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"UserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Base64-encoded MIME user data to make available to the instances.</p>\",\
          \"locationName\":\"userData\"\
        },\
        \"AddressingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Deprecated.</p>\",\
          \"locationName\":\"addressingType\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Placement\":{\
          \"shape\":\"SpotPlacement\",\
          \"documentation\":\"<p>The placement information for the instance.</p>\",\
          \"locationName\":\"placement\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the kernel.</p>\",\
          \"locationName\":\"kernelId\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the RAM disk.</p>\",\
          \"locationName\":\"ramdiskId\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingList\",\
          \"documentation\":\"<p>One or more block device mapping entries.</p> <p>Although you can specify encrypted EBS volumes in this block device mapping for your Spot Instances, these volumes are not encrypted.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet in which to launch the instance.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"NetworkInterfaces\":{\
          \"shape\":\"InstanceNetworkInterfaceSpecificationList\",\
          \"documentation\":\"<p>One or more network interfaces.</p>\",\
          \"locationName\":\"networkInterfaceSet\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"IamInstanceProfileSpecification\",\
          \"documentation\":\"<p>The IAM instance profile.</p>\",\
          \"locationName\":\"iamInstanceProfile\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"ebsOptimized\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"RunInstancesMonitoringEnabled\",\
          \"locationName\":\"monitoring\"\
        }\
      },\
      \"documentation\":\"<p>Describes the launch specification for an instance.</p>\"\
    },\
    \"LaunchSpecsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SpotFleetLaunchSpecification\",\
        \"locationName\":\"item\"\
      },\
      \"min\":1\
    },\
    \"ListingState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"available\",\
        \"sold\",\
        \"cancelled\",\
        \"pending\"\
      ]\
    },\
    \"ListingStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"pending\",\
        \"cancelled\",\
        \"closed\"\
      ]\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":255,\
      \"min\":5\
    },\
    \"ModifyHostsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HostIds\",\
        \"AutoPlacement\"\
      ],\
      \"members\":{\
        \"HostIds\":{\
          \"shape\":\"RequestHostIdList\",\
          \"documentation\":\"<p>The host IDs of the Dedicated hosts you want to modify.</p>\",\
          \"locationName\":\"hostId\"\
        },\
        \"AutoPlacement\":{\
          \"shape\":\"AutoPlacement\",\
          \"documentation\":\"<p>Specify whether to enable or disable auto-placement.</p>\",\
          \"locationName\":\"autoPlacement\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyHosts.</p>\"\
    },\
    \"ModifyHostsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Successful\":{\
          \"shape\":\"ResponseHostIdList\",\
          \"documentation\":\"<p>The IDs of the Dedicated hosts that were successfully modified.</p>\",\
          \"locationName\":\"successful\"\
        },\
        \"Unsuccessful\":{\
          \"shape\":\"UnsuccessfulItemList\",\
          \"documentation\":\"<p>The IDs of the Dedicated hosts that could not be modified. Check whether the setting you requested can be used.</p>\",\
          \"locationName\":\"unsuccessful\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ModifyHosts.</p>\"\
    },\
    \"ModifyIdFormatRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Resource\",\
        \"UseLongIds\"\
      ],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of resource.</p>\"\
        },\
        \"UseLongIds\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicate whether the resource should use longer IDs (17-character IDs).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters of ModifyIdFormat.</p>\"\
    },\
    \"ModifyImageAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ImageId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the attribute to modify.</p>\"\
        },\
        \"OperationType\":{\
          \"shape\":\"OperationType\",\
          \"documentation\":\"<p>The operation type.</p>\"\
        },\
        \"UserIds\":{\
          \"shape\":\"UserIdStringList\",\
          \"documentation\":\"<p>One or more AWS account IDs. This is only valid when modifying the <code>launchPermission</code> attribute.</p>\",\
          \"locationName\":\"UserId\"\
        },\
        \"UserGroups\":{\
          \"shape\":\"UserGroupStringList\",\
          \"documentation\":\"<p>One or more user groups. This is only valid when modifying the <code>launchPermission</code> attribute.</p>\",\
          \"locationName\":\"UserGroup\"\
        },\
        \"ProductCodes\":{\
          \"shape\":\"ProductCodeStringList\",\
          \"documentation\":\"<p>One or more product codes. After you add a product code to an AMI, it can't be removed. This is only valid when modifying the <code>productCodes</code> attribute.</p>\",\
          \"locationName\":\"ProductCode\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the attribute being modified. This is only valid when modifying the <code>description</code> attribute.</p>\"\
        },\
        \"LaunchPermission\":{\
          \"shape\":\"LaunchPermissionModifications\",\
          \"documentation\":\"<p>A launch permission modification.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>A description for the AMI.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyImageAttribute.</p>\"\
    },\
    \"ModifyInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Attribute\":{\
          \"shape\":\"InstanceAttributeName\",\
          \"documentation\":\"<p>The name of the attribute.</p>\",\
          \"locationName\":\"attribute\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A new value for the attribute. Use only with the <code>kernel</code>, <code>ramdisk</code>, <code>userData</code>, <code>disableApiTermination</code>, or <code>instanceInitiatedShutdownBehavior</code> attribute.</p>\",\
          \"locationName\":\"value\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"InstanceBlockDeviceMappingSpecificationList\",\
          \"documentation\":\"<p>Modifies the <code>DeleteOnTermination</code> attribute for volumes that are currently attached. The volume must be owned by the caller. If no value is specified for <code>DeleteOnTermination</code>, the default is <code>true</code> and the volume is deleted when the instance is terminated.</p> <p>To add instance store volumes to an Amazon EBS-backed instance, you must add them when you launch the instance. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html#Using_OverridingAMIBDM\\\">Updating the Block Device Mapping when Launching an Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Specifies whether source/destination checking is enabled. A value of <code>true</code> means that checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT.</p>\"\
        },\
        \"DisableApiTermination\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>If the value is <code>true</code>, you can't terminate the instance using the Amazon EC2 console, CLI, or API; otherwise, you can. You cannot use this paramater for Spot Instances.</p>\",\
          \"locationName\":\"disableApiTermination\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>Changes the instance type to the specified value. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance Types</a>. If the instance type is not valid, the error returned is <code>InvalidInstanceAttributeValue</code>.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Kernel\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>Changes the instance's kernel to the specified value. We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html\\\">PV-GRUB</a>.</p>\",\
          \"locationName\":\"kernel\"\
        },\
        \"Ramdisk\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>Changes the instance's RAM disk to the specified value. We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html\\\">PV-GRUB</a>.</p>\",\
          \"locationName\":\"ramdisk\"\
        },\
        \"UserData\":{\
          \"shape\":\"BlobAttributeValue\",\
          \"documentation\":\"<p>Changes the instance's user data to the specified base64-encoded value. For command line tools, base64 encoding is performed for you.</p>\",\
          \"locationName\":\"userData\"\
        },\
        \"InstanceInitiatedShutdownBehavior\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>Specifies whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>\",\
          \"locationName\":\"instanceInitiatedShutdownBehavior\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdStringList\",\
          \"documentation\":\"<p>[EC2-VPC] Changes the security groups of the instance. You must specify at least one security group, even if it's just the default security group for the VPC. You must specify the security group ID, not the security group name.</p>\",\
          \"locationName\":\"GroupId\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Specifies whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p>\",\
          \"locationName\":\"ebsOptimized\"\
        },\
        \"SriovNetSupport\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>Set to <code>simple</code> to enable enhanced networking for the instance.</p> <p>There is no way to disable enhanced networking at this time.</p> <p>This option is supported only for HVM instances. Specifying this option with a PV instance can make it unreachable.</p>\",\
          \"locationName\":\"sriovNetSupport\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyInstanceAttribute.</p>\"\
    },\
    \"ModifyInstancePlacementRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance that you are modifying.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Tenancy\":{\
          \"shape\":\"HostTenancy\",\
          \"documentation\":\"<p>The tenancy of the instance that you are modifying.</p>\",\
          \"locationName\":\"tenancy\"\
        },\
        \"Affinity\":{\
          \"shape\":\"Affinity\",\
          \"documentation\":\"<p>The new affinity setting for the instance.</p>\",\
          \"locationName\":\"affinity\"\
        },\
        \"HostId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Dedicated host that the instance will have affinity with.</p>\",\
          \"locationName\":\"hostId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyInstancePlacement.</p>\"\
    },\
    \"ModifyInstancePlacementResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Is <code>true</code> if the request succeeds, and an error otherwise.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ModifyInstancePlacement.</p>\"\
    },\
    \"ModifyNetworkInterfaceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NetworkInterfaceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"Description\":{\
          \"shape\":\"AttributeValue\",\
          \"documentation\":\"<p>A description for the network interface.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether source/destination checking is enabled. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html\\\">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        },\
        \"Groups\":{\
          \"shape\":\"SecurityGroupIdStringList\",\
          \"documentation\":\"<p>Changes the security groups for the network interface. The new set of groups you specify replaces the current set. You must specify at least one group, even if it's just the default security group in the VPC. You must specify the ID of the security group, not the name.</p>\",\
          \"locationName\":\"SecurityGroupId\"\
        },\
        \"Attachment\":{\
          \"shape\":\"NetworkInterfaceAttachmentChanges\",\
          \"documentation\":\"<p>Information about the interface attachment. If modifying the 'delete on termination' attribute, you must specify the ID of the interface attachment.</p>\",\
          \"locationName\":\"attachment\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyNetworkInterfaceAttribute.</p>\"\
    },\
    \"ModifyReservedInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReservedInstancesIds\",\
        \"TargetConfigurations\"\
      ],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive token you provide to ensure idempotency of your modification request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"ReservedInstancesIds\":{\
          \"shape\":\"ReservedInstancesIdStringList\",\
          \"documentation\":\"<p>The IDs of the Reserved Instances to modify.</p>\",\
          \"locationName\":\"ReservedInstancesId\"\
        },\
        \"TargetConfigurations\":{\
          \"shape\":\"ReservedInstancesConfigurationList\",\
          \"documentation\":\"<p>The configuration settings for the Reserved Instances to modify.</p>\",\
          \"locationName\":\"ReservedInstancesConfigurationSetItemType\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyReservedInstances.</p>\"\
    },\
    \"ModifyReservedInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesModificationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID for the modification.</p>\",\
          \"locationName\":\"reservedInstancesModificationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ModifyReservedInstances.</p>\"\
    },\
    \"ModifySnapshotAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SnapshotId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the snapshot.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"SnapshotAttributeName\",\
          \"documentation\":\"<p>The snapshot attribute to modify.</p> <note> <p>Only volume creation permissions may be modified at the customer level.</p> </note>\"\
        },\
        \"OperationType\":{\
          \"shape\":\"OperationType\",\
          \"documentation\":\"<p>The type of operation to perform to the attribute.</p>\"\
        },\
        \"UserIds\":{\
          \"shape\":\"UserIdStringList\",\
          \"documentation\":\"<p>The account ID to modify for the snapshot.</p>\",\
          \"locationName\":\"UserId\"\
        },\
        \"GroupNames\":{\
          \"shape\":\"GroupNameStringList\",\
          \"documentation\":\"<p>The group to modify for the snapshot.</p>\",\
          \"locationName\":\"UserGroup\"\
        },\
        \"CreateVolumePermission\":{\
          \"shape\":\"CreateVolumePermissionModifications\",\
          \"documentation\":\"<p>A JSON representation of the snapshot attribute modification.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifySnapshotAttribute.</p>\"\
    },\
    \"ModifySpotFleetRequestRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotFleetRequestId\"],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"TargetCapacity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the fleet.</p>\",\
          \"locationName\":\"targetCapacity\"\
        },\
        \"ExcessCapacityTerminationPolicy\":{\
          \"shape\":\"ExcessCapacityTerminationPolicy\",\
          \"documentation\":\"<p>Indicates whether running Spot instances should be terminated if the target capacity of the Spot fleet request is decreased below the current size of the Spot fleet.</p>\",\
          \"locationName\":\"excessCapacityTerminationPolicy\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifySpotFleetRequest.</p>\"\
    },\
    \"ModifySpotFleetRequestResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Is <code>true</code> if the request succeeds, and an error otherwise.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ModifySpotFleetRequest.</p>\"\
    },\
    \"ModifySubnetAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubnetId\"],\
      \"members\":{\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"MapPublicIpOnLaunch\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Specify <code>true</code> to indicate that instances launched into the specified subnet should be assigned public IP address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifySubnetAttribute.</p>\"\
    },\
    \"ModifyVolumeAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VolumeId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\"\
        },\
        \"AutoEnableIO\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether the volume should be auto-enabled for I/O operations.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyVolumeAttribute.</p>\"\
    },\
    \"ModifyVpcAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcId\"],\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"EnableDnsSupport\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether the DNS resolution is supported for the VPC. If enabled, queries to the Amazon provided DNS server at the 169.254.169.253 IP address, or the reserved IP address at the base of the VPC network range \\\"plus two\\\" will succeed. If disabled, the Amazon provided DNS service in the VPC that resolves public DNS hostnames to IP addresses is not enabled. </p> <p>You cannot modify the DNS resolution and DNS hostnames attributes in the same request. Use separate requests for each attribute.</p>\"\
        },\
        \"EnableDnsHostnames\":{\
          \"shape\":\"AttributeBooleanValue\",\
          \"documentation\":\"<p>Indicates whether the instances launched in the VPC get DNS hostnames. If enabled, instances in the VPC get DNS hostnames; otherwise, they do not.</p> <p>You cannot modify the DNS resolution and DNS hostnames attributes in the same request. Use separate requests for each attribute. You can only enable DNS hostnames if you've enabled DNS support.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyVpcAttribute.</p>\"\
    },\
    \"ModifyVpcEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcEndpointId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"VpcEndpointId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the endpoint.</p>\"\
        },\
        \"ResetPolicy\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specify <code>true</code> to reset the policy document to the default policy. The default policy allows access to the service.</p>\"\
        },\
        \"PolicyDocument\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A policy document to attach to the endpoint. The policy must be in valid JSON format. </p>\"\
        },\
        \"AddRouteTableIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more route tables IDs to associate with the endpoint.</p>\",\
          \"locationName\":\"AddRouteTableId\"\
        },\
        \"RemoveRouteTableIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more route table IDs to disassociate from the endpoint.</p>\",\
          \"locationName\":\"RemoveRouteTableId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ModifyVpcEndpoint.</p>\"\
    },\
    \"ModifyVpcEndpointResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ModifyVpcEndpoint.</p>\"\
    },\
    \"ModifyVpcPeeringConnectionOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcPeeringConnectionId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the operation, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\"\
        },\
        \"RequesterPeeringConnectionOptions\":{\
          \"shape\":\"PeeringConnectionOptionsRequest\",\
          \"documentation\":\"<p>The VPC peering connection options for the requester VPC.</p>\"\
        },\
        \"AccepterPeeringConnectionOptions\":{\
          \"shape\":\"PeeringConnectionOptionsRequest\",\
          \"documentation\":\"<p>The VPC peering connection options for the accepter VPC.</p>\"\
        }\
      }\
    },\
    \"ModifyVpcPeeringConnectionOptionsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequesterPeeringConnectionOptions\":{\
          \"shape\":\"PeeringConnectionOptions\",\
          \"documentation\":\"<p>Information about the VPC peering connection options for the requester VPC.</p>\",\
          \"locationName\":\"requesterPeeringConnectionOptions\"\
        },\
        \"AccepterPeeringConnectionOptions\":{\
          \"shape\":\"PeeringConnectionOptions\",\
          \"documentation\":\"<p>Information about the VPC peering connection options for the accepter VPC.</p>\",\
          \"locationName\":\"accepterPeeringConnectionOptions\"\
        }\
      }\
    },\
    \"MonitorInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for MonitorInstances.</p>\"\
    },\
    \"MonitorInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceMonitorings\":{\
          \"shape\":\"InstanceMonitoringList\",\
          \"documentation\":\"<p>Monitoring information for one or more instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of MonitorInstances.</p>\"\
    },\
    \"Monitoring\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"MonitoringState\",\
          \"documentation\":\"<p>Indicates whether monitoring is enabled for the instance.</p>\",\
          \"locationName\":\"state\"\
        }\
      },\
      \"documentation\":\"<p>Describes the monitoring for the instance.</p>\"\
    },\
    \"MonitoringState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"disabled\",\
        \"disabling\",\
        \"enabled\",\
        \"pending\"\
      ]\
    },\
    \"MoveAddressToVpcRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PublicIp\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address.</p>\",\
          \"locationName\":\"publicIp\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for MoveAddressToVpc.</p>\"\
    },\
    \"MoveAddressToVpcResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The allocation ID for the Elastic IP address.</p>\",\
          \"locationName\":\"allocationId\"\
        },\
        \"Status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>The status of the move of the IP address.</p>\",\
          \"locationName\":\"status\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of MoveAddressToVpc.</p>\"\
    },\
    \"MoveStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"movingToVpc\",\
        \"restoringToClassic\"\
      ]\
    },\
    \"MovingAddressStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"MoveStatus\":{\
          \"shape\":\"MoveStatus\",\
          \"documentation\":\"<p>The status of the Elastic IP address that's being moved to the EC2-VPC platform, or restored to the EC2-Classic platform.</p>\",\
          \"locationName\":\"moveStatus\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of a moving Elastic IP address.</p>\"\
    },\
    \"MovingAddressStatusSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"MovingAddressStatus\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NatGateway\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC in which the NAT gateway is located.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet in which the NAT gateway is located.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"NatGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the NAT gateway.</p>\",\
          \"locationName\":\"natGatewayId\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the NAT gateway was created.</p>\",\
          \"locationName\":\"createTime\"\
        },\
        \"DeleteTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the NAT gateway was deleted, if applicable.</p>\",\
          \"locationName\":\"deleteTime\"\
        },\
        \"NatGatewayAddresses\":{\
          \"shape\":\"NatGatewayAddressList\",\
          \"documentation\":\"<p>Information about the IP addresses and network interface associated with the NAT gateway.</p>\",\
          \"locationName\":\"natGatewayAddressSet\"\
        },\
        \"State\":{\
          \"shape\":\"NatGatewayState\",\
          \"documentation\":\"<p>The state of the NAT gateway.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"FailureCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the NAT gateway could not be created, specifies the error code for the failure. (<code>InsufficientFreeAddressesInSubnet</code> | <code>Gateway.NotAttached</code> | <code>InvalidAllocationID.NotFound</code> | <code>Resource.AlreadyAssociated</code> | <code>InternalError</code> | <code>InvalidSubnetID.NotFound</code>)</p>\",\
          \"locationName\":\"failureCode\"\
        },\
        \"FailureMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the NAT gateway could not be created, specifies the error message for the failure, that corresponds to the error code. </p> <ul> <li><p>For InsufficientFreeAddressesInSubnet: \\\"Subnet has insufficient free addresses to create this NAT gateway\\\"</p></li> <li><p>For Gateway.NotAttached: \\\"Network vpc-xxxxxxxx has no Internet gateway attached\\\"</p></li> <li><p>For InvalidAllocationID.NotFound: \\\"Elastic IP address eipalloc-xxxxxxxx could not be associated with this NAT gateway\\\"</p></li> <li><p>For Resource.AlreadyAssociated: \\\"Elastic IP address eipalloc-xxxxxxxx is already associated\\\"</p></li> <li><p>For InternalError: \\\"Network interface eni-xxxxxxxx, created and used internally by this NAT gateway is in an invalid state. Please try again.\\\"</p></li> <li><p>For InvalidSubnetID.NotFound: \\\"The specified subnet subnet-xxxxxxxx does not exist or could not be found.\\\"</p></li> </ul>\",\
          \"locationName\":\"failureMessage\"\
        }\
      },\
      \"documentation\":\"<p>Describes a NAT gateway.</p>\"\
    },\
    \"NatGatewayAddress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address associated with the NAT gateway.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The allocation ID of the Elastic IP address that's associated with the NAT gateway.</p>\",\
          \"locationName\":\"allocationId\"\
        },\
        \"PrivateIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address associated with the Elastic IP address.</p>\",\
          \"locationName\":\"privateIp\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface associated with the NAT gateway.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        }\
      },\
      \"documentation\":\"<p>Describes the IP addresses and network interface associated with a NAT gateway.</p>\"\
    },\
    \"NatGatewayAddressList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NatGatewayAddress\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NatGatewayList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NatGateway\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NatGatewayState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"failed\",\
        \"available\",\
        \"deleting\",\
        \"deleted\"\
      ]\
    },\
    \"NetworkAcl\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network ACL.</p>\",\
          \"locationName\":\"networkAclId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC for the network ACL.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"IsDefault\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this is the default network ACL for the VPC.</p>\",\
          \"locationName\":\"default\"\
        },\
        \"Entries\":{\
          \"shape\":\"NetworkAclEntryList\",\
          \"documentation\":\"<p>One or more entries (rules) in the network ACL.</p>\",\
          \"locationName\":\"entrySet\"\
        },\
        \"Associations\":{\
          \"shape\":\"NetworkAclAssociationList\",\
          \"documentation\":\"<p>Any associations between the network ACL and one or more subnets</p>\",\
          \"locationName\":\"associationSet\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the network ACL.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network ACL.</p>\"\
    },\
    \"NetworkAclAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkAclAssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the association between a network ACL and a subnet.</p>\",\
          \"locationName\":\"networkAclAssociationId\"\
        },\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network ACL.</p>\",\
          \"locationName\":\"networkAclId\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\",\
          \"locationName\":\"subnetId\"\
        }\
      },\
      \"documentation\":\"<p>Describes an association between a network ACL and a subnet.</p>\"\
    },\
    \"NetworkAclAssociationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NetworkAclAssociation\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NetworkAclEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The rule number for the entry. ACL entries are processed in ascending order by rule number.</p>\",\
          \"locationName\":\"ruleNumber\"\
        },\
        \"Protocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The protocol. A value of <code>-1</code> means all protocols.</p>\",\
          \"locationName\":\"protocol\"\
        },\
        \"RuleAction\":{\
          \"shape\":\"RuleAction\",\
          \"documentation\":\"<p>Indicates whether to allow or deny the traffic that matches the rule.</p>\",\
          \"locationName\":\"ruleAction\"\
        },\
        \"Egress\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the rule is an egress rule (applied to traffic leaving the subnet).</p>\",\
          \"locationName\":\"egress\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network range to allow or deny, in CIDR notation.</p>\",\
          \"locationName\":\"cidrBlock\"\
        },\
        \"IcmpTypeCode\":{\
          \"shape\":\"IcmpTypeCode\",\
          \"documentation\":\"<p>ICMP protocol: The ICMP type and code.</p>\",\
          \"locationName\":\"icmpTypeCode\"\
        },\
        \"PortRange\":{\
          \"shape\":\"PortRange\",\
          \"documentation\":\"<p>TCP or UDP protocols: The range of ports the rule applies to.</p>\",\
          \"locationName\":\"portRange\"\
        }\
      },\
      \"documentation\":\"<p>Describes an entry in a network ACL.</p>\"\
    },\
    \"NetworkAclEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NetworkAclEntry\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NetworkAclList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NetworkAcl\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NetworkInterface\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the network interface.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"RequesterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the entity that launched the instance on your behalf (for example, AWS Management Console or Auto Scaling).</p>\",\
          \"locationName\":\"requesterId\"\
        },\
        \"RequesterManaged\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the network interface is being managed by AWS.</p>\",\
          \"locationName\":\"requesterManaged\"\
        },\
        \"Status\":{\
          \"shape\":\"NetworkInterfaceStatus\",\
          \"documentation\":\"<p>The status of the network interface.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"MacAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The MAC address.</p>\",\
          \"locationName\":\"macAddress\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP address of the network interface within the subnet.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"PrivateDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private DNS name.</p>\",\
          \"locationName\":\"privateDnsName\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether traffic to or from the instance is validated.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>Any security groups for the network interface.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"Attachment\":{\
          \"shape\":\"NetworkInterfaceAttachment\",\
          \"documentation\":\"<p>The network interface attachment.</p>\",\
          \"locationName\":\"attachment\"\
        },\
        \"Association\":{\
          \"shape\":\"NetworkInterfaceAssociation\",\
          \"documentation\":\"<p>The association information for an Elastic IP associated with the network interface.</p>\",\
          \"locationName\":\"association\"\
        },\
        \"TagSet\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the network interface.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"PrivateIpAddresses\":{\
          \"shape\":\"NetworkInterfacePrivateIpAddressList\",\
          \"documentation\":\"<p>The private IP addresses associated with the network interface.</p>\",\
          \"locationName\":\"privateIpAddressesSet\"\
        },\
        \"InterfaceType\":{\
          \"shape\":\"NetworkInterfaceType\",\
          \"documentation\":\"<p>The type of interface. </p>\",\
          \"locationName\":\"interfaceType\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network interface.</p>\"\
    },\
    \"NetworkInterfaceAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The address of the Elastic IP address bound to the network interface.</p>\",\
          \"locationName\":\"publicIp\"\
        },\
        \"PublicDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The public DNS name.</p>\",\
          \"locationName\":\"publicDnsName\"\
        },\
        \"IpOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Elastic IP address owner.</p>\",\
          \"locationName\":\"ipOwnerId\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The allocation ID.</p>\",\
          \"locationName\":\"allocationId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The association ID.</p>\",\
          \"locationName\":\"associationId\"\
        }\
      },\
      \"documentation\":\"<p>Describes association information for an Elastic IP address.</p>\"\
    },\
    \"NetworkInterfaceAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttachmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface attachment.</p>\",\
          \"locationName\":\"attachmentId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"InstanceOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the instance.</p>\",\
          \"locationName\":\"instanceOwnerId\"\
        },\
        \"DeviceIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The device index of the network interface attachment on the instance.</p>\",\
          \"locationName\":\"deviceIndex\"\
        },\
        \"Status\":{\
          \"shape\":\"AttachmentStatus\",\
          \"documentation\":\"<p>The attachment state.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"AttachTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The timestamp indicating when the attachment initiated.</p>\",\
          \"locationName\":\"attachTime\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the network interface is deleted when the instance is terminated.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network interface attachment.</p>\"\
    },\
    \"NetworkInterfaceAttachmentChanges\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttachmentId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface attachment.</p>\",\
          \"locationName\":\"attachmentId\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the network interface is deleted when the instance is terminated.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        }\
      },\
      \"documentation\":\"<p>Describes an attachment change.</p>\"\
    },\
    \"NetworkInterfaceAttribute\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"description\",\
        \"groupSet\",\
        \"sourceDestCheck\",\
        \"attachment\"\
      ]\
    },\
    \"NetworkInterfaceIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NetworkInterfaceList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NetworkInterface\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NetworkInterfacePrivateIpAddress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP address.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"PrivateDnsName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private DNS name.</p>\",\
          \"locationName\":\"privateDnsName\"\
        },\
        \"Primary\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this IP address is the primary private IP address of the network interface.</p>\",\
          \"locationName\":\"primary\"\
        },\
        \"Association\":{\
          \"shape\":\"NetworkInterfaceAssociation\",\
          \"documentation\":\"<p>The association information for an Elastic IP address associated with the network interface.</p>\",\
          \"locationName\":\"association\"\
        }\
      },\
      \"documentation\":\"<p>Describes the private IP address of a network interface.</p>\"\
    },\
    \"NetworkInterfacePrivateIpAddressList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NetworkInterfacePrivateIpAddress\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NetworkInterfaceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"available\",\
        \"attaching\",\
        \"in-use\",\
        \"detaching\"\
      ]\
    },\
    \"NetworkInterfaceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"interface\",\
        \"natGateway\"\
      ]\
    },\
    \"NewDhcpConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"locationName\":\"key\"\
        },\
        \"Values\":{\
          \"shape\":\"ValueStringList\",\
          \"locationName\":\"Value\"\
        }\
      }\
    },\
    \"NewDhcpConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"NewDhcpConfiguration\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"OccurrenceDayRequestSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Integer\",\
        \"locationName\":\"OccurenceDay\"\
      }\
    },\
    \"OccurrenceDaySet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Integer\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"OfferingTypeValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Heavy Utilization\",\
        \"Medium Utilization\",\
        \"Light Utilization\",\
        \"No Upfront\",\
        \"Partial Upfront\",\
        \"All Upfront\"\
      ]\
    },\
    \"OperationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"add\",\
        \"remove\"\
      ]\
    },\
    \"OwnerStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"Owner\"\
      }\
    },\
    \"PeeringConnectionOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowEgressFromLocalClassicLinkToRemoteVpc\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If true, enables outbound communication from an EC2-Classic instance that's linked to a local VPC via ClassicLink to instances in a peer VPC.</p>\",\
          \"locationName\":\"allowEgressFromLocalClassicLinkToRemoteVpc\"\
        },\
        \"AllowEgressFromLocalVpcToRemoteClassicLink\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If true, enables outbound communication from instances in a local VPC to an EC2-Classic instance that's linked to a peer VPC via ClassicLink.</p>\",\
          \"locationName\":\"allowEgressFromLocalVpcToRemoteClassicLink\"\
        }\
      },\
      \"documentation\":\"<p>Describes the VPC peering connection options.</p>\"\
    },\
    \"PeeringConnectionOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AllowEgressFromLocalClassicLinkToRemoteVpc\",\
        \"AllowEgressFromLocalVpcToRemoteClassicLink\"\
      ],\
      \"members\":{\
        \"AllowEgressFromLocalClassicLinkToRemoteVpc\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If true, enables outbound communication from an EC2-Classic instance that's linked to a local VPC via ClassicLink to instances in a peer VPC.</p>\"\
        },\
        \"AllowEgressFromLocalVpcToRemoteClassicLink\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If true, enables outbound communication from instances in a local VPC to an EC2-Classic instance that's linked to a peer VPC via ClassicLink.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC peering connection options.</p>\"\
    },\
    \"PermissionGroup\":{\
      \"type\":\"string\",\
      \"enum\":[\"all\"]\
    },\
    \"Placement\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone of the instance.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the placement group the instance is in (for cluster compute instances).</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"Tenancy\":{\
          \"shape\":\"Tenancy\",\
          \"documentation\":\"<p>The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of <code>dedicated</code> runs on single-tenant hardware. The <code>host</code> tenancy is not supported for the <a>ImportInstance</a> command.</p>\",\
          \"locationName\":\"tenancy\"\
        },\
        \"HostId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Dedicted host on which the instance resides. This parameter is not support for the <a>ImportInstance</a> command.</p>\",\
          \"locationName\":\"hostId\"\
        },\
        \"Affinity\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The affinity setting for the instance on the Dedicated host. This parameter is not supported for the <a>ImportInstance</a> command.</p>\",\
          \"locationName\":\"affinity\"\
        }\
      },\
      \"documentation\":\"<p>Describes the placement for the instance.</p>\"\
    },\
    \"PlacementGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the placement group.</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"Strategy\":{\
          \"shape\":\"PlacementStrategy\",\
          \"documentation\":\"<p>The placement strategy.</p>\",\
          \"locationName\":\"strategy\"\
        },\
        \"State\":{\
          \"shape\":\"PlacementGroupState\",\
          \"documentation\":\"<p>The state of the placement group.</p>\",\
          \"locationName\":\"state\"\
        }\
      },\
      \"documentation\":\"<p>Describes a placement group.</p>\"\
    },\
    \"PlacementGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PlacementGroup\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PlacementGroupState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"available\",\
        \"deleting\",\
        \"deleted\"\
      ]\
    },\
    \"PlacementGroupStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"PlacementStrategy\":{\
      \"type\":\"string\",\
      \"enum\":[\"cluster\"]\
    },\
    \"PlatformValues\":{\
      \"type\":\"string\",\
      \"enum\":[\"Windows\"]\
    },\
    \"PortRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"From\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The first port in the range.</p>\",\
          \"locationName\":\"from\"\
        },\
        \"To\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The last port in the range.</p>\",\
          \"locationName\":\"to\"\
        }\
      },\
      \"documentation\":\"<p>Describes a range of ports.</p>\"\
    },\
    \"PrefixList\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrefixListId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the prefix. </p>\",\
          \"locationName\":\"prefixListId\"\
        },\
        \"PrefixListName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the prefix.</p>\",\
          \"locationName\":\"prefixListName\"\
        },\
        \"Cidrs\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>The IP address range of the AWS service.</p>\",\
          \"locationName\":\"cidrSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes prefixes for AWS services. </p>\"\
    },\
    \"PrefixListId\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrefixListId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the prefix.</p>\",\
          \"locationName\":\"prefixListId\"\
        }\
      },\
      \"documentation\":\"<p>The ID of the prefix.</p>\"\
    },\
    \"PrefixListIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PrefixListId\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PrefixListIdSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PrefixListSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PrefixList\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PriceSchedule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Term\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of months remaining in the reservation. For example, 2 is the second to the last month before the capacity reservation expires.</p>\",\
          \"locationName\":\"term\"\
        },\
        \"Price\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The fixed price for the term.</p>\",\
          \"locationName\":\"price\"\
        },\
        \"CurrencyCode\":{\
          \"shape\":\"CurrencyCodeValues\",\
          \"documentation\":\"<p>The currency for transacting the Reserved Instance resale. At this time, the only supported currency is <code>USD</code>.</p>\",\
          \"locationName\":\"currencyCode\"\
        },\
        \"Active\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The current price schedule, as determined by the term remaining for the Reserved Instance in the listing.</p> <p>A specific price schedule is always in effect, but only one price schedule can be active at any time. Take, for example, a Reserved Instance listing that has five months remaining in its term. When you specify price schedules for five months and two months, this means that schedule 1, covering the first three months of the remaining term, will be active during months 5, 4, and 3. Then schedule 2, covering the last two months of the term, will be active for months 2 and 1.</p>\",\
          \"locationName\":\"active\"\
        }\
      },\
      \"documentation\":\"<p>Describes the price for a Reserved Instance.</p>\"\
    },\
    \"PriceScheduleList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PriceSchedule\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PriceScheduleSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Term\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of months remaining in the reservation. For example, 2 is the second to the last month before the capacity reservation expires.</p>\",\
          \"locationName\":\"term\"\
        },\
        \"Price\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The fixed price for the term.</p>\",\
          \"locationName\":\"price\"\
        },\
        \"CurrencyCode\":{\
          \"shape\":\"CurrencyCodeValues\",\
          \"documentation\":\"<p>The currency for transacting the Reserved Instance resale. At this time, the only supported currency is <code>USD</code>.</p>\",\
          \"locationName\":\"currencyCode\"\
        }\
      },\
      \"documentation\":\"<p>Describes the price for a Reserved Instance.</p>\"\
    },\
    \"PriceScheduleSpecificationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PriceScheduleSpecification\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PricingDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Price\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The price per instance.</p>\",\
          \"locationName\":\"price\"\
        },\
        \"Count\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of reservations available for the price.</p>\",\
          \"locationName\":\"count\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Reserved Instance offering.</p>\"\
    },\
    \"PricingDetailsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PricingDetail\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PrivateIpAddressConfigSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ScheduledInstancesPrivateIpAddressConfig\",\
        \"locationName\":\"PrivateIpAddressConfigSet\"\
      }\
    },\
    \"PrivateIpAddressSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"PrivateIpAddress\"],\
      \"members\":{\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The private IP addresses.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"Primary\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the private IP address is the primary private IP address. Only one IP address can be designated as primary.</p>\",\
          \"locationName\":\"primary\"\
        }\
      },\
      \"documentation\":\"<p>Describes a secondary private IP address for a network interface.</p>\"\
    },\
    \"PrivateIpAddressSpecificationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PrivateIpAddressSpecification\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PrivateIpAddressStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"PrivateIpAddress\"\
      }\
    },\
    \"ProductCode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProductCodeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The product code.</p>\",\
          \"locationName\":\"productCode\"\
        },\
        \"ProductCodeType\":{\
          \"shape\":\"ProductCodeValues\",\
          \"documentation\":\"<p>The type of product code.</p>\",\
          \"locationName\":\"type\"\
        }\
      },\
      \"documentation\":\"<p>Describes a product code.</p>\"\
    },\
    \"ProductCodeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ProductCode\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ProductCodeStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ProductCode\"\
      }\
    },\
    \"ProductCodeValues\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"devpay\",\
        \"marketplace\"\
      ]\
    },\
    \"ProductDescriptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"PropagatingVgw\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway (VGW).</p>\",\
          \"locationName\":\"gatewayId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a virtual private gateway propagating route.</p>\"\
    },\
    \"PropagatingVgwList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PropagatingVgw\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"PublicIpStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"PublicIp\"\
      }\
    },\
    \"PurchaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PurchaseToken\",\
        \"InstanceCount\"\
      ],\
      \"members\":{\
        \"PurchaseToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The purchase token.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a request to purchase Scheduled Instances.</p>\"\
    },\
    \"PurchaseRequestSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"PurchaseRequest\",\
        \"locationName\":\"PurchaseRequest\"\
      },\
      \"min\":1\
    },\
    \"PurchaseReservedInstancesOfferingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReservedInstancesOfferingId\",\
        \"InstanceCount\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ReservedInstancesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance offering to purchase.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of Reserved Instances to purchase.</p>\"\
        },\
        \"LimitPrice\":{\
          \"shape\":\"ReservedInstanceLimitPrice\",\
          \"documentation\":\"<p>Specified for Reserved Instance Marketplace offerings to limit the total order and ensure that the Reserved Instances are not purchased at unexpected prices.</p>\",\
          \"locationName\":\"limitPrice\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for PurchaseReservedInstancesOffering.</p>\"\
    },\
    \"PurchaseReservedInstancesOfferingResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IDs of the purchased Reserved Instances.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of PurchaseReservedInstancesOffering.</p>\"\
    },\
    \"PurchaseScheduledInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PurchaseRequests\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier that ensures the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"PurchaseRequests\":{\
          \"shape\":\"PurchaseRequestSet\",\
          \"documentation\":\"<p>One or more purchase requests.</p>\",\
          \"locationName\":\"PurchaseRequest\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for PurchaseScheduledInstances.</p>\"\
    },\
    \"PurchaseScheduledInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScheduledInstanceSet\":{\
          \"shape\":\"PurchasedScheduledInstanceSet\",\
          \"documentation\":\"<p>Information about the Scheduled Instances.</p>\",\
          \"locationName\":\"scheduledInstanceSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of PurchaseScheduledInstances.</p>\"\
    },\
    \"PurchasedScheduledInstanceSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ScheduledInstance\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RIProductDescription\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Linux/UNIX\",\
        \"Linux/UNIX (Amazon VPC)\",\
        \"Windows\",\
        \"Windows (Amazon VPC)\"\
      ]\
    },\
    \"ReasonCodesList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReportInstanceReasonCodes\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RebootInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RebootInstances.</p>\"\
    },\
    \"RecurringCharge\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Frequency\":{\
          \"shape\":\"RecurringChargeFrequency\",\
          \"documentation\":\"<p>The frequency of the recurring charge.</p>\",\
          \"locationName\":\"frequency\"\
        },\
        \"Amount\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The amount of the recurring charge.</p>\",\
          \"locationName\":\"amount\"\
        }\
      },\
      \"documentation\":\"<p>Describes a recurring charge.</p>\"\
    },\
    \"RecurringChargeFrequency\":{\
      \"type\":\"string\",\
      \"enum\":[\"Hourly\"]\
    },\
    \"RecurringChargesList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RecurringCharge\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"Region\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RegionName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the region.</p>\",\
          \"locationName\":\"regionName\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The region service endpoint.</p>\",\
          \"locationName\":\"regionEndpoint\"\
        }\
      },\
      \"documentation\":\"<p>Describes a region.</p>\"\
    },\
    \"RegionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Region\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RegionNameStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"RegionName\"\
      }\
    },\
    \"RegisterImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageLocation\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full path to your AMI manifest in Amazon S3 storage.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for your AMI.</p> <p>Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ), periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)</p>\",\
          \"locationName\":\"name\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for your AMI.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"Architecture\":{\
          \"shape\":\"ArchitectureValues\",\
          \"documentation\":\"<p>The architecture of the AMI.</p> <p>Default: For Amazon EBS-backed AMIs, <code>i386</code>. For instance store-backed AMIs, the architecture specified in the manifest file.</p>\",\
          \"locationName\":\"architecture\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the kernel.</p>\",\
          \"locationName\":\"kernelId\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the RAM disk.</p>\",\
          \"locationName\":\"ramdiskId\"\
        },\
        \"RootDeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the root device (for example, <code>/dev/sda1</code>, or <code>/dev/xvda</code>).</p>\",\
          \"locationName\":\"rootDeviceName\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingRequestList\",\
          \"documentation\":\"<p>One or more block device mapping entries.</p>\",\
          \"locationName\":\"BlockDeviceMapping\"\
        },\
        \"VirtualizationType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of virtualization.</p> <p>Default: <code>paravirtual</code></p>\",\
          \"locationName\":\"virtualizationType\"\
        },\
        \"SriovNetSupport\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Set to <code>simple</code> to enable enhanced networking for the AMI and any instances that you launch from the AMI.</p> <p>There is no way to disable enhanced networking at this time.</p> <p>This option is supported only for HVM AMIs. Specifying this option with a PV AMI can make instances launched from the AMI unreachable.</p>\",\
          \"locationName\":\"sriovNetSupport\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RegisterImage.</p>\"\
    },\
    \"RegisterImageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the newly registered AMI.</p>\",\
          \"locationName\":\"imageId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RegisterImage.</p>\"\
    },\
    \"RejectVpcPeeringConnectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VpcPeeringConnectionId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RejectVpcPeeringConnection.</p>\"\
    },\
    \"RejectVpcPeeringConnectionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Return\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>\",\
          \"locationName\":\"return\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RejectVpcPeeringConnection.</p>\"\
    },\
    \"ReleaseAddressRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic] The Elastic IP address. Required for EC2-Classic.</p>\"\
        },\
        \"AllocationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The allocation ID. Required for EC2-VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReleaseAddress.</p>\"\
    },\
    \"ReleaseHostsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HostIds\"],\
      \"members\":{\
        \"HostIds\":{\
          \"shape\":\"RequestHostIdList\",\
          \"documentation\":\"<p>The IDs of the Dedicated hosts you want to release.</p>\",\
          \"locationName\":\"hostId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReleaseHosts.</p>\"\
    },\
    \"ReleaseHostsResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Successful\":{\
          \"shape\":\"ResponseHostIdList\",\
          \"documentation\":\"<p>The IDs of the Dedicated hosts that were successfully released.</p>\",\
          \"locationName\":\"successful\"\
        },\
        \"Unsuccessful\":{\
          \"shape\":\"UnsuccessfulItemList\",\
          \"documentation\":\"<p>The IDs of the Dedicated hosts that could not be released, including an error message.</p>\",\
          \"locationName\":\"unsuccessful\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ReleaseHosts.</p>\"\
    },\
    \"ReplaceNetworkAclAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AssociationId\",\
        \"NetworkAclId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the current association between the original network ACL and the subnet.</p>\",\
          \"locationName\":\"associationId\"\
        },\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new network ACL to associate with the subnet.</p>\",\
          \"locationName\":\"networkAclId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReplaceNetworkAclAssociation.</p>\"\
    },\
    \"ReplaceNetworkAclAssociationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NewAssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new association.</p>\",\
          \"locationName\":\"newAssociationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ReplaceNetworkAclAssociation.</p>\"\
    },\
    \"ReplaceNetworkAclEntryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NetworkAclId\",\
        \"RuleNumber\",\
        \"Protocol\",\
        \"RuleAction\",\
        \"Egress\",\
        \"CidrBlock\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkAclId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the ACL.</p>\",\
          \"locationName\":\"networkAclId\"\
        },\
        \"RuleNumber\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The rule number of the entry to replace.</p>\",\
          \"locationName\":\"ruleNumber\"\
        },\
        \"Protocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol. You can specify <code>all</code> or <code>-1</code> to mean all protocols.</p>\",\
          \"locationName\":\"protocol\"\
        },\
        \"RuleAction\":{\
          \"shape\":\"RuleAction\",\
          \"documentation\":\"<p>Indicates whether to allow or deny the traffic that matches the rule.</p>\",\
          \"locationName\":\"ruleAction\"\
        },\
        \"Egress\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to replace the egress rule.</p> <p>Default: If no value is specified, we replace the ingress rule.</p>\",\
          \"locationName\":\"egress\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network range to allow or deny, in CIDR notation.</p>\",\
          \"locationName\":\"cidrBlock\"\
        },\
        \"IcmpTypeCode\":{\
          \"shape\":\"IcmpTypeCode\",\
          \"documentation\":\"<p>ICMP protocol: The ICMP type and code. Required if specifying 1 (ICMP) for the protocol.</p>\",\
          \"locationName\":\"Icmp\"\
        },\
        \"PortRange\":{\
          \"shape\":\"PortRange\",\
          \"documentation\":\"<p>TCP or UDP protocols: The range of ports the rule applies to. Required if specifying 6 (TCP) or 17 (UDP) for the protocol.</p>\",\
          \"locationName\":\"portRange\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReplaceNetworkAclEntry.</p>\"\
    },\
    \"ReplaceRouteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RouteTableId\",\
        \"DestinationCidrBlock\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\",\
          \"locationName\":\"routeTableId\"\
        },\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR address block used for the destination match. The value you provide must match the CIDR of an existing route in the table.</p>\",\
          \"locationName\":\"destinationCidrBlock\"\
        },\
        \"GatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of an Internet gateway or virtual private gateway.</p>\",\
          \"locationName\":\"gatewayId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a NAT instance in your VPC.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        },\
        \"NatGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a NAT gateway.</p>\",\
          \"locationName\":\"natGatewayId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReplaceRoute.</p>\"\
    },\
    \"ReplaceRouteTableAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AssociationId\",\
        \"RouteTableId\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The association ID.</p>\",\
          \"locationName\":\"associationId\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new route table to associate with the subnet.</p>\",\
          \"locationName\":\"routeTableId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReplaceRouteTableAssociation.</p>\"\
    },\
    \"ReplaceRouteTableAssociationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NewAssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the new association.</p>\",\
          \"locationName\":\"newAssociationId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of ReplaceRouteTableAssociation.</p>\"\
    },\
    \"ReportInstanceReasonCodes\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"instance-stuck-in-state\",\
        \"unresponsive\",\
        \"not-accepting-credentials\",\
        \"password-not-available\",\
        \"performance-network\",\
        \"performance-instance-store\",\
        \"performance-ebs-volume\",\
        \"performance-other\",\
        \"other\"\
      ]\
    },\
    \"ReportInstanceStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Instances\",\
        \"Status\",\
        \"ReasonCodes\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"Instances\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instances.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Status\":{\
          \"shape\":\"ReportStatusType\",\
          \"documentation\":\"<p>The status of all instances listed.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time at which the reported instance health state began.</p>\",\
          \"locationName\":\"startTime\"\
        },\
        \"EndTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time at which the reported instance health state ended.</p>\",\
          \"locationName\":\"endTime\"\
        },\
        \"ReasonCodes\":{\
          \"shape\":\"ReasonCodesList\",\
          \"documentation\":\"<p>One or more reason codes that describes the health state of your instance.</p> <ul> <li> <p><code>instance-stuck-in-state</code>: My instance is stuck in a state.</p> </li> <li> <p><code>unresponsive</code>: My instance is unresponsive.</p> </li> <li> <p><code>not-accepting-credentials</code>: My instance is not accepting my credentials.</p> </li> <li> <p><code>password-not-available</code>: A password is not available for my instance.</p> </li> <li> <p><code>performance-network</code>: My instance is experiencing performance problems which I believe are network related.</p> </li> <li> <p><code>performance-instance-store</code>: My instance is experiencing performance problems which I believe are related to the instance stores.</p> </li> <li> <p><code>performance-ebs-volume</code>: My instance is experiencing performance problems which I believe are related to an EBS volume.</p> </li> <li> <p><code>performance-other</code>: My instance is experiencing performance problems.</p> </li> <li> <p><code>other</code>: [explain using the description parameter]</p> </li> </ul>\",\
          \"locationName\":\"reasonCode\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Descriptive text about the health state of your instance.</p>\",\
          \"locationName\":\"description\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ReportInstanceStatus.</p>\"\
    },\
    \"ReportStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ok\",\
        \"impaired\"\
      ]\
    },\
    \"RequestHostIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RequestSpotFleetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotFleetRequestConfig\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotFleetRequestConfig\":{\
          \"shape\":\"SpotFleetRequestConfigData\",\
          \"documentation\":\"<p>The configuration for the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestConfig\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RequestSpotFleet.</p>\"\
    },\
    \"RequestSpotFleetResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotFleetRequestId\"],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RequestSpotFleet.</p>\"\
    },\
    \"RequestSpotInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SpotPrice\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The maximum hourly price (bid) for any Spot instance launched to fulfill the request.</p>\",\
          \"locationName\":\"spotPrice\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html\\\">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of Spot instances to launch.</p> <p>Default: 1</p>\",\
          \"locationName\":\"instanceCount\"\
        },\
        \"Type\":{\
          \"shape\":\"SpotInstanceType\",\
          \"documentation\":\"<p>The Spot instance request type.</p> <p>Default: <code>one-time</code></p>\",\
          \"locationName\":\"type\"\
        },\
        \"ValidFrom\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The start date of the request. If this is a one-time request, the request becomes active at this date and time and remains active until all instances launch, the request expires, or the request is canceled. If the request is persistent, the request becomes active at this date and time and remains active until it expires or is canceled.</p> <p>Default: The request is effective indefinitely.</p>\",\
          \"locationName\":\"validFrom\"\
        },\
        \"ValidUntil\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The end date of the request. If this is a one-time request, the request remains active until all instances launch, the request is canceled, or this date is reached. If the request is persistent, it remains active until it is canceled or this date and time is reached.</p> <p>Default: The request is effective indefinitely.</p>\",\
          \"locationName\":\"validUntil\"\
        },\
        \"LaunchGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance launch group. Launch groups are Spot instances that launch together and terminate together.</p> <p>Default: Instances are launched and terminated individually</p>\",\
          \"locationName\":\"launchGroup\"\
        },\
        \"AvailabilityZoneGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The user-specified name for a logical grouping of bids.</p> <p>When you specify an Availability Zone group in a Spot Instance request, all Spot instances in the request are launched in the same Availability Zone. Instance proximity is maintained with this parameter, but the choice of Availability Zone is not. The group applies only to bids for Spot Instances of the same instance type. Any additional Spot instance requests that are specified with the same Availability Zone group name are launched in that same Availability Zone, as long as at least one instance from the group is still active.</p> <p>If there is no active instance running in the Availability Zone group that you specify for a new Spot instance request (all instances are terminated, the bid is expired, or the bid falls below current market), then Amazon EC2 launches the instance in any Availability Zone where the constraint can be met. Consequently, the subsequent set of Spot instances could be placed in a different zone from the original request, even if you specified the same Availability Zone group.</p> <p>Default: Instances are launched in any available Availability Zone.</p>\",\
          \"locationName\":\"availabilityZoneGroup\"\
        },\
        \"BlockDurationMinutes\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The required duration for the Spot instances (also known as Spot blocks), in minutes. This value must be a multiple of 60 (60, 120, 180, 240, 300, or 360).</p> <p>The duration period starts as soon as your Spot instance receives its instance ID. At the end of the duration period, Amazon EC2 marks the Spot instance for termination and provides a Spot instance termination notice, which gives the instance a two-minute warning before it terminates.</p> <p>Note that you can't specify an Availability Zone group or a launch group if you specify a duration.</p>\",\
          \"locationName\":\"blockDurationMinutes\"\
        },\
        \"LaunchSpecification\":{\"shape\":\"RequestSpotLaunchSpecification\"}\
      },\
      \"documentation\":\"<p>Contains the parameters for RequestSpotInstances.</p>\"\
    },\
    \"RequestSpotInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotInstanceRequests\":{\
          \"shape\":\"SpotInstanceRequestList\",\
          \"documentation\":\"<p>One or more Spot instance requests.</p>\",\
          \"locationName\":\"spotInstanceRequestSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RequestSpotInstances.</p>\"\
    },\
    \"RequestSpotLaunchSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"ValueStringList\",\
          \"locationName\":\"SecurityGroup\"\
        },\
        \"UserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Base64-encoded MIME user data to make available to the instances.</p>\",\
          \"locationName\":\"userData\"\
        },\
        \"AddressingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Deprecated.</p>\",\
          \"locationName\":\"addressingType\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Placement\":{\
          \"shape\":\"SpotPlacement\",\
          \"documentation\":\"<p>The placement information for the instance.</p>\",\
          \"locationName\":\"placement\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the kernel.</p>\",\
          \"locationName\":\"kernelId\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the RAM disk.</p>\",\
          \"locationName\":\"ramdiskId\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingList\",\
          \"documentation\":\"<p>One or more block device mapping entries.</p> <p>Although you can specify encrypted EBS volumes in this block device mapping for your Spot Instances, these volumes are not encrypted.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet in which to launch the instance.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"NetworkInterfaces\":{\
          \"shape\":\"InstanceNetworkInterfaceSpecificationList\",\
          \"documentation\":\"<p>One or more network interfaces.</p>\",\
          \"locationName\":\"NetworkInterface\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"IamInstanceProfileSpecification\",\
          \"documentation\":\"<p>The IAM instance profile.</p>\",\
          \"locationName\":\"iamInstanceProfile\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"ebsOptimized\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"RunInstancesMonitoringEnabled\",\
          \"locationName\":\"monitoring\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"ValueStringList\",\
          \"locationName\":\"SecurityGroupId\"\
        }\
      },\
      \"documentation\":\"<p>Describes the launch specification for an instance.</p>\"\
    },\
    \"Reservation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the reservation.</p>\",\
          \"locationName\":\"reservationId\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AWS account that owns the reservation.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"RequesterId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the requester that launched the instances on your behalf (for example, AWS Management Console or Auto Scaling).</p>\",\
          \"locationName\":\"requesterId\"\
        },\
        \"Groups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>[EC2-Classic only] One or more security groups.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"Instances\":{\
          \"shape\":\"InstanceList\",\
          \"documentation\":\"<p>One or more instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a reservation.</p>\"\
    },\
    \"ReservationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Reservation\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedInstanceLimitPrice\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Amount\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>Used for Reserved Instance Marketplace offerings. Specifies the limit price on the total order (instanceCount * price).</p>\",\
          \"locationName\":\"amount\"\
        },\
        \"CurrencyCode\":{\
          \"shape\":\"CurrencyCodeValues\",\
          \"documentation\":\"<p>The currency in which the <code>limitPrice</code> amount is specified. At this time, the only supported currency is <code>USD</code>.</p>\",\
          \"locationName\":\"currencyCode\"\
        }\
      },\
      \"documentation\":\"<p>Describes the limit price of a Reserved Instance offering.</p>\"\
    },\
    \"ReservedInstanceState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"payment-pending\",\
        \"active\",\
        \"payment-failed\",\
        \"retired\"\
      ]\
    },\
    \"ReservedInstances\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type on which the Reserved Instance can be used.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone in which the Reserved Instance can be used.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Start\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the Reserved Instance started.</p>\",\
          \"locationName\":\"start\"\
        },\
        \"End\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the Reserved Instance expires.</p>\",\
          \"locationName\":\"end\"\
        },\
        \"Duration\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The duration of the Reserved Instance, in seconds.</p>\",\
          \"locationName\":\"duration\"\
        },\
        \"UsagePrice\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The usage price of the Reserved Instance, per hour.</p>\",\
          \"locationName\":\"usagePrice\"\
        },\
        \"FixedPrice\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The purchase price of the Reserved Instance.</p>\",\
          \"locationName\":\"fixedPrice\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of reservations purchased.</p>\",\
          \"locationName\":\"instanceCount\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"RIProductDescription\",\
          \"documentation\":\"<p>The Reserved Instance product platform description.</p>\",\
          \"locationName\":\"productDescription\"\
        },\
        \"State\":{\
          \"shape\":\"ReservedInstanceState\",\
          \"documentation\":\"<p>The state of the Reserved Instance purchase.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the resource.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"InstanceTenancy\":{\
          \"shape\":\"Tenancy\",\
          \"documentation\":\"<p>The tenancy of the instance.</p>\",\
          \"locationName\":\"instanceTenancy\"\
        },\
        \"CurrencyCode\":{\
          \"shape\":\"CurrencyCodeValues\",\
          \"documentation\":\"<p>The currency of the Reserved Instance. It's specified using ISO 4217 standard currency codes. At this time, the only supported currency is <code>USD</code>.</p>\",\
          \"locationName\":\"currencyCode\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"OfferingTypeValues\",\
          \"documentation\":\"<p>The Reserved Instance offering type.</p>\",\
          \"locationName\":\"offeringType\"\
        },\
        \"RecurringCharges\":{\
          \"shape\":\"RecurringChargesList\",\
          \"documentation\":\"<p>The recurring charge tag assigned to the resource.</p>\",\
          \"locationName\":\"recurringCharges\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Reserved Instance.</p>\"\
    },\
    \"ReservedInstancesConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone for the modified Reserved Instances.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network platform of the modified Reserved Instances, which is either EC2-Classic or EC2-VPC.</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of modified Reserved Instances.</p>\",\
          \"locationName\":\"instanceCount\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type for the modified Reserved Instances.</p>\",\
          \"locationName\":\"instanceType\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration settings for the modified Reserved Instances.</p>\"\
    },\
    \"ReservedInstancesConfigurationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstancesConfiguration\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedInstancesId\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        }\
      },\
      \"documentation\":\"<p>Describes the ID of a Reserved Instance.</p>\"\
    },\
    \"ReservedInstancesIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ReservedInstancesId\"\
      }\
    },\
    \"ReservedInstancesList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstances\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedInstancesListing\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesListingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance listing.</p>\",\
          \"locationName\":\"reservedInstancesListingId\"\
        },\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        },\
        \"CreateDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time the listing was created.</p>\",\
          \"locationName\":\"createDate\"\
        },\
        \"UpdateDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The last modified timestamp of the listing.</p>\",\
          \"locationName\":\"updateDate\"\
        },\
        \"Status\":{\
          \"shape\":\"ListingStatus\",\
          \"documentation\":\"<p>The status of the Reserved Instance listing.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for the current status of the Reserved Instance listing. The response can be blank.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"InstanceCounts\":{\
          \"shape\":\"InstanceCountList\",\
          \"documentation\":\"<p>The number of instances in this state.</p>\",\
          \"locationName\":\"instanceCounts\"\
        },\
        \"PriceSchedules\":{\
          \"shape\":\"PriceScheduleList\",\
          \"documentation\":\"<p>The price of the Reserved Instance listing.</p>\",\
          \"locationName\":\"priceSchedules\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the resource.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive key supplied by the client to ensure that the request is idempotent. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"locationName\":\"clientToken\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Reserved Instance listing.</p>\"\
    },\
    \"ReservedInstancesListingList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstancesListing\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedInstancesModification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesModificationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique ID for the Reserved Instance modification.</p>\",\
          \"locationName\":\"reservedInstancesModificationId\"\
        },\
        \"ReservedInstancesIds\":{\
          \"shape\":\"ReservedIntancesIds\",\
          \"documentation\":\"<p>The IDs of one or more Reserved Instances.</p>\",\
          \"locationName\":\"reservedInstancesSet\"\
        },\
        \"ModificationResults\":{\
          \"shape\":\"ReservedInstancesModificationResultList\",\
          \"documentation\":\"<p>Contains target configurations along with their corresponding new Reserved Instance IDs.</p>\",\
          \"locationName\":\"modificationResultSet\"\
        },\
        \"CreateDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the modification request was created.</p>\",\
          \"locationName\":\"createDate\"\
        },\
        \"UpdateDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time when the modification request was last updated.</p>\",\
          \"locationName\":\"updateDate\"\
        },\
        \"EffectiveDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time for the modification to become effective.</p>\",\
          \"locationName\":\"effectiveDate\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of the Reserved Instances modification request.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason for the status.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive key supplied by the client to ensure that the request is idempotent. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"locationName\":\"clientToken\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Reserved Instance modification.</p>\"\
    },\
    \"ReservedInstancesModificationIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ReservedInstancesModificationId\"\
      }\
    },\
    \"ReservedInstancesModificationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstancesModification\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedInstancesModificationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID for the Reserved Instances that were created as part of the modification request. This field is only available when the modification is fulfilled.</p>\",\
          \"locationName\":\"reservedInstancesId\"\
        },\
        \"TargetConfiguration\":{\
          \"shape\":\"ReservedInstancesConfiguration\",\
          \"documentation\":\"<p>The target Reserved Instances configurations supplied as part of the modification request.</p>\",\
          \"locationName\":\"targetConfiguration\"\
        }\
      },\
      \"documentation\":\"<p>Describes the modification request/s.</p>\"\
    },\
    \"ReservedInstancesModificationResultList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstancesModificationResult\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedInstancesOffering\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedInstancesOfferingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Reserved Instance offering.</p>\",\
          \"locationName\":\"reservedInstancesOfferingId\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type on which the Reserved Instance can be used.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone in which the Reserved Instance can be used.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"Duration\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The duration of the Reserved Instance, in seconds.</p>\",\
          \"locationName\":\"duration\"\
        },\
        \"UsagePrice\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The usage price of the Reserved Instance, per hour.</p>\",\
          \"locationName\":\"usagePrice\"\
        },\
        \"FixedPrice\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The purchase price of the Reserved Instance.</p>\",\
          \"locationName\":\"fixedPrice\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"RIProductDescription\",\
          \"documentation\":\"<p>The Reserved Instance product platform description.</p>\",\
          \"locationName\":\"productDescription\"\
        },\
        \"InstanceTenancy\":{\
          \"shape\":\"Tenancy\",\
          \"documentation\":\"<p>The tenancy of the instance.</p>\",\
          \"locationName\":\"instanceTenancy\"\
        },\
        \"CurrencyCode\":{\
          \"shape\":\"CurrencyCodeValues\",\
          \"documentation\":\"<p>The currency of the Reserved Instance offering you are purchasing. It's specified using ISO 4217 standard currency codes. At this time, the only supported currency is <code>USD</code>.</p>\",\
          \"locationName\":\"currencyCode\"\
        },\
        \"OfferingType\":{\
          \"shape\":\"OfferingTypeValues\",\
          \"documentation\":\"<p>The Reserved Instance offering type.</p>\",\
          \"locationName\":\"offeringType\"\
        },\
        \"RecurringCharges\":{\
          \"shape\":\"RecurringChargesList\",\
          \"documentation\":\"<p>The recurring charge tag assigned to the resource.</p>\",\
          \"locationName\":\"recurringCharges\"\
        },\
        \"Marketplace\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the offering is available through the Reserved Instance Marketplace (resale) or AWS. If it's a Reserved Instance Marketplace offering, this is <code>true</code>.</p>\",\
          \"locationName\":\"marketplace\"\
        },\
        \"PricingDetails\":{\
          \"shape\":\"PricingDetailsList\",\
          \"documentation\":\"<p>The pricing details of the Reserved Instance offering.</p>\",\
          \"locationName\":\"pricingDetailsSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Reserved Instance offering.</p>\"\
    },\
    \"ReservedInstancesOfferingIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ReservedInstancesOfferingList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstancesOffering\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ReservedIntancesIds\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ReservedInstancesId\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ResetImageAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\"launchPermission\"]\
    },\
    \"ResetImageAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ImageId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"ResetImageAttributeName\",\
          \"documentation\":\"<p>The attribute to reset (currently you can only reset the launch permission attribute).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ResetImageAttribute.</p>\"\
    },\
    \"ResetInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Attribute\":{\
          \"shape\":\"InstanceAttributeName\",\
          \"documentation\":\"<p>The attribute to reset.</p> <important><p>You can only reset the following attributes: <code>kernel</code> | <code>ramdisk</code> | <code>sourceDestCheck</code>. To change an instance attribute, use <a>ModifyInstanceAttribute</a>.</p></important>\",\
          \"locationName\":\"attribute\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ResetInstanceAttribute.</p>\"\
    },\
    \"ResetNetworkInterfaceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"NetworkInterfaceId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The source/destination checking attribute. Resets the value to <code>true</code>.</p>\",\
          \"locationName\":\"sourceDestCheck\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ResetNetworkInterfaceAttribute.</p>\"\
    },\
    \"ResetSnapshotAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SnapshotId\",\
        \"Attribute\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the snapshot.</p>\"\
        },\
        \"Attribute\":{\
          \"shape\":\"SnapshotAttributeName\",\
          \"documentation\":\"<p>The attribute to reset. Currently, only the attribute for permission to create volumes can be reset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for ResetSnapshotAttribute.</p>\"\
    },\
    \"ResourceIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"customer-gateway\",\
        \"dhcp-options\",\
        \"image\",\
        \"instance\",\
        \"internet-gateway\",\
        \"network-acl\",\
        \"network-interface\",\
        \"reserved-instances\",\
        \"route-table\",\
        \"snapshot\",\
        \"spot-instances-request\",\
        \"subnet\",\
        \"security-group\",\
        \"volume\",\
        \"vpc\",\
        \"vpn-connection\",\
        \"vpn-gateway\"\
      ]\
    },\
    \"ResponseHostIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RestorableByStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"RestoreAddressToClassicRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PublicIp\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address.</p>\",\
          \"locationName\":\"publicIp\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RestoreAddressToClassic.</p>\"\
    },\
    \"RestoreAddressToClassicResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"Status\",\
          \"documentation\":\"<p>The move status for the IP address.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"PublicIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Elastic IP address.</p>\",\
          \"locationName\":\"publicIp\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RestoreAddressToClassic.</p>\"\
    },\
    \"RevokeSecurityGroupEgressRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"GroupId\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        },\
        \"SourceSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a destination security group. To revoke outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>\",\
          \"locationName\":\"sourceSecurityGroupName\"\
        },\
        \"SourceSecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account number for a destination security group. To revoke outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>\",\
          \"locationName\":\"sourceSecurityGroupOwnerId\"\
        },\
        \"IpProtocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol name or number. We recommend that you specify the protocol in a set of IP permissions instead.</p>\",\
          \"locationName\":\"ipProtocol\"\
        },\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>\",\
          \"locationName\":\"fromPort\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>\",\
          \"locationName\":\"toPort\"\
        },\
        \"CidrIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR IP address range. We recommend that you specify the CIDR range in a set of IP permissions instead.</p>\",\
          \"locationName\":\"cidrIp\"\
        },\
        \"IpPermissions\":{\
          \"shape\":\"IpPermissionList\",\
          \"documentation\":\"<p>A set of IP permissions. You can't specify a destination security group and a CIDR IP address range.</p>\",\
          \"locationName\":\"ipPermissions\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RevokeSecurityGroupEgress.</p>\"\
    },\
    \"RevokeSecurityGroupIngressRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic, default VPC] The name of the security group.</p>\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group. Required for a security group in a nondefault VPC.</p>\"\
        },\
        \"SourceSecurityGroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic, default VPC] The name of the source security group. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the start of the port range, the IP protocol, and the end of the port range. For EC2-VPC, the source security group must be in the same VPC. To revoke a specific rule for an IP protocol and port range, use a set of IP permissions instead.</p>\"\
        },\
        \"SourceSecurityGroupOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-Classic] The AWS account ID of the source security group, if the source security group is in a different account. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the IP protocol, the start of the port range, and the end of the port range. To revoke a specific rule for an IP protocol and port range, use a set of IP permissions instead.</p>\"\
        },\
        \"IpProtocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href=\\\"http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml\\\">Protocol Numbers</a>). Use <code>-1</code> to specify all.</p>\"\
        },\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>\"\
        },\
        \"CidrIp\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>\"\
        },\
        \"IpPermissions\":{\
          \"shape\":\"IpPermissionList\",\
          \"documentation\":\"<p>A set of IP permissions. You can't specify a source security group and a CIDR IP address range.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RevokeSecurityGroupIngress.</p>\"\
    },\
    \"Route\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block used for the destination match.</p>\",\
          \"locationName\":\"destinationCidrBlock\"\
        },\
        \"DestinationPrefixListId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The prefix of the AWS service.</p>\",\
          \"locationName\":\"destinationPrefixListId\"\
        },\
        \"GatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a gateway attached to your VPC.</p>\",\
          \"locationName\":\"gatewayId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a NAT instance in your VPC.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"InstanceOwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the instance.</p>\",\
          \"locationName\":\"instanceOwnerId\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        },\
        \"NatGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of a NAT gateway.</p>\",\
          \"locationName\":\"natGatewayId\"\
        },\
        \"State\":{\
          \"shape\":\"RouteState\",\
          \"documentation\":\"<p>The state of the route. The <code>blackhole</code> state indicates that the route's target isn't available (for example, the specified gateway isn't attached to the VPC, or the specified NAT instance has been terminated).</p>\",\
          \"locationName\":\"state\"\
        },\
        \"Origin\":{\
          \"shape\":\"RouteOrigin\",\
          \"documentation\":\"<p>Describes how the route was created.</p> <ul> <li><p><code>CreateRouteTable</code> - The route was automatically created when the route table was created.</p></li> <li><p><code>CreateRoute</code> - The route was manually added to the route table.</p></li> <li><p><code>EnableVgwRoutePropagation</code> - The route was propagated by route propagation.</p></li> </ul>\",\
          \"locationName\":\"origin\"\
        }\
      },\
      \"documentation\":\"<p>Describes a route in a route table.</p>\"\
    },\
    \"RouteList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Route\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RouteOrigin\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CreateRouteTable\",\
        \"CreateRoute\",\
        \"EnableVgwRoutePropagation\"\
      ]\
    },\
    \"RouteState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"active\",\
        \"blackhole\"\
      ]\
    },\
    \"RouteTable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\",\
          \"locationName\":\"routeTableId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"Routes\":{\
          \"shape\":\"RouteList\",\
          \"documentation\":\"<p>The routes in the route table.</p>\",\
          \"locationName\":\"routeSet\"\
        },\
        \"Associations\":{\
          \"shape\":\"RouteTableAssociationList\",\
          \"documentation\":\"<p>The associations between the route table and one or more subnets.</p>\",\
          \"locationName\":\"associationSet\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the route table.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"PropagatingVgws\":{\
          \"shape\":\"PropagatingVgwList\",\
          \"documentation\":\"<p>Any virtual private gateway (VGW) propagating routes.</p>\",\
          \"locationName\":\"propagatingVgwSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a route table.</p>\"\
    },\
    \"RouteTableAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RouteTableAssociationId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the association between a route table and a subnet.</p>\",\
          \"locationName\":\"routeTableAssociationId\"\
        },\
        \"RouteTableId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the route table.</p>\",\
          \"locationName\":\"routeTableId\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet. A subnet ID is not returned for an implicit association.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"Main\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this is the main route table.</p>\",\
          \"locationName\":\"main\"\
        }\
      },\
      \"documentation\":\"<p>Describes an association between a route table and a subnet.</p>\"\
    },\
    \"RouteTableAssociationList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RouteTableAssociation\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RouteTableList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"RouteTable\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"RuleAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"allow\",\
        \"deny\"\
      ]\
    },\
    \"RunInstancesMonitoringEnabled\":{\
      \"type\":\"structure\",\
      \"required\":[\"Enabled\"],\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether monitoring is enabled for the instance.</p>\",\
          \"locationName\":\"enabled\"\
        }\
      },\
      \"documentation\":\"<p>Describes the monitoring for the instance.</p>\"\
    },\
    \"RunInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ImageId\",\
        \"MinCount\",\
        \"MaxCount\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI, which you can get by calling <a>DescribeImages</a>.</p>\"\
        },\
        \"MinCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The minimum number of instances to launch. If you specify a minimum that is more instances than Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches no instances.</p> <p>Constraints: Between 1 and the maximum number you're allowed for the specified instance type. For more information about the default limits, and how to request an increase, see <a href=\\\"http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2\\\">How many instances can I run in Amazon EC2</a> in the Amazon EC2 General FAQ.</p>\"\
        },\
        \"MaxCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of instances to launch. If you specify more instances than Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches the largest possible number of instances above <code>MinCount</code>.</p> <p>Constraints: Between 1 and the maximum number you're allowed for the specified instance type. For more information about the default limits, and how to request an increase, see <a href=\\\"http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2\\\">How many instances can I run in Amazon EC2</a> in the Amazon EC2 FAQ.</p>\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair. You can create a key pair using <a>CreateKeyPair</a> or <a>ImportKeyPair</a>.</p> <important> <p>If you do not specify a key pair, you can't connect to the instance unless you choose an AMI that is configured to allow users another way to log in.</p> </important>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroupStringList\",\
          \"documentation\":\"<p>[EC2-Classic, default VPC] One or more security group names. For a nondefault VPC, you must use security group IDs instead.</p> <p>Default: Amazon EC2 uses the default security group.</p>\",\
          \"locationName\":\"SecurityGroup\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIdStringList\",\
          \"documentation\":\"<p>One or more security group IDs. You can create a security group using <a>CreateSecurityGroup</a>.</p> <p>Default: Amazon EC2 uses the default security group.</p>\",\
          \"locationName\":\"SecurityGroupId\"\
        },\
        \"UserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Data to configure the instance, or a script to run during instance launch. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html\\\">Running Commands on Your Linux Instance at Launch</a> (Linux) and <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html#instancedata-add-user-data\\\">Adding User Data</a> (Windows). For API calls, the text must be base64-encoded. For command line tools, the encoding is performed for you, and you can load the text from a file.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>Default: <code>m1.small</code></p>\"\
        },\
        \"Placement\":{\
          \"shape\":\"Placement\",\
          \"documentation\":\"<p>The placement for the instance.</p>\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the kernel.</p> <important> <p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html\\\"> PV-GRUB</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> </important>\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the RAM disk.</p> <important> <p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html\\\"> PV-GRUB</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> </important>\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingRequestList\",\
          \"documentation\":\"<p>The block device mapping.</p>\",\
          \"locationName\":\"BlockDeviceMapping\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"RunInstancesMonitoringEnabled\",\
          \"documentation\":\"<p>The monitoring for the instance.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the subnet to launch the instance into.</p>\"\
        },\
        \"DisableApiTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If you set this parameter to <code>true</code>, you can't terminate the instance using the Amazon EC2 console, CLI, or API; otherwise, you can. If you set this parameter to <code>true</code> and then later want to be able to terminate the instance, you must first change the value of the <code>disableApiTermination</code> attribute to <code>false</code> using <a>ModifyInstanceAttribute</a>. Alternatively, if you set <code>InstanceInitiatedShutdownBehavior</code> to <code>terminate</code>, you can terminate the instance by running the shutdown command from the instance.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"disableApiTermination\"\
        },\
        \"InstanceInitiatedShutdownBehavior\":{\
          \"shape\":\"ShutdownBehavior\",\
          \"documentation\":\"<p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p> <p>Default: <code>stop</code></p>\",\
          \"locationName\":\"instanceInitiatedShutdownBehavior\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The primary IP address. You must specify a value from the IP address range of the subnet.</p> <p>Only one private IP address can be designated as primary. Therefore, you can't specify this parameter if <code>PrivateIpAddresses.n.Primary</code> is set to <code>true</code> and <code>PrivateIpAddresses.n.PrivateIpAddress</code> is set to an IP address. </p> <p>Default: We select an IP address from the IP address range of the subnet.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p> <p>Constraints: Maximum 64 ASCII characters</p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"AdditionalInfo\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Reserved.</p>\",\
          \"locationName\":\"additionalInfo\"\
        },\
        \"NetworkInterfaces\":{\
          \"shape\":\"InstanceNetworkInterfaceSpecificationList\",\
          \"documentation\":\"<p>One or more network interfaces.</p>\",\
          \"locationName\":\"networkInterface\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"IamInstanceProfileSpecification\",\
          \"documentation\":\"<p>The IAM instance profile.</p>\",\
          \"locationName\":\"iamInstanceProfile\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS-optimized instance.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"ebsOptimized\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RunInstances.</p>\"\
    },\
    \"RunScheduledInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ScheduledInstanceId\",\
        \"LaunchSpecification\"\
      ],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier that ensures the idempotency of the request. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of instances.</p> <p>Default: 1</p>\"\
        },\
        \"ScheduledInstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Scheduled Instance ID.</p>\"\
        },\
        \"LaunchSpecification\":{\
          \"shape\":\"ScheduledInstancesLaunchSpecification\",\
          \"documentation\":\"<p>The launch specification.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for RunScheduledInstances.</p>\"\
    },\
    \"RunScheduledInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceIdSet\":{\
          \"shape\":\"InstanceIdSet\",\
          \"documentation\":\"<p>The IDs of the newly launched instances.</p>\",\
          \"locationName\":\"instanceIdSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of RunScheduledInstances.</p>\"\
    },\
    \"S3Storage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.</p>\",\
          \"locationName\":\"bucket\"\
        },\
        \"Prefix\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The beginning of the file name of the AMI.</p>\",\
          \"locationName\":\"prefix\"\
        },\
        \"AWSAccessKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The access key ID of the owner of the bucket. Before you specify a value for your access key ID, review and follow the guidance in <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html\\\">Best Practices for Managing AWS Access Keys</a>.</p>\"\
        },\
        \"UploadPolicy\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>A base64-encoded Amazon S3 upload policy that gives Amazon EC2 permission to upload items into Amazon S3 on your behalf. For command line tools, base64 encoding is performed for you.</p>\",\
          \"locationName\":\"uploadPolicy\"\
        },\
        \"UploadPolicySignature\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The signature of the Base64 encoded JSON document.</p>\",\
          \"locationName\":\"uploadPolicySignature\"\
        }\
      },\
      \"documentation\":\"<p>Describes the storage parameters for S3 and S3 buckets for an instance store-backed AMI.</p>\"\
    },\
    \"ScheduledInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScheduledInstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Scheduled Instance ID.</p>\",\
          \"locationName\":\"scheduledInstanceId\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"NetworkPlatform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p>\",\
          \"locationName\":\"networkPlatform\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"SlotDurationInHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of hours in the schedule.</p>\",\
          \"locationName\":\"slotDurationInHours\"\
        },\
        \"Recurrence\":{\
          \"shape\":\"ScheduledInstanceRecurrence\",\
          \"documentation\":\"<p>The schedule recurrence.</p>\",\
          \"locationName\":\"recurrence\"\
        },\
        \"PreviousSlotEndTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time that the previous schedule ended or will end.</p>\",\
          \"locationName\":\"previousSlotEndTime\"\
        },\
        \"NextSlotStartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time for the next schedule to start.</p>\",\
          \"locationName\":\"nextSlotStartTime\"\
        },\
        \"HourlyPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The hourly price for a single instance.</p>\",\
          \"locationName\":\"hourlyPrice\"\
        },\
        \"TotalScheduledInstanceHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The total number of hours for a single instance for the entire term.</p>\",\
          \"locationName\":\"totalScheduledInstanceHours\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of instances.</p>\",\
          \"locationName\":\"instanceCount\"\
        },\
        \"TermStartDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The start date for the Scheduled Instance.</p>\",\
          \"locationName\":\"termStartDate\"\
        },\
        \"TermEndDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The end date for the Scheduled Instance.</p>\",\
          \"locationName\":\"termEndDate\"\
        },\
        \"CreateDate\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date when the Scheduled Instance was purchased.</p>\",\
          \"locationName\":\"createDate\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstanceAvailability\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type. You can specify one of the C3, C4, M4, or R3 instance types.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Platform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p>\",\
          \"locationName\":\"platform\"\
        },\
        \"NetworkPlatform\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p>\",\
          \"locationName\":\"networkPlatform\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"PurchaseToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The purchase token. This token expires in two hours.</p>\",\
          \"locationName\":\"purchaseToken\"\
        },\
        \"SlotDurationInHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of hours in the schedule.</p>\",\
          \"locationName\":\"slotDurationInHours\"\
        },\
        \"Recurrence\":{\
          \"shape\":\"ScheduledInstanceRecurrence\",\
          \"documentation\":\"<p>The schedule recurrence.</p>\",\
          \"locationName\":\"recurrence\"\
        },\
        \"FirstSlotStartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time period for the first schedule to start.</p>\",\
          \"locationName\":\"firstSlotStartTime\"\
        },\
        \"HourlyPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The hourly price for a single instance.</p>\",\
          \"locationName\":\"hourlyPrice\"\
        },\
        \"TotalScheduledInstanceHours\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The total number of hours for a single instance for the entire term.</p>\",\
          \"locationName\":\"totalScheduledInstanceHours\"\
        },\
        \"AvailableInstanceCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of available instances.</p>\",\
          \"locationName\":\"availableInstanceCount\"\
        },\
        \"MinTermDurationInDays\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The minimum term. The only possible value is 365 days.</p>\",\
          \"locationName\":\"minTermDurationInDays\"\
        },\
        \"MaxTermDurationInDays\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum term. The only possible value is 365 days.</p>\",\
          \"locationName\":\"maxTermDurationInDays\"\
        }\
      },\
      \"documentation\":\"<p>Describes a schedule that is available for your Scheduled Instances.</p>\"\
    },\
    \"ScheduledInstanceAvailabilitySet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ScheduledInstanceAvailability\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ScheduledInstanceIdRequestSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ScheduledInstanceId\"\
      }\
    },\
    \"ScheduledInstanceRecurrence\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Frequency\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The frequency (<code>Daily</code>, <code>Weekly</code>, or <code>Monthly</code>).</p>\",\
          \"locationName\":\"frequency\"\
        },\
        \"Interval\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The interval quantity. The interval unit depends on the value of <code>frequency</code>. For example, every 2 weeks or every 2 months.</p>\",\
          \"locationName\":\"interval\"\
        },\
        \"OccurrenceDaySet\":{\
          \"shape\":\"OccurrenceDaySet\",\
          \"documentation\":\"<p>The days. For a monthly schedule, this is one or more days of the month (1-31). For a weekly schedule, this is one or more days of the week (1-7, where 1 is Sunday).</p>\",\
          \"locationName\":\"occurrenceDaySet\"\
        },\
        \"OccurrenceRelativeToEnd\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the occurrence is relative to the end of the specified week or month.</p>\",\
          \"locationName\":\"occurrenceRelativeToEnd\"\
        },\
        \"OccurrenceUnit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unit for <code>occurrenceDaySet</code> (<code>DayOfWeek</code> or <code>DayOfMonth</code>).</p>\",\
          \"locationName\":\"occurrenceUnit\"\
        }\
      },\
      \"documentation\":\"<p>Describes the recurring schedule for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstanceRecurrenceRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Frequency\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The frequency (<code>Daily</code>, <code>Weekly</code>, or <code>Monthly</code>).</p>\"\
        },\
        \"Interval\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The interval quantity. The interval unit depends on the value of <code>Frequency</code>. For example, every 2 weeks or every 2 months.</p>\"\
        },\
        \"OccurrenceDays\":{\
          \"shape\":\"OccurrenceDayRequestSet\",\
          \"documentation\":\"<p>The days. For a monthly schedule, this is one or more days of the month (1-31). For a weekly schedule, this is one or more days of the week (1-7, where 1 is Sunday). You can't specify this value with a daily schedule. If the occurrence is relative to the end of the month, you can specify only a single day.</p>\",\
          \"locationName\":\"OccurrenceDay\"\
        },\
        \"OccurrenceRelativeToEnd\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the occurrence is relative to the end of the specified week or month. You can't specify this value with a daily schedule.</p>\"\
        },\
        \"OccurrenceUnit\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The unit for <code>OccurrenceDays</code> (<code>DayOfWeek</code> or <code>DayOfMonth</code>). This value is required for a monthly schedule. You can't specify <code>DayOfWeek</code> with a weekly schedule. You can't specify this value with a daily schedule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the recurring schedule for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstanceSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ScheduledInstance\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"ScheduledInstancesBlockDeviceMapping\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>\"\
        },\
        \"NoDevice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Suppresses the specified device included in the block device mapping of the AMI.</p>\"\
        },\
        \"VirtualName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The virtual device name (<code>ephemeral</code>N). Instance store volumes are numbered starting from 0. An instance type with two available instance store volumes can specify mappings for <code>ephemeral0</code> and <code>ephemeral1</code>.The number of available instance store volumes depends on the instance type. After you connect to the instance, you must mount the volume.</p> <p>Constraints: For M3 instances, you must specify instance store volumes in the block device mapping for the instance. When you launch an M3 instance, we ignore any instance store volumes specified in the block device mapping for the AMI.</p>\"\
        },\
        \"Ebs\":{\
          \"shape\":\"ScheduledInstancesEbs\",\
          \"documentation\":\"<p>Parameters used to set up EBS volumes automatically when the instance is launched.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device mapping for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesBlockDeviceMappingSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ScheduledInstancesBlockDeviceMapping\",\
        \"locationName\":\"BlockDeviceMapping\"\
      }\
    },\
    \"ScheduledInstancesEbs\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the snapshot.</p>\"\
        },\
        \"VolumeSize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the volume, in GiB.</p> <p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the volume is deleted on instance termination.</p>\"\
        },\
        \"VolumeType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The volume type. <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, Throughput Optimized HDD for <code>st1</code>, Cold HDD for <code>sc1</code>, or <code>standard</code> for Magnetic.</p> <p>Default: <code>standard</code></p>\"\
        },\
        \"Iops\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of I/O operations per second (IOPS) that the volume supports. For io1 volumes, this represents the number of IOPS that are provisioned for the volume. For <code>gp2</code> volumes, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. For more information about <code>gp2</code> baseline performance, I/O credits, and bursting, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html\\\">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>Constraint: Range is 100-20000 IOPS for <code>io1</code> volumes and 100-10000 IOPS for <code>gp2</code> volumes.</p> <p>Condition: This parameter is required for requests to create <code>io1</code>volumes; it is not used in requests to create <code>gp2</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code> volumes.</p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the volume is encrypted. You can attached encrypted volumes only to instances that support them.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an EBS volume for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesIamInstanceProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN).</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an IAM instance profile for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesLaunchSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"ImageId\"],\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI).</p>\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"ScheduledInstancesSecurityGroupIdSet\",\
          \"documentation\":\"<p>The IDs of one or more security groups.</p>\",\
          \"locationName\":\"SecurityGroupId\"\
        },\
        \"UserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The base64-encoded MIME user data.</p>\"\
        },\
        \"Placement\":{\
          \"shape\":\"ScheduledInstancesPlacement\",\
          \"documentation\":\"<p>The placement information.</p>\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the kernel.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance type.</p>\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the RAM disk.</p>\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"ScheduledInstancesBlockDeviceMappingSet\",\
          \"documentation\":\"<p>One or more block device mapping entries.</p>\",\
          \"locationName\":\"BlockDeviceMapping\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"ScheduledInstancesMonitoring\",\
          \"documentation\":\"<p>Enable or disable monitoring for the instances.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet in which to launch the instances.</p>\"\
        },\
        \"NetworkInterfaces\":{\
          \"shape\":\"ScheduledInstancesNetworkInterfaceSet\",\
          \"documentation\":\"<p>One or more network interfaces.</p>\",\
          \"locationName\":\"NetworkInterface\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"ScheduledInstancesIamInstanceProfile\",\
          \"documentation\":\"<p>The IAM instance profile.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the instances are optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS-optimized instance.</p> <p>Default: <code>false</code></p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the launch specification for a Scheduled Instance.</p> <p>If you are launching the Scheduled Instance in EC2-VPC, you must specify the ID of the subnet. You can specify the subnet using either <code>SubnetId</code> or <code>NetworkInterface</code>.</p>\"\
    },\
    \"ScheduledInstancesMonitoring\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether monitoring is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes whether monitoring is enabled for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesNetworkInterface\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\"\
        },\
        \"DeviceIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The index of the device for the network interface attachment.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description.</p>\"\
        },\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP address of the network interface within the subnet.</p>\"\
        },\
        \"PrivateIpAddressConfigs\":{\
          \"shape\":\"PrivateIpAddressConfigSet\",\
          \"documentation\":\"<p>The private IP addresses.</p>\",\
          \"locationName\":\"PrivateIpAddressConfig\"\
        },\
        \"SecondaryPrivateIpAddressCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of secondary private IP addresses.</p>\"\
        },\
        \"AssociatePublicIpAddress\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to assign a public IP address to instances launched in a VPC. The public IP address can only be assigned to a network interface for eth0, and can only be assigned to a new network interface, not an existing one. You cannot specify more than one network interface in the request. If launching into a default subnet, the default value is <code>true</code>.</p>\"\
        },\
        \"Groups\":{\
          \"shape\":\"ScheduledInstancesSecurityGroupIdSet\",\
          \"documentation\":\"<p>The IDs of one or more security groups.</p>\",\
          \"locationName\":\"Group\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether to delete the interface when the instance is terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a network interface for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesNetworkInterfaceSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"ScheduledInstancesNetworkInterface\",\
        \"locationName\":\"NetworkInterface\"\
      }\
    },\
    \"ScheduledInstancesPlacement\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the placement group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the placement for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesPrivateIpAddressConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrivateIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP address.</p>\"\
        },\
        \"Primary\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this is a primary IP address. Otherwise, this is a secondary IP address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a private IP address for a Scheduled Instance.</p>\"\
    },\
    \"ScheduledInstancesSecurityGroupIdSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SecurityGroupId\"\
      }\
    },\
    \"SecurityGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the security group.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the security group.</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the security group.</p>\",\
          \"locationName\":\"groupDescription\"\
        },\
        \"IpPermissions\":{\
          \"shape\":\"IpPermissionList\",\
          \"documentation\":\"<p>One or more inbound rules associated with the security group.</p>\",\
          \"locationName\":\"ipPermissions\"\
        },\
        \"IpPermissionsEgress\":{\
          \"shape\":\"IpPermissionList\",\
          \"documentation\":\"<p>[EC2-VPC] One or more outbound rules associated with the security group.</p>\",\
          \"locationName\":\"ipPermissionsEgress\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>[EC2-VPC] The ID of the VPC for the security group.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the security group.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a security group</p>\"\
    },\
    \"SecurityGroupIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SecurityGroupId\"\
      }\
    },\
    \"SecurityGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SecurityGroup\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SecurityGroupReference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupId\",\
        \"ReferencingVpcId\"\
      ],\
      \"members\":{\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of your security group.</p>\",\
          \"locationName\":\"groupId\"\
        },\
        \"ReferencingVpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC with the referencing security group.</p>\",\
          \"locationName\":\"referencingVpcId\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a VPC with a security group that references your security group.</p>\"\
    },\
    \"SecurityGroupReferences\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SecurityGroupReference\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SecurityGroupStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SecurityGroup\"\
      }\
    },\
    \"ShutdownBehavior\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"stop\",\
        \"terminate\"\
      ]\
    },\
    \"SlotDateTimeRangeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EarliestTime\",\
        \"LatestTime\"\
      ],\
      \"members\":{\
        \"EarliestTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The earliest date and time, in UTC, for the Scheduled Instance to start.</p>\"\
        },\
        \"LatestTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The latest date and time, in UTC, for the Scheduled Instance to start. This value must be later than or equal to the earliest date and at most three months in the future.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the time period for a Scheduled Instance to start its first schedule. The time period must span less than one day.</p>\"\
    },\
    \"SlotStartTimeRangeRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EarliestTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The earliest date and time, in UTC, for the Scheduled Instance to start.</p>\"\
        },\
        \"LatestTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The latest date and time, in UTC, for the Scheduled Instance to start.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the time period for a Scheduled Instance to start its first schedule.</p>\"\
    },\
    \"Snapshot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the snapshot. Each snapshot receives a unique identifier when it is created.</p>\",\
          \"locationName\":\"snapshotId\"\
        },\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume that was used to create the snapshot.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"State\":{\
          \"shape\":\"SnapshotState\",\
          \"documentation\":\"<p>The snapshot state.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"StateMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Encrypted Amazon EBS snapshots are copied asynchronously. If a snapshot copy operation fails (for example, if the proper AWS Key Management Service (AWS KMS) permissions are not obtained) this field displays error state details to help you diagnose why the error occurred. This parameter is only returned by the <a>DescribeSnapshots</a> API operation.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time stamp when the snapshot was initiated.</p>\",\
          \"locationName\":\"startTime\"\
        },\
        \"Progress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The progress of the snapshot, as a percentage.</p>\",\
          \"locationName\":\"progress\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the EBS snapshot owner.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description for the snapshot.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"VolumeSize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the volume, in GiB.</p>\",\
          \"locationName\":\"volumeSize\"\
        },\
        \"OwnerAlias\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account alias (for example, <code>amazon</code>, <code>self</code>) or AWS account ID that owns the snapshot.</p>\",\
          \"locationName\":\"ownerAlias\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the snapshot.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the snapshot is encrypted.</p>\",\
          \"locationName\":\"encrypted\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the volume encryption key for the parent volume.</p>\",\
          \"locationName\":\"kmsKeyId\"\
        },\
        \"DataEncryptionKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data encryption key identifier for the snapshot. This value is a unique identifier that corresponds to the data encryption key that was used to encrypt the original volume or snapshot copy. Because data encryption keys are inherited by volumes created from snapshots, and vice versa, if snapshots share the same data encryption key identifier, then they belong to the same volume/snapshot lineage. This parameter is only returned by the <a>DescribeSnapshots</a> API operation.</p>\",\
          \"locationName\":\"dataEncryptionKeyId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a snapshot.</p>\"\
    },\
    \"SnapshotAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"productCodes\",\
        \"createVolumePermission\"\
      ]\
    },\
    \"SnapshotDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DiskImageSize\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The size of the disk in the snapshot, in GiB.</p>\",\
          \"locationName\":\"diskImageSize\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description for the snapshot.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"Format\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The format of the disk image from which the snapshot is created.</p>\",\
          \"locationName\":\"format\"\
        },\
        \"Url\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URL used to access the disk image.</p>\",\
          \"locationName\":\"url\"\
        },\
        \"UserBucket\":{\
          \"shape\":\"UserBucketDetails\",\
          \"documentation\":\"<p>The S3 bucket for the disk image.</p>\",\
          \"locationName\":\"userBucket\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The block device mapping for the snapshot.</p>\",\
          \"locationName\":\"deviceName\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The snapshot ID of the disk being imported.</p>\",\
          \"locationName\":\"snapshotId\"\
        },\
        \"Progress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The percentage of progress for the task.</p>\",\
          \"locationName\":\"progress\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A detailed status message for the snapshot creation.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A brief status of the snapshot creation.</p>\",\
          \"locationName\":\"status\"\
        }\
      },\
      \"documentation\":\"<p>Describes the snapshot created from the imported disk.</p>\"\
    },\
    \"SnapshotDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SnapshotDetail\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SnapshotDiskContainer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the disk image being imported.</p>\"\
        },\
        \"Format\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The format of the disk image being imported.</p> <p>Valid values: <code>RAW</code> | <code>VHD</code> | <code>VMDK</code> | <code>OVA</code></p>\"\
        },\
        \"Url\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URL to the Amazon S3-based disk image being imported. It can either be a https URL (https://..) or an Amazon S3 URL (s3://..).</p>\"\
        },\
        \"UserBucket\":{\
          \"shape\":\"UserBucket\",\
          \"documentation\":\"<p>The S3 bucket for the disk image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The disk container object for the import snapshot request.</p>\"\
    },\
    \"SnapshotIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SnapshotId\"\
      }\
    },\
    \"SnapshotList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Snapshot\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SnapshotState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"completed\",\
        \"error\"\
      ]\
    },\
    \"SnapshotTaskDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DiskImageSize\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The size of the disk in the snapshot, in GiB.</p>\",\
          \"locationName\":\"diskImageSize\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the snapshot.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"Format\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The format of the disk image from which the snapshot is created.</p>\",\
          \"locationName\":\"format\"\
        },\
        \"Url\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URL of the disk image from which the snapshot is created.</p>\",\
          \"locationName\":\"url\"\
        },\
        \"UserBucket\":{\
          \"shape\":\"UserBucketDetails\",\
          \"documentation\":\"<p>The S3 bucket for the disk image.</p>\",\
          \"locationName\":\"userBucket\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The snapshot ID of the disk being imported.</p>\",\
          \"locationName\":\"snapshotId\"\
        },\
        \"Progress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The percentage of completion for the import snapshot task.</p>\",\
          \"locationName\":\"progress\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A detailed status message for the import snapshot task.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A brief status for the import snapshot task.</p>\",\
          \"locationName\":\"status\"\
        }\
      },\
      \"documentation\":\"<p>Details about the import snapshot task.</p>\"\
    },\
    \"SpotDatafeedSubscription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the account.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon S3 bucket where the Spot instance data feed is located.</p>\",\
          \"locationName\":\"bucket\"\
        },\
        \"Prefix\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The prefix that is prepended to data feed files.</p>\",\
          \"locationName\":\"prefix\"\
        },\
        \"State\":{\
          \"shape\":\"DatafeedSubscriptionState\",\
          \"documentation\":\"<p>The state of the Spot instance data feed subscription.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"Fault\":{\
          \"shape\":\"SpotInstanceStateFault\",\
          \"documentation\":\"<p>The fault codes for the Spot instance request, if any.</p>\",\
          \"locationName\":\"fault\"\
        }\
      },\
      \"documentation\":\"<p>Describes the data feed for a Spot instance.</p>\"\
    },\
    \"SpotFleetLaunchSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the AMI.</p>\",\
          \"locationName\":\"imageId\"\
        },\
        \"KeyName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the key pair.</p>\",\
          \"locationName\":\"keyName\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"GroupIdentifierList\",\
          \"documentation\":\"<p>One or more security groups. When requesting instances in a VPC, you must specify the IDs of the security groups. When requesting instances in EC2-Classic, you can specify the names or the IDs of the security groups.</p>\",\
          \"locationName\":\"groupSet\"\
        },\
        \"UserData\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Base64-encoded MIME user data to make available to the instances.</p>\",\
          \"locationName\":\"userData\"\
        },\
        \"AddressingType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Deprecated.</p>\",\
          \"locationName\":\"addressingType\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"Placement\":{\
          \"shape\":\"SpotPlacement\",\
          \"documentation\":\"<p>The placement information.</p>\",\
          \"locationName\":\"placement\"\
        },\
        \"KernelId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the kernel.</p>\",\
          \"locationName\":\"kernelId\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the RAM disk.</p>\",\
          \"locationName\":\"ramdiskId\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappingList\",\
          \"documentation\":\"<p>One or more block device mapping entries.</p>\",\
          \"locationName\":\"blockDeviceMapping\"\
        },\
        \"Monitoring\":{\
          \"shape\":\"SpotFleetMonitoring\",\
          \"documentation\":\"<p>Enable or disable monitoring for the instances.</p>\",\
          \"locationName\":\"monitoring\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet in which to launch the instances. To specify multiple subnets, separate them using commas; for example, \\\"subnet-a61dafcf, subnet-65ea5f08\\\".</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"NetworkInterfaces\":{\
          \"shape\":\"InstanceNetworkInterfaceSpecificationList\",\
          \"documentation\":\"<p>One or more network interfaces.</p>\",\
          \"locationName\":\"networkInterfaceSet\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"IamInstanceProfileSpecification\",\
          \"documentation\":\"<p>The IAM instance profile.</p>\",\
          \"locationName\":\"iamInstanceProfile\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the instances are optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"ebsOptimized\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The number of units provided by the specified instance type. These are the same units that you chose to set the target capacity in terms (instances or a performance characteristic such as vCPUs, memory, or I/O).</p> <p>If the target capacity divided by this value is not a whole number, we round the number of instances to the next whole number. If this value is not specified, the default is 1.</p>\",\
          \"locationName\":\"weightedCapacity\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The bid price per unit hour for the specified instance type. If this value is not specified, the default is the Spot bid price specified for the fleet. To determine the bid price per unit hour, divide the Spot bid price by the value of <code>WeightedCapacity</code>.</p>\",\
          \"locationName\":\"spotPrice\"\
        }\
      },\
      \"documentation\":\"<p>Describes the launch specification for one or more Spot instances.</p>\"\
    },\
    \"SpotFleetMonitoring\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Enables monitoring for the instance.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"enabled\"\
        }\
      },\
      \"documentation\":\"<p>Describes whether monitoring is enabled.</p>\"\
    },\
    \"SpotFleetRequestConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotFleetRequestId\",\
        \"SpotFleetRequestState\",\
        \"SpotFleetRequestConfig\",\
        \"CreateTime\"\
      ],\
      \"members\":{\
        \"SpotFleetRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestId\"\
        },\
        \"SpotFleetRequestState\":{\
          \"shape\":\"BatchState\",\
          \"documentation\":\"<p>The state of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestState\"\
        },\
        \"SpotFleetRequestConfig\":{\
          \"shape\":\"SpotFleetRequestConfigData\",\
          \"documentation\":\"<p>Information about the configuration of the Spot fleet request.</p>\",\
          \"locationName\":\"spotFleetRequestConfig\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The creation date and time of the request.</p>\",\
          \"locationName\":\"createTime\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot fleet request.</p>\"\
    },\
    \"SpotFleetRequestConfigData\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SpotPrice\",\
        \"TargetCapacity\",\
        \"IamFleetRole\",\
        \"LaunchSpecifications\"\
      ],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html\\\">Ensuring Idempotency</a>.</p>\",\
          \"locationName\":\"clientToken\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The bid price per unit hour.</p>\",\
          \"locationName\":\"spotPrice\"\
        },\
        \"TargetCapacity\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of units to request. You can choose to set the target capacity in terms of instances or a performance characteristic that is important to your application workload, such as vCPUs, memory, or I/O.</p>\",\
          \"locationName\":\"targetCapacity\"\
        },\
        \"ValidFrom\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The start date and time of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). The default is to start fulfilling the request immediately.</p>\",\
          \"locationName\":\"validFrom\"\
        },\
        \"ValidUntil\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The end date and time of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). At this point, no new Spot instance requests are placed or enabled to fulfill the request.</p>\",\
          \"locationName\":\"validUntil\"\
        },\
        \"TerminateInstancesWithExpiration\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether running Spot instances should be terminated when the Spot fleet request expires.</p>\",\
          \"locationName\":\"terminateInstancesWithExpiration\"\
        },\
        \"IamFleetRole\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Grants the Spot fleet permission to terminate Spot instances on your behalf when you cancel its Spot fleet request using <a>CancelSpotFleetRequests</a> or when the Spot fleet request expires, if you set <code>terminateInstancesWithExpiration</code>.</p>\",\
          \"locationName\":\"iamFleetRole\"\
        },\
        \"LaunchSpecifications\":{\
          \"shape\":\"LaunchSpecsList\",\
          \"documentation\":\"<p>Information about the launch specifications for the Spot fleet request.</p>\",\
          \"locationName\":\"launchSpecifications\"\
        },\
        \"ExcessCapacityTerminationPolicy\":{\
          \"shape\":\"ExcessCapacityTerminationPolicy\",\
          \"documentation\":\"<p>Indicates whether running Spot instances should be terminated if the target capacity of the Spot fleet request is decreased below the current size of the Spot fleet.</p>\",\
          \"locationName\":\"excessCapacityTerminationPolicy\"\
        },\
        \"AllocationStrategy\":{\
          \"shape\":\"AllocationStrategy\",\
          \"documentation\":\"<p>Indicates how to allocate the target capacity across the Spot pools specified by the Spot fleet request. The default is <code>lowestPrice</code>.</p>\",\
          \"locationName\":\"allocationStrategy\"\
        }\
      },\
      \"documentation\":\"<p>Describes the configuration of a Spot fleet request.</p>\"\
    },\
    \"SpotFleetRequestConfigSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SpotFleetRequestConfig\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SpotInstanceRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpotInstanceRequestId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the Spot instance request.</p>\",\
          \"locationName\":\"spotInstanceRequestId\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The maximum hourly price (bid) for the Spot instance launched to fulfill the request.</p>\",\
          \"locationName\":\"spotPrice\"\
        },\
        \"Type\":{\
          \"shape\":\"SpotInstanceType\",\
          \"documentation\":\"<p>The Spot instance request type.</p>\",\
          \"locationName\":\"type\"\
        },\
        \"State\":{\
          \"shape\":\"SpotInstanceState\",\
          \"documentation\":\"<p>The state of the Spot instance request. Spot bid status information can help you track your Spot instance requests. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-bid-status.html\\\">Spot Bid Status</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"Fault\":{\
          \"shape\":\"SpotInstanceStateFault\",\
          \"documentation\":\"<p>The fault codes for the Spot instance request, if any.</p>\",\
          \"locationName\":\"fault\"\
        },\
        \"Status\":{\
          \"shape\":\"SpotInstanceStatus\",\
          \"documentation\":\"<p>The status code and status message describing the Spot instance request.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"ValidFrom\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The start date of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). The request becomes active at this date and time.</p>\",\
          \"locationName\":\"validFrom\"\
        },\
        \"ValidUntil\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The end date of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). If this is a one-time request, it remains active until all instances launch, the request is canceled, or this date is reached. If the request is persistent, it remains active until it is canceled or this date is reached.</p>\",\
          \"locationName\":\"validUntil\"\
        },\
        \"LaunchGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance launch group. Launch groups are Spot instances that launch together and terminate together.</p>\",\
          \"locationName\":\"launchGroup\"\
        },\
        \"AvailabilityZoneGroup\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone group. If you specify the same Availability Zone group for all Spot instance requests, all Spot instances are launched in the same Availability Zone.</p>\",\
          \"locationName\":\"availabilityZoneGroup\"\
        },\
        \"LaunchSpecification\":{\
          \"shape\":\"LaunchSpecification\",\
          \"documentation\":\"<p>Additional information for launching instances.</p>\",\
          \"locationName\":\"launchSpecification\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The instance ID, if an instance has been launched to fulfill the Spot instance request.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time when the Spot instance request was created, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"createTime\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"RIProductDescription\",\
          \"documentation\":\"<p>The product description associated with the Spot instance.</p>\",\
          \"locationName\":\"productDescription\"\
        },\
        \"BlockDurationMinutes\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The duration for the Spot instance, in minutes.</p>\",\
          \"locationName\":\"blockDurationMinutes\"\
        },\
        \"ActualBlockHourlyPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If you specified a duration and your Spot instance request was fulfilled, this is the fixed hourly price in effect for the Spot instance while it runs.</p>\",\
          \"locationName\":\"actualBlockHourlyPrice\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the resource.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"LaunchedAvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone in which the bid is launched.</p>\",\
          \"locationName\":\"launchedAvailabilityZone\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot instance request.</p>\"\
    },\
    \"SpotInstanceRequestIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SpotInstanceRequestId\"\
      }\
    },\
    \"SpotInstanceRequestList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SpotInstanceRequest\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SpotInstanceState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"open\",\
        \"active\",\
        \"closed\",\
        \"cancelled\",\
        \"failed\"\
      ]\
    },\
    \"SpotInstanceStateFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason code for the Spot instance state change.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message for the Spot instance state change.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes a Spot instance state change.</p>\"\
    },\
    \"SpotInstanceStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status code. For a list of status codes, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-bid-status.html#spot-instance-bid-status-understand\\\">Spot Bid Status Codes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time of the most recent status update, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"updateTime\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description for the status code.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of a Spot instance request.</p>\"\
    },\
    \"SpotInstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"one-time\",\
        \"persistent\"\
      ]\
    },\
    \"SpotPlacement\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone.</p> <p>[Spot fleet only] To specify multiple Availability Zones, separate them using commas; for example, \\\"us-west-2a, us-west-2b\\\".</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the placement group (for cluster instances).</p>\",\
          \"locationName\":\"groupName\"\
        }\
      },\
      \"documentation\":\"<p>Describes Spot instance placement.</p>\"\
    },\
    \"SpotPrice\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The instance type.</p>\",\
          \"locationName\":\"instanceType\"\
        },\
        \"ProductDescription\":{\
          \"shape\":\"RIProductDescription\",\
          \"documentation\":\"<p>A general description of the AMI.</p>\",\
          \"locationName\":\"productDescription\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The maximum price (bid) that you are willing to pay for a Spot instance.</p>\",\
          \"locationName\":\"spotPrice\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the request was created, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>\",\
          \"locationName\":\"timestamp\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone.</p>\",\
          \"locationName\":\"availabilityZone\"\
        }\
      },\
      \"documentation\":\"<p>Describes the maximum hourly price (bid) for any Spot instance launched to fulfill the request.</p>\"\
    },\
    \"SpotPriceHistoryList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"SpotPrice\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"StaleIpPermission\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of the port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types. </p>\",\
          \"locationName\":\"fromPort\"\
        },\
        \"IpProtocol\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The IP protocol name (for <code>tcp</code>, <code>udp</code>, and <code>icmp</code>) or number (see <a href=\\\"http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml\\\">Protocol Numbers)</a>.</p>\",\
          \"locationName\":\"ipProtocol\"\
        },\
        \"IpRanges\":{\
          \"shape\":\"IpRanges\",\
          \"documentation\":\"<p>One or more IP ranges. Not applicable for stale security group rules.</p>\",\
          \"locationName\":\"ipRanges\"\
        },\
        \"PrefixListIds\":{\
          \"shape\":\"PrefixListIdSet\",\
          \"documentation\":\"<p>One or more prefix list IDs for an AWS service. Not applicable for stale security group rules.</p>\",\
          \"locationName\":\"prefixListIds\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of the port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types. </p>\",\
          \"locationName\":\"toPort\"\
        },\
        \"UserIdGroupPairs\":{\
          \"shape\":\"UserIdGroupPairSet\",\
          \"documentation\":\"<p>One or more security group pairs. Returns the ID of the referenced security group and VPC, and the ID and status of the VPC peering connection.</p>\",\
          \"locationName\":\"groups\"\
        }\
      },\
      \"documentation\":\"<p>Describes a stale rule in a security group.</p>\"\
    },\
    \"StaleIpPermissionSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"StaleIpPermission\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"StaleSecurityGroup\":{\
      \"type\":\"structure\",\
      \"required\":[\"GroupId\"],\
      \"members\":{\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the security group.</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The description of the security group.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC for the security group.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"StaleIpPermissions\":{\
          \"shape\":\"StaleIpPermissionSet\",\
          \"documentation\":\"<p>Information about the stale inbound rules in the security group.</p>\",\
          \"locationName\":\"staleIpPermissions\"\
        },\
        \"StaleIpPermissionsEgress\":{\
          \"shape\":\"StaleIpPermissionSet\",\
          \"documentation\":\"<p>Information about the stale outbound rules in the security group.</p>\",\
          \"locationName\":\"staleIpPermissionsEgress\"\
        }\
      },\
      \"documentation\":\"<p>Describes a stale security group (a security group that contains stale rules).</p>\"\
    },\
    \"StaleSecurityGroupSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"StaleSecurityGroup\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"StartInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceIds\"],\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AdditionalInfo\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Reserved.</p>\",\
          \"locationName\":\"additionalInfo\"\
        },\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for StartInstances.</p>\"\
    },\
    \"StartInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartingInstances\":{\
          \"shape\":\"InstanceStateChangeList\",\
          \"documentation\":\"<p>Information about one or more started instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of StartInstances.</p>\"\
    },\
    \"State\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Available\",\
        \"Deleting\",\
        \"Deleted\"\
      ]\
    },\
    \"StateReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason code for the state change.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message for the state change.</p> <ul> <li><p><code>Server.SpotInstanceTermination</code>: A Spot instance was terminated due to an increase in the market price.</p></li> <li><p><code>Server.InternalError</code>: An internal error occurred during instance launch, resulting in termination.</p></li> <li><p><code>Server.InsufficientInstanceCapacity</code>: There was insufficient instance capacity to satisfy the launch request.</p></li> <li><p><code>Client.InternalError</code>: A client error caused the instance to terminate on launch.</p></li> <li><p><code>Client.InstanceInitiatedShutdown</code>: The instance was shut down using the <code>shutdown -h</code> command from the instance.</p></li> <li><p><code>Client.UserInitiatedShutdown</code>: The instance was shut down using the Amazon EC2 API.</p></li> <li><p><code>Client.VolumeLimitExceeded</code>: The limit on the number of EBS volumes or total storage was exceeded. Decrease usage or request an increase in your limits.</p></li> <li><p><code>Client.InvalidSnapshot.NotFound</code>: The specified snapshot was not found.</p></li> </ul>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes a state change.</p>\"\
    },\
    \"Status\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MoveInProgress\",\
        \"InVpc\",\
        \"InClassic\"\
      ]\
    },\
    \"StatusName\":{\
      \"type\":\"string\",\
      \"enum\":[\"reachability\"]\
    },\
    \"StatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"passed\",\
        \"failed\",\
        \"insufficient-data\",\
        \"initializing\"\
      ]\
    },\
    \"StopInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Force\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Forces the instances to stop. The instances do not have an opportunity to flush file system caches or file system metadata. If you use this option, you must perform file system check and repair procedures. This option is not recommended for Windows instances.</p> <p>Default: <code>false</code></p>\",\
          \"locationName\":\"force\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for StopInstances.</p>\"\
    },\
    \"StopInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StoppingInstances\":{\
          \"shape\":\"InstanceStateChangeList\",\
          \"documentation\":\"<p>Information about one or more stopped instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of StopInstances.</p>\"\
    },\
    \"Storage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3\":{\
          \"shape\":\"S3Storage\",\
          \"documentation\":\"<p>An Amazon S3 storage location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the storage location for an instance store-backed AMI.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Subnet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the subnet.</p>\",\
          \"locationName\":\"subnetId\"\
        },\
        \"State\":{\
          \"shape\":\"SubnetState\",\
          \"documentation\":\"<p>The current state of the subnet.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC the subnet is in.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block assigned to the subnet.</p>\",\
          \"locationName\":\"cidrBlock\"\
        },\
        \"AvailableIpAddressCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of unused IP addresses in the subnet. Note that the IP addresses for any stopped instances are considered unavailable.</p>\",\
          \"locationName\":\"availableIpAddressCount\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone of the subnet.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"DefaultForAz\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this is the default subnet for the Availability Zone.</p>\",\
          \"locationName\":\"defaultForAz\"\
        },\
        \"MapPublicIpOnLaunch\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether instances launched in this subnet receive a public IP address.</p>\",\
          \"locationName\":\"mapPublicIpOnLaunch\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the subnet.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a subnet.</p>\"\
    },\
    \"SubnetIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"SubnetId\"\
      }\
    },\
    \"SubnetList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Subnet\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"SubnetState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"available\"\
      ]\
    },\
    \"SummaryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ok\",\
        \"impaired\",\
        \"insufficient-data\",\
        \"not-applicable\",\
        \"initializing\"\
      ]\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The key of the tag. </p> <p>Constraints: Tag keys are case-sensitive and accept a maximum of 127 Unicode characters. May not begin with <code>aws:</code></p>\",\
          \"locationName\":\"key\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the tag.</p> <p>Constraints: Tag values are case-sensitive and accept a maximum of 255 Unicode characters.</p>\",\
          \"locationName\":\"value\"\
        }\
      },\
      \"documentation\":\"<p>Describes a tag.</p>\"\
    },\
    \"TagDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the resource. For example, <code>ami-1a2b3c4d</code>.</p>\",\
          \"locationName\":\"resourceId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The resource type.</p>\",\
          \"locationName\":\"resourceType\"\
        },\
        \"Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag key.</p>\",\
          \"locationName\":\"key\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag value.</p>\",\
          \"locationName\":\"value\"\
        }\
      },\
      \"documentation\":\"<p>Describes a tag.</p>\"\
    },\
    \"TagDescriptionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"TagDescription\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Tag\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"TelemetryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UP\",\
        \"DOWN\"\
      ]\
    },\
    \"Tenancy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"default\",\
        \"dedicated\",\
        \"host\"\
      ]\
    },\
    \"TerminateInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for TerminateInstances.</p>\"\
    },\
    \"TerminateInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TerminatingInstances\":{\
          \"shape\":\"InstanceStateChangeList\",\
          \"documentation\":\"<p>Information about one or more terminated instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of TerminateInstances.</p>\"\
    },\
    \"TrafficType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACCEPT\",\
        \"REJECT\",\
        \"ALL\"\
      ]\
    },\
    \"UnassignPrivateIpAddressesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NetworkInterfaceId\",\
        \"PrivateIpAddresses\"\
      ],\
      \"members\":{\
        \"NetworkInterfaceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\",\
          \"locationName\":\"networkInterfaceId\"\
        },\
        \"PrivateIpAddresses\":{\
          \"shape\":\"PrivateIpAddressStringList\",\
          \"documentation\":\"<p>The secondary private IP addresses to unassign from the network interface. You can specify this option multiple times to unassign more than one IP address.</p>\",\
          \"locationName\":\"privateIpAddress\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for UnassignPrivateIpAddresses.</p>\"\
    },\
    \"UnmonitorInstancesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceIds\"],\
      \"members\":{\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>\",\
          \"locationName\":\"dryRun\"\
        },\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIdStringList\",\
          \"documentation\":\"<p>One or more instance IDs.</p>\",\
          \"locationName\":\"InstanceId\"\
        }\
      },\
      \"documentation\":\"<p>Contains the parameters for UnmonitorInstances.</p>\"\
    },\
    \"UnmonitorInstancesResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceMonitorings\":{\
          \"shape\":\"InstanceMonitoringList\",\
          \"documentation\":\"<p>Monitoring information for one or more instances.</p>\",\
          \"locationName\":\"instancesSet\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of UnmonitorInstances.</p>\"\
    },\
    \"UnsuccessfulItem\":{\
      \"type\":\"structure\",\
      \"required\":[\"Error\"],\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the resource.</p>\",\
          \"locationName\":\"resourceId\"\
        },\
        \"Error\":{\
          \"shape\":\"UnsuccessfulItemError\",\
          \"documentation\":\"<p>Information about the error.</p>\",\
          \"locationName\":\"error\"\
        }\
      },\
      \"documentation\":\"<p>Information about items that were not successfully processed in a batch call.</p>\"\
    },\
    \"UnsuccessfulItemError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Code\",\
        \"Message\"\
      ],\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error code.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error message accompanying the error code.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Information about the error that occurred. For more information about errors, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html\\\">Error Codes</a>.</p>\"\
    },\
    \"UnsuccessfulItemList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"UnsuccessfulItem\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"UnsuccessfulItemSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"UnsuccessfulItem\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"UserBucket\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the S3 bucket where the disk image is located.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The file name of the disk image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the S3 bucket for the disk image.</p>\"\
    },\
    \"UserBucketDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The S3 bucket from which the disk image was created.</p>\",\
          \"locationName\":\"s3Bucket\"\
        },\
        \"S3Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The file name of the disk image.</p>\",\
          \"locationName\":\"s3Key\"\
        }\
      },\
      \"documentation\":\"<p>Describes the S3 bucket for the disk image.</p>\"\
    },\
    \"UserData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Data\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Base64-encoded MIME user data for the instance.</p>\",\
          \"locationName\":\"data\"\
        }\
      },\
      \"documentation\":\"<p>Describes the user data to be made available to an instance.</p>\"\
    },\
    \"UserGroupStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"UserGroup\"\
      }\
    },\
    \"UserIdGroupPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of an AWS account. For a referenced security group in another VPC, the account ID of the referenced security group is returned.</p> <p>[EC2-Classic] Required when adding or removing rules that reference a security group in another AWS account.</p>\",\
          \"locationName\":\"userId\"\
        },\
        \"GroupName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the security group. In a request, use this parameter for a security group in EC2-Classic or a default VPC only. For a security group in a nondefault VPC, use the security group ID.</p>\",\
          \"locationName\":\"groupName\"\
        },\
        \"GroupId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the security group.</p>\",\
          \"locationName\":\"groupId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC for the referenced security group, if applicable.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection, if applicable. </p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        },\
        \"PeeringStatus\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The status of a VPC peering connection, if applicable.</p>\",\
          \"locationName\":\"peeringStatus\"\
        }\
      },\
      \"documentation\":\"<p>Describes a security group and AWS account ID pair. </p>\"\
    },\
    \"UserIdGroupPairList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"UserIdGroupPair\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"UserIdGroupPairSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"UserIdGroupPair\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"UserIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"UserId\"\
      }\
    },\
    \"ValueStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VgwTelemetry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OutsideIpAddress\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Internet-routable IP address of the virtual private gateway's outside interface.</p>\",\
          \"locationName\":\"outsideIpAddress\"\
        },\
        \"Status\":{\
          \"shape\":\"TelemetryStatus\",\
          \"documentation\":\"<p>The status of the VPN tunnel.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"LastStatusChange\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time of the last change in status.</p>\",\
          \"locationName\":\"lastStatusChange\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If an error occurs, a description of the error.</p>\",\
          \"locationName\":\"statusMessage\"\
        },\
        \"AcceptedRouteCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of accepted routes.</p>\",\
          \"locationName\":\"acceptedRouteCount\"\
        }\
      },\
      \"documentation\":\"<p>Describes telemetry for a VPN tunnel.</p>\"\
    },\
    \"VgwTelemetryList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VgwTelemetry\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VirtualizationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"hvm\",\
        \"paravirtual\"\
      ]\
    },\
    \"Volume\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"Size\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the volume, in GiBs.</p>\",\
          \"locationName\":\"size\"\
        },\
        \"SnapshotId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The snapshot from which the volume was created, if applicable.</p>\",\
          \"locationName\":\"snapshotId\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone for the volume.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"State\":{\
          \"shape\":\"VolumeState\",\
          \"documentation\":\"<p>The volume state.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time stamp when volume creation was initiated.</p>\",\
          \"locationName\":\"createTime\"\
        },\
        \"Attachments\":{\
          \"shape\":\"VolumeAttachmentList\",\
          \"documentation\":\"<p>Information about the volume attachments.</p>\",\
          \"locationName\":\"attachmentSet\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the volume.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"VolumeType\":{\
          \"shape\":\"VolumeType\",\
          \"documentation\":\"<p>The volume type. This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for Magnetic volumes.</p>\",\
          \"locationName\":\"volumeType\"\
        },\
        \"Iops\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of I/O operations per second (IOPS) that the volume supports. For Provisioned IOPS SSD volumes, this represents the number of IOPS that are provisioned for the volume. For General Purpose SSD volumes, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. For more information on General Purpose SSD baseline performance, I/O credits, and bursting, see <a href=\\\"http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html\\\">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>Constraint: Range is 100-20000 IOPS for io1 volumes and 100-10000 IOPS for <code>gp2</code> volumes.</p> <p>Condition: This parameter is required for requests to create <code>io1</code> volumes; it is not used in requests to create <code>gp2</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code> volumes.</p>\",\
          \"locationName\":\"iops\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the volume will be encrypted.</p>\",\
          \"locationName\":\"encrypted\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the volume encryption key for the volume.</p>\",\
          \"locationName\":\"kmsKeyId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a volume.</p>\"\
    },\
    \"VolumeAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the volume.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the instance.</p>\",\
          \"locationName\":\"instanceId\"\
        },\
        \"Device\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The device name.</p>\",\
          \"locationName\":\"device\"\
        },\
        \"State\":{\
          \"shape\":\"VolumeAttachmentState\",\
          \"documentation\":\"<p>The attachment state of the volume.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"AttachTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time stamp when the attachment initiated.</p>\",\
          \"locationName\":\"attachTime\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the EBS volume is deleted on instance termination.</p>\",\
          \"locationName\":\"deleteOnTermination\"\
        }\
      },\
      \"documentation\":\"<p>Describes volume attachment details.</p>\"\
    },\
    \"VolumeAttachmentList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VolumeAttachment\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VolumeAttachmentState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"attaching\",\
        \"attached\",\
        \"detaching\",\
        \"detached\"\
      ]\
    },\
    \"VolumeAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"autoEnableIO\",\
        \"productCodes\"\
      ]\
    },\
    \"VolumeDetail\":{\
      \"type\":\"structure\",\
      \"required\":[\"Size\"],\
      \"members\":{\
        \"Size\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the volume, in GiB.</p>\",\
          \"locationName\":\"size\"\
        }\
      },\
      \"documentation\":\"<p>Describes an EBS volume.</p>\"\
    },\
    \"VolumeIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"VolumeId\"\
      }\
    },\
    \"VolumeList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Volume\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VolumeState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"creating\",\
        \"available\",\
        \"in-use\",\
        \"deleting\",\
        \"deleted\",\
        \"error\"\
      ]\
    },\
    \"VolumeStatusAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The code identifying the operation, for example, <code>enable-volume-io</code>.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the operation.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"EventType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The event type associated with this operation.</p>\",\
          \"locationName\":\"eventType\"\
        },\
        \"EventId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the event associated with this operation.</p>\",\
          \"locationName\":\"eventId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a volume status operation code.</p>\"\
    },\
    \"VolumeStatusActionsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VolumeStatusAction\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VolumeStatusDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"VolumeStatusName\",\
          \"documentation\":\"<p>The name of the volume status.</p>\",\
          \"locationName\":\"name\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The intended status of the volume status.</p>\",\
          \"locationName\":\"status\"\
        }\
      },\
      \"documentation\":\"<p>Describes a volume status.</p>\"\
    },\
    \"VolumeStatusDetailsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VolumeStatusDetails\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VolumeStatusEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The type of this event.</p>\",\
          \"locationName\":\"eventType\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the event.</p>\",\
          \"locationName\":\"description\"\
        },\
        \"NotBefore\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The earliest start time of the event.</p>\",\
          \"locationName\":\"notBefore\"\
        },\
        \"NotAfter\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The latest end time of the event.</p>\",\
          \"locationName\":\"notAfter\"\
        },\
        \"EventId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of this event.</p>\",\
          \"locationName\":\"eventId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a volume status event.</p>\"\
    },\
    \"VolumeStatusEventsList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VolumeStatusEvent\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VolumeStatusInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VolumeStatusInfoStatus\",\
          \"documentation\":\"<p>The status of the volume.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"Details\":{\
          \"shape\":\"VolumeStatusDetailsList\",\
          \"documentation\":\"<p>The details of the volume status.</p>\",\
          \"locationName\":\"details\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of a volume.</p>\"\
    },\
    \"VolumeStatusInfoStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ok\",\
        \"impaired\",\
        \"insufficient-data\"\
      ]\
    },\
    \"VolumeStatusItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The volume ID.</p>\",\
          \"locationName\":\"volumeId\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone of the volume.</p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"VolumeStatus\":{\
          \"shape\":\"VolumeStatusInfo\",\
          \"documentation\":\"<p>The volume status.</p>\",\
          \"locationName\":\"volumeStatus\"\
        },\
        \"Events\":{\
          \"shape\":\"VolumeStatusEventsList\",\
          \"documentation\":\"<p>A list of events associated with the volume.</p>\",\
          \"locationName\":\"eventsSet\"\
        },\
        \"Actions\":{\
          \"shape\":\"VolumeStatusActionsList\",\
          \"documentation\":\"<p>The details of the operation.</p>\",\
          \"locationName\":\"actionsSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes the volume status.</p>\"\
    },\
    \"VolumeStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VolumeStatusItem\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VolumeStatusName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"io-enabled\",\
        \"io-performance\"\
      ]\
    },\
    \"VolumeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"standard\",\
        \"io1\",\
        \"gp2\",\
        \"sc1\",\
        \"st1\"\
      ]\
    },\
    \"Vpc\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"State\":{\
          \"shape\":\"VpcState\",\
          \"documentation\":\"<p>The current state of the VPC.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block for the VPC.</p>\",\
          \"locationName\":\"cidrBlock\"\
        },\
        \"DhcpOptionsId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the set of DHCP options you've associated with the VPC (or <code>default</code> if the default options are associated with the VPC).</p>\",\
          \"locationName\":\"dhcpOptionsId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the VPC.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"InstanceTenancy\":{\
          \"shape\":\"Tenancy\",\
          \"documentation\":\"<p>The allowed tenancy of instances launched into the VPC.</p>\",\
          \"locationName\":\"instanceTenancy\"\
        },\
        \"IsDefault\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the VPC is the default VPC.</p>\",\
          \"locationName\":\"isDefault\"\
        }\
      },\
      \"documentation\":\"<p>Describes a VPC.</p>\"\
    },\
    \"VpcAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"State\":{\
          \"shape\":\"AttachmentStatus\",\
          \"documentation\":\"<p>The current state of the attachment.</p>\",\
          \"locationName\":\"state\"\
        }\
      },\
      \"documentation\":\"<p>Describes an attachment between a virtual private gateway and a VPC.</p>\"\
    },\
    \"VpcAttachmentList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpcAttachment\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpcAttributeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"enableDnsSupport\",\
        \"enableDnsHostnames\"\
      ]\
    },\
    \"VpcClassicLink\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"ClassicLinkEnabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the VPC is enabled for ClassicLink.</p>\",\
          \"locationName\":\"classicLinkEnabled\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the VPC.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes whether a VPC is enabled for ClassicLink.</p>\"\
    },\
    \"VpcClassicLinkIdList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"VpcId\"\
      }\
    },\
    \"VpcClassicLinkList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpcClassicLink\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpcEndpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcEndpointId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC endpoint.</p>\",\
          \"locationName\":\"vpcEndpointId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC to which the endpoint is associated.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"ServiceName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the AWS service to which the endpoint is associated.</p>\",\
          \"locationName\":\"serviceName\"\
        },\
        \"State\":{\
          \"shape\":\"State\",\
          \"documentation\":\"<p>The state of the VPC endpoint.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"PolicyDocument\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The policy document associated with the endpoint.</p>\",\
          \"locationName\":\"policyDocument\"\
        },\
        \"RouteTableIds\":{\
          \"shape\":\"ValueStringList\",\
          \"documentation\":\"<p>One or more route tables associated with the endpoint.</p>\",\
          \"locationName\":\"routeTableIdSet\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the VPC endpoint was created.</p>\",\
          \"locationName\":\"creationTimestamp\"\
        }\
      },\
      \"documentation\":\"<p>Describes a VPC endpoint.</p>\"\
    },\
    \"VpcEndpointSet\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpcEndpoint\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpcIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"VpcId\"\
      }\
    },\
    \"VpcList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"Vpc\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpcPeeringConnection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccepterVpcInfo\":{\
          \"shape\":\"VpcPeeringConnectionVpcInfo\",\
          \"documentation\":\"<p>Information about the accepter VPC. CIDR block information is not returned when creating a VPC peering connection, or when describing a VPC peering connection that's in the <code>initiating-request</code> or <code>pending-acceptance</code> state.</p>\",\
          \"locationName\":\"accepterVpcInfo\"\
        },\
        \"ExpirationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time that an unaccepted VPC peering connection will expire.</p>\",\
          \"locationName\":\"expirationTime\"\
        },\
        \"RequesterVpcInfo\":{\
          \"shape\":\"VpcPeeringConnectionVpcInfo\",\
          \"documentation\":\"<p>Information about the requester VPC.</p>\",\
          \"locationName\":\"requesterVpcInfo\"\
        },\
        \"Status\":{\
          \"shape\":\"VpcPeeringConnectionStateReason\",\
          \"documentation\":\"<p>The status of the VPC peering connection.</p>\",\
          \"locationName\":\"status\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the resource.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC peering connection.</p>\",\
          \"locationName\":\"vpcPeeringConnectionId\"\
        }\
      },\
      \"documentation\":\"<p>Describes a VPC peering connection.</p>\"\
    },\
    \"VpcPeeringConnectionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpcPeeringConnection\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpcPeeringConnectionOptionsDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowEgressFromLocalClassicLinkToRemoteVpc\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether a local ClassicLink connection can communicate with the peer VPC over the VPC peering connection.</p>\",\
          \"locationName\":\"allowEgressFromLocalClassicLinkToRemoteVpc\"\
        },\
        \"AllowEgressFromLocalVpcToRemoteClassicLink\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether a local VPC can communicate with a ClassicLink connection in the peer VPC over the VPC peering connection.</p>\",\
          \"locationName\":\"allowEgressFromLocalVpcToRemoteClassicLink\"\
        }\
      },\
      \"documentation\":\"<p>Describes the VPC peering connection options.</p>\"\
    },\
    \"VpcPeeringConnectionStateReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"VpcPeeringConnectionStateReasonCode\",\
          \"documentation\":\"<p>The status of the VPC peering connection.</p>\",\
          \"locationName\":\"code\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message that provides more information about the status, if applicable.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>Describes the status of a VPC peering connection.</p>\"\
    },\
    \"VpcPeeringConnectionStateReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"initiating-request\",\
        \"pending-acceptance\",\
        \"active\",\
        \"deleted\",\
        \"rejected\",\
        \"failed\",\
        \"expired\",\
        \"provisioning\",\
        \"deleting\"\
      ]\
    },\
    \"VpcPeeringConnectionVpcInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block for the VPC.</p>\",\
          \"locationName\":\"cidrBlock\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS account ID of the VPC owner.</p>\",\
          \"locationName\":\"ownerId\"\
        },\
        \"VpcId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\",\
          \"locationName\":\"vpcId\"\
        },\
        \"PeeringOptions\":{\
          \"shape\":\"VpcPeeringConnectionOptionsDescription\",\
          \"documentation\":\"<p>Information about the VPC peering connection options for the accepter or requester VPC.</p>\",\
          \"locationName\":\"peeringOptions\"\
        }\
      },\
      \"documentation\":\"<p>Describes a VPC in a VPC peering connection.</p>\"\
    },\
    \"VpcState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"available\"\
      ]\
    },\
    \"VpnConnection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpnConnectionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the VPN connection.</p>\",\
          \"locationName\":\"vpnConnectionId\"\
        },\
        \"State\":{\
          \"shape\":\"VpnState\",\
          \"documentation\":\"<p>The current state of the VPN connection.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"CustomerGatewayConfiguration\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The configuration information for the VPN connection's customer gateway (in the native XML format). This element is always present in the <a>CreateVpnConnection</a> response; however, it's present in the <a>DescribeVpnConnections</a> response only if the VPN connection is in the <code>pending</code> or <code>available</code> state.</p>\",\
          \"locationName\":\"customerGatewayConfiguration\"\
        },\
        \"Type\":{\
          \"shape\":\"GatewayType\",\
          \"documentation\":\"<p>The type of VPN connection.</p>\",\
          \"locationName\":\"type\"\
        },\
        \"CustomerGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the customer gateway at your end of the VPN connection.</p>\",\
          \"locationName\":\"customerGatewayId\"\
        },\
        \"VpnGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway at the AWS side of the VPN connection.</p>\",\
          \"locationName\":\"vpnGatewayId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the VPN connection.</p>\",\
          \"locationName\":\"tagSet\"\
        },\
        \"VgwTelemetry\":{\
          \"shape\":\"VgwTelemetryList\",\
          \"documentation\":\"<p>Information about the VPN tunnel.</p>\",\
          \"locationName\":\"vgwTelemetry\"\
        },\
        \"Options\":{\
          \"shape\":\"VpnConnectionOptions\",\
          \"documentation\":\"<p>The VPN connection options.</p>\",\
          \"locationName\":\"options\"\
        },\
        \"Routes\":{\
          \"shape\":\"VpnStaticRouteList\",\
          \"documentation\":\"<p>The static routes associated with the VPN connection.</p>\",\
          \"locationName\":\"routes\"\
        }\
      },\
      \"documentation\":\"<p>Describes a VPN connection.</p>\"\
    },\
    \"VpnConnectionIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"VpnConnectionId\"\
      }\
    },\
    \"VpnConnectionList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpnConnection\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpnConnectionOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StaticRoutesOnly\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.</p>\",\
          \"locationName\":\"staticRoutesOnly\"\
        }\
      },\
      \"documentation\":\"<p>Describes VPN connection options.</p>\"\
    },\
    \"VpnConnectionOptionsSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StaticRoutesOnly\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.</p>\",\
          \"locationName\":\"staticRoutesOnly\"\
        }\
      },\
      \"documentation\":\"<p>Describes VPN connection options.</p>\"\
    },\
    \"VpnGateway\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpnGatewayId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ID of the virtual private gateway.</p>\",\
          \"locationName\":\"vpnGatewayId\"\
        },\
        \"State\":{\
          \"shape\":\"VpnState\",\
          \"documentation\":\"<p>The current state of the virtual private gateway.</p>\",\
          \"locationName\":\"state\"\
        },\
        \"Type\":{\
          \"shape\":\"GatewayType\",\
          \"documentation\":\"<p>The type of VPN connection the virtual private gateway supports.</p>\",\
          \"locationName\":\"type\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Availability Zone where the virtual private gateway was created, if applicable. This field may be empty or not returned. </p>\",\
          \"locationName\":\"availabilityZone\"\
        },\
        \"VpcAttachments\":{\
          \"shape\":\"VpcAttachmentList\",\
          \"documentation\":\"<p>Any VPCs attached to the virtual private gateway.</p>\",\
          \"locationName\":\"attachments\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Any tags assigned to the virtual private gateway.</p>\",\
          \"locationName\":\"tagSet\"\
        }\
      },\
      \"documentation\":\"<p>Describes a virtual private gateway.</p>\"\
    },\
    \"VpnGatewayIdStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"VpnGatewayId\"\
      }\
    },\
    \"VpnGatewayList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpnGateway\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpnState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"pending\",\
        \"available\",\
        \"deleting\",\
        \"deleted\"\
      ]\
    },\
    \"VpnStaticRoute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DestinationCidrBlock\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The CIDR block associated with the local subnet of the customer data center.</p>\",\
          \"locationName\":\"destinationCidrBlock\"\
        },\
        \"Source\":{\
          \"shape\":\"VpnStaticRouteSource\",\
          \"documentation\":\"<p>Indicates how the routes were provided.</p>\",\
          \"locationName\":\"source\"\
        },\
        \"State\":{\
          \"shape\":\"VpnState\",\
          \"documentation\":\"<p>The current state of the static route.</p>\",\
          \"locationName\":\"state\"\
        }\
      },\
      \"documentation\":\"<p>Describes a static route for a VPN connection.</p>\"\
    },\
    \"VpnStaticRouteList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"VpnStaticRoute\",\
        \"locationName\":\"item\"\
      }\
    },\
    \"VpnStaticRouteSource\":{\
      \"type\":\"string\",\
      \"enum\":[\"Static\"]\
    },\
    \"ZoneNameStringList\":{\
      \"type\":\"list\",\
      \"member\":{\
        \"shape\":\"String\",\
        \"locationName\":\"ZoneName\"\
      }\
    }\
  },\
  \"documentation\":\"<fullname>Amazon Elastic Compute Cloud</fullname> <p>Amazon Elastic Compute Cloud (Amazon EC2) provides resizable computing capacity in the Amazon Web Services (AWS) cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and deploy applications faster.</p>\"\
}\
";
}

@end
