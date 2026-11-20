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

/** Logic checks for new ShapePanelLayout (56 cases). */
export default function shapePanelLayoutCtorTest(): void {
  describe('ShapePanelLayoutCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0001
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0001
     * @tc.desc      new ShapePanelLayout(0, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0001 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      logInfo(`new ShapePanelLayout(0, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(0);
      logInfo(`new ShapePanelLayout(0, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(0, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0002
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0002
     * @tc.desc      new ShapePanelLayout(1, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0002 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, true);
      logInfo(`new ShapePanelLayout(1, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1);
      logInfo(`new ShapePanelLayout(1, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(0.5, PRECISION);
      logInfo(`new ShapePanelLayout(1, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0003
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0003
     * @tc.desc      new ShapePanelLayout(100, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0003 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, true);
      logInfo(`new ShapePanelLayout(100, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(100);
      logInfo(`new ShapePanelLayout(100, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(50);
      logInfo(`new ShapePanelLayout(100, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0004
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0004
     * @tc.desc      new ShapePanelLayout(360, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0004 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(360, true);
      logInfo(`new ShapePanelLayout(360, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(360);
      logInfo(`new ShapePanelLayout(360, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(180);
      logInfo(`new ShapePanelLayout(360, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0005
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0005
     * @tc.desc      new ShapePanelLayout(720, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0005 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(720, true);
      logInfo(`new ShapePanelLayout(720, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(720);
      logInfo(`new ShapePanelLayout(720, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(360);
      logInfo(`new ShapePanelLayout(720, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0006
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0006
     * @tc.desc      new ShapePanelLayout(1080, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0006 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1080, true);
      logInfo(`new ShapePanelLayout(1080, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1080);
      logInfo(`new ShapePanelLayout(1080, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(540);
      logInfo(`new ShapePanelLayout(1080, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0007
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0007
     * @tc.desc      new ShapePanelLayout(1920, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0007 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1920, true);
      logInfo(`new ShapePanelLayout(1920, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1920);
      logInfo(`new ShapePanelLayout(1920, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(960);
      logInfo(`new ShapePanelLayout(1920, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0008
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0008
     * @tc.desc      new ShapePanelLayout(-1, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0008 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(-1, true);
      logInfo(`new ShapePanelLayout(-1, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(-1);
      logInfo(`new ShapePanelLayout(-1, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(-0.5, PRECISION);
      logInfo(`new ShapePanelLayout(-1, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0009
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0009
     * @tc.desc      new ShapePanelLayout(2, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0009 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(2, true);
      logInfo(`new ShapePanelLayout(2, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(2);
      logInfo(`new ShapePanelLayout(2, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(1);
      logInfo(`new ShapePanelLayout(2, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0010
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0010
     * @tc.desc      new ShapePanelLayout(3, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0010 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(3, true);
      logInfo(`new ShapePanelLayout(3, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(3);
      logInfo(`new ShapePanelLayout(3, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertClose(1.5, PRECISION);
      logInfo(`new ShapePanelLayout(3, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0011
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0011
     * @tc.desc      new ShapePanelLayout(10, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0011 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(10, true);
      logInfo(`new ShapePanelLayout(10, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(10);
      logInfo(`new ShapePanelLayout(10, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(5);
      logInfo(`new ShapePanelLayout(10, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0012
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0012
     * @tc.desc      new ShapePanelLayout(96, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0012 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(96, true);
      logInfo(`new ShapePanelLayout(96, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(96);
      logInfo(`new ShapePanelLayout(96, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(48);
      logInfo(`new ShapePanelLayout(96, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0013
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0013
     * @tc.desc      new ShapePanelLayout(192, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0013 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(192, true);
      logInfo(`new ShapePanelLayout(192, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(192);
      logInfo(`new ShapePanelLayout(192, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(96);
      logInfo(`new ShapePanelLayout(192, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0014
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0014
     * @tc.desc      new ShapePanelLayout(288, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0014 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(288, true);
      logInfo(`new ShapePanelLayout(288, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(288);
      logInfo(`new ShapePanelLayout(288, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(144);
      logInfo(`new ShapePanelLayout(288, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0015
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0015
     * @tc.desc      new ShapePanelLayout(384, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0015 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(384, true);
      logInfo(`new ShapePanelLayout(384, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(384);
      logInfo(`new ShapePanelLayout(384, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(192);
      logInfo(`new ShapePanelLayout(384, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0016
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0016
     * @tc.desc      new ShapePanelLayout(480, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0016 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(480, true);
      logInfo(`new ShapePanelLayout(480, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(480);
      logInfo(`new ShapePanelLayout(480, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(240);
      logInfo(`new ShapePanelLayout(480, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0017
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0017
     * @tc.desc      new ShapePanelLayout(576, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0017 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(576, true);
      logInfo(`new ShapePanelLayout(576, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(576);
      logInfo(`new ShapePanelLayout(576, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(288);
      logInfo(`new ShapePanelLayout(576, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0018
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0018
     * @tc.desc      new ShapePanelLayout(672, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0018 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(672, true);
      logInfo(`new ShapePanelLayout(672, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(672);
      logInfo(`new ShapePanelLayout(672, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(336);
      logInfo(`new ShapePanelLayout(672, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0019
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0019
     * @tc.desc      new ShapePanelLayout(768, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0019 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(768, true);
      logInfo(`new ShapePanelLayout(768, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(768);
      logInfo(`new ShapePanelLayout(768, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(384);
      logInfo(`new ShapePanelLayout(768, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0020
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0020
     * @tc.desc      new ShapePanelLayout(864, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0020 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(864, true);
      logInfo(`new ShapePanelLayout(864, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(864);
      logInfo(`new ShapePanelLayout(864, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(432);
      logInfo(`new ShapePanelLayout(864, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0021
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0021
     * @tc.desc      new ShapePanelLayout(960, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0021 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(960, true);
      logInfo(`new ShapePanelLayout(960, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(960);
      logInfo(`new ShapePanelLayout(960, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(480);
      logInfo(`new ShapePanelLayout(960, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0022
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0022
     * @tc.desc      new ShapePanelLayout(1056, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0022 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1056, true);
      logInfo(`new ShapePanelLayout(1056, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1056);
      logInfo(`new ShapePanelLayout(1056, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(528);
      logInfo(`new ShapePanelLayout(1056, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0023
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0023
     * @tc.desc      new ShapePanelLayout(1152, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0023 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1152, true);
      logInfo(`new ShapePanelLayout(1152, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1152);
      logInfo(`new ShapePanelLayout(1152, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(576);
      logInfo(`new ShapePanelLayout(1152, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0024
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0024
     * @tc.desc      new ShapePanelLayout(1248, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0024 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1248, true);
      logInfo(`new ShapePanelLayout(1248, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1248);
      logInfo(`new ShapePanelLayout(1248, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(624);
      logInfo(`new ShapePanelLayout(1248, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0025
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0025
     * @tc.desc      new ShapePanelLayout(1344, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0025 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1344, true);
      logInfo(`new ShapePanelLayout(1344, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1344);
      logInfo(`new ShapePanelLayout(1344, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(672);
      logInfo(`new ShapePanelLayout(1344, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0026
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0026
     * @tc.desc      new ShapePanelLayout(1440, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0026 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1440, true);
      logInfo(`new ShapePanelLayout(1440, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1440);
      logInfo(`new ShapePanelLayout(1440, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(720);
      logInfo(`new ShapePanelLayout(1440, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0027
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0027
     * @tc.desc      new ShapePanelLayout(1536, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0027 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1536, true);
      logInfo(`new ShapePanelLayout(1536, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1536);
      logInfo(`new ShapePanelLayout(1536, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(768);
      logInfo(`new ShapePanelLayout(1536, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0028
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0028
     * @tc.desc      new ShapePanelLayout(1632, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0028 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1632, true);
      logInfo(`new ShapePanelLayout(1632, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1632);
      logInfo(`new ShapePanelLayout(1632, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(816);
      logInfo(`new ShapePanelLayout(1632, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0029
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0029
     * @tc.desc      new ShapePanelLayout(1728, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0029 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1728, true);
      logInfo(`new ShapePanelLayout(1728, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1728);
      logInfo(`new ShapePanelLayout(1728, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(864);
      logInfo(`new ShapePanelLayout(1728, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0030
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0030
     * @tc.desc      new ShapePanelLayout(1824, true) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0030 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1824, true);
      logInfo(`new ShapePanelLayout(1824, true): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1824);
      logInfo(`new ShapePanelLayout(1824, true): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(912);
      logInfo(`new ShapePanelLayout(1824, true): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0031
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0031
     * @tc.desc      new ShapePanelLayout(96, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0031 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(96, false);
      logInfo(`new ShapePanelLayout(96, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(96);
      logInfo(`new ShapePanelLayout(96, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(96, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0032
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0032
     * @tc.desc      new ShapePanelLayout(3, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0032 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(3, false);
      logInfo(`new ShapePanelLayout(3, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(3);
      logInfo(`new ShapePanelLayout(3, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(3, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0033
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0033
     * @tc.desc      new ShapePanelLayout(1728, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0033 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1728, false);
      logInfo(`new ShapePanelLayout(1728, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1728);
      logInfo(`new ShapePanelLayout(1728, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1728, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0034
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0034
     * @tc.desc      new ShapePanelLayout(100, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0034 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(100, false);
      logInfo(`new ShapePanelLayout(100, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(100);
      logInfo(`new ShapePanelLayout(100, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(100, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0035
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0035
     * @tc.desc      new ShapePanelLayout(576, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0035 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(576, false);
      logInfo(`new ShapePanelLayout(576, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(576);
      logInfo(`new ShapePanelLayout(576, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(576, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0036
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0036
     * @tc.desc      new ShapePanelLayout(384, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0036 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(384, false);
      logInfo(`new ShapePanelLayout(384, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(384);
      logInfo(`new ShapePanelLayout(384, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(384, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0037
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0037
     * @tc.desc      new ShapePanelLayout(480, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0037 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(480, false);
      logInfo(`new ShapePanelLayout(480, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(480);
      logInfo(`new ShapePanelLayout(480, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(480, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0038
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0038
     * @tc.desc      new ShapePanelLayout(1632, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0038 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1632, false);
      logInfo(`new ShapePanelLayout(1632, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1632);
      logInfo(`new ShapePanelLayout(1632, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1632, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0039
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0039
     * @tc.desc      new ShapePanelLayout(1920, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0039 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1920, false);
      logInfo(`new ShapePanelLayout(1920, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1920);
      logInfo(`new ShapePanelLayout(1920, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1920, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0040
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0040
     * @tc.desc      new ShapePanelLayout(1056, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0040 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1056, false);
      logInfo(`new ShapePanelLayout(1056, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1056);
      logInfo(`new ShapePanelLayout(1056, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1056, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0041
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0041
     * @tc.desc      new ShapePanelLayout(2, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0041 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(2, false);
      logInfo(`new ShapePanelLayout(2, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(2);
      logInfo(`new ShapePanelLayout(2, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(2, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0042
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0042
     * @tc.desc      new ShapePanelLayout(288, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0042 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(288, false);
      logInfo(`new ShapePanelLayout(288, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(288);
      logInfo(`new ShapePanelLayout(288, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(288, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0043
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0043
     * @tc.desc      new ShapePanelLayout(10, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0043 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(10, false);
      logInfo(`new ShapePanelLayout(10, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(10);
      logInfo(`new ShapePanelLayout(10, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(10, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0044
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0044
     * @tc.desc      new ShapePanelLayout(360, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0044 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(360, false);
      logInfo(`new ShapePanelLayout(360, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(360);
      logInfo(`new ShapePanelLayout(360, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(360, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0045
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0045
     * @tc.desc      new ShapePanelLayout(1152, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0045 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1152, false);
      logInfo(`new ShapePanelLayout(1152, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1152);
      logInfo(`new ShapePanelLayout(1152, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1152, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0046
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0046
     * @tc.desc      new ShapePanelLayout(1824, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0046 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1824, false);
      logInfo(`new ShapePanelLayout(1824, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1824);
      logInfo(`new ShapePanelLayout(1824, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1824, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0047
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0047
     * @tc.desc      new ShapePanelLayout(1344, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0047 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1344, false);
      logInfo(`new ShapePanelLayout(1344, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1344);
      logInfo(`new ShapePanelLayout(1344, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1344, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0048
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0048
     * @tc.desc      new ShapePanelLayout(1080, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0048 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1080, false);
      logInfo(`new ShapePanelLayout(1080, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1080);
      logInfo(`new ShapePanelLayout(1080, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1080, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0049
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0049
     * @tc.desc      new ShapePanelLayout(720, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0049 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(720, false);
      logInfo(`new ShapePanelLayout(720, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(720);
      logInfo(`new ShapePanelLayout(720, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(720, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0050
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0050
     * @tc.desc      new ShapePanelLayout(192, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0050 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(192, false);
      logInfo(`new ShapePanelLayout(192, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(192);
      logInfo(`new ShapePanelLayout(192, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(192, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0051
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0051
     * @tc.desc      new ShapePanelLayout(1440, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0051 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1440, false);
      logInfo(`new ShapePanelLayout(1440, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1440);
      logInfo(`new ShapePanelLayout(1440, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1440, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0052
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0052
     * @tc.desc      new ShapePanelLayout(1248, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0052 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1248, false);
      logInfo(`new ShapePanelLayout(1248, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1248);
      logInfo(`new ShapePanelLayout(1248, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1248, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0053
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0053
     * @tc.desc      new ShapePanelLayout(1, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0053 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(1, false);
      logInfo(`new ShapePanelLayout(1, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(1);
      logInfo(`new ShapePanelLayout(1, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(1, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0054
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0054
     * @tc.desc      new ShapePanelLayout(768, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0054 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(768, false);
      logInfo(`new ShapePanelLayout(768, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(768);
      logInfo(`new ShapePanelLayout(768, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(768, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0055
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0055
     * @tc.desc      new ShapePanelLayout(864, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0055 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(864, false);
      logInfo(`new ShapePanelLayout(864, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(864);
      logInfo(`new ShapePanelLayout(864, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(864, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_CTOR_0056
     * @tc.name      TsDrawingSample_ShapePanelLayoutCtor_0056
     * @tc.desc      new ShapePanelLayout(0, false) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ShapePanelLayoutCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0056 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, false);
      logInfo(`new ShapePanelLayout(0, false): subject.screenWidth=${subject.screenWidth}`);
      expect(subject.screenWidth).assertEqual(0);
      logInfo(`new ShapePanelLayout(0, false): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new ShapePanelLayout(0, false): subject.columns=${subject.columns}`);
      expect(subject.columns).assertEqual(4);
      logInfo(`${BUNDLE}ShapePanelLayoutCtor_0056 end`);
    });
  });
}
