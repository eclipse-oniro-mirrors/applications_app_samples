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

import { describe, it, expect } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'CommonProblemOfApplicationDriverProbeTest';

export default function driverProbeTest() {
  describe('driverProbeTest', () => {
    it('probe', 0, async () => {
      hilog.info(DOMAIN, TAG, 'driverProbeTest probe begin');
      try {
        const d: Driver = Driver.create();
        hilog.info(DOMAIN, TAG, `Driver.create() returned non-null: ${d !== null}`);
        expect(d !== null).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        hilog.error(DOMAIN, TAG, `driver probe failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      hilog.info(DOMAIN, TAG, 'driverProbeTest probe end');
    });
  });
}
