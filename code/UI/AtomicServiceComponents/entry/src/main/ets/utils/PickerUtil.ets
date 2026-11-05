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
 
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { picker } from '@kit.CoreFileKit';
import { PICKER_TIMEOUT_MS } from '../common/AppConstants';
import { beginAttempt, isStaleAttempt, shouldFallbackOnTimeout } from '../model/DownloadFlow';

export class PickerOutcome {
  public success: boolean;
  public path: string;
  public code: number;
  public message: string;
  public timedOut: boolean;

  constructor(success: boolean, path: string, code: number, message: string, timedOut: boolean) {
    this.success = success;
    this.path = path;
    this.code = code;
    this.message = message;
    this.timedOut = timedOut;
  }
}

export class DownloadPicker {
  private context: common.UIAbilityContext;
  private token: number = 0;
  private activeToken: number = 0;
  private timer: number = -1;
  private settled: boolean = false;
  private disposed: boolean = false;
  private callback: ((outcome: PickerOutcome) => void) | null = null;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  open(callback: (outcome: PickerOutcome) => void): void {
    // 同一实例重复 open 时先清掉上一轮未触发的超时定时器，避免遗留定时器与新一次尝试并存
    this.clearTimer();
    this.disposed = false;
    this.settled = false;
    this.callback = callback;
    this.token = beginAttempt(this.token);
    this.activeToken = this.token;
    const token = this.token;

    this.timer = setTimeout(() => {
      if (shouldFallbackOnTimeout(this.settled, token, this.activeToken)) {
        this.settled = true;
        this.finish(new PickerOutcome(false, '', 0, `文档选择器 ${PICKER_TIMEOUT_MS / 1000} 秒无响应`, true));
      }
    }, PICKER_TIMEOUT_MS);

    try {
      const options = new picker.DocumentSaveOptions();
      options.pickerMode = picker.DocumentPickerMode.DOWNLOAD;
      const documentPicker = new picker.DocumentViewPicker(this.context);
      documentPicker.save(options, (err: BusinessError, result: string[]) => {
        if (this.disposed || this.settled || isStaleAttempt(token, this.activeToken)) {
          return;
        }
        this.settled = true;
        if (err) {
          this.finish(new PickerOutcome(false, '', err.code, err.message, false));
          return;
        }
        const path = result.length > 0 ? result[0] : '';
        if (path.length === 0) {
          this.finish(new PickerOutcome(false, '', 0, '选择器未返回路径', false));
          return;
        }
        this.finish(new PickerOutcome(true, path, 0, '已获取保存路径', false));
      });
    } catch (err) {
      const error = err as BusinessError;
      this.settled = true;
      this.finish(new PickerOutcome(false, '', error.code, error.message, false));
    }
  }

  dispose(): void {
    this.disposed = true;
    this.activeToken = beginAttempt(this.activeToken);
    this.clearTimer();
    this.callback = null;
  }

  private finish(outcome: PickerOutcome): void {
    this.clearTimer();
    const callback = this.callback;
    this.callback = null;
    if (callback !== null) {
      callback(outcome);
    }
  }

  private clearTimer(): void {
    if (this.timer !== -1) {
      clearTimeout(this.timer);
      this.timer = -1;
    }
  }
}
