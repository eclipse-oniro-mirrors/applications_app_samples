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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ShapePanelLayout flow (62 cases). */
export default function shapePanelLayoutFlowTest(): void {
  describe('ShapePanelLayoutFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0001
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0001
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > labelX > labelY > roundRectWidth > labelY keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0001 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.labelX(14.18);
      logInfo(`step2 labelX(14.18): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-40);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0002
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0002
     * @tc.desc      ShapePanelLayout call flow labelY > labelY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0002 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertClose(120.5, PRECISION);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertClose(120.5, PRECISION);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertClose(200.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0003
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0003
     * @tc.desc      ShapePanelLayout call flow labelY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0003 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(170);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0004
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0004
     * @tc.desc      ShapePanelLayout call flow labelX > lineY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0004 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(54.92);
      logInfo(`step1 labelX(54.92): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(200);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0005
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0005
     * @tc.desc      ShapePanelLayout call flow labelY > roundRectWidth > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0005 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertClose(120.5, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0006
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0006
     * @tc.desc      ShapePanelLayout call flow lineY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0006 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(250);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(170);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0007
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0007
     * @tc.desc      ShapePanelLayout call flow lineY > roundRectWidth > labelY > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0007 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(200);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      const step4: number = subject.rectWidth();
      logInfo(`step4 rectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-40);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0008
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0008
     * @tc.desc      ShapePanelLayout call flow labelX > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0008 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelX(163);
      logInfo(`step1 labelX(163): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0009
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0009
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > roundRectWidth > labelX keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0009 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-15);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      const step3: number = subject.labelX(92.51);
      logInfo(`step3 labelX(92.51): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0010
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0010
     * @tc.desc      ShapePanelLayout call flow lineY > labelX > labelX > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0010 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(200);
      const step2: number = subject.labelX(122);
      logInfo(`step2 labelX(122): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.labelX(125);
      logInfo(`step3 labelX(125): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0011
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0011
     * @tc.desc      ShapePanelLayout call flow lineY > labelY > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0011 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertClose(120.5, PRECISION);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0012
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0012
     * @tc.desc      ShapePanelLayout call flow labelY > labelY > roundRectWidth > labelY > labelX keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0012 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(170);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(170);
      const step5: number = subject.labelX(-27);
      logInfo(`step5 labelX(-27): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0013
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0013
     * @tc.desc      ShapePanelLayout call flow rectWidth > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0013 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0014
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0014
     * @tc.desc      ShapePanelLayout call flow lineY > labelX > roundRectWidth > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0014 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.labelX(4);
      logInfo(`step2 labelX(4): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      const step4: number = subject.lineY();
      logInfo(`step4 lineY(): step4=${step4}`);
      expect(step4).assertClose(200.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0015
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0015
     * @tc.desc      ShapePanelLayout call flow labelX > labelX > lineY > rectWidth > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0015 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelX(125);
      logInfo(`step1 labelX(125): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.labelX(9);
      logInfo(`step2 labelX(9): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(250);
      const step4: number = subject.rectWidth();
      logInfo(`step4 rectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-15);
      const step5: number = subject.lineY();
      logInfo(`step5 lineY(): step5=${step5}`);
      expect(step5).assertEqual(250);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0016
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0016
     * @tc.desc      ShapePanelLayout call flow labelX > labelY > roundRectWidth > labelY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0016 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(100);
      logInfo(`step1 labelX(100): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-40);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(120);
      const step5: number = subject.lineY();
      logInfo(`step5 lineY(): step5=${step5}`);
      expect(step5).assertEqual(200);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0017
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0017
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > roundRectWidth > roundRectWidth > roundRectWidth kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0017 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0018
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0018
     * @tc.desc      ShapePanelLayout call flow labelX > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0018 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelX(194);
      logInfo(`step1 labelX(194): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(170);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0019
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0019
     * @tc.desc      ShapePanelLayout call flow labelY > roundRectWidth > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0019 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(120);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(200);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0020
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0020
     * @tc.desc      ShapePanelLayout call flow rectWidth > roundRectWidth > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0020 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0021
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0021
     * @tc.desc      ShapePanelLayout call flow labelY > lineY > labelY > labelY > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0021 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(250);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(170);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(170);
      const step5: number = subject.rectWidth();
      logInfo(`step5 rectWidth(): step5=${step5}`);
      expect(step5).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0022
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0022
     * @tc.desc      ShapePanelLayout call flow labelX > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0022 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(79.46);
      logInfo(`step1 labelX(79.46): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0023
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0023
     * @tc.desc      ShapePanelLayout call flow lineY > roundRectWidth > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0023 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0024
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0024
     * @tc.desc      ShapePanelLayout call flow labelY > labelY > labelY > labelY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0024 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(170);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(170);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(170);
      const step5: number = subject.lineY();
      logInfo(`step5 lineY(): step5=${step5}`);
      expect(step5).assertEqual(250);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0025
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0025
     * @tc.desc      ShapePanelLayout call flow labelX > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0025 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(95);
      logInfo(`step1 labelX(95): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0026
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0026
     * @tc.desc      ShapePanelLayout call flow lineY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0026 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertClose(200.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0027
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0027
     * @tc.desc      ShapePanelLayout call flow labelX > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0027 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelX(29);
      logInfo(`step1 labelX(29): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0028
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0028
     * @tc.desc      ShapePanelLayout call flow lineY > labelY > labelX keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0028 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(200);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      const step3: number = subject.labelX(190);
      logInfo(`step3 labelX(190): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0029
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0029
     * @tc.desc      ShapePanelLayout call flow lineY > lineY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0029 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertClose(200.5, PRECISION);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertClose(200.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0030
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0030
     * @tc.desc      ShapePanelLayout call flow lineY > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0030 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(250);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0031
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0031
     * @tc.desc      ShapePanelLayout call flow lineY > lineY > labelY > roundRectWidth > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0031 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(200);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(200);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-40);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0032
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0032
     * @tc.desc      ShapePanelLayout call flow labelX > rectWidth > labelY > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0032 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelX(118);
      logInfo(`step1 labelX(118): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertClose(120.5, PRECISION);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0033
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0033
     * @tc.desc      ShapePanelLayout call flow lineY > rectWidth > lineY > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0033 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(250);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(250);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0034
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0034
     * @tc.desc      ShapePanelLayout call flow rectWidth > labelX > rectWidth > labelX keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0034 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.labelX(142);
      logInfo(`step2 labelX(142): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.rectWidth();
      logInfo(`step3 rectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-40);
      const step4: number = subject.labelX(55);
      logInfo(`step4 labelX(55): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0035
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0035
     * @tc.desc      ShapePanelLayout call flow rectWidth > lineY > lineY > labelX keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0035 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertClose(200.5, PRECISION);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertClose(200.5, PRECISION);
      const step4: number = subject.labelX(-12);
      logInfo(`step4 labelX(-12): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0036
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0036
     * @tc.desc      ShapePanelLayout call flow labelY > lineY > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0036 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(250);
      const step3: number = subject.rectWidth();
      logInfo(`step3 rectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0037
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0037
     * @tc.desc      ShapePanelLayout call flow rectWidth > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0037 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0038
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0038
     * @tc.desc      ShapePanelLayout call flow rectWidth > labelX > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0038 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-15);
      const step2: number = subject.labelX(47.96);
      logInfo(`step2 labelX(47.96): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(250);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0039
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0039
     * @tc.desc      ShapePanelLayout call flow rectWidth > labelY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0039 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0040
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0040
     * @tc.desc      ShapePanelLayout call flow labelX > lineY > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0040 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelX(200);
      logInfo(`step1 labelX(200): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertClose(200.5, PRECISION);
      const step3: number = subject.rectWidth();
      logInfo(`step3 rectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0041
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0041
     * @tc.desc      ShapePanelLayout call flow labelY > rectWidth > roundRectWidth > labelX > labelY keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0041 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      const step4: number = subject.labelX(11);
      logInfo(`step4 labelX(11): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertEqual(170);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0042
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0042
     * @tc.desc      ShapePanelLayout call flow lineY > roundRectWidth > labelY > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0042 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertClose(120.5, PRECISION);
      const step4: number = subject.rectWidth();
      logInfo(`step4 rectWidth(): step4=${step4}`);
      expect(step4).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0043
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0043
     * @tc.desc      ShapePanelLayout call flow labelX > roundRectWidth > labelX > roundRectWidth > rectWidth keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0043 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(89.27);
      logInfo(`step1 labelX(89.27): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.labelX(105);
      logInfo(`step3 labelX(105): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-40);
      const step5: number = subject.rectWidth();
      logInfo(`step5 rectWidth(): step5=${step5}`);
      expect(step5).assertEqual(-40);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0044
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0044
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > rectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0044 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0045
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0045
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > labelX > labelX > labelX keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0045 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-15);
      const step2: number = subject.labelX(156);
      logInfo(`step2 labelX(156): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.labelX(135);
      logInfo(`step3 labelX(135): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.labelX(45);
      logInfo(`step4 labelX(45): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0046
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0046
     * @tc.desc      ShapePanelLayout call flow labelX > rectWidth > labelY > roundRectWidth > labelX keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0046 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(20);
      logInfo(`step1 labelX(20): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-40);
      const step5: number = subject.labelX(95);
      logInfo(`step5 labelX(95): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0047
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0047
     * @tc.desc      ShapePanelLayout call flow rectWidth > rectWidth > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0047 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0048
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0048
     * @tc.desc      ShapePanelLayout call flow labelY > lineY > roundRectWidth > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0048 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(250);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      const step4: number = subject.lineY();
      logInfo(`step4 lineY(): step4=${step4}`);
      expect(step4).assertEqual(250);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0049
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0049
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > labelY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0049 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(200);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0050
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0050
     * @tc.desc      ShapePanelLayout call flow labelY > labelY > rectWidth > roundRectWidth > roundRectWidth keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0050 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertClose(120.5, PRECISION);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertClose(120.5, PRECISION);
      const step3: number = subject.rectWidth();
      logInfo(`step3 rectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertClose(-39.75, PRECISION);
      const step5: number = subject.roundRectWidth();
      logInfo(`step5 roundRectWidth(): step5=${step5}`);
      expect(step5).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0051
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0051
     * @tc.desc      ShapePanelLayout call flow lineY > rectWidth > labelX > roundRectWidth > roundRectWidth keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0051 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(250);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      const step3: number = subject.labelX(31.48);
      logInfo(`step3 labelX(31.48): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-15);
      const step5: number = subject.roundRectWidth();
      logInfo(`step5 roundRectWidth(): step5=${step5}`);
      expect(step5).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0052
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0052
     * @tc.desc      ShapePanelLayout call flow labelX > rectWidth > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0052 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(-9);
      logInfo(`step1 labelX(-9): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0053
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0053
     * @tc.desc      ShapePanelLayout call flow labelY > labelY > labelX keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0053 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertClose(120.5, PRECISION);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertClose(120.5, PRECISION);
      const step3: number = subject.labelX(135);
      logInfo(`step3 labelX(135): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0054
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0054
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > labelY > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0054 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-15);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(170);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(250);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0055
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0055
     * @tc.desc      ShapePanelLayout call flow lineY > lineY > labelX > labelY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0055 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(200);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(200);
      const step3: number = subject.labelX(4);
      logInfo(`step3 labelX(4): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(120);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0056
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0056
     * @tc.desc      ShapePanelLayout call flow rectWidth > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0056 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertClose(-39.75, PRECISION);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertClose(200.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0057
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0057
     * @tc.desc      ShapePanelLayout call flow labelX > rectWidth > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0057 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelX(195);
      logInfo(`step1 labelX(195): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-40);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0058
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0058
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > rectWidth > labelX > rectWidth > rectWidth keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0058 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.labelX(106);
      logInfo(`step3 labelX(106): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.rectWidth();
      logInfo(`step4 rectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-40);
      const step5: number = subject.rectWidth();
      logInfo(`step5 rectWidth(): step5=${step5}`);
      expect(step5).assertEqual(-40);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0059
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0059
     * @tc.desc      ShapePanelLayout call flow labelX > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0059 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelX(-9);
      logInfo(`step1 labelX(-9): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0060
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0060
     * @tc.desc      ShapePanelLayout call flow labelX > roundRectWidth > roundRectWidth > labelX > lineY keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0060 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelX(147);
      logInfo(`step1 labelX(147): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      const step4: number = subject.labelX(195);
      logInfo(`step4 labelX(195): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.lineY();
      logInfo(`step5 lineY(): step5=${step5}`);
      expect(step5).assertEqual(250);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0061
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0061
     * @tc.desc      ShapePanelLayout call flow labelY > labelX > roundRectWidth > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0061 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(120);
      const step2: number = subject.labelX(92.51);
      logInfo(`step2 labelX(92.51): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-40);
      const step4: number = subject.lineY();
      logInfo(`step4 lineY(): step4=${step4}`);
      expect(step4).assertEqual(200);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0062
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0062
     * @tc.desc      ShapePanelLayout call flow labelY > lineY > labelY > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0062 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(170);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(250);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(170);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0062 end`);
    });
  });
}
