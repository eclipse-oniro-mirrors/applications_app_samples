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

import Logger from '../common/utils/Logger';

export interface ScreenOnWindow {
  setWindowKeepScreenOn(enabled: boolean): Promise<void>;
}

// 串行更新窗口状态，避免暂停或离页时被较晚完成的开启操作覆盖。
export class ScreenOnController {
  private static target: ScreenOnWindow | undefined = undefined;
  private static foreground: boolean = false;
  private static playback: boolean = false;
  private static recording: boolean = false;
  private static applied: boolean | undefined = undefined;
  private static generation: number = 0;
  private static writes: Promise<void> = Promise.resolve();

  static bind(target: ScreenOnWindow): Promise<void> {
    if (ScreenOnController.target === target) { return ScreenOnController.update(); }
    const previous: ScreenOnWindow | undefined = ScreenOnController.target;
    ScreenOnController.target = target;
    ScreenOnController.generation++;
    ScreenOnController.applied = undefined;
    ScreenOnController.reset(previous);
    return ScreenOnController.update();
  }

  static unbind(): Promise<void> {
    const previous: ScreenOnWindow | undefined = ScreenOnController.target;
    ScreenOnController.target = undefined;
    ScreenOnController.generation++;
    ScreenOnController.playback = false;
    ScreenOnController.recording = false;
    ScreenOnController.applied = undefined;
    return ScreenOnController.reset(previous);
  }

  private static reset(previous: ScreenOnWindow | undefined): Promise<void> {
    const task: Promise<void> = ScreenOnController.writes.then(async (): Promise<void> => {
      if (previous !== undefined) { await previous.setWindowKeepScreenOn(false); }
    });
    ScreenOnController.writes = task.catch((error: Error): void => {
      Logger.warn('ScreenOn', 'Reset destroyed window failed: ' + String(error));
    });
    return ScreenOnController.writes;
  }

  static setForeground(active: boolean): Promise<void> {
    ScreenOnController.foreground = active;
    return ScreenOnController.update();
  }

  static setPlaybackActive(active: boolean): Promise<void> {
    ScreenOnController.playback = active;
    return ScreenOnController.update();
  }

  static setRecordingActive(active: boolean): Promise<void> {
    ScreenOnController.recording = active;
    return ScreenOnController.update();
  }

  private static update(): Promise<void> {
    const task: Promise<void> = ScreenOnController.writes.then(async (): Promise<void> => {
      const target: ScreenOnWindow | undefined = ScreenOnController.target;
      const generation: number = ScreenOnController.generation;
      const enabled: boolean = ScreenOnController.foreground &&
        (ScreenOnController.playback || ScreenOnController.recording);
      if (target === undefined || ScreenOnController.applied === enabled) { return; }
      await target.setWindowKeepScreenOn(enabled);
      if (ScreenOnController.generation === generation) { ScreenOnController.applied = enabled; }
    });
    ScreenOnController.writes = task.catch((error: Error): void => {
      ScreenOnController.applied = undefined;
      Logger.warn('ScreenOn', 'Update window failed: ' + String(error));
    });
    return ScreenOnController.writes;
  }
}
