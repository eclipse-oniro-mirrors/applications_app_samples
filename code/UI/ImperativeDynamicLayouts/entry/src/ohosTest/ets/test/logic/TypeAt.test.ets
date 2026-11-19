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
import { typeAt } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for typeAt (8 cases). */
export default function typeAtTest(): void {
  describe('TypeAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0001
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0001
     * @tc.desc      typeAt(pathIndexes=[]) returns "Column"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_TypeAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TypeAt_0001 begin`);
      const actual: string = typeAt([]);
      logInfo(`typeAt(pathIndexes=[]): actual=${actual}`);
      expect(actual).assertEqual('Column');
      logInfo(`${BUNDLE}TypeAt_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0002
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0002
     * @tc.desc      typeAt(pathIndexes=[0]) returns "Row"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_TypeAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TypeAt_0002 begin`);
      const actual: string = typeAt([0]);
      logInfo(`typeAt(pathIndexes=[0]): actual=${actual}`);
      expect(actual).assertEqual('Row');
      logInfo(`${BUNDLE}TypeAt_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0003
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0003
     * @tc.desc      typeAt(pathIndexes=[0, 1]) returns "Image"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_TypeAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeAt_0003 begin`);
      const actual: string = typeAt([0, 1]);
      logInfo(`typeAt(pathIndexes=[0, 1]): actual=${actual}`);
      expect(actual).assertEqual('Image');
      logInfo(`${BUNDLE}TypeAt_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0004
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0004
     * @tc.desc      typeAt(pathIndexes=[1, 0, 2]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_TypeAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeAt_0004 begin`);
      const actual: string = typeAt([1, 0, 2]);
      logInfo(`typeAt(pathIndexes=[1, 0, 2]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeAt_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0005
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0005
     * @tc.desc      typeAt(pathIndexes=[2, 2]) returns "Text"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_TypeAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeAt_0005 begin`);
      const actual: string = typeAt([2, 2]);
      logInfo(`typeAt(pathIndexes=[2, 2]): actual=${actual}`);
      expect(actual).assertEqual('Text');
      logInfo(`${BUNDLE}TypeAt_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0006
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0006
     * @tc.desc      typeAt(pathIndexes=[0, 1, 2, -1, 5]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_TypeAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeAt_0006 begin`);
      const actual: string = typeAt([0, 1, 2, -1, 5]);
      logInfo(`typeAt(pathIndexes=[0, 1, 2, -1, 5]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeAt_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0007
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0007
     * @tc.desc      typeAt(pathIndexes=[-1, 1, 5, 1, 10]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_TypeAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeAt_0007 begin`);
      const actual: string = typeAt([-1, 1, 5, 1, 10]);
      logInfo(`typeAt(pathIndexes=[-1, 1, 5, 1, 10]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeAt_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TYPE_AT_0008
     * @tc.name      ImperativeDynamicLayouts_TypeAt_0008
     * @tc.desc      typeAt(pathIndexes=[10, 5, -1, 2, 1, 0]) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_TypeAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TypeAt_0008 begin`);
      const actual: string = typeAt([10, 5, -1, 2, 1, 0]);
      logInfo(`typeAt(pathIndexes=[10, 5, -1, 2, 1, 0]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TypeAt_0008 end`);
    });
  });
}
