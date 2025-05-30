/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "ca_chains" {
  description = "The CA chains in PEM format."
  value = {
    for k, v in google_privateca_certificate_authority.default :
    k => join("\n", v.pem_ca_certificates)
  }
}

output "ca_ids" {
  description = "The CA ids."
  value = {
    for k, v in google_privateca_certificate_authority.default :
    k => v.id
  }
}

output "ca_pool" {
  description = "The CA pool."
  value       = one(google_privateca_ca_pool.default)
}

output "ca_pool_id" {
  description = "The CA pool id."
  value       = local.pool_id
}

output "cas" {
  description = "The CAs."
  value = {
    for k, v in google_privateca_certificate_authority.default :
    k => v
  }
}
