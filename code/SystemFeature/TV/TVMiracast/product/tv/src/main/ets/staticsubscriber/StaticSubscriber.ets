/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import type { commonEventManager } from '@kit.BasicServicesKit';
import { settings } from '@kit.BasicServicesKit';
import { ConfigData, Log, MIRACAST_SETTINGS_KEY } from 'library';

const TAG = 'StaticSubscriber';
const ON = '1';
const START_SERVICE_DELAY = 5000;

export default class StaticSubscriber {
  private static instance: StaticSubscriber | null = null;

  static getInstance(): StaticSubscriber {
    if (!StaticSubscriber.instance) {
      StaticSubscriber.instance = new StaticSubscriber();
    }
    return StaticSubscriber.instance;
  }

  onReceiveEvent(event: commonEventManager.CommonEventData): void {
    Log.info(TAG, `onReceiveEvent event: ${JSON.stringify(event)}`);
    setTimeout(() => {
      this.startService();
    }, START_SERVICE_DELAY);
  }

  startService(): void {
    Log.info(TAG, 'startService - Stage mode');
    // Note: StaticSubscriberExtensionAbility is FA mode only
    // In Stage mode, service startup should be handled by ability lifecycle
  }
}
