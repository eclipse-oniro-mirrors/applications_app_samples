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

// 只在 ArkTS 线程使用。覆盖 Native 尚未开始的异步启动阶段，清理期间不允许新任务进入。
export class MediaFileActivity {
  private static launches: number = 0;
  private static cleaning: boolean = false;
  private static transcoding: boolean = false;

  static beginLaunch(): boolean {
    if (MediaFileActivity.cleaning || MediaFileActivity.transcoding) {
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
    MediaFileActivity.cleaning = true;
    return true;
  }

  static endCleanup(): void {
    MediaFileActivity.cleaning = false;
  }

  static beginTranscode(): boolean {
    if (MediaFileActivity.cleaning || MediaFileActivity.transcoding || MediaFileActivity.launches > 0) { return false; }
    MediaFileActivity.transcoding = true;
    return true;
  }

  static endTranscode(): void { MediaFileActivity.transcoding = false; }
  static isTranscoding(): boolean { return MediaFileActivity.transcoding; }
}
