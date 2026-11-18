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
import { AnimationAttribute } from '../../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomAnimationTab]';
const BUNDLE: string = 'CustomAnimationTab_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new AnimationAttribute (1 cases). */
export default function animationAttributeCtorTest(): void {
  describe('AnimationAttributeCtorTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_ANIMATION_ATTRIBUTE_CTOR_0001
     * @tc.name      CustomAnimationTab_AnimationAttributeCtor_0001
     * @tc.desc      new AnimationAttribute() initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_AnimationAttributeCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimationAttributeCtor_0001 begin`);
      const subject: AnimationAttribute = new AnimationAttribute();
      logInfo(`new AnimationAttribute(): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new AnimationAttribute(): subject.indicatorBarWidth=${subject.indicatorBarWidth}`);
      expect(subject.indicatorBarWidth).assertEqual(0);
      logInfo(`new AnimationAttribute(): subject.indicatorBarHeight=${subject.indicatorBarHeight}`);
      expect(subject.indicatorBarHeight).assertEqual(0);
      logInfo(`${BUNDLE}AnimationAttributeCtor_0001 end`);
    });
  });
}
