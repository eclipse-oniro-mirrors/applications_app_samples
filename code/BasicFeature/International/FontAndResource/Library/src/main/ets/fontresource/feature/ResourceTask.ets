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

// Import the sendable resource manager used for the cross-thread conversion.
import { sendableResourceManager } from '@kit.LocalizationKit';
// Import the business error type used for structured error reporting.
import { BusinessError } from '@kit.BasicServicesKit';
// Import the carrier and summary models plus the failure factory.
import { ResourceCarrier, ResourceSummary, createFailureSummary } from '../model/ResourceTypes';

// A concurrent function executed inside the taskpool that converts one sendable resource
// back into a plain resource and returns a measured summary.
// Note: @Concurrent functions cannot call into non-sendable imports, so no Logger here.
@Concurrent
export function roundTripResource(carrier: ResourceCarrier): ResourceSummary {
  // Record the start timestamp for the cost measurement.
  const startedAt: number = Date.now();
  try {
    // Convert the sendable resource back into a plain resource inside the pool thread.
    const resource: Resource = sendableResourceManager.sendableResourceToResource(carrier.sendable);
    // Return the success summary carrying the resource metadata and the measured cost.
    return {
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      resourceId: resource.id,
      type: resource.type === undefined ? 0 : resource.type,
      paramsCount: resource.params === undefined ? 0 : resource.params.length,
      costMs: Date.now() - startedAt,
      success: true,
      errorMessage: ''
    };
  } catch (error) {
    // Normalize the thrown value into a business error.
    const err: BusinessError = error as BusinessError;
    // Build the failure-shaped summary carrying the error message.
    const summary: ResourceSummary = createFailureSummary(err.message);
    // Record the elapsed cost even on the failure path.
    summary.costMs = Date.now() - startedAt;
    // Return the failed summary to the pool caller.
    return summary;
  }
}
