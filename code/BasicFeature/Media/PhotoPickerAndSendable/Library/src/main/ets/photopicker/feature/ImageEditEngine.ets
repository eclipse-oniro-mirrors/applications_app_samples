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

import { taskpool } from '@kit.ArkTS';
import { image } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { processImage, exportUriToSandbox } from './MediaProcessTask';
import { EditParams, EditOutcome, ProcessOutput, ExportResult } from './MediaModels';
import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

/** Module tag used by every log line emitted from this file. */
const TAG: string = 'ImageEditEngine';

// Fallback extension used when the picked uri carries no file suffix.
const DEFAULT_EXTENSION: string = '.jpg';

/**
 * Owns the sendable PhotoAccessHelper and dispatches media work to TaskPool.
 */
export class ImageEditEngine {
  /** Sendable helper of the current ability context, null before init or after release. */
  private helper: sendablePhotoAccessHelper.PhotoAccessHelper | null = null;

  /**
   * Creates the sendable PhotoAccessHelper once per ability context.
   * @param context Ability context used to reach the media library.
   */
  init(context: common.Context): void {
    // Create the helper at most once so concurrent pages share the same connection.
    if (this.helper === null) {
      // Build the helper from the ability context of the caller.
      this.helper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);
      // Record that the engine is ready to dispatch work.
      Logger.info(TAG, 'init completed the helper is ready');
    }
  }

  /**
   * Runs the full edit pipeline on the worker thread and decodes the result on the UI thread.
   * @param uri Picker granted uri of the source image.
   * @param params Edit parameters transferred to the worker.
   * @returns Decoded pixel map together with the worker and decode timings.
   */
  async process(uri: string, params: EditParams): Promise<EditOutcome> {
    return Trace.withAsync('ImageEditEngine.process', async () => {
      // Take a local snapshot so a concurrent release cannot clear the helper mid flight.
      const helper: sendablePhotoAccessHelper.PhotoAccessHelper | null = this.helper;
      // Refuse to run before init, the caller has to create the helper first.
      if (helper === null) {
        // Log the failed precondition before raising the error.
        Logger.error(TAG, 'process rejected because the engine is not initialized');
        // Abort the pipeline with a descriptive error.
        throw new Error('ImageEditEngine is not initialized');
      }
      // Log the dispatch stage together with the selected filter; no uri is written to the log.
      Logger.info(TAG, 'process dispatch to taskpool, filter: ' + params.filter);
      // Wrap the worker call into a taskpool task carrying the sendable arguments.
      const task: taskpool.Task = new taskpool.Task(processImage, helper, uri, params);
      // Mark the start of the worker stage for the wall clock measurement.
      const executeStart: number = Date.now();
      // Run the pixel work on the worker thread and wait for its raw output.
      const output: ProcessOutput = await taskpool.execute(task) as ProcessOutput;
      // Compute the time spent inside the task pool.
      const workerCost: number = Date.now() - executeStart;
      // Report the worker result size and cost; the bytes themselves stay out of the log.
      Logger.info(TAG, 'process worker done, bytes: ' + String(output.byteLength) +
        ', cost: ' + String(workerCost));
      // Mark the start of the decode stage for the wall clock measurement.
      const decodeStart: number = Date.now();
      // Create an image source over the encoded bytes returned by the worker.
      const source: image.ImageSource = image.createImageSource(output.buffer);
      // Decode the encoded bytes into a pixel map the editor can render.
      const pixelMap: image.PixelMap = await source.createPixelMap();
      // Release the image source right after the decode to free the native buffers.
      source.release();
      // Compute the time spent decoding the worker output.
      const decodeCost: number = Date.now() - decodeStart;
      // Report the decoded size and decode cost.
      Logger.info(TAG, 'process decode done, width: ' + String(output.width) + ', height: ' +
        String(output.height) + ', cost: ' + String(decodeCost));
      // Assemble the outcome object returned to the page.
      const outcome: EditOutcome = new EditOutcome();
      // Attach the decoded pixel map.
      outcome.pixelMap = pixelMap;
      // Attach the raw worker output for size and ratio reporting.
      outcome.output = output;
      // Attach the measured worker cost.
      outcome.workerCost = workerCost;
      // Attach the measured decode cost.
      outcome.decodeCost = decodeCost;
      // Hand the finished outcome back to the caller.
      return outcome;
    });
  }

  /**
   * Exports every picked uri into the given sandbox directory through the worker thread.
   * @param uris Picker granted uris to export.
   * @param targetDir Absolute sandbox directory receiving the exported files.
   * @returns One export result per input uri, in the same order.
   */
  async exportOriginals(uris: string[], targetDir: string): Promise<ExportResult[]> {
    return Trace.withAsync('ImageEditEngine.exportOriginals', async () => {
      // Take a local snapshot so a concurrent release cannot clear the helper mid flight.
      const helper: sendablePhotoAccessHelper.PhotoAccessHelper | null = this.helper;
      // Refuse to run before init, the caller has to create the helper first.
      if (helper === null) {
        // Log the failed precondition before raising the error.
        Logger.error(TAG, 'exportOriginals rejected because the engine is not initialized');
        // Abort the export with a descriptive error.
        throw new Error('ImageEditEngine is not initialized');
      }
      // Log the batch size only, the uris stay out of the log.
      Logger.info(TAG, 'exportOriginals begin, count: ' + String(uris.length));
      // Collect the result of every exported uri in input order.
      const results: ExportResult[] = [];
      // Walk the input uris one by one, exports must not run in parallel here.
      for (let index = 0; index < uris.length; index++) {
        // Take the uri of the current iteration.
        const uri: string = uris[index];
        // Build a unique target path inside the sandbox output directory.
        const targetPath: string = `${targetDir}/export_${Date.now()}_${index}${ImageEditEngine.extensionOf(uri)}`;
        // Wrap the copy call into a taskpool task carrying the sendable arguments.
        const task: taskpool.Task = new taskpool.Task(exportUriToSandbox, helper, uri, targetPath);
        // Run the copy on the worker thread and wait for its result.
        const result: ExportResult = await taskpool.execute(task) as ExportResult;
        // Report the single export outcome; only the index and the size are logged.
        Logger.info(TAG, 'exportOriginals item done, index: ' + String(index) + ', success: ' +
          String(result.success) + ', bytes: ' + String(result.size));
        // Append the outcome to the batch result.
        results.push(result);
      }
      // Report the finished batch with the collected count.
      Logger.info(TAG, 'exportOriginals end, count: ' + String(results.length));
      // Hand the batch result back to the caller.
      return results;
    });
  }

  /**
   * Releases the sendable PhotoAccessHelper and clears the internal reference.
   */
  release(): void {
    return Trace.withSync('ImageEditEngine.release', () => {
      // Nothing to release when the engine was never initialized.
      if (this.helper === null) {
        // Log the no-op so the call sequence stays readable in the log stream.
        Logger.debug(TAG, 'release skipped because the helper is already null');
        // Leave the method early.
        return;
      }
      // Keep a local reference because the field is cleared before the async release.
      const helper: sendablePhotoAccessHelper.PhotoAccessHelper = this.helper;
      // Clear the field first so no new work can use the helper being released.
      this.helper = null;
      // Release the native helper and report a failure without breaking the caller.
      helper.release().catch((error: BusinessError) => {
        // Log the failure with its numeric code and system message.
        Logger.errorWithCode(TAG, 'release PhotoAccessHelper', error);
      });
      // Record that the engine dropped its helper.
      Logger.info(TAG, 'release completed');
    });
  }

  /**
   * Reads the file suffix of a picked uri.
   * @param uri Picker granted uri.
   * @returns Suffix including the leading dot, or the fallback extension.
   */
  private static extensionOf(uri: string): string {
    return Trace.withSync('ImageEditEngine.extensionOf', () => {
      // Locate the last dot so the suffix can be sliced out of the uri.
      const dotIndex: number = uri.lastIndexOf('.');
      // Fall back to the default extension when the uri carries no suffix.
      if (dotIndex < 0) {
        // Log the fallback branch without printing the uri itself.
        Logger.debug(TAG, 'extensionOf fell back to the default extension');
        // Return the fallback extension.
        return DEFAULT_EXTENSION;
      }
      // Return the suffix including its leading dot.
      return uri.substring(dotIndex);
    });
  }
}
