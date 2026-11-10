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

// Import the business error type used for structured error reporting.
import { BusinessError } from '@kit.BasicServicesKit';
// Import the sendable resource manager used for resource conversions.
import { sendableResourceManager } from '@kit.LocalizationKit';
// Import the library facades, models and log helpers exposed by the HAR.
import { LogEntry, Logger, ResourceBridge, ResourceCarrier, ResourceEntry, ResourceSummary, RoundTripResult,
  TraceUtil, appendLog, createFailureSummary, nowTimeText } from 'library';

// The maximum number of on-screen log entries kept by the view model.
const LOG_LIMIT: number = 50;
// The list index of the string entry rendered by the round trip path.
const RENDER_INDEX: number = 0;
// The list index of the media entry handled by the image conversion.
const MEDIA_INDEX: number = 4;
// The magic path value that selects the worker based conversion route.
const WORKER_PATH: string = 'worker';
// The module tag used for every system log line emitted by this view model.
const TAG: string = 'ResourceVM';

// Builds the default resource list shown when the page first opens.
function createDefaultEntries(): ResourceEntry[] {
  // Create the empty list that receives every default row.
  const entries: ResourceEntry[] = [];
  // Add the application title string entry.
  entries.push(new ResourceEntry('app_title', $r('app.string.fr_entry_app_title'), 'string',
    $r('app.string.fr_demo_title')));
  // Add the slogan string entry.
  entries.push(new ResourceEntry('slogan', $r('app.string.fr_entry_slogan'), 'string',
    $r('app.string.fr_demo_slogan')));
  // Add the brand color entry.
  entries.push(new ResourceEntry('brand_color', $r('app.string.fr_entry_brand_color'), 'color',
    $r('app.color.brand_primary')));
  // Add the card radius float entry.
  entries.push(new ResourceEntry('card_radius', $r('app.string.fr_entry_card_radius'), 'float',
    $r('app.float.card_radius')));
  // Add the demo picture media entry.
  entries.push(new ResourceEntry('media_picture', $r('app.string.fr_entry_media_picture'), 'media',
    $r('app.media.demo_picture')));
  // Add the custom preview text entry.
  entries.push(new ResourceEntry('custom_text', $r('app.string.fr_entry_custom_text'), 'string',
    $r('app.string.fr_preview_custom')));
  // Return the assembled default list.
  return entries;
}

// The observable view model that drives the resource demo page.
@ObservedV2
export class ResourceViewModel {
  // The resource rows rendered in the list card.
  @Trace public entries: ResourceEntry[] = createDefaultEntries();
  // The latest round trip outcome rendered in the result card.
  @Trace public roundTrip: RoundTripResult | null = null;
  // The concurrency path that produced the latest outcome.
  @Trace public activePath: string = 'taskpool';
  // The on-screen log entries with the newest entry first.
  @Trace public logs: LogEntry[] = [];
  // The restored string resource rendered as text in the render card.
  @Trace public renderedResource: Resource | null = null;
  // The restored media resource rendered as an image in the render card.
  @Trace public mediaResource: Resource | null = null;
  // Whether a conversion is currently running, used to disable buttons.
  @Trace public busy: boolean = false;

  // The monotonically increasing sequence used as the log entry id.
  private logSeq: number = 0;

  // Converts every non-media entry in the list and updates each row status.
  convertAll(): void {
    // Skip the request while another conversion is running.
    if (this.busy) {
      // Another conversion owns the busy flag.
      return;
    }
    // Mark the view model as busy so buttons disable.
    this.busy = true;
    // Count the successfully converted rows.
    let converted: number = 0;
    // Count the failed conversions.
    let failed: number = 0;
    // Open a trace section around the batch conversion.
    const taskId: number = TraceUtil.begin('ResourceVM.convertAll');
    try {
      // Collect the updated rows into a fresh list.
      const next: ResourceEntry[] = [];
      // Walk every row in list order.
      for (let index = 0; index < this.entries.length; index++) {
        // Read the current row once per iteration.
        const entry: ResourceEntry = this.entries[index];
        // Skip media rows because they are handled by the dedicated image flow.
        if (entry.category === 'media') {
          // Keep the media row untouched.
          next.push(entry);
          // Jump to the next row.
          continue;
        }
        try {
          // Convert the row resource into its sendable representation.
          const sendable: sendableResourceManager.SendableResource = ResourceBridge.toSendable(entry.resource);
          // Convert the sendable representation back into a plain resource.
          const restored: Resource = ResourceBridge.fromSendable(sendable);
          // Build the descriptive summary from the restored resource.
          const summary: ResourceSummary = ResourceBridge.describe(restored);
          // Mark the row as converted.
          entry.status = 'converted';
          // Compose the short result detail for the row.
          entry.detail = `id ${summary.resourceId} · type ${summary.type} · params ${summary.paramsCount}`;
          // Increment the success counter.
          converted += 1;
        } catch (error) {
          // Normalize the thrown value into a business error.
          const err: BusinessError = error as BusinessError;
          // Mark the row as failed.
          entry.status = 'failed';
          // Store the error message as the row detail.
          entry.detail = err.message;
          // Increment the failure counter.
          failed += 1;
        }
        // Keep the processed row in the updated list.
        next.push(entry);
      }
      // Replace the observable list with the updated rows.
      this.entries = next;
      // Log the batch outcome into the UI and system logs.
      this.log('info', 'Convert', `Batch conversion finished: ${converted} succeeded, ${failed} failed`);
    } finally {
      // Release the busy flag no matter how the flow ended.
      this.busy = false;
      // Close the trace section for the batch conversion.
      TraceUtil.end('ResourceVM.convertAll', taskId);
    }
  }

