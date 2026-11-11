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

export class PlaybackControlsController {
  private timer: number = -1;

  clear(): void {
    if (this.timer >= 0) {
      clearTimeout(this.timer);
      this.timer = -1;
    }
  }

  schedule(delayMs: number, shouldRetain: () => boolean, canHide: () => boolean, hide: () => void): void {
    this.clear();
    this.timer = setTimeout((): void => {
      this.timer = -1;
      // 面板打开时保留承载控件，避免锚点销毁导致面板关闭。
      if (shouldRetain()) {
        this.schedule(delayMs, shouldRetain, canHide, hide);
      } else if (canHide()) {
        hide();
      }
    }, delayMs);
  }
}
