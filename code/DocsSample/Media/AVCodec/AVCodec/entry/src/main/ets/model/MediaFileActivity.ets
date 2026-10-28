/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { MediaTaskCoordinator, MediaTaskLease } from './MediaTaskCoordinator';

// Compatibility gate for existing launch and cleanup callers.
export class MediaFileActivity {
  private static launches: number = 0;
  private static cleaning: boolean = false;
  private static transcoding: boolean = false;
  private static transcodeLease: MediaTaskLease | undefined = undefined;
  private static cleanupLease: MediaTaskLease | undefined = undefined;

  static beginLaunch(): boolean {
    if (MediaFileActivity.cleaning || MediaFileActivity.transcoding || MediaTaskCoordinator.busy()) {
      return false;
    }
    MediaFileActivity.launches++;
    return true;
  }

  static endLaunch(): void {
    MediaFileActivity.launches = Math.max(0, MediaFileActivity.launches - 1);
  }

  static beginCleanup(): boolean {
    if (MediaFileActivity.cleaning || MediaFileActivity.launches > 0 || MediaFileActivity.transcoding) {
      return false;
    }
    MediaFileActivity.cleanupLease = MediaTaskCoordinator.acquire('cleanup');
    if (MediaFileActivity.cleanupLease === undefined) { return false; }
    MediaFileActivity.cleaning = true;
    return true;
  }

  static endCleanup(): void {
    MediaFileActivity.cleaning = false;
    if (MediaFileActivity.cleanupLease !== undefined) {
      MediaTaskCoordinator.release(MediaFileActivity.cleanupLease);
      MediaFileActivity.cleanupLease = undefined;
    }
  }

  static beginTranscode(): boolean {
    if (MediaFileActivity.cleaning || MediaFileActivity.transcoding || MediaFileActivity.launches > 0) { return false; }
    MediaFileActivity.transcodeLease = MediaTaskCoordinator.acquire('transcode');
    if (MediaFileActivity.transcodeLease === undefined) { return false; }
    MediaFileActivity.transcoding = true;
    return true;
  }

  static endTranscode(): void {
    MediaFileActivity.transcoding = false;
    if (MediaFileActivity.transcodeLease !== undefined) {
      MediaTaskCoordinator.release(MediaFileActivity.transcodeLease);
      MediaFileActivity.transcodeLease = undefined;
    }
  }
  static isTranscoding(): boolean { return MediaFileActivity.transcoding; }
}
