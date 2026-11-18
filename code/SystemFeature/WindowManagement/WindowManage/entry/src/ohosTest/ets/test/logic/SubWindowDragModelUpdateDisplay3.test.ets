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

/** Logic checks for SubWindowDragModel.updateDisplay (67 cases). */
export default function subWindowDragModelUpdateDisplay3Test(): void {
  describe('SubWindowDragModelUpdateDisplay3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0137
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0137
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0137',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0137 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 576);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0138
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0138
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0138',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0138 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 672);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0139
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0139
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0139',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0139 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 768);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0140
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0140
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0140',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0140 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 864);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0141
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0141
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0141',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0141 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 960);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0142
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0142
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0142',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0142 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 1056);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0143
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0143
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0143',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0143 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 1152);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0144
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0144
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0144',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0144 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 1248);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0145
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0145
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0145',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0145 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 1344);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0146
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0146
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0146',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0146 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 1440);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0147
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0147
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0147',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0147 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 1536);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0148
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0148
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0148',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0148 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 1632);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0149
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0149
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0149',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0149 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 1728);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0150
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0150
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0150',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0150 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 1824);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0151
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0151
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0151',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0151 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 0);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0152
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0152
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0152',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0152 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0153
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0153
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0153',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0153 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 100);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0154
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0154
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0154',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0154 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 360);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0155
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0155
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0155',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0155 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 720);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0156
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0156
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0156',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0156 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0157
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0157
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0157',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0157 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1920);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0158
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0158
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0158',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0158 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, -1);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0159
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0159
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0159',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0159 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 2);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0160
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0160
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0160',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0160 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 3);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0161
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0161
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0161',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0161 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 10);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0162
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0162
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0162',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0162 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 96);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0163
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0163
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0163',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0163 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 192);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0164
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0164
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0164',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0164 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 288);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0165
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0165
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0165',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0165 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 384);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0166
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0166
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0166',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0166 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 480);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0167
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0167
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0167',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0167 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 576);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0168
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0168
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0168',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0168 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 672);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0169
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0169
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0169',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0169 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 768);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0170
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0170
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0170',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0170 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 864);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0171
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0171
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0171',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0171 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 960);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0172
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0172
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0172',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0172 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1056);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0173
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0173
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0173',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0173 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1152);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0174
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0174
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0174',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0174 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1248);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0175
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0175
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0175',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0175 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1344);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0176
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0176
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0176',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0176 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1440);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0177
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0177
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0177',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0177 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1536);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0178
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0178
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0178',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0178 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1632);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0179
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0179
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0179',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0179 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1728);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0180
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0180
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1080, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0180',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0180 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1080, 1824);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`updateDisplay(windowWidth=1080, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0181
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0181
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0181',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0181 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 0);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0182
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0182
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0182',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0182 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0183
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0183
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0183',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0183 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 100);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0184
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0184
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0184',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0184 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 360);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0185
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0185
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0185',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0185 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 720);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0186
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0186
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0186',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0186 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1080);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0187
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0187
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0187',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0187 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0188
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0188
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0188',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0188 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, -1);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0189
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0189
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0189',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0189 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 2);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0190
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0190
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0190',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0190 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 3);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0191
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0191
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0191',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0191 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 10);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0192
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0192
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0192',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0192 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 96);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0192 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0193
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0193
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0193',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0193 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 192);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0194
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0194
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0194',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0194 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 288);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0195
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0195
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0195',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0195 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 384);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0196
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0196
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0196',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0196 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 480);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0197
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0197
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0197',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0197 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 576);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0198
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0198
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0198',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0198 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 672);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0199
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0199
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0199',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0199 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 768);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0200
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0200
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0200',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0200 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 864);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0201
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0201
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0201',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0201 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 960);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0202
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0202
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0202',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0202 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1056);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0203
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0203
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0203',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0203 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1152);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0203 end`);
    });
  });
}
