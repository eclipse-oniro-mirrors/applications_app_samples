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

// Import the UI context type used to reach the font manager.
import { UIContext } from '@kit.ArkUI';
// Import the logger used for observable registration logs.
import { Logger } from '../utils/Logger';
// Import the trace facade used for performance marks around registration.
import { TraceUtil } from '../utils/TraceUtil';

// The module tag used for every log line emitted by this service.
const TAG: string = 'Preview';

// Static service that registers custom fonts with the UI for on-screen previews.
export class FontPreviewService {
  // The set of family names already registered in this process.
  private static registered: Set<string> = new Set<string>();

  // Registers the font file under the family name unless it was registered before.
  static register(uiContext: UIContext, familyName: string, sandboxPath: string): void {
    // Open a trace section around the registration.
    const taskId: number = TraceUtil.begin('Preview.register');
    try {
      // Skip the registration when the family name is already known.
      if (FontPreviewService.registered.has(familyName)) {
        // Log the idempotent skip so repeated toggles stay explainable.
        Logger.debug(TAG, `Family ${familyName} is already registered`);
        // Return early without touching the font manager.
        return;
      }
      // Register the font file with the UI font manager.
      uiContext.getFont().registerFont({
        familyName: familyName,
        familySrc: `file://${sandboxPath}`
      });
      // Remember the family name so future calls skip the registration.
      FontPreviewService.registered.add(familyName);
      // Log the successful registration with the source path.
      Logger.info(TAG, `Registered ${familyName} from ${sandboxPath}`);
    } finally {
      // Close the trace section even when registration throws.
      TraceUtil.end('Preview.register', taskId);
    }
  }

  // Reports whether the family name has already been registered.
  static isRegistered(familyName: string): boolean {
    // Check the membership of the family name in the registry set.
    return FontPreviewService.registered.has(familyName);
  }
}
