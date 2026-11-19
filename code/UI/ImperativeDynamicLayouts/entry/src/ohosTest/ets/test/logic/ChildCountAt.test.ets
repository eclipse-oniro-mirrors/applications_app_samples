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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { childCountAt } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for childCountAt (8 cases). */
export default function childCountAtTest(): void {
  describe('ChildCountAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0001
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0001
     * @tc.desc      childCountAt(pathIndexes=[]) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChildCountAt_0001 begin`);
      const actual: number = childCountAt([]);
      logInfo(`childCountAt(pathIndexes=[]): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ChildCountAt_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0002
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0002
     * @tc.desc      childCountAt(pathIndexes=[0]) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChildCountAt_0002 begin`);
      const actual: number = childCountAt([0]);
      logInfo(`childCountAt(pathIndexes=[0]): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ChildCountAt_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0003
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0003
     * @tc.desc      childCountAt(pathIndexes=[0, 1]) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChildCountAt_0003 begin`);
      const actual: number = childCountAt([0, 1]);
      logInfo(`childCountAt(pathIndexes=[0, 1]): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ChildCountAt_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0004
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0004
     * @tc.desc      childCountAt(pathIndexes=[1, 0, -1]) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChildCountAt_0004 begin`);
      const actual: number = childCountAt([1, 0, -1]);
      logInfo(`childCountAt(pathIndexes=[1, 0, -1]): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ChildCountAt_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0005
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0005
     * @tc.desc      childCountAt(pathIndexes=[-1, -1]) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChildCountAt_0005 begin`);
      const actual: number = childCountAt([-1, -1]);
      logInfo(`childCountAt(pathIndexes=[-1, -1]): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ChildCountAt_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0006
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0006
     * @tc.desc      childCountAt(pathIndexes=[0, 1, -1, -2, 2]) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChildCountAt_0006 begin`);
      const actual: number = childCountAt([0, 1, -1, -2, 2]);
      logInfo(`childCountAt(pathIndexes=[0, 1, -1, -2, 2]): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ChildCountAt_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0007
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0007
     * @tc.desc      childCountAt(pathIndexes=[-2, 1, 2, 1, 5]) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChildCountAt_0007 begin`);
      const actual: number = childCountAt([-2, 1, 2, 1, 5]);
      logInfo(`childCountAt(pathIndexes=[-2, 1, 2, 1, 5]): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ChildCountAt_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CHILD_COUNT_AT_0008
     * @tc.name      ImperativeDynamicLayouts_ChildCountAt_0008
     * @tc.desc      childCountAt(pathIndexes=[5, 2, -2, -1, 1, 0]) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ChildCountAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChildCountAt_0008 begin`);
      const actual: number = childCountAt([5, 2, -2, -1, 1, 0]);
      logInfo(`childCountAt(pathIndexes=[5, 2, -2, -1, 1...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ChildCountAt_0008 end`);
    });
  });
}
