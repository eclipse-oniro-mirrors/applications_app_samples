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
import { AnimationAttribute } from '../../../../main/ets/model/AnimationAttribute';
import { defaultAttribute } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for defaultAttribute (1 cases). */
export default function defaultAttributeTest(): void {
  describe('DefaultAttributeTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_DEFAULT_ATTRIBUTE_0001
     * @tc.name      ExpandTitle_DefaultAttribute_0001
     * @tc.desc      defaultAttribute() returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_DefaultAttribute_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DefaultAttribute_0001 begin`);
      const actual: AnimationAttribute = defaultAttribute();
      logInfo(`defaultAttribute(): actual.normalTitleHeight=${actual.normalTitleHeight}`);
      expect(actual.normalTitleHeight).assertEqual(80);
      logInfo(`defaultAttribute(): actual.expandTitleHeight=${actual.expandTitleHeight}`);
      expect(actual.expandTitleHeight).assertEqual(100);
      logInfo(`defaultAttribute(): actual.continuePullThreshold=${actual.continuePullThreshold}`);
      expect(actual.continuePullThreshold).assertEqual(90);
      logInfo(`defaultAttribute(): actual.titleScale=${actual.titleScale}`);
      expect(actual.titleScale).assertClose(1.2, PRECISION);
      logInfo(`defaultAttribute(): actual.animationDuration=${actual.animationDuration}`);
      expect(actual.animationDuration).assertEqual(120);
      logInfo(`${BUNDLE}DefaultAttribute_0001 end`);
    });
  });
}
