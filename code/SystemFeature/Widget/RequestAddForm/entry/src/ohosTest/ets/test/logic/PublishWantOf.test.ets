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
import { PublishWant, publishWantOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for publishWantOf (2 cases). */
export default function publishWantOfTest(): void {
  describe('PublishWantOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_WANT_OF_0001
     * @tc.name      RequestAddForm_PublishWantOf_0001
     * @tc.desc      publishWantOf(isArkTsCard=true) returns "entry"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_PublishWantOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PublishWantOf_0001 begin`);
      const actual: PublishWant = publishWantOf(true);
      logInfo(`publishWantOf(isArkTsCard=true): actual.abilityName=${actual.abilityName}`);
      expect(actual.abilityName).assertEqual('EntryFormAbility');
      logInfo(`publishWantOf(isArkTsCard=true): actual.dimension=${actual.dimension}`);
      expect(actual.dimension).assertEqual(2);
      logInfo(`publishWantOf(isArkTsCard=true): actual.formName=${actual.formName}`);
      expect(actual.formName).assertEqual('widget');
      logInfo(`publishWantOf(isArkTsCard=true): actual.moduleName=${actual.moduleName}`);
      expect(actual.moduleName).assertEqual('entry');
      logInfo(`${BUNDLE}PublishWantOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PUBLISH_WANT_OF_0002
     * @tc.name      RequestAddForm_PublishWantOf_0002
     * @tc.desc      publishWantOf(isArkTsCard=false) returns "entry"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_PublishWantOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PublishWantOf_0002 begin`);
      const actual: PublishWant = publishWantOf(false);
      logInfo(`publishWantOf(isArkTsCard=false): actual.abilityName=${actual.abilityName}`);
      expect(actual.abilityName).assertEqual('EntryFormAbility');
      logInfo(`publishWantOf(isArkTsCard=false): actual.dimension=${actual.dimension}`);
      expect(actual.dimension).assertEqual(2);
      logInfo(`publishWantOf(isArkTsCard=false): actual.formName=${actual.formName}`);
      expect(actual.formName).assertEqual('JsWidget');
      logInfo(`publishWantOf(isArkTsCard=false): actual.moduleName=${actual.moduleName}`);
      expect(actual.moduleName).assertEqual('entry');
      logInfo(`${BUNDLE}PublishWantOf_0002 end`);
    });
  });
}
