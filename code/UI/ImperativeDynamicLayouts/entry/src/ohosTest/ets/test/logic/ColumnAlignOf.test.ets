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
import { columnAlignOf } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for columnAlignOf (50 cases). */
export default function columnAlignOfTest(): void {
  describe('ColumnAlignOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0001
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0001
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.Start") returns "Start"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0001 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.Start');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Start');
      logInfo(`${BUNDLE}ColumnAlignOf_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0002
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0002
     * @tc.desc      columnAlignOf(alignItems="Start") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0002 begin`);
      const actual: string = columnAlignOf('Start');
      logInfo(`columnAlignOf(alignItems="Start"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0003
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0003
     * @tc.desc      columnAlignOf(alignItems="Center") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0003 begin`);
      const actual: string = columnAlignOf('Center');
      logInfo(`columnAlignOf(alignItems="Center"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0004
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0004
     * @tc.desc      columnAlignOf(alignItems="HORIZONTALALIGN.START") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0004 begin`);
      const actual: string = columnAlignOf('HORIZONTALALIGN.START');
      logInfo(`columnAlignOf(alignItems="HORIZONTALALIGN...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0005
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0005
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.Star") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0005 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.Star');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0006
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0006
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.Startx") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0006 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.Startx');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0007
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0007
     * @tc.desc      columnAlignOf(alignItems="START") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0007 begin`);
      const actual: string = columnAlignOf('START');
      logInfo(`columnAlignOf(alignItems="START"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0008
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0008
     * @tc.desc      columnAlignOf(alignItems="Star") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0008 begin`);
      const actual: string = columnAlignOf('Star');
      logInfo(`columnAlignOf(alignItems="Star"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0009
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0009
     * @tc.desc      columnAlignOf(alignItems="Startx") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0009 begin`);
      const actual: string = columnAlignOf('Startx');
      logInfo(`columnAlignOf(alignItems="Startx"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0010
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0010
     * @tc.desc      columnAlignOf(alignItems="CENTER") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0010 begin`);
      const actual: string = columnAlignOf('CENTER');
      logInfo(`columnAlignOf(alignItems="CENTER"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0011
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0011
     * @tc.desc      columnAlignOf(alignItems="Cente") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0011 begin`);
      const actual: string = columnAlignOf('Cente');
      logInfo(`columnAlignOf(alignItems="Cente"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0012
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0012
     * @tc.desc      columnAlignOf(alignItems="Centerx") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0012 begin`);
      const actual: string = columnAlignOf('Centerx');
      logInfo(`columnAlignOf(alignItems="Centerx"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0013
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0013
     * @tc.desc      columnAlignOf(alignItems="") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0013 begin`);
      const actual: string = columnAlignOf('');
      logInfo(`columnAlignOf(alignItems=""): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0014
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0014
     * @tc.desc      columnAlignOf(alignItems="a") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0014 begin`);
      const actual: string = columnAlignOf('a');
      logInfo(`columnAlignOf(alignItems="a"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0015
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0015
     * @tc.desc      columnAlignOf(alignItems="abc") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0015 begin`);
      const actual: string = columnAlignOf('abc');
      logInfo(`columnAlignOf(alignItems="abc"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0016
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0016
     * @tc.desc      columnAlignOf(alignItems="Hello World") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0016 begin`);
      const actual: string = columnAlignOf('Hello World');
      logInfo(`columnAlignOf(alignItems="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0017
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0017
     * @tc.desc      columnAlignOf(alignItems=" ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0017 begin`);
      const actual: string = columnAlignOf(' ');
      logInfo(`columnAlignOf(alignItems=" "): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0018
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0018
     * @tc.desc      columnAlignOf(alignItems="123") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0018 begin`);
      const actual: string = columnAlignOf('123');
      logInfo(`columnAlignOf(alignItems="123"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0019
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0019
     * @tc.desc      columnAlignOf(alignItems=" HorizontalAlign.Start ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0019 begin`);
      const actual: string = columnAlignOf(' HorizontalAlign.Start ');
      logInfo(`columnAlignOf(alignItems=" HorizontalAlig...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0020
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0020
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.Start_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0020 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.Start_1');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0021
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0021
     * @tc.desc      columnAlignOf(alignItems="xHorizontalAlign.Start") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0021 begin`);
      const actual: string = columnAlignOf('xHorizontalAlign.Start');
      logInfo(`columnAlignOf(alignItems="xHorizontalAlig...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0022
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0022
     * @tc.desc      columnAlignOf(alignItems=" Start ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0022 begin`);
      const actual: string = columnAlignOf(' Start ');
      logInfo(`columnAlignOf(alignItems=" Start "): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0023
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0023
     * @tc.desc      columnAlignOf(alignItems="StartStart") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0023 begin`);
      const actual: string = columnAlignOf('StartStart');
      logInfo(`columnAlignOf(alignItems="StartStart"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0024
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0024
     * @tc.desc      columnAlignOf(alignItems="Start_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0024 begin`);
      const actual: string = columnAlignOf('Start_1');
      logInfo(`columnAlignOf(alignItems="Start_1"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0025
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0025
     * @tc.desc      columnAlignOf(alignItems="xStart") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0025 begin`);
      const actual: string = columnAlignOf('xStart');
      logInfo(`columnAlignOf(alignItems="xStart"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0026
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0026
     * @tc.desc      columnAlignOf(alignItems=" Center ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0026 begin`);
      const actual: string = columnAlignOf(' Center ');
      logInfo(`columnAlignOf(alignItems=" Center "): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0027
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0027
     * @tc.desc      columnAlignOf(alignItems="CenterCenter") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0027 begin`);
      const actual: string = columnAlignOf('CenterCenter');
      logInfo(`columnAlignOf(alignItems="CenterCenter"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0028
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0028
     * @tc.desc      columnAlignOf(alignItems="Center_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0028 begin`);
      const actual: string = columnAlignOf('Center_1');
      logInfo(`columnAlignOf(alignItems="Center_1"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0029
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0029
     * @tc.desc      columnAlignOf(alignItems="xCenter") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0029 begin`);
      const actual: string = columnAlignOf('xCenter');
      logInfo(`columnAlignOf(alignItems="xCenter"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0030
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0030
     * @tc.desc      columnAlignOf(alignItems=" HORIZONTALALIGN.START ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0030 begin`);
      const actual: string = columnAlignOf(' HORIZONTALALIGN.START ');
      logInfo(`columnAlignOf(alignItems=" HORIZONTALALIG...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0030 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0031
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0031
     * @tc.desc      columnAlignOf(alignItems="HORIZONTALALIGN.START_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0031 begin`);
      const actual: string = columnAlignOf('HORIZONTALALIGN.START_1');
      logInfo(`columnAlignOf(alignItems="HORIZONTALALIGN...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0031 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0032
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0032
     * @tc.desc      columnAlignOf(alignItems="xHORIZONTALALIGN.START") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0032 begin`);
      const actual: string = columnAlignOf('xHORIZONTALALIGN.START');
      logInfo(`columnAlignOf(alignItems="xHORIZONTALALIG...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0032 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0033
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0033
     * @tc.desc      columnAlignOf(alignItems=" HorizontalAlign.Star ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0033 begin`);
      const actual: string = columnAlignOf(' HorizontalAlign.Star ');
      logInfo(`columnAlignOf(alignItems=" HorizontalAlig...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0033 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0034
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0034
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.StarHorizontalAlign....) returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0034 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.StarHorizontalAlign.Star');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0034 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0035
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0035
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.Star_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0035 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.Star_1');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0035 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0036
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0036
     * @tc.desc      columnAlignOf(alignItems="xHorizontalAlign.Star") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0036 begin`);
      const actual: string = columnAlignOf('xHorizontalAlign.Star');
      logInfo(`columnAlignOf(alignItems="xHorizontalAlig...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0036 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0037
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0037
     * @tc.desc      columnAlignOf(alignItems=" HorizontalAlign.Startx ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0037 begin`);
      const actual: string = columnAlignOf(' HorizontalAlign.Startx ');
      logInfo(`columnAlignOf(alignItems=" HorizontalAlig...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0037 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0038
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0038
     * @tc.desc      columnAlignOf(alignItems="HorizontalAlign.Startx_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0038 begin`);
      const actual: string = columnAlignOf('HorizontalAlign.Startx_1');
      logInfo(`columnAlignOf(alignItems="HorizontalAlign...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0038 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0039
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0039
     * @tc.desc      columnAlignOf(alignItems="xHorizontalAlign.Startx") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0039 begin`);
      const actual: string = columnAlignOf('xHorizontalAlign.Startx');
      logInfo(`columnAlignOf(alignItems="xHorizontalAlig...: actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0039 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0040
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0040
     * @tc.desc      columnAlignOf(alignItems=" START ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0040 begin`);
      const actual: string = columnAlignOf(' START ');
      logInfo(`columnAlignOf(alignItems=" START "): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0040 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0041
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0041
     * @tc.desc      columnAlignOf(alignItems="STARTSTART") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0041 begin`);
      const actual: string = columnAlignOf('STARTSTART');
      logInfo(`columnAlignOf(alignItems="STARTSTART"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0041 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0042
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0042
     * @tc.desc      columnAlignOf(alignItems="START_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0042 begin`);
      const actual: string = columnAlignOf('START_1');
      logInfo(`columnAlignOf(alignItems="START_1"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0042 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0043
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0043
     * @tc.desc      columnAlignOf(alignItems="xSTART") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0043 begin`);
      const actual: string = columnAlignOf('xSTART');
      logInfo(`columnAlignOf(alignItems="xSTART"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0043 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0044
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0044
     * @tc.desc      columnAlignOf(alignItems=" Star ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0044 begin`);
      const actual: string = columnAlignOf(' Star ');
      logInfo(`columnAlignOf(alignItems=" Star "): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0044 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0045
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0045
     * @tc.desc      columnAlignOf(alignItems="StarStar") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0045 begin`);
      const actual: string = columnAlignOf('StarStar');
      logInfo(`columnAlignOf(alignItems="StarStar"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0045 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0046
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0046
     * @tc.desc      columnAlignOf(alignItems="Star_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0046 begin`);
      const actual: string = columnAlignOf('Star_1');
      logInfo(`columnAlignOf(alignItems="Star_1"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0046 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0047
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0047
     * @tc.desc      columnAlignOf(alignItems="xStar") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0047 begin`);
      const actual: string = columnAlignOf('xStar');
      logInfo(`columnAlignOf(alignItems="xStar"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0047 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0048
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0048
     * @tc.desc      columnAlignOf(alignItems=" Startx ") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0048 begin`);
      const actual: string = columnAlignOf(' Startx ');
      logInfo(`columnAlignOf(alignItems=" Startx "): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0048 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0049
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0049
     * @tc.desc      columnAlignOf(alignItems="StartxStartx") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0049 begin`);
      const actual: string = columnAlignOf('StartxStartx');
      logInfo(`columnAlignOf(alignItems="StartxStartx"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0049 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_COLUMN_ALIGN_OF_0050
     * @tc.name      ImperativeDynamicLayouts_ColumnAlignOf_0050
     * @tc.desc      columnAlignOf(alignItems="Startx_1") returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_ColumnAlignOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnAlignOf_0050 begin`);
      const actual: string = columnAlignOf('Startx_1');
      logInfo(`columnAlignOf(alignItems="Startx_1"): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}ColumnAlignOf_0050 end`);
    });
  });
}
