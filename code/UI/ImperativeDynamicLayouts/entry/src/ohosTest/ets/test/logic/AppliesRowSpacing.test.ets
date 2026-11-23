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
import { appliesRowSpacing } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for appliesRowSpacing (30 cases). */
export default function appliesRowSpacingTest(): void {
  describe('AppliesRowSpacingTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0001
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0001
     * @tc.desc      appliesRowSpacing(left=-100, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0001 begin`);
      const actual: boolean = appliesRowSpacing(-100, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=-100, ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0002
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0002
     * @tc.desc      appliesRowSpacing(left=-1, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0002 begin`);
      const actual: boolean = appliesRowSpacing(-1, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=-1, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0003
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0003
     * @tc.desc      appliesRowSpacing(left=0, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0003 begin`);
      const actual: boolean = appliesRowSpacing(0, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=0, right=-100, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0004
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0004
     * @tc.desc      appliesRowSpacing(left=1, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0004 begin`);
      const actual: boolean = appliesRowSpacing(1, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=1, right=-100, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0005
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0005
     * @tc.desc      appliesRowSpacing(left=50, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0005 begin`);
      const actual: boolean = appliesRowSpacing(50, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=50, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0006
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0006
     * @tc.desc      appliesRowSpacing(left=100, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0006 begin`);
      const actual: boolean = appliesRowSpacing(100, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=100, right=-100, t...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0007
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0007
     * @tc.desc      appliesRowSpacing(left=2, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0007 begin`);
      const actual: boolean = appliesRowSpacing(2, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=2, right=-100, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0008
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0008
     * @tc.desc      appliesRowSpacing(left=3, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0008 begin`);
      const actual: boolean = appliesRowSpacing(3, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=3, right=-100, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0009
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0009
     * @tc.desc      appliesRowSpacing(left=10, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0009 begin`);
      const actual: boolean = appliesRowSpacing(10, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=10, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0010
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0010
     * @tc.desc      appliesRowSpacing(left=5, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0010 begin`);
      const actual: boolean = appliesRowSpacing(5, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=5, right=-100, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0011
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0011
     * @tc.desc      appliesRowSpacing(left=15, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0011 begin`);
      const actual: boolean = appliesRowSpacing(15, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=15, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0012
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0012
     * @tc.desc      appliesRowSpacing(left=20, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0012 begin`);
      const actual: boolean = appliesRowSpacing(20, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=20, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0013
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0013
     * @tc.desc      appliesRowSpacing(left=25, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0013 begin`);
      const actual: boolean = appliesRowSpacing(25, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=25, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0014
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0014
     * @tc.desc      appliesRowSpacing(left=30, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0014 begin`);
      const actual: boolean = appliesRowSpacing(30, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=30, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0015
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0015
     * @tc.desc      appliesRowSpacing(left=35, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0015 begin`);
      const actual: boolean = appliesRowSpacing(35, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=35, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0016
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0016
     * @tc.desc      appliesRowSpacing(left=-9, right=-100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0016 begin`);
      const actual: boolean = appliesRowSpacing(-9, -100, -100, -100);
      logInfo(`appliesRowSpacing(left=-9, right=-100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0017
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0017
     * @tc.desc      appliesRowSpacing(left=-100, right=-1, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0017 begin`);
      const actual: boolean = appliesRowSpacing(-100, -1, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=-1, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0018
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0018
     * @tc.desc      appliesRowSpacing(left=-100, right=0, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0018 begin`);
      const actual: boolean = appliesRowSpacing(-100, 0, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=0, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0019
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0019
     * @tc.desc      appliesRowSpacing(left=-100, right=1, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0019 begin`);
      const actual: boolean = appliesRowSpacing(-100, 1, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=1, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0020
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0020
     * @tc.desc      appliesRowSpacing(left=-100, right=50, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0020 begin`);
      const actual: boolean = appliesRowSpacing(-100, 50, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=50, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0021
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0021
     * @tc.desc      appliesRowSpacing(left=-100, right=100, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0021 begin`);
      const actual: boolean = appliesRowSpacing(-100, 100, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=100, t...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0022
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0022
     * @tc.desc      appliesRowSpacing(left=-100, right=2, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0022 begin`);
      const actual: boolean = appliesRowSpacing(-100, 2, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=2, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0023
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0023
     * @tc.desc      appliesRowSpacing(left=-100, right=3, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0023 begin`);
      const actual: boolean = appliesRowSpacing(-100, 3, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=3, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0024
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0024
     * @tc.desc      appliesRowSpacing(left=-100, right=10, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0024 begin`);
      const actual: boolean = appliesRowSpacing(-100, 10, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=10, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0025
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0025
     * @tc.desc      appliesRowSpacing(left=-100, right=5, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0025 begin`);
      const actual: boolean = appliesRowSpacing(-100, 5, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=5, top...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0026
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0026
     * @tc.desc      appliesRowSpacing(left=-100, right=15, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0026 begin`);
      const actual: boolean = appliesRowSpacing(-100, 15, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=15, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0027
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0027
     * @tc.desc      appliesRowSpacing(left=-100, right=20, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0027 begin`);
      const actual: boolean = appliesRowSpacing(-100, 20, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=20, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0028
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0028
     * @tc.desc      appliesRowSpacing(left=-100, right=25, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0028 begin`);
      const actual: boolean = appliesRowSpacing(-100, 25, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=25, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0029
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0029
     * @tc.desc      appliesRowSpacing(left=-100, right=30, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0029 begin`);
      const actual: boolean = appliesRowSpacing(-100, 30, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=30, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_APPLIES_ROW_SPACING_0030
     * @tc.name      ImperativeDynamicLayouts_AppliesRowSpacing_0030
     * @tc.desc      appliesRowSpacing(left=-100, right=35, top=-100, bottom=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_AppliesRowSpacing_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AppliesRowSpacing_0030 begin`);
      const actual: boolean = appliesRowSpacing(-100, 35, -100, -100);
      logInfo(`appliesRowSpacing(left=-100, right=35, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}AppliesRowSpacing_0030 end`);
    });
  });
}
