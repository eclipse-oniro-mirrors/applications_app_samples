/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Import the sendable resource manager type used by the cross-thread resource carrier.
import { sendableResourceManager } from '@kit.LocalizationKit';

// A sendable wrapper that carries a resource across thread boundaries via taskpool or worker.
@Sendable
export class ResourceCarrier {
  // The sendable resource object that survives the thread hop.
  sendable: sendableResourceManager.SendableResource;

  // Builds the carrier around one sendable resource.
  constructor(sendable: sendableResourceManager.SendableResource) {
    // Store the sendable resource reference.
    this.sendable = sendable;
  }
}

// The conversion summary describing one resource after a round trip.
export interface ResourceSummary {
  // The bundle that owns the resource.
  bundleName: string;
  // The module inside the bundle that owns the resource.
  moduleName: string;
  // The numeric resource id.
  resourceId: number;
  // The numeric resource type id.
  type: number;
  // How many format parameters the resource carries.
  paramsCount: number;
  // The measured conversion cost in milliseconds.
  costMs: number;
  // Whether the round trip finished without throwing.
  success: boolean;
  // The error message when success is false, otherwise empty.
  errorMessage: string;
}

// The request message sent from the main thread into the worker thread.
export interface WorkerRequest {
  // The request kind; only "convert" is supported by the demo worker.
  type: string;
  // The sendable resource that should be converted inside the worker.
  sendable: sendableResourceManager.SendableResource;
}

// The response message returned from the worker thread back to the main thread.
export interface WorkerResponse {
  // The response kind, either "result" or "error".
  type: string;
  // The conversion summary when the conversion succeeded, otherwise null.
  summary: ResourceSummary | null;
  // The error message when the conversion failed, otherwise empty.
  message: string;
}

// One resource list row shown on the resource page.
@ObservedV2
export class ResourceEntry {
  // The stable key used as the list item key.
  key: string;
  // The localized display name of the resource entry.
  name: ResourceStr;
  // The category bucket such as "string", "color", "float" or "media".
  category: string;
  // The underlying resource object of the entry.
  resource: Resource;
  // The conversion status: "idle", "converted" or "failed".
  @Trace status: string;
  // The short result detail shown under the entry after conversion.
  @Trace detail: string;

  // Builds one resource list row in the idle state.
  constructor(key: string, name: ResourceStr, category: string, resource: Resource) {
    // Store the stable entry key.
    this.key = key;
    // Store the localized display name.
    this.name = name;
    // Store the category bucket name.
    this.category = category;
    // Store the underlying resource object.
    this.resource = resource;
    // Start every entry in the idle status.
    this.status = 'idle';
    // Start with an empty detail line.
    this.detail = '';
  }
}

// The outcome of one full round trip executed on a chosen concurrency path.
export class RoundTripResult {
  // The concurrency path used, either "taskpool" or "worker".
  path: string;
  // The conversion summary produced by the round trip.
  summary: ResourceSummary;
  // Whether the round trip succeeded.
  success: boolean;

  // Builds one round trip outcome record.
  constructor(path: string, summary: ResourceSummary, success: boolean) {
    // Store the path that produced this outcome.
    this.path = path;
    // Store the conversion summary.
    this.summary = summary;
    // Store the success flag.
    this.success = success;
  }
}

// Builds a failure-shaped summary for the given error message.
export function createFailureSummary(message: string): ResourceSummary {
  // Return an all-empty summary carrying only the error message.
  return {
    bundleName: '',
    moduleName: '',
    resourceId: 0,
    type: 0,
    paramsCount: 0,
    costMs: 0,
    success: false,
    errorMessage: message
  };
}
