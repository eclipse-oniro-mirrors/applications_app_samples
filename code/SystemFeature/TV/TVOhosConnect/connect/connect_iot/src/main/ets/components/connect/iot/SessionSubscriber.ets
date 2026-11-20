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
import { DeviceManager } from 'iotmanagementkit';
import { Logger } from '@ohos/common';

const TAG = 'SessionSubscriber';

export class SessionSubscriber implements DeviceManager.EventObserver {
  private callback: (eventName: string, data: object) => void;

  constructor(callback: (eventName: string, data: object) => void) {
    this.callback = callback;
  }

  public testFunc(): void {
    Logger.warn(TAG, 'testFunc is not supported');
  }

  public onEvent(eventName: string, data: object): void {
    Logger.info(TAG, 'SessionSubscriber onEvent: ' + eventName);
    this.callback(eventName, data);
  }
}
