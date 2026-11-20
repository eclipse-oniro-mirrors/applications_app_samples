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

// Import the worker runtime types for thread worker control.
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
// Import the request, response and summary models exchanged with the worker.
import { ResourceCarrier, ResourceSummary, WorkerRequest, WorkerResponse } from '../model/ResourceTypes';
// Import the trace facade used for performance marks around the worker round trip.
import { TraceUtil } from '../utils/TraceUtil';
// Import the logger used for observable worker lifecycle logs.
import { Logger } from '../utils/Logger';

// The maximum time the main thread waits for the worker response before giving up.
const WORKER_TIMEOUT_MS: number = 3000;
// The module tag used for every log line emitted by this client.
const TAG: string = 'Worker';

// Client that runs one resource conversion inside a dedicated worker thread.
export class ResourceWorkerClient {
  // Spawns the worker, posts the request and resolves with the conversion summary.
  static run(carrier: ResourceCarrier): Promise<ResourceSummary> {
    // Open a trace section around the whole worker round trip.
    const taskId: number = TraceUtil.begin('Worker.runRoundTrip');
    // Build the promise that owns the worker lifecycle.
    return new Promise<ResourceSummary>((resolve, reject) => {
      // Create the thread worker bound to the worker script file.
      const threadWorker: worker.ThreadWorker = new worker.ThreadWorker('../workers/ResourceWorker.ets');
      // Track whether the promise has already been settled once.
      let settled: boolean = false;

      // Arm the watchdog timer that terminates the worker on timeout.
      const timer: number = setTimeout(() => {
        // Skip the timeout handling when the promise already settled.
        if (settled) {
          // The timeout fires after a legitimate settle.
          return;
        }
        // Mark the promise as settled by the timeout path.
        settled = true;
        // Terminate the unresponsive worker thread.
        threadWorker.terminate();
        // Log the timeout with the configured budget.
        Logger.error(TAG, `Worker timed out after ${WORKER_TIMEOUT_MS} ms`);
        // Close the trace section for the timed-out round trip.
        TraceUtil.end('Worker.runRoundTrip', taskId);
        // Reject the promise with a descriptive timeout error.
        reject(new Error(`The worker did not respond within ${WORKER_TIMEOUT_MS} ms`));
      }, WORKER_TIMEOUT_MS);

      // The shared finisher that settles the promise exactly once.
      const finish = (response: WorkerResponse): void => {
        // Skip duplicate settlements from late events.
        if (settled) {
          // A previous path already settled the promise.
          return;
        }
        // Mark the promise as settled by this path.
        settled = true;
        // Disarm the watchdog timer.
        clearTimeout(timer);
        // Terminate the worker now that the response arrived.
        threadWorker.terminate();
        // Check whether the worker reported a successful conversion.
        if (response.type === 'result' && response.summary !== null) {
          // Log the successful worker round trip.
          Logger.debug(TAG, 'Worker round trip succeeded');
          // Close the trace section on success.
          TraceUtil.end('Worker.runRoundTrip', taskId);
          // Resolve with the conversion summary.
          resolve(response.summary);
          // Stop here on the success path.
          return;
        }
        // Log the failure reported by the worker itself.
        Logger.error(TAG, 'Worker returned a failure');
        // Close the trace section on the worker failure path.
        TraceUtil.end('Worker.runRoundTrip', taskId);
        // Reject with the worker message or a generic fallback.
        reject(new Error(response.message.length > 0 ? response.message : 'The worker returned a failed result'));
      };

      // Wire the message handler that receives the worker response.
      threadWorker.onmessage = (event: MessageEvents) => {
        // Forward the received payload into the shared finisher.
        finish(event.data as WorkerResponse);
      };
      // Wire the error handler that catches worker-side exceptions.
      threadWorker.onerror = (error: ErrorEvent) => {
        // Skip duplicate settlements from late errors.
        if (settled) {
          // A previous path already settled the promise.
          return;
        }
        // Mark the promise as settled by the error path.
        settled = true;
        // Disarm the watchdog timer.
        clearTimeout(timer);
        // Terminate the failing worker thread.
        threadWorker.terminate();
        // Log the worker error message.
        Logger.error(TAG, `Worker threw: ${error.message}`);
        // Close the trace section for the errored round trip.
        TraceUtil.end('Worker.runRoundTrip', taskId);
        // Reject the promise with the worker error message.
        reject(new Error(error.message));
      };

      // Compose the conversion request around the sendable carrier.
      const request: WorkerRequest = { type: 'convert', sendable: carrier.sendable };
      // Post the request into the worker thread.
      threadWorker.postMessage(request);
    });
  }
}
