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
import { TabBarAttribute } from '../../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomAnimationTab]';
const BUNDLE: string = 'CustomAnimationTab_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new TabBarAttribute (2 cases). */
export default function tabBarAttributeCtorTest(): void {
  describe('TabBarAttributeCtorTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_TAB_BAR_ATTRIBUTE_CTOR_0001
     * @tc.name      CustomAnimationTab_TabBarAttributeCtor_0001
     * @tc.desc      new TabBarAttribute(undefined, undefined, true) initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_TabBarAttributeCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TabBarAttributeCtor_0001 begin`);
      const subject: TabBarAttribute = new TabBarAttribute(undefined, undefined, true);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barItemWidth=${subject.barItemWidth}`);
      expect(subject.barItemWidth).assertUndefined();
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barHeight=${subject.barHeight}`);
      expect(subject.barHeight).assertUndefined();
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.scrollable=${subject.scrollable}`);
      expect(subject.scrollable).assertTrue();
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barEdgeEffect=${subject.barEdgeEffect}`);
      expect(subject.barEdgeEffect).assertEqual(EdgeEffect.Spring);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barVertical=${subject.barVertical}`);
      expect(subject.barVertical).assertEqual(BarPosition.Start);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barBackgroundColor=${subject.barBackgroundColor}`);
      expect(subject.barBackgroundColor).assertEqual(Color.Transparent);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barMargin=${subject.barMargin}`);
      expect(subject.barMargin).assertUndefined();
      logInfo(`${BUNDLE}TabBarAttributeCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_TAB_BAR_ATTRIBUTE_CTOR_0002
     * @tc.name      CustomAnimationTab_TabBarAttributeCtor_0002
     * @tc.desc      new TabBarAttribute(undefined, undefined, false) initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_TabBarAttributeCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TabBarAttributeCtor_0002 begin`);
      const subject: TabBarAttribute = new TabBarAttribute(undefined, undefined, false);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barItemWidth=${subject.barItemWidth}`);
      expect(subject.barItemWidth).assertUndefined();
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barHeight=${subject.barHeight}`);
      expect(subject.barHeight).assertUndefined();
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.scrollable=${subject.scrollable}`);
      expect(subject.scrollable).assertFalse();
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barEdgeEffect=${subject.barEdgeEffect}`);
      expect(subject.barEdgeEffect).assertEqual(EdgeEffect.Spring);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barVertical=${subject.barVertical}`);
      expect(subject.barVertical).assertEqual(BarPosition.Start);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barBackgroundColor=${subject.barBackgroundColor}`);
      expect(subject.barBackgroundColor).assertEqual(Color.Transparent);
      logInfo(`new TabBarAttribute(undefined, undefined,...: subject.barMargin=${subject.barMargin}`);
      expect(subject.barMargin).assertUndefined();
      logInfo(`${BUNDLE}TabBarAttributeCtor_0002 end`);
    });
  });
}
