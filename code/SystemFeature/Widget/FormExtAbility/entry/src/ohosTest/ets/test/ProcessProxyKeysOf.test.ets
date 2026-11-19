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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { processProxyKeysOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for processProxyKeysOf (1 cases). */
export default function processProxyKeysOfTest(): void {
  describe('ProcessProxyKeysOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_PROCESS_PROXY_KEYS_OF_0001
     * @tc.name      FormExtAbility_ProcessProxyKeysOf_0001
     * @tc.desc      processProxyKeysOf() returns ["cityName","cityTemperature"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_ProcessProxyKeysOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProcessProxyKeysOf_0001 begin`);
      const actual: string[] = processProxyKeysOf();
      logInfo(`processProxyKeysOf(): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`processProxyKeysOf(): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["cityName","cityTemperature"]');
      logInfo(`${BUNDLE}ProcessProxyKeysOf_0001 end`);
    });
  });
}
