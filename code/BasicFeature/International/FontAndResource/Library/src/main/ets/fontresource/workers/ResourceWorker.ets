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

// Import the worker runtime types for the worker-side message loop.
import { worker, ThreadWorkerGlobalScope, MessageEvents } from '@kit.ArkTS';
// Import the sendable resource manager for the in-thread conversion.
import { sendableResourceManager } from '@kit.LocalizationKit';
// Import the business error type used for structured error reporting.
import { BusinessError } from '@kit.BasicServicesKit';
// Import hilog directly because this file runs inside a dedicated worker thread.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the request, response and summary models exchanged with the main thread.
import { ResourceSummary, WorkerRequest, WorkerResponse, createFailureSummary } from '../model/ResourceTypes';

// The hilog domain used by the worker-side log lines.
const DOMAIN: number = 0xFF00;
// The hilog tag that marks every worker-side log line.
const TAG: string = '[Sample_FontAndResource][Worker]';
// The hilog format string printing the message as a public string.
const FORMAT: string = '%{public}s';
// Bind the worker-side message port exposed by the runtime.
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// The worker-side message loop handling one conversion request at a time.
workerPort.onmessage = (event: MessageEvents) => {
  // Read the incoming request payload from the main thread.
  const request: WorkerRequest = event.data as WorkerRequest;
  // Log the received request type for traceability.
  hilog.info(DOMAIN, TAG, FORMAT, `request type=${request.type}`);
  // Reject request kinds the worker does not understand.
  if (request.type !== 'convert') {
    // Build the error response for the unsupported request kind.
    const invalid: WorkerResponse = {
      type: 'error',
      summary: null,
      message: `Unsupported request type: ${request.type}`
    };
    // Send the error response back to the main thread.
    workerPort.postMessage(invalid);
    // Stop processing the invalid request.
    return;
  }

  // Record the start timestamp for the cost measurement.
  const startedAt: number = Date.now();
  try {
    // Convert the sendable resource back into a plain resource inside the worker.
    const resource: Resource = sendableResourceManager.sendableResourceToResource(request.sendable);
    // Assemble the success summary carrying the resource metadata and cost.
    const summary: ResourceSummary = {
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      resourceId: resource.id,
      type: resource.type === undefined ? 0 : resource.type,
      paramsCount: resource.params === undefined ? 0 : resource.params.length,
      costMs: Date.now() - startedAt,
      success: true,
      errorMessage: ''
    };
    // Wrap the summary into the result response message.
    const response: WorkerResponse = { type: 'result', summary: summary, message: '' };
    // Send the success response back to the main thread.
    workerPort.postMessage(response);
  } catch (error) {
    // Normalize the thrown value into a business error.
    const err: BusinessError = error as BusinessError;
    // Log the worker-side failure with its error code.
    hilog.error(DOMAIN, TAG, FORMAT, `conversion failed, code ${err.code}: ${err.message}`);
    // Build the failure-shaped summary carrying the error message.
    const failed: ResourceSummary = createFailureSummary(err.message);
    // Record the elapsed cost even on the failure path.
    failed.costMs = Date.now() - startedAt;
    // Wrap the failure into the error response message.
    const response: WorkerResponse = { type: 'error', summary: failed, message: err.message };
    // Send the error response back to the main thread.
    workerPort.postMessage(response);
  }
};
