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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ShapePanelLayout } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ShapePanelLayout.labelX (74 cases). */
export default function shapePanelLayoutLabelXTest(): void {
  describe('ShapePanelLayoutLabelXTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0001
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0001
     * @tc.desc      ShapePanelLayout.labelX(column=0) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0001 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(0);
      logInfo(`labelX(column=0): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0002
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0002
     * @tc.desc      ShapePanelLayout.labelX(column=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0002 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(-1);
      logInfo(`labelX(column=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0003
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0003
     * @tc.desc      ShapePanelLayout.labelX(column=1) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0003 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(1);
      logInfo(`labelX(column=1): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0004
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0004
     * @tc.desc      ShapePanelLayout.labelX(column=2) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0004 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(2);
      logInfo(`labelX(column=2): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0005
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0005
     * @tc.desc      ShapePanelLayout.labelX(column=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0005 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(3);
      logInfo(`labelX(column=3): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0006
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0006
     * @tc.desc      ShapePanelLayout.labelX(column=20) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0006 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(20);
      logInfo(`labelX(column=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0007
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0007
     * @tc.desc      ShapePanelLayout.labelX(column=19) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0007 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(19);
      logInfo(`labelX(column=19): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0008
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0008
     * @tc.desc      ShapePanelLayout.labelX(column=21) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0008 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(21);
      logInfo(`labelX(column=21): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0009
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0009
     * @tc.desc      ShapePanelLayout.labelX(column=40) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0009 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(40);
      logInfo(`labelX(column=40): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0010
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0010
     * @tc.desc      ShapePanelLayout.labelX(column=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0010 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(10);
      logInfo(`labelX(column=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0011
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0011
     * @tc.desc      ShapePanelLayout.labelX(column=30) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0011 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(30);
      logInfo(`labelX(column=30): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0012
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0012
     * @tc.desc      ShapePanelLayout.labelX(column=29) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0012 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(29);
      logInfo(`labelX(column=29): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0013
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0013
     * @tc.desc      ShapePanelLayout.labelX(column=31) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0013 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(31);
      logInfo(`labelX(column=31): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0014
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0014
     * @tc.desc      ShapePanelLayout.labelX(column=60) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0014 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(60);
      logInfo(`labelX(column=60): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0015
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0015
     * @tc.desc      ShapePanelLayout.labelX(column=15) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0015 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(15);
      logInfo(`labelX(column=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0016
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0016
     * @tc.desc      ShapePanelLayout.labelX(column=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0016 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(4);
      logInfo(`labelX(column=4): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0017
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0017
     * @tc.desc      ShapePanelLayout.labelX(column=9) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0017 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(9);
      logInfo(`labelX(column=9): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0018
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0018
     * @tc.desc      ShapePanelLayout.labelX(column=11) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0018 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(11);
      logInfo(`labelX(column=11): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0019
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0019
     * @tc.desc      ShapePanelLayout.labelX(column=5) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0019 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(5);
      logInfo(`labelX(column=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0020
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0020
     * @tc.desc      ShapePanelLayout.labelX(column=-2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0020 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(-2);
      logInfo(`labelX(column=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0021
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0021
     * @tc.desc      ShapePanelLayout.labelX(column=120) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0021 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(120);
      logInfo(`labelX(column=120): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0022
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0022
     * @tc.desc      ShapePanelLayout.labelX(column=119) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0022 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(119);
      logInfo(`labelX(column=119): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0023
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0023
     * @tc.desc      ShapePanelLayout.labelX(column=121) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0023 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(121);
      logInfo(`labelX(column=121): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0024
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0024
     * @tc.desc      ShapePanelLayout.labelX(column=240) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0024 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(240);
      logInfo(`labelX(column=240): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0025
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0025
     * @tc.desc      ShapePanelLayout.labelX(column=200) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0025 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(200);
      logInfo(`labelX(column=200): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0026
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0026
     * @tc.desc      ShapePanelLayout.labelX(column=199) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0026 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(199);
      logInfo(`labelX(column=199): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0027
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0027
     * @tc.desc      ShapePanelLayout.labelX(column=201) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0027 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(201);
      logInfo(`labelX(column=201): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0028
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0028
     * @tc.desc      ShapePanelLayout.labelX(column=400) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0028 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(400);
      logInfo(`labelX(column=400): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0029
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0029
     * @tc.desc      ShapePanelLayout.labelX(column=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0029 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(100);
      logInfo(`labelX(column=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0030
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0030
     * @tc.desc      ShapePanelLayout.labelX(column=80) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0030 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(80);
      logInfo(`labelX(column=80): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0031
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0031
     * @tc.desc      ShapePanelLayout.labelX(column=140) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0031 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(140);
      logInfo(`labelX(column=140): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0032
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0032
     * @tc.desc      ShapePanelLayout.labelX(column=160) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0032 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(160);
      logInfo(`labelX(column=160): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0033
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0033
     * @tc.desc      ShapePanelLayout.labelX(column=180) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0033 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(180);
      logInfo(`labelX(column=180): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0034
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0034
     * @tc.desc      ShapePanelLayout.labelX(column=220) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0034 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(220);
      logInfo(`labelX(column=220): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0035
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0035
     * @tc.desc      ShapePanelLayout.labelX(column=260) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0035 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(260);
      logInfo(`labelX(column=260): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0036
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0036
     * @tc.desc      ShapePanelLayout.labelX(column=280) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0036 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(280);
      logInfo(`labelX(column=280): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0037
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0037
     * @tc.desc      ShapePanelLayout.labelX(column=300) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0037 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(300);
      logInfo(`labelX(column=300): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0038
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0038
     * @tc.desc      ShapePanelLayout.labelX(column=320) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0038 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(320);
      logInfo(`labelX(column=320): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0039
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0039
     * @tc.desc      ShapePanelLayout.labelX(column=340) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0039 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(340);
      logInfo(`labelX(column=340): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0040
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0040
     * @tc.desc      ShapePanelLayout.labelX(column=360) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0040 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(360);
      logInfo(`labelX(column=360): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0041
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0041
     * @tc.desc      ShapePanelLayout.labelX(column=380) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0041 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(380);
      logInfo(`labelX(column=380): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0042
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0042
     * @tc.desc      ShapePanelLayout.labelX(column=420) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0042 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(420);
      logInfo(`labelX(column=420): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0043
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0043
     * @tc.desc      ShapePanelLayout.labelX(column=440) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0043 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(440);
      logInfo(`labelX(column=440): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0044
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0044
     * @tc.desc      ShapePanelLayout.labelX(column=460) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0044 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(460);
      logInfo(`labelX(column=460): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0045
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0045
     * @tc.desc      ShapePanelLayout.labelX(column=480) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0045 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(480);
      logInfo(`labelX(column=480): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0046
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0046
     * @tc.desc      ShapePanelLayout.labelX(column=500) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0046 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(500);
      logInfo(`labelX(column=500): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0047
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0047
     * @tc.desc      ShapePanelLayout.labelX(column=520) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0047 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(520);
      logInfo(`labelX(column=520): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0048
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0048
     * @tc.desc      ShapePanelLayout.labelX(column=540) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0048 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(540);
      logInfo(`labelX(column=540): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0049
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0049
     * @tc.desc      ShapePanelLayout.labelX(column=560) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0049 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(560);
      logInfo(`labelX(column=560): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0050
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0050
     * @tc.desc      ShapePanelLayout.labelX(column=580) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0050 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(580);
      logInfo(`labelX(column=580): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0051
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0051
     * @tc.desc      ShapePanelLayout.labelX(column=600) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0051 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(600);
      logInfo(`labelX(column=600): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0052
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0052
     * @tc.desc      ShapePanelLayout.labelX(column=620) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0052 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(620);
      logInfo(`labelX(column=620): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0053
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0053
     * @tc.desc      ShapePanelLayout.labelX(column=640) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0053 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(640);
      logInfo(`labelX(column=640): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0054
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0054
     * @tc.desc      ShapePanelLayout.labelX(column=660) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0054 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(660);
      logInfo(`labelX(column=660): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0055
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0055
     * @tc.desc      ShapePanelLayout.labelX(column=680) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0055 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(680);
      logInfo(`labelX(column=680): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0056
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0056
     * @tc.desc      ShapePanelLayout.labelX(column=700) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0056 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(700);
      logInfo(`labelX(column=700): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0057
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0057
     * @tc.desc      ShapePanelLayout.labelX(column=720) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0057 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(720);
      logInfo(`labelX(column=720): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0058
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0058
     * @tc.desc      ShapePanelLayout.labelX(column=740) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0058 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(740);
      logInfo(`labelX(column=740): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0059
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0059
     * @tc.desc      ShapePanelLayout.labelX(column=760) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0059 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(760);
      logInfo(`labelX(column=760): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0060
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0060
     * @tc.desc      ShapePanelLayout.labelX(column=780) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0060 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(780);
      logInfo(`labelX(column=780): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0061
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0061
     * @tc.desc      ShapePanelLayout.labelX(column=800) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0061 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(800);
      logInfo(`labelX(column=800): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0062
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0062
     * @tc.desc      ShapePanelLayout.labelX(column=-59) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0062 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(-59);
      logInfo(`labelX(column=-59): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0063
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0063
     * @tc.desc      ShapePanelLayout.labelX(column=587) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0063 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(587);
      logInfo(`labelX(column=587): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0064
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0064
     * @tc.desc      ShapePanelLayout.labelX(column=687) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0064 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(687);
      logInfo(`labelX(column=687): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0065
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0065
     * @tc.desc      ShapePanelLayout.labelX(column=370.05) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0065 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(370.05);
      logInfo(`labelX(column=370.05): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0066
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0066
     * @tc.desc      ShapePanelLayout.labelX(column=277.66) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0066 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(277.66);
      logInfo(`labelX(column=277.66): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0067
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0067
     * @tc.desc      ShapePanelLayout.labelX(column=-240) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0067 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(-240);
      logInfo(`labelX(column=-240): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0068
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0068
     * @tc.desc      ShapePanelLayout.labelX(column=257) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0068 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(257);
      logInfo(`labelX(column=257): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0069
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0069
     * @tc.desc      ShapePanelLayout.labelX(column=52.8) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0069 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(52.8);
      logInfo(`labelX(column=52.8): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0070
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0070
     * @tc.desc      ShapePanelLayout.labelX(column=-110) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0070 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(-110);
      logInfo(`labelX(column=-110): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0071
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0071
     * @tc.desc      ShapePanelLayout.labelX(column=277) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0071 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(277);
      logInfo(`labelX(column=277): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0072
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0072
     * @tc.desc      ShapePanelLayout.labelX(column=324.84) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0072 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const actual: number = subject.labelX(324.84);
      logInfo(`labelX(column=324.84): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0073
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0073
     * @tc.desc      ShapePanelLayout.labelX(column=577) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0073 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.labelX(577);
      logInfo(`labelX(column=577): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LABEL_X_0074
     * @tc.name      TsDrawingSample_ShapePanelLayoutLabelX_0074
     * @tc.desc      ShapePanelLayout.labelX(column=67.19) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutLabelX_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0074 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const actual: number = subject.labelX(67.19);
      logInfo(`labelX(column=67.19): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutLabelX_0074 end`);
    });
  });
}
