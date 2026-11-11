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

import { autoStartupManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';

class ApiProbeResult {
  public api: string;
  public success: boolean;
  public value: boolean | null;
  public code: string;
  public message: string;
  public durationMillis: number;

  constructor(api: string, success: boolean, value: boolean | null,
    code: string, message: string, durationMillis: number) {
    this.api = api;
    this.success = success;
    this.value = value;
    this.code = code;
    this.message = message;
    this.durationMillis = durationMillis;
  }
}

export default class Mate80ApiProbeRunner implements TestRunner {
  onPrepare(): void {}

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let failed: number = 0;
    let startedAt: number = Date.now();
    try {
      const supported: boolean = autoStartupManager.isAutoStartupSupported();
      this.print(new ApiProbeResult('isAutoStartupSupported()', true, supported,
        '', '', Date.now() - startedAt));
    } catch (error) {
      failed++;
      const cause = error as BusinessError;
      this.print(new ApiProbeResult('isAutoStartupSupported()', false, null,
        cause.code === undefined ? 'UNKNOWN' : String(cause.code),
        cause.message, Date.now() - startedAt));
    }

    startedAt = Date.now();
    let timer: number = -1;
    try {
      const pending: Promise<boolean> = autoStartupManager.getAutoStartupStatusForSelf();
      const deadline = new Promise<boolean>((resolve, reject) => {
        timer = setTimeout(() => reject(new Error('LOCAL_TIMEOUT:10000ms')), 10000);
      });
      const enabled: boolean = await Promise.race([pending, deadline]);
      this.print(new ApiProbeResult('getAutoStartupStatusForSelf()', true, enabled,
        '', '', Date.now() - startedAt));
    } catch (error) {
      failed++;
      const cause = error as BusinessError;
      const code: string = cause.message === 'LOCAL_TIMEOUT:10000ms' ? 'LOCAL_TIMEOUT' :
        (cause.code === undefined ? 'UNKNOWN' : String(cause.code));
      this.print(new ApiProbeResult('getAutoStartupStatusForSelf()', false, null,
        code, cause.message, Date.now() - startedAt));
    } finally {
      if (timer >= 0) {
        clearTimeout(timer);
      }
    }
    delegator.finishTest(`Mate80 API probes completed: total=2 failed=${failed}`, failed, () => {});
  }

  private print(result: ApiProbeResult): void {
    abilityDelegatorRegistry.getAbilityDelegator()
      .printSync(`MATE80_API_RESULT ${JSON.stringify(result)}\n`);
  }
}