  // Converts the media entry and renders the restored image resource.
  convertMedia(): void {
    // Skip the request while another conversion is running.
    if (this.busy) {
      // Another conversion owns the busy flag.
      return;
    }
    // Mark the view model as busy so buttons disable.
    this.busy = true;
    // Open a trace section around the media conversion.
    const taskId: number = TraceUtil.begin('ResourceVM.convertMedia');
    try {
      // Read the media row from its fixed list position.
      const entry: ResourceEntry = this.entries[MEDIA_INDEX];
      // Convert the media resource into its sendable representation.
      const sendable: sendableResourceManager.SendableResource = ResourceBridge.toSendable(entry.resource);
      // Convert the sendable representation back into a plain resource.
      const restored: Resource = ResourceBridge.fromSendable(sendable);
      // Build the descriptive summary from the restored resource.
      const summary: ResourceSummary = ResourceBridge.describe(restored);
      // Store the restored media resource for rendering.
      this.mediaResource = restored;
      // Mark the media row as converted.
      entry.status = 'converted';
      // Compose the short result detail for the row.
      entry.detail = `id ${summary.resourceId} · type ${summary.type}`;
      // Trigger the observable update by replacing the list with a shallow copy.
      this.entries = this.entries.slice();
      // Log the successful media conversion.
      this.log('info', 'Image', 'The image resource is converted and rendered');
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Log the media conversion failure.
      this.log('error', 'Image', `Image conversion failed: ${err.message}`);
    } finally {
      // Release the busy flag no matter how the flow ended.
      this.busy = false;
      // Close the trace section for the media conversion.
      TraceUtil.end('ResourceVM.convertMedia', taskId);
    }
  }

  // Runs one full conversion round trip on the requested concurrency path.
  async runRoundTrip(path: string): Promise<void> {
    // Skip the request while another conversion is running.
    if (this.busy) {
      // Another conversion owns the busy flag.
      return;
    }
    // Mark the view model as busy so buttons disable.
    this.busy = true;
    // Remember the active path so the UI can highlight the last used button.
    this.activePath = path;
    // Derive the log tag from the chosen route.
    const tag: string = path === WORKER_PATH ? 'Worker' : 'TaskPool';
    // Read the string row rendered by this flow from its fixed position.
    const entry: ResourceEntry = this.entries[RENDER_INDEX];
    // Record the start timestamp for the elapsed measurement.
    const startedAt: number = Date.now();
    // Open a trace section around the round trip.
    const taskId: number = TraceUtil.begin('ResourceVM.runRoundTrip');
    try {
      // Wrap the row resource into a sendable carrier for the thread hop.
      const carrier: ResourceCarrier = new ResourceCarrier(ResourceBridge.toSendable(entry.resource));
      // Execute the round trip on the selected concurrency path.
      const summary: ResourceSummary = await ResourceBridge.runRoundTrip(path, carrier);
      // Measure the total elapsed time including the thread hop.
      const elapsed: number = Date.now() - startedAt;
      // Overwrite the summary cost with the main-thread observed duration.
      summary.costMs = elapsed;
      // Store the round trip outcome for rendering.
      this.roundTrip = new RoundTripResult(path, summary, summary.success);
      // Continue on the success branch when the conversion passed.
      if (summary.success) {
        // Restore the plain resource for the on-screen text rendering.
        this.renderedResource = ResourceBridge.fromSendable(carrier.sendable);
        // Log the success with the observed duration.
        this.log('info', tag, `Round trip succeeded, main thread rendered in ${elapsed} ms`);
      } else {
        // Log the conversion error message reported by the path.
        this.log('error', tag, summary.errorMessage);
      }
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Store the failed outcome for rendering.
      this.roundTrip = new RoundTripResult(path, createFailureSummary(err.message), false);
      // Log the thrown failure into the UI and system logs.
      this.log('error', tag, `Round trip failed: ${err.message}`);
    } finally {
      // Release the busy flag no matter how the flow ended.
      this.busy = false;
      // Close the trace section for the round trip.
      TraceUtil.end('ResourceVM.runRoundTrip', taskId);
    }
  }

  // Clears every on-screen log entry.
  clearLogs(): void {
    // Reset the observable log list to empty.
    this.logs = [];
  }

  // Appends one entry to the UI log and mirrors it into the system log with the tag.
  private log(level: string, tag: string, text: string): void {
    // Advance the sequence so every entry gets a fresh id.
    this.logSeq += 1;
    // Build the on-screen entry with the current wall clock text.
    const entry: LogEntry = new LogEntry(this.logSeq, nowTimeText(), tag, text, level);
    // Insert the entry into the capped observable list.
    this.logs = appendLog(this.logs, entry, LOG_LIMIT);
    // Compose the system log message with the tag prefix.
    const message: string = `[${tag}] ${text}`;
    // Route the error level into Logger.error with the module tag.
    if (level === 'error') {
      // Emit the error level system log line.
      Logger.error(TAG, message);
      // Stop the routing here.
      return;
    }
    // Route the warn level into Logger.warn with the module tag.
    if (level === 'warn') {
      // Emit the warn level system log line.
      Logger.warn(TAG, message);
      // Stop the routing here.
      return;
    }
    // Route everything else into Logger.info with the module tag.
    // Emit the info level system log line.
    Logger.info(TAG, message);
  }
}
