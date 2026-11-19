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
import { logger } from '../../../util/Logger';

// Cleanup runs once at the original finally site. Never inspect arbitrary errors.
export function finishCleanup(primaryFailed: boolean, cleanup: () => void): void {
  if (!primaryFailed) {
    cleanup();
  } else {
    try {
      cleanup();
    } catch (_) {
      try {
        logger.error('ExpansionCleanup', 'Secondary cleanup failed; original failure retained.');
      } catch (_) {
        // Best-effort diagnostic must not replace the original failure.
      }
    }
  }
}
