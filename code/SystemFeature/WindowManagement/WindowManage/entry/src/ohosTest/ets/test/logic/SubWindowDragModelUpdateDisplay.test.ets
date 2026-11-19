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
import { SubWindowDragModel } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SubWindowDragModel.updateDisplay (69 cases). */
export default function subWindowDragModelUpdateDisplayTest(): void {
  describe('SubWindowDragModelUpdateDisplayTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0001
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0001
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0001',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0001 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0002
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0002
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0002',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0002 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 1);
      logInfo(`updateDisplay(windowWidth=0, windowHeight=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0003
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0003
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0003',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0003 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 100);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0004
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0004
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0004',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0004 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 360);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0005
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0005
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0005',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0005 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 720);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0006
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0006
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0006',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0006 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 1080);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0007
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0007
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0007',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0007 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 1920);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0008
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0008
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0008',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0008 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, -1);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0009
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0009
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0009',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0009 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 2);
      logInfo(`updateDisplay(windowWidth=0, windowHeight=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0010
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0010
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0010',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0010 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 3);
      logInfo(`updateDisplay(windowWidth=0, windowHeight=3): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0011
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0011
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0011',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0011 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 10);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0012
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0012
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0012',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0012 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 96);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0013
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0013
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0013',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0013 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 192);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0014
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0014
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0014',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0014 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 288);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0015
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0015
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0015',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0015 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 384);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0016
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0016
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0016',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0016 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 480);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0017
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0017
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0017',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0017 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 576);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0018
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0018
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0018',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0018 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 672);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0019
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0019
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0019',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0019 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 768);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0020
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0020
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0020',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0020 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 864);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0021
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0021
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0021',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0021 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 960);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0022
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0022
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0022',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0022 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 1056);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0023
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0023
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0023',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0023 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 1152);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0024
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0024
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0024',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0024 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 1248);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0025
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0025
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0025',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0025 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 1344);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0026
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0026
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0026',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0026 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 1440);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0027
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0027
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0027',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0027 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 1536);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0028
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0028
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0028',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0028 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(0, 1632);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0029
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0029
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0029',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0029 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(0, 1728);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0030
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0030
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=0, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0030',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0030 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(0, 1824);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=0, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0031
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0031
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0031',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0031 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 0);
      logInfo(`updateDisplay(windowWidth=1, windowHeight=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0032
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0032
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0032',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0032 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0033
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0033
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0033',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0033 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 100);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0034
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0034
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0034',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0034 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 360);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0035
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0035
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0035',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0035 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 720);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0036
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0036
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0036',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0036 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 1080);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0037
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0037
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0037',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0037 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 1920);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0038
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0038
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0038',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0038 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, -1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0039
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0039
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0039',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0039 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 2);
      logInfo(`updateDisplay(windowWidth=1, windowHeight=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0040
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0040
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0040',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0040 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 3);
      logInfo(`updateDisplay(windowWidth=1, windowHeight=3): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0041
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0041
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0041',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0041 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 10);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0042
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0042
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0042',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0042 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 96);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0043
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0043
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0043',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0043 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 192);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0044
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0044
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0044',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0044 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 288);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0045
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0045
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0045',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0045 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 384);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0046
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0046
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0046',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0046 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 480);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0047
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0047
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0047',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0047 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 576);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0048
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0048
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0048',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0048 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 672);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0049
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0049
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0049',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0049 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 768);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0050
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0050
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0050',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0050 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 864);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0051
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0051
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0051',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0051 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 960);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0052
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0052
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0052',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0052 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 1056);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0053
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0053
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0053',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0053 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 1152);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0054
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0054
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0054',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0054 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 1248);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0055
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0055
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0055',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0055 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 1344);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0056
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0056
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0056',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0056 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 1440);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0057
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0057
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0057',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0057 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 1536);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0058
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0058
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0058',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0058 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1, 1632);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0059
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0059
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0059',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0059 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1, 1728);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0060
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0060
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0060',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0060 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1, 1824);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0061
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0061
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0061',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0061 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 0);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0062
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0062
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0062',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0062 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 1);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0063
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0063
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0063',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0063 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0064
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0064
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0064',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0064 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 360);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0065
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0065
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0065',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0065 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 720);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0066
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0066
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0066',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0066 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 1080);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0067
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0067
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0067',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0067 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 1920);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0068
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0068
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0068',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0068 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, -1);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0069
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0069
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0069',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0069 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 2);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0069 end`);
    });
  });
}
