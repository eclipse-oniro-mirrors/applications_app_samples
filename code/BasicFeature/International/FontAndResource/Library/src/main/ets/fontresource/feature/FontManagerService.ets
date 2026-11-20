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

// Import the font manager API from the localization kit.
import { fontManager } from '@kit.LocalizationKit';
// Import the error code registry used to explain result codes.
import { ErrorCodeMap } from '../common/ErrorCodeMap';
// Import the error explanation model returned by this service.
import { ErrorExplain } from '../model/FontTypes';
// Import the logger used for observable install and uninstall logs.
import { Logger } from '../utils/Logger';
// Import the trace facade used for performance marks around font operations.
import { TraceUtil } from '../utils/TraceUtil';

// The module tag used for every log line emitted by this service.
const TAG: string = 'FontManager';

// Static service that installs and uninstalls fonts through the system font manager.
export class FontManagerService {
  // Installs the font file at the given sandbox path.
  static install(filePath: string): Promise<number> {
    // Open a trace section around the install call.
    const taskId: number = TraceUtil.begin('FontManager.install');
    // Log the install request with the target path.
    Logger.info(TAG, `install request for ${filePath}`);
    // Delegate to the platform font manager and attach settle logging.
    return fontManager.installFont(filePath).then((code: number) => {
      // Log the resulting return code.
      Logger.info(TAG, `install finished, code ${code}`);
      // Close the trace section on success.
      TraceUtil.end('FontManager.install', taskId);
      // Forward the result code untouched.
      return code;
    }).catch((error: Error) => {
      // Log the failure path.
      Logger.error(TAG, `install threw: ${error.message}`);
      // Close the trace section on failure.
      TraceUtil.end('FontManager.install', taskId);
      // Re-throw so the caller error handling stays intact.
      throw error;
    });
  }

  // Uninstalls the font registered under the given full name.
  static uninstall(fullName: string): Promise<number> {
    // Open a trace section around the uninstall call.
    const taskId: number = TraceUtil.begin('FontManager.uninstall');
    // Log the uninstall request with the target name.
    Logger.info(TAG, `uninstall request for ${fullName}`);
    // Delegate to the platform font manager and attach settle logging.
    return fontManager.uninstallFont(fullName).then((code: number) => {
      // Log the resulting return code.
      Logger.info(TAG, `uninstall finished, code ${code}`);
      // Close the trace section on success.
      TraceUtil.end('FontManager.uninstall', taskId);
      // Forward the result code untouched.
      return code;
    }).catch((error: Error) => {
      // Log the failure path.
      Logger.error(TAG, `uninstall threw: ${error.message}`);
      // Close the trace section on failure.
      TraceUtil.end('FontManager.uninstall', taskId);
      // Re-throw so the caller error handling stays intact.
      throw error;
    });
  }

  // Explains a numeric font error code using the shared registry.
  static explain(code: number): ErrorExplain {
    // Delegate the lookup to the error code map.
    return ErrorCodeMap.explain(code);
  }
}
