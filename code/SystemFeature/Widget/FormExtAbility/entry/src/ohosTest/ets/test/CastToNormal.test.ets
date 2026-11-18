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
import { FormRecord, castToNormal } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for castToNormal (4 cases). */
export default function castToNormalTest(): void {
  describe('CastToNormalTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_CAST_TO_NORMAL_0001
     * @tc.name      FormExtAbility_CastToNormal_0001
     * @tc.desc      castToNormal(record=FormRecord("Hello", true, 1)) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_CastToNormal_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CastToNormal_0001 begin`);
      const actual: FormRecord = castToNormal(new FormRecord('Hello', true, 1));
      logInfo(`castToNormal(record=FormRecord("Hello", t...: actual.formName=${actual.formName}`);
      expect(actual.formName).assertEqual('Hello');
      logInfo(`castToNormal(record=FormRecord("Hello", t...: actual.tempFlag=${actual.tempFlag}`);
      expect(actual.tempFlag).assertFalse();
      logInfo(`castToNormal(record=FormRecord("Hello", t...: actual.updateCount=${actual.updateCount}`);
      expect(actual.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}CastToNormal_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CAST_TO_NORMAL_0002
     * @tc.name      FormExtAbility_CastToNormal_0002
     * @tc.desc      castToNormal(record=FormRecord("hello world", true, 1)) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_CastToNormal_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CastToNormal_0002 begin`);
      const actual: FormRecord = castToNormal(new FormRecord('hello world', true, 1));
      logInfo(`castToNormal(record=FormRecord("hello wor...: actual.formName=${actual.formName}`);
      expect(actual.formName).assertEqual('hello world');
      logInfo(`castToNormal(record=FormRecord("hello wor...: actual.tempFlag=${actual.tempFlag}`);
      expect(actual.tempFlag).assertFalse();
      logInfo(`castToNormal(record=FormRecord("hello wor...: actual.updateCount=${actual.updateCount}`);
      expect(actual.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}CastToNormal_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CAST_TO_NORMAL_0003
     * @tc.name      FormExtAbility_CastToNormal_0003
     * @tc.desc      castToNormal(record=FormRecord("", true, 1)) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_CastToNormal_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CastToNormal_0003 begin`);
      const actual: FormRecord = castToNormal(new FormRecord('', true, 1));
      logInfo(`castToNormal(record=FormRecord("", true, 1)): actual.formName=${actual.formName}`);
      expect(actual.formName).assertEqual('');
      logInfo(`castToNormal(record=FormRecord("", true, 1)): actual.tempFlag=${actual.tempFlag}`);
      expect(actual.tempFlag).assertFalse();
      logInfo(`castToNormal(record=FormRecord("", true, 1)): actual.updateCount=${actual.updateCount}`);
      expect(actual.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}CastToNormal_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_CAST_TO_NORMAL_0004
     * @tc.name      FormExtAbility_CastToNormal_0004
     * @tc.desc      castToNormal(record=FormRecord(" ", true, 1)) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_CastToNormal_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CastToNormal_0004 begin`);
      const actual: FormRecord = castToNormal(new FormRecord(' ', true, 1));
      logInfo(`castToNormal(record=FormRecord(" ", true,...: actual.formName=${actual.formName}`);
      expect(actual.formName).assertEqual(' ');
      logInfo(`castToNormal(record=FormRecord(" ", true,...: actual.tempFlag=${actual.tempFlag}`);
      expect(actual.tempFlag).assertFalse();
      logInfo(`castToNormal(record=FormRecord(" ", true,...: actual.updateCount=${actual.updateCount}`);
      expect(actual.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}CastToNormal_0004 end`);
    });
  });
}
