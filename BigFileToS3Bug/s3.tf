resource "sbercloud_obs_bucket" "bucket" {
  bucket = "test-bucket-100500"
  acl    = "public-read"
}

resource "sbercloud_obs_bucket_object" "GPU_driver" {
  bucket = sbercloud_obs_bucket.bucket.id
  key    = "drivers/NVIDIA-Linux-x86_64-535.161.07.run"
  source = "drivers/NVIDIA-Linux-x86_64-535.161.07.run"
  etag   = filemd5("drivers/NVIDIA-Linux-x86_64-535.161.07.run")
}