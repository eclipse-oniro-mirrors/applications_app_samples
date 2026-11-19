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

/** Logic checks for SubWindowDragModel.updateDisplay (40 cases). */
export default function subWindowDragModelUpdateDisplay4Test(): void {
  describe('SubWindowDragModelUpdateDisplay4Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0204
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0204
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0204',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0204 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1248);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0205
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0205
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0205',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0205 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1344);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0206
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0206
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0206',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0206 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1440);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0207
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0207
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0207',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0207 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1536);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0208
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0208
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0208',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0208 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1632);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0209
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0209
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0209',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0209 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1728);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0210
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0210
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=1920, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0210',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0210 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(1920, 1824);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`updateDisplay(windowWidth=1920, windowHei...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0211
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0211
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0211',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0211 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 0);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0212
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0212
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0212',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0212 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0213
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0213
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0213',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0213 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 100);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0214
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0214
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0214',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0214 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 360);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0215
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0215
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0215',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0215 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 720);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0216
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0216
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0216',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0216 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1080);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0217
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0217
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0217',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0217 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1920);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0218
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0218
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0218',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0218 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, -1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0219
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0219
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0219',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0219 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 2);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0220
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0220
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0220',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0220 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 3);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0221
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0221
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0221',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0221 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 10);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0222
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0222
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0222',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0222 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 96);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0223
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0223
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0223',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0223 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 192);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0224
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0224
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0224',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0224 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 288);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0225
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0225
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0225',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0225 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 384);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0226
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0226
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0226',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0226 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 480);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0227
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0227
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0227',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0227 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 576);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0228
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0228
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0228',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0228 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 672);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0229
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0229
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0229',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0229 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 768);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0230
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0230
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0230',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0230 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 864);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0231
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0231
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0231',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0231 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 960);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0232
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0232
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0232',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0232 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1056);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0233
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0233
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0233',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0233 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1152);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0234
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0234
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0234',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0234 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1248);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0235
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0235
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0235',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0235 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1344);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0236
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0236
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0236',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0236 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1440);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0237
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0237
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0237',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0237 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1536);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0238
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0238
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0238',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0238 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1632);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0239
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0239
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0239',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0239 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1728);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0240
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0240
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=-1, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0240',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0240 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(-1, 1824);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`updateDisplay(windowWidth=-1, windowHeigh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0241
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0241
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=2, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0241',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0241 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(2, 0);
      logInfo(`updateDisplay(windowWidth=2, windowHeight=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0242
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0242
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=2, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0242',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0242 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(2, 1);
      logInfo(`updateDisplay(windowWidth=2, windowHeight=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0243
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0243
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=2, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0243',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0243 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(2, 100);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`updateDisplay(windowWidth=2, windowHeight...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0243 end`);
    });
  });
}
