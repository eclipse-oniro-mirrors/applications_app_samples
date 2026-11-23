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

/** Logic checks for ShapePanelLayout flow (12 cases). */
export default function shapePanelLayoutFlow2Test(): void {
  describe('ShapePanelLayoutFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0063
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0063
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > labelX > labelX > labelX > labelX keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0063 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-40);
      const step2: number = subject.labelX(50);
      logInfo(`step2 labelX(50): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.labelX(199);
      logInfo(`step3 labelX(199): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.labelX(85);
      logInfo(`step4 labelX(85): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.labelX(-1);
      logInfo(`step5 labelX(-1): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0064
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0064
     * @tc.desc      ShapePanelLayout call flow labelY > roundRectWidth keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0064 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertClose(120.5, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0065
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0065
     * @tc.desc      ShapePanelLayout call flow roundRectWidth > labelX > roundRectWidth > roundRectWidth keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0065 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.roundRectWidth();
      logInfo(`step1 roundRectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-15);
      const step2: number = subject.labelX(115);
      logInfo(`step2 labelX(115): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      const step4: number = subject.roundRectWidth();
      logInfo(`step4 roundRectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0066
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0066
     * @tc.desc      ShapePanelLayout call flow lineY > labelY > labelX > lineY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0066 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertEqual(200);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      const step3: number = subject.labelX(11);
      logInfo(`step3 labelX(11): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.lineY();
      logInfo(`step4 lineY(): step4=${step4}`);
      expect(step4).assertEqual(200);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0067
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0067
     * @tc.desc      ShapePanelLayout call flow lineY > roundRectWidth > lineY > labelY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0067 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertClose(200.5, PRECISION);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertClose(120.5, PRECISION);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0068
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0068
     * @tc.desc      ShapePanelLayout call flow rectWidth > roundRectWidth > lineY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0068 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.rectWidth();
      logInfo(`step1 rectWidth(): step1=${step1}`);
      expect(step1).assertEqual(-15);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-15);
      const step3: number = subject.lineY();
      logInfo(`step3 lineY(): step3=${step3}`);
      expect(step3).assertEqual(250);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(170);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0069
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0069
     * @tc.desc      ShapePanelLayout call flow labelY > rectWidth > rectWidth > labelY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0069 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(120);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertEqual(-40);
      const step3: number = subject.rectWidth();
      logInfo(`step3 rectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-40);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(120);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0070
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0070
     * @tc.desc      ShapePanelLayout call flow lineY > rectWidth > rectWidth > rectWidth > roundRectWidth keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0070 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.lineY();
      logInfo(`step1 lineY(): step1=${step1}`);
      expect(step1).assertClose(200.5, PRECISION);
      const step2: number = subject.rectWidth();
      logInfo(`step2 rectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.rectWidth();
      logInfo(`step3 rectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      const step4: number = subject.rectWidth();
      logInfo(`step4 rectWidth(): step4=${step4}`);
      expect(step4).assertClose(-39.75, PRECISION);
      const step5: number = subject.roundRectWidth();
      logInfo(`step5 roundRectWidth(): step5=${step5}`);
      expect(step5).assertClose(-39.75, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0071
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0071
     * @tc.desc      ShapePanelLayout call flow labelX > lineY > labelY > rectWidth > roundRectWidth keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0071 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelX(175);
      logInfo(`step1 labelX(175): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(250);
      const step3: number = subject.labelY();
      logInfo(`step3 labelY(): step3=${step3}`);
      expect(step3).assertEqual(170);
      const step4: number = subject.rectWidth();
      logInfo(`step4 rectWidth(): step4=${step4}`);
      expect(step4).assertEqual(-15);
      const step5: number = subject.roundRectWidth();
      logInfo(`step5 roundRectWidth(): step5=${step5}`);
      expect(step5).assertEqual(-15);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0072
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0072
     * @tc.desc      ShapePanelLayout call flow labelY > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0072 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const step1: number = subject.labelY();
      logInfo(`step1 labelY(): step1=${step1}`);
      expect(step1).assertEqual(120);
      const step2: number = subject.labelY();
      logInfo(`step2 labelY(): step2=${step2}`);
      expect(step2).assertEqual(120);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0073
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0073
     * @tc.desc      ShapePanelLayout call flow labelX > roundRectWidth > roundRectWidth > labelX > labelY keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0073 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      const step1: number = subject.labelX(37.75);
      logInfo(`step1 labelX(37.75): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.roundRectWidth();
      logInfo(`step2 roundRectWidth(): step2=${step2}`);
      expect(step2).assertClose(-39.75, PRECISION);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertClose(-39.75, PRECISION);
      const step4: number = subject.labelX(37.75);
      logInfo(`step4 labelX(37.75): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.labelY();
      logInfo(`step5 labelY(): step5=${step5}`);
      expect(step5).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_FLOW_0074
     * @tc.name      TsDrawingSample_ShapePanelLayoutFlow_0074
     * @tc.desc      ShapePanelLayout call flow labelX > lineY > roundRectWidth > labelY keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0074 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      const step1: number = subject.labelX(60.02);
      logInfo(`step1 labelX(60.02): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.lineY();
      logInfo(`step2 lineY(): step2=${step2}`);
      expect(step2).assertEqual(250);
      const step3: number = subject.roundRectWidth();
      logInfo(`step3 roundRectWidth(): step3=${step3}`);
      expect(step3).assertEqual(-15);
      const step4: number = subject.labelY();
      logInfo(`step4 labelY(): step4=${step4}`);
      expect(step4).assertEqual(170);
      logInfo(`${BUNDLE}ShapePanelLayoutFlow_0074 end`);
    });
  });
}
