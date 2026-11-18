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

// Font asset model describing one bundled font and its sandbox installation state.
export class FontAsset {
  // The display family name used when registering the font with the UI.
  public familyName: string;
  // The raw file path inside the bundle resources, for example "fonts/DroidSerif-Regular.ttf".
  public rawFileName: string;
  // The absolute sandbox path of the copied font, empty until it has been prepared.
  public sandboxPath: string;
  // Whether the font file already exists in the sandbox and can be installed.
  public ready: boolean;

  // Builds a fully populated font asset instance.
  constructor(familyName: string, rawFileName: string, sandboxPath: string, ready: boolean) {
    // Store the display family name.
    this.familyName = familyName;
    // Store the bundled raw file path.
    this.rawFileName = rawFileName;
    // Store the sandbox path (may be empty).
    this.sandboxPath = sandboxPath;
    // Store the readiness flag.
    this.ready = ready;
  }
}

// Creates the default font asset used by the demo page on first launch.
export function createDefaultFontAsset(): FontAsset {
  // Return the Droid Serif regular asset in its not-prepared state.
  return new FontAsset('Droid Serif', 'fonts/DroidSerif-Regular.ttf', '', false);
}

// One capability self-check row shown on the font page.
export class CapabilityCheck {
  // The localized name of the capability being checked.
  public name: ResourceStr;
  // Whether the capability is supported on the current device.
  public supported: boolean;
  // The localized detail text explaining the check outcome.
  public detail: ResourceStr;

  // Builds one capability check row.
  constructor(name: ResourceStr, supported: boolean, detail: ResourceStr) {
    // Store the localized check name.
    this.name = name;
    // Store the support flag.
    this.supported = supported;
    // Store the localized detail text.
    this.detail = detail;
  }
}

// A structured explanation for one font error code.
export class ErrorExplain {
  // The numeric error code being explained.
  public code: number;
  // The localized short title of the error.
  public title: ResourceStr;
  // The localized reason describing why the error happened.
  public reason: ResourceStr;
  // The localized suggestion telling the user how to fix it.
  public suggestion: ResourceStr;
  // The severity bucket ("error", "warning" or "info") used for coloring.
  public severity: string;

  // Builds one error explanation entry.
  constructor(code: number, title: ResourceStr, reason: ResourceStr, suggestion: ResourceStr,
    severity: string) {
    // Store the numeric error code.
    this.code = code;
    // Store the localized title.
    this.title = title;
    // Store the localized reason.
    this.reason = reason;
    // Store the localized suggestion.
    this.suggestion = suggestion;
    // Store the severity bucket name.
    this.severity = severity;
  }
}

// One completed font operation record shown in the operation history.
export class FontOperation {
  // The action name such as "Install" or "Uninstall".
  public action: string;
  // The target file path or family name the action was applied to.
  public target: string;
  // The numeric result code returned by the font API.
  public code: number;
  // The short human readable outcome message, localized when a code explains it.
  public message: ResourceStr;
  // The raw error message from the platform when available, otherwise empty.
  public rawMessage: string;
  // The epoch millisecond timestamp when the operation started.
  public timestamp: number;

  // Builds one operation history record.
  constructor(action: string, target: string, code: number, message: ResourceStr, rawMessage: string,
    timestamp: number) {
    // Store the action name.
    this.action = action;
    // Store the action target.
    this.target = target;
    // Store the numeric result code.
    this.code = code;
    // Store the short outcome message.
    this.message = message;
    // Store the raw platform error message.
    this.rawMessage = rawMessage;
    // Store the start timestamp.
    this.timestamp = timestamp;
  }
}
