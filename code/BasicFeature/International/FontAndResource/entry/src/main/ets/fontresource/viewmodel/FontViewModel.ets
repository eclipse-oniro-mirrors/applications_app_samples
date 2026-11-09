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

// Import the context types used for binding the view model to the ability and UI.
import { common } from '@kit.AbilityKit';
// Import the business error type used for structured error reporting.
import { BusinessError } from '@kit.BasicServicesKit';
// Import the UI context type used for font preview registration.
import { UIContext } from '@kit.ArkUI';
// Import the library facades, models and log helpers exposed by the HAR.
import { CapabilityCheck, FontAsset, FontOperation, FontResource, LogEntry, Logger, TraceUtil, appendLog,
  createDefaultFontAsset, nowTimeText } from 'library';

// The maximum number of on-screen log entries kept by the view model.
const LOG_LIMIT: number = 50;
// The maximum number of operation history records kept by the view model.
const OPERATION_LIMIT: number = 10;
// The short message used when an install succeeded.
const MESSAGE_INSTALL_OK: string = 'Install succeeded';
// The short message used when an uninstall succeeded.
const MESSAGE_UNINSTALL_OK: string = 'Uninstall succeeded';
// The module tag used for every system log line emitted by this view model.
const TAG: string = 'FontVM';

// The observable view model that drives the font demo page.
@ObservedV2
export class FontViewModel {
  // The capability self-check rows rendered at the top of the page.
  @Trace checks: CapabilityCheck[] = [];
  // The font asset currently bound to the page, including its sandbox state.
  @Trace asset: FontAsset = createDefaultFontAsset();
  // The operation history with the newest record first.
  @Trace operations: FontOperation[] = [];
  // The on-screen log entries with the newest entry first.
  @Trace logs: LogEntry[] = [];
  // Whether the preview text is rendered with the custom font.
  @Trace previewEnabled: boolean = false;
  // Whether an async operation is currently running, used to disable buttons.
  @Trace busy: boolean = false;

  // The ability context captured during binding, null until bind() runs.
  private context: common.Context | null = null;
  // The UI context captured during binding, null until bind() runs.
  private uiContext: UIContext | null = null;
  // The monotonically increasing sequence used as the log entry id.
  private logSeq: number = 0;

  // Binds the ability context and UI context and resolves the current asset state.
  bind(context: common.Context, uiContext: UIContext): void {
    // Store the ability context for later file operations.
    this.context = context;
    // Store the UI context for later preview registration.
    this.uiContext = uiContext;
    // Resolve whether the font file already exists in the sandbox.
    this.asset = FontResource.resolveAsset(context, this.asset);
    // Kick off the capability self-checks in the background.
    this.refreshChecks();
  }

  // Refreshes the capability check rows and logs the pass count.
  async refreshChecks(): Promise<void> {
    // Open a trace section around the refresh flow.
    const taskId: number = TraceUtil.begin('FontVM.refreshChecks');
    // Run all capability probes through the facade.
    this.checks = await FontResource.checkCapability();
    // Count how many checks passed on this device.
    let passed: number = 0;
    // Walk every check row and accumulate the pass count.
    for (let index = 0; index < this.checks.length; index++) {
      // Increment the counter for every supported capability.
      if (this.checks[index].supported) {
        // One more capability is supported.
        passed += 1;
      }
    }
    // Log the summary line through both the UI log and the system log.
    this.log('info', 'SelfCheck', `Self-check finished, ${passed}/${this.checks.length} passed`);
    // Close the trace section after the flow finished.
    TraceUtil.end('FontVM.refreshChecks', taskId);
  }

