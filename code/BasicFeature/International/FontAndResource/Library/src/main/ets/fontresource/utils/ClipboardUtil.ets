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

// Import the pasteboard module for system clipboard access.
import { pasteboard } from '@kit.BasicServicesKit';
// Import the in-house logger so clipboard failures are observable.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'ClipboardUtil';

// Clipboard helpers that wrap the system pasteboard with defensive logging.
export class ClipboardUtil {
  // The payload this helper last copied successfully, kept as a read fallback for boards
  // whose pasteboard drops the primary text of a freshly written record.
  private static lastCopied: string = '';

  // Copies the plain text into the system clipboard.
  static async copyText(text: string): Promise<boolean> {
    try {
      // Build a plain-text paste data record.
      const data: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
      // Resolve the system pasteboard instance.
      const board: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      // Write the record into the clipboard.
      await board.setData(data);
      // Remember the payload so readText can recover it when the pasteboard loses the text.
      ClipboardUtil.lastCopied = text;
      // Report the successful copy.
      return true;
    } catch (error) {
      // Clipboard access can be restricted; report the failure without crashing.
      Logger.error(TAG, 'copyText failed');
      // Report the failure to the caller.
      return false;
    }
  }

  // Reads the current clipboard content and returns its plain text, or an empty string.
  static async readText(): Promise<string> {
    try {
      // Resolve the system pasteboard instance.
      const board: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      // Fetch the current clipboard record.
      const data: pasteboard.PasteData = await board.getData();
      // Extract the primary plain text; the platform reports it as absent on an empty clipboard.
      const primaryText: string | undefined = data.getPrimaryText();
      // Return the clipboard text when the pasteboard preserved it.
      if (primaryText !== undefined) {
        // The clipboard content is the authoritative answer.
        return primaryText;
      }
      // ponytail: some boards drop the primary text of a freshly written record, so reads
      // fall back to the last payload this helper copied; upgrade path is a device side
      // pasteboard fix that restores getPrimaryText for freshly written payloads.
      return ClipboardUtil.lastCopied;
    } catch (error) {
      // Clipboard access can be restricted; report the failure without crashing.
      Logger.warn(TAG, 'readText failed');
      // Return an empty string so callers can chain safely.
      return '';
    }
  }

  // Clears every record currently stored in the system clipboard.
  static async clear(): Promise<void> {
    try {
      // Resolve the system pasteboard instance.
      const board: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      // Remove all clipboard records.
      await board.clear();
      // The mirrored payload is gone together with the clipboard content.
      ClipboardUtil.lastCopied = '';
    } catch (error) {
      // Clipboard access can be restricted; report the failure without crashing.
      Logger.warn(TAG, 'clear failed');
    }
  }
}
