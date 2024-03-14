tofu init
tofu validate
tofu fmt
tofu plan
tofu apply -auto-approve

Возникает ошибка: fatal error: out of memory
Лог:
sbercloud_obs_bucket_object.GPU_driver: Creating...
╷
│ Error: Plugin did not respond
│
│   with sbercloud_obs_bucket_object.GPU_driver,
│   on kuber.tf line 6, in resource "sbercloud_obs_bucket_object" "GPU_driver":
│    6: resource "sbercloud_obs_bucket_object" "GPU_driver" {
│
│ The plugin encountered an error, and failed to respond to the plugin.(*GRPCProvider).ApplyResourceChange call. The plugin logs may contain more details.
╵

Stack trace from the terraform-provider-sbercloud_v1.11.6.exe plugin:

fatal error: out of memory

goroutine 67 [running]:
runtime.throw({0x1a58b33, 0xd})
        runtime/panic.go:1077 +0x4d fp=0xc3f2d24 sp=0xc3f2d10 pc=0x55cf1d
runtime.(*mcache).allocLarge(0x3260088, 0x145eff30, 0x1)
        runtime/mcache.go:236 +0x1c5 fp=0xc3f2d50 sp=0xc3f2d24 pc=0x537d95
runtime.mallocgc(0x145eff30, 0x0, 0x0)
        runtime/malloc.go:1123 +0x5bd fp=0xc3f2da4 sp=0xc3f2d50 pc=0x52f8cd
runtime.slicebytetostring(0x0, 0x3fc00000, 0x145eff30)
        runtime/string.go:112 +0x76 fp=0xc3f2dbc sp=0xc3f2da4 pc=0x576116
bytes.(*Buffer).String(...)
        bytes/buffer.go:71
github.com/huaweicloud/terraform-provider-huaweicloud/huaweicloud/config.(*LogRoundTripper).logRequest(0xc3e8d20, {0x1cdf528, 0xc3cc4b0}, {0x0, 0x0})
        github.com/huaweicloud/terraform-provider-huaweicloud@v1.57.0/huaweicloud/config/logger.go:115 +0x2b9 fp=0xc3f2e40 sp=0xc3f2dbc pc=0x11b2b99
github.com/huaweicloud/terraform-provider-huaweicloud/huaweicloud/config.(*LogRoundTripper).RoundTrip(0xc3e8d20, 0xc5b8180)
        github.com/huaweicloud/terraform-provider-huaweicloud@v1.57.0/huaweicloud/config/logger.go:56 +0x28d fp=0xc3f2ee4 sp=0xc3f2e40 pc=0x11b1fed
net/http.send(0xc5b8180, {0x1cda4e0, 0xc3e8d20}, {0x0, 0x0, 0x0})
        net/http/client.go:260 +0x592 fp=0xc3f3038 sp=0xc3f2ee4 pc=0x8ed422
net/http.(*Client).send(0xc36089c, 0xc5b8180, {0x0, 0x0, 0x0})
        net/http/client.go:181 +0x87 fp=0xc3f307c sp=0xc3f3038 pc=0x8eccf7
net/http.(*Client).do(0xc36089c, 0xc5b8180)
        net/http/client.go:724 +0x8d0 fp=0xc3f3194 sp=0xc3f307c pc=0x8eeff0
net/http.(*Client).Do(...)
        net/http/client.go:590
github.com/chnsz/golangsdk/openstack/obs.ObsClient.doHTTP({0xc106580, 0xc36089c}, {0x1a4ae1f, 0x3}, {0xc506558, 0x12}, {0xc4d4240, 0x2a}, 0xc4d0ae0, 0xc4d0b00, ...)   
        github.com/chnsz/golangsdk@v0.0.0-20231027080141-c5721e2542e4/openstack/obs/http.go:533 +0x3cf fp=0xc3f3280 sp=0xc3f3194 pc=0xcf1e6f
github.com/chnsz/golangsdk/openstack/obs.ObsClient.doHTTPRequest({0xc106580, 0xc36089c}, {0x1a4ae1f, 0x3}, {0xc506558, 0x12}, {0xc4d4240, 0x2a}, 0xc4d0ae0, 0xc4d0ac0, 
...)
        github.com/chnsz/golangsdk@v0.0.0-20231027080141-c5721e2542e4/openstack/obs/http.go:180 +0xce fp=0xc3f32cc sp=0xc3f3280 pc=0xcef1de
github.com/chnsz/golangsdk/openstack/obs.ObsClient.doAction({0xc106580, 0xc36089c}, {0x1a4f30f, 0x7}, {0x1a4ae1f, 0x3}, {0xc506558, 0x12}, {0xc4d4240, 0x2a}, ...)     
        github.com/chnsz/golangsdk@v0.0.0-20231027080141-c5721e2542e4/openstack/obs/http.go:163 +0x2c3 fp=0xc3f3408 sp=0xc3f32cc pc=0xceef13
github.com/chnsz/golangsdk/openstack/obs.ObsClient.doActionWithBucketAndKeyWithProgress({0xc106580, 0xc36089c}, {0x1a4f30f, 0x7}, {0x1a4ae1f, 0x3}, {0xc506558, 0x12}, 
{0xc4d4240, 0x2a}, ...)
        github.com/chnsz/golangsdk@v0.0.0-20231027080141-c5721e2542e4/openstack/obs/http.go:99 +0x194 fp=0xc3f3464 sp=0xc3f3408 pc=0xcee6e4
github.com/chnsz/golangsdk/openstack/obs.ObsClient.PutFile({0xc106580, 0xc36089c}, 0xc0b0370, {0x0, 0x0, 0x0})
        github.com/chnsz/golangsdk@v0.0.0-20231027080141-c5721e2542e4/openstack/obs/client_object.go:377 +0x48f fp=0xc3f3510 sp=0xc3f3464 pc=0xcdc66f
github.com/huaweicloud/terraform-provider-huaweicloud/huaweicloud/services/obs.putFileToObject(0xc1f93a8, 0xc346af0)
        github.com/huaweicloud/terraform-provider-huaweicloud@v1.57.0/huaweicloud/services/obs/resource_huaweicloud_obs_bucket_object.go:231 +0x483 fp=0xc3f3590 sp=0xc3f3510 pc=0x1238ce3
github.com/huaweicloud/terraform-provider-huaweicloud/huaweicloud/services/obs.resourceObsBucketObjectPut({0x1ce19a0, 0xc346b40}, 0xc346af0, {0x1a440c0, 0xc263d40})   
        github.com/huaweicloud/terraform-provider-huaweicloud@v1.57.0/huaweicloud/services/obs/resource_huaweicloud_obs_bucket_object.go:140 +0x709 fp=0xc3f3704 sp=0xc3f3590 pc=0x1237ae9
github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema.(*Resource).create(0xc017c00, {0x1ce1940, 0xc4e2c78}, 0xc346af0, {0x1a440c0, 0xc263d40})
        github.com/hashicorp/terraform-plugin-sdk/v2@v2.24.0/helper/schema/resource.go:707 +0x11d fp=0xc3f3738 sp=0xc3f3704 pc=0xbd0e7d
github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema.(*Resource).Apply(0xc017c00, {0x1ce1940, 0xc4e2c78}, 0xc4bf9d0, 0xc346a00, {0x1a440c0, 0xc263d40})
        github.com/hashicorp/terraform-plugin-sdk/v2@v2.24.0/helper/schema/resource.go:837 +0xa8b fp=0xc3f3904 sp=0xc3f3738 pc=0xbd202b
github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema.(*GRPCProviderServer).ApplyResourceChange(0xc2f4a00, {0x1ce1940, 0xc4e2c30}, 0xc4d9620)
        github.com/hashicorp/terraform-plugin-sdk/v2@v2.24.0/helper/schema/grpc_provider.go:1021 +0xf46 fp=0xc3f3a60 sp=0xc3f3904 pc=0xbca7a6
github.com/hashicorp/terraform-plugin-go/tfprotov5/tf5server.(*server).ApplyResourceChange(0xc100d70, {0x1ce1940, 0xc4e2948}, 0xc4b2f80)
        github.com/hashicorp/terraform-plugin-go@v0.14.0/tfprotov5/tf5server/server.go:818 +0x582 fp=0xc3f3cd4 sp=0xc3f3a60 pc=0xa96ac2
github.com/hashicorp/terraform-plugin-go/tfprotov5/internal/tfplugin5._Provider_ApplyResourceChange_Handler({0x1a05ce0, 0xc100d70}, {0x1ce1940, 0xc4e2948}, 0xc4b2f40, 
0x0)
        github.com/hashicorp/terraform-plugin-go@v0.14.0/tfprotov5/internal/tfplugin5/tfplugin5_grpc.pb.go:385 +0x176 fp=0xc3f3d08 sp=0xc3f3cd4 pc=0xa7e456
google.golang.org/grpc.(*Server).processUnaryRPC(0xc342120, {0x1ce383c, 0xc150240}, 0xc1ecd20, 0xc115c50, 0x29c72a0, 0x0)
        google.golang.org/grpc@v1.56.3/server.go:1335 +0xee7 fp=0xc3f3f1c sp=0xc3f3d08 pc=0x9eadb7
google.golang.org/grpc.(*Server).handleStream(0xc342120, {0x1ce383c, 0xc150240}, 0xc1ecd20, 0x0)
        google.golang.org/grpc@v1.56.3/server.go:1712 +0xa02 fp=0xc3f3fac sp=0xc3f3f1c pc=0x9ef282
google.golang.org/grpc.(*Server).serveStreams.func1.1()
        google.golang.org/grpc@v1.56.3/server.go:947 +0xe1 fp=0xc3f3ff0 sp=0xc3f3fac pc=0x9e8b31
runtime.goexit()
        runtime/asm_386.s:1363 +0x1 fp=0xc3f3ff4 sp=0xc3f3ff0 pc=0x58d591
created by google.golang.org/grpc.(*Server).serveStreams.func1 in goroutine 55
        google.golang.org/grpc@v1.56.3/server.go:958 +0x14c

goroutine 1 [select]:
runtime.gopark(0x1af33dc, 0x0, 0x9, 0x18, 0x1)
        runtime/proc.go:398 +0xfd fp=0xc24da04 sp=0xc24d9f0 pc=0x55ff6d
runtime.selectgo(0xc24dc5c, 0xc2e9b80, 0x0, 0x0, 0x2, 0x1)
        runtime/select.go:327 +0xac6 fp=0xc24dae4 sp=0xc24da04 pc=0x56f876
github.com/hashicorp/go-plugin.Serve(0xc07fbc0)
        github.com/hashicorp/go-plugin@v1.4.4/server.go:471 +0x14cd fp=0xc24dd70 sp=0xc24dae4 pc=0xa36add
github.com/hashicorp/terraform-plugin-go/tfprotov5/tf5server.Serve({0x1a50331, 0x8}, 0xc1f9010, {0x0, 0x0, 0x0})
        github.com/hashicorp/terraform-plugin-go@v0.14.0/tfprotov5/tf5server/server.go:312 +0xc00 fp=0xc24deac sp=0xc24dd70 pc=0xa90ec0
github.com/hashicorp/terraform-plugin-sdk/v2/plugin.tf5serverServe(0xc07fb90)
        github.com/hashicorp/terraform-plugin-sdk/v2@v2.24.0/plugin/serve.go:185 +0x47e fp=0xc24df18 sp=0xc24deac pc=0xbedc1e
github.com/hashicorp/terraform-plugin-sdk/v2/plugin.Serve(0xc07fb90)
        github.com/hashicorp/terraform-plugin-sdk/v2@v2.24.0/plugin/serve.go:125 +0x196 fp=0xc24df98 sp=0xc24df18 pc=0xbed4f6
main.main()
        github.com/sbercloud-terraform/terraform-provider-sbercloud/main.go:9 +0x35 fp=0xc24dfa4 sp=0xc24df98 pc=0x160f7c5
runtime.main()
        runtime/proc.go:267 +0x2b7 fp=0xc24dff0 sp=0xc24dfa4 pc=0x55faf7
runtime.goexit()
        runtime/asm_386.s:1363 +0x1 fp=0xc24dff4 sp=0xc24dff0 pc=0x58d591

goroutine 2 [force gc (idle)]:
runtime.gopark(0x1af33a8, 0x29cd320, 0x11, 0x14, 0x1)
        runtime/proc.go:398 +0xfd fp=0xc073fdc sp=0xc073fc8 pc=0x55ff6d
runtime.goparkunlock(...)
        runtime/proc.go:404
runtime.forcegchelper()
        runtime/proc.go:322 +0xcf fp=0xc073ff0 sp=0xc073fdc pc=0x55fdbf
runtime.goexit()
        runtime/asm_386.s:1363 +0x1 fp=0xc073ff4 sp=0xc073ff0 pc=0x58d591
created by runtime.init.5 in goroutine 1
        runtime/proc.go:310 +0x21

goroutine 3 [GC sweep wait]:
runtime.gopark(0x1af33a8, 0x29ce220, 0xc, 0x14, 0x1)
        runtime/proc.go:398 +0xfd fp=0xc074fcc sp=0xc074fb8 pc=0x55ff6d
runtime.goparkunlock(...)
        runtime/proc.go:404
runtime.bgsweep(0xc038240)
        runtime/mgcsweep.go:321 +0xf4 fp=0xc074fe8 sp=0xc074fcc pc=0x549db4
runtime.gcenable.func1()
        runtime/mgc.go:200 +0x25 fp=0xc074ff0 sp=0xc074fe8 pc=0x53bd85

Error: The terraform-provider-sbercloud_v1.11.6.exe plugin crashed!

This is always indicative of a bug within the plugin. It would be immensely
helpful if you could report the crash with the plugin's maintainers so that it
can be fixed. The output above should help diagnose the issue.