  // Copies the bundled font into the sandbox unless it is already there.
  async prepareAsset(): Promise<void> {
    // Skip the request while another async operation is running or context is missing.
    if (this.busy || this.context === null) {
      // Another operation owns the busy flag.
      return;
    }
    // Mark the view model as busy so buttons disable.
    this.busy = true;
    // Open a trace section around the prepare flow.
    const taskId: number = TraceUtil.begin('FontVM.prepareAsset');
    try {
      // Run the sandbox copy through the facade.
      this.asset = await FontResource.prepareAsset(this.context, this.asset);
      // Log the successful copy with the resulting sandbox path.
      this.log('info', 'FontFile', `Font copied to the sandbox: ${this.asset.sandboxPath}`);
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Log the copy failure into the UI and system logs.
      this.log('error', 'FontFile', err.message);
    } finally {
      // Release the busy flag no matter how the flow ended.
      this.busy = false;
      // Close the trace section for the prepare flow.
      TraceUtil.end('FontVM.prepareAsset', taskId);
    }
  }

  // Installs the prepared sandbox font through the system font manager.
  async install(): Promise<void> {
    // Skip the request while another async operation is running.
    if (this.busy) {
      // Another operation owns the busy flag.
      return;
    }
    // Refuse the install when the font file was never prepared.
    if (!this.asset.ready) {
      // Log the refusal so the user understands the missing preparation.
      this.log('warn', 'Install', 'Prepare the font file first');
      // Stop before touching the font manager.
      return;
    }
    // Record the start timestamp for the operation history record.
    const startedAt: number = Date.now();
    // Mark the view model as busy so buttons disable.
    this.busy = true;
    // Open a trace section around the install flow.
    const taskId: number = TraceUtil.begin('FontVM.install');
    try {
      // Resolve the sandbox path of the font file to install.
      const path: string = this.asset.sandboxPath;
      // Probe the sandbox file size before installing.
      const size: number = FontResource.fileSize(path);
      // Refuse the install when the sandbox file disappeared.
      if (size < 0) {
        // Log the missing file warning with the expected path.
        this.log('warn', 'Install', `The sandbox font file does not exist: ${path}`);
        // Stop before calling the font manager.
        return;
      }
      // Log the install target and its size.
      this.log('info', 'Install', `Target file ${path}, size ${size} bytes`);
      // Call the system font manager through the facade.
      const code: number = await FontResource.install(path);
      // Handle the non-zero rejection codes returned by the API.
      if (code !== 0) {
        // Record the failed operation into the history.
        this.recordOperation(new FontOperation('Install', path, code, FontResource.explain(code).title, '',
          startedAt));
        // Log the failure code into the UI and system logs.
        this.log('error', 'Install', `Install failed, return code ${code}`);
        // Stop before recording a success entry.
        return;
      }
      // Record the successful operation into the history.
      this.recordOperation(new FontOperation('Install', path, code, MESSAGE_INSTALL_OK, '', startedAt));
      // Log the success into the UI and system logs.
      this.log('info', 'Install', 'Install succeeded, return code 0');
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Record the exception into the operation history.
      this.recordOperation(new FontOperation('Install', this.asset.sandboxPath, err.code,
        FontResource.explain(err.code).title, err.message, startedAt));
      // Log the exception into the UI and system logs.
      this.log('error', 'Install', `Install failed, code ${err.code}: ${err.message}`);
    } finally {
      // Release the busy flag no matter how the flow ended.
      this.busy = false;
      // Close the trace section for the install flow.
      TraceUtil.end('FontVM.install', taskId);
    }
  }

