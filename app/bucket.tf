module "bucket" {
  count  = length(var.buckets)
  source = "../bucket"

  name    = var.buckets[count.index]["name"]
  private = var.buckets[count.index]["private"]
}
