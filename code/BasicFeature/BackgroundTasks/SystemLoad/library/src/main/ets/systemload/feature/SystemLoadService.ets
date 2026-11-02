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

import { systemLoad } from '@kit.BasicServicesKit';

type SystemLoadCallback = (level: systemLoad.SystemLoadLevel) => void;

export class SystemLoadService {
  static async getLocalLevel(): Promise<systemLoad.SystemLoadLevel> {
    return await systemLoad.getLevel();
  }

  static onSystemLoadChange(callback: SystemLoadCallback): void {
    systemLoad.on('systemLoadChange', callback);
  }

  static offSystemLoadChange(callback: SystemLoadCallback): void {
    systemLoad.off('systemLoadChange', callback);
  }

  static offAllSystemLoadChange(): void {
    systemLoad.off('systemLoadChange');
  }
}