  // Uninstalls the font registered under the given full name.
  async uninstall(fullName: string): Promise<void> {
    // Skip the request while another async operation is running.
    if (this.busy) {
      // Another operation owns the busy flag.
      return;
    }
    // Trim the user supplied font name.
    const target: string = fullName.trim();
    // Refuse the uninstall when the name is empty.
    if (target.length === 0) {
      // Log the refusal so the user understands the missing input.
      this.log('warn', 'Uninstall', 'Enter the font name to uninstall');
      // Stop before calling the font manager.
      return;
    }
    // Record the start timestamp for the operation history record.
    const startedAt: number = Date.now();
    // Mark the view model as busy so buttons disable.
    this.busy = true;
    // Open a trace section around the uninstall flow.
    const taskId: number = TraceUtil.begin('FontVM.uninstall');
    try {
      // Call the system font manager through the facade.
      const code: number = await FontResource.uninstall(target);
      // Handle the non-zero rejection codes returned by the API.
      if (code !== 0) {
        // Record the failed operation into the history.
        this.recordOperation(new FontOperation('Uninstall', target, code, FontResource.explain(code).title, '',
          startedAt));
        // Log the failure code into the UI and system logs.
        this.log('error', 'Uninstall', `Uninstall failed, return code ${code}`);
        // Stop before recording a success entry.
        return;
      }
      // Record the successful operation into the history.
      this.recordOperation(new FontOperation('Uninstall', target, code, MESSAGE_UNINSTALL_OK, '', startedAt));
      // Log the success into the UI and system logs.
      this.log('info', 'Uninstall', 'Uninstall succeeded, return code 0');
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Record the exception into the operation history.
      this.recordOperation(new FontOperation('Uninstall', target, err.code, FontResource.explain(err.code).title,
        err.message, startedAt));
      // Log the exception into the UI and system logs.
      this.log('error', 'Uninstall', `Uninstall failed, code ${err.code}: ${err.message}`);
    } finally {
      // Release the busy flag no matter how the flow ended.
      this.busy = false;
      // Close the trace section for the uninstall flow.
      TraceUtil.end('FontVM.uninstall', taskId);
    }
  }

  // Toggles the preview between the custom font and the system font.
  togglePreview(): void {
    // Turn the preview off when it is currently on.
    if (this.previewEnabled) {
      // Flip the observable flag back to the system font.
      this.previewEnabled = false;
      // Log the switch back to the system font.
      this.log('info', 'Preview', 'Switched back to the system font');
      // Stop after the disable path.
      return;
    }
    // Refuse the preview when the font file was never prepared.
    if (!this.asset.ready) {
      // Log the refusal so the user understands the missing preparation.
      this.log('warn', 'Preview', 'Prepare the font file first');
      // Stop before registering the font.
      return;
    }
    // Refuse the preview when the UI context was never bound.
    if (this.uiContext === null) {
      // The page did not bind its UI context yet.
      return;
    }
    // Open a trace section around the registration.
    const taskId: number = TraceUtil.begin('FontVM.togglePreview');
    try {
      // Register the sandbox font with the UI font manager.
      FontResource.registerPreview(this.uiContext, this.asset.familyName, this.asset.sandboxPath);
      // Flip the observable flag to the custom font.
      this.previewEnabled = true;
      // Log the successful registration with the family name.
      this.log('info', 'Preview', `Custom font registered: ${this.asset.familyName}`);
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Log the registration failure into the UI and system logs.
      this.log('error', 'Preview', `Failed to register the font, code ${err.code}: ${err.message}`);
    } finally {
      // Close the trace section for the registration flow.
      TraceUtil.end('FontVM.togglePreview', taskId);
    }
  }

  // Clears every on-screen log entry.
  clearLogs(): void {
    // Reset the observable log list to empty.
    this.logs = [];
  }

  // Prepends the operation into the history while keeping at most OPERATION_LIMIT records.
  private recordOperation(operation: FontOperation): void {
    // Start the next list with the newest operation on top.
    const next: FontOperation[] = [operation];
    // Decide how many existing records still fit under the limit.
    const keep: number = this.operations.length < OPERATION_LIMIT ? this.operations.length : OPERATION_LIMIT - 1;
    // Copy the surviving older records after the new one.
    for (let index = 0; index < keep; index++) {
      // Append one retained record.
      next.push(this.operations[index]);
    }
    // Replace the observable history with the trimmed list.
    this.operations = next;
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
