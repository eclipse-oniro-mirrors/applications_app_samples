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
export default function subWindowDragModelUpdateDisplay2Test(): void {
  describe('SubWindowDragModelUpdateDisplay2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0070
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0070
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0070',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0070 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 3);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0071
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0071
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0071',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0071 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 10);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0072
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0072
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0072',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0072 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 96);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0073
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0073
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0073',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0073 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 192);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0074
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0074
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0074',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0074 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 288);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0075
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0075
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0075',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0075 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 384);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0076
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0076
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0076',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0076 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 480);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0077
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0077
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0077',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0077 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 576);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0078
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0078
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0078',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0078 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 672);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0079
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0079
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0079',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0079 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 768);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0080
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0080
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0080',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0080 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 864);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0081
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0081
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0081',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0081 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 960);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0082
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0082
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0082',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0082 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 1056);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0083
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0083
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0083',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0083 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 1152);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0084
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0084
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0084',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0084 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 1248);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0085
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0085
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0085',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0085 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 1344);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0086
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0086
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0086',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0086 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 1440);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0087
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0087
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0087',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0087 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 1536);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0088
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0088
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0088',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0088 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(100, 1632);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0089
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0089
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0089',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0089 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(100, 1728);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0090
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0090
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=100, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0090',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0090 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(100, 1824);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=100, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0091
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0091
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0091',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0091 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 0);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0092
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0092
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0092',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0092 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 1);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0093
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0093
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0093',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0093 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 100);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0094
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0094
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0094',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0094 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0095
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0095
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0095',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0095 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 720);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0096
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0096
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0096',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0096 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 1080);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0097
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0097
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0097',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0097 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 1920);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0098
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0098
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0098',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0098 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, -1);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0099
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0099
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0099',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0099 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 2);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0100
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0100
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0100',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0100 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 3);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0101
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0101
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0101',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0101 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 10);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0102
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0102
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0102',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0102 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 96);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0103
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0103
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0103',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0103 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 192);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0104
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0104
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0104',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0104 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 288);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0105
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0105
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0105',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0105 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 384);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0106
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0106
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0106',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0106 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 480);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0107
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0107
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=576) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0107',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0107 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 576);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(288);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(576);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0108
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0108
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=672) yields 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0108',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0108 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 672);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(336);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(672);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0109
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0109
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=768) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0109',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0109 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 768);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(384);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(768);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0110
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0110
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=864) yields 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0110',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0110 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 864);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(432);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(864);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0111
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0111
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=960) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0111',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0111 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 960);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(480);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0112
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0112
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1056) yields 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0112',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0112 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 1056);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(528);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1056);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0113
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0113
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1152) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0113',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0113 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 1152);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(576);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1152);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0114
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0114
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1248) yields 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0114',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0114 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 1248);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(624);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1248);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0115
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0115
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1344) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0115',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0115 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 1344);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(672);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1344);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0116
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0116
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1440) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0116',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0116 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 1440);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1440);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0117
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0117
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1536) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0117',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0117 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 1536);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(768);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1536);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0118
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0118
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1632) yields 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0118',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0118 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(360, 1632);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(816);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1632);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0119
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0119
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1728) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0119',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0119 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(360, 1728);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(864);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1728);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0120
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0120
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=360, windowHeight=1824) yields 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0120',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0120 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(360, 1824);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(912);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=360, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1824);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0121
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0121
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0121',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0121 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 0);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(0);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0122
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0122
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1) yields 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0122',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0122 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 1);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0123
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0123
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0123',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0123 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 100);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(50);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0124
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0124
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=360) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0124',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0124 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 360);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(180);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0125
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0125
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=720) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0125',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0125 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(360);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0126
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0126
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1080) yields 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0126',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0126 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 1080);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(540);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0127
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0127
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=1920) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0127',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0127 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 1920);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(960);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0128
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0128
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=-1) yields -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0128',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0128 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, -1);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(-0.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0129
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0129
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0129',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0129 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 2);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(1);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0130
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0130
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=3) yields 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0130',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0130 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 3);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertClose(1.5, PRECISION);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0131
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0131
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0131',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0131 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 10);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(5);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0132
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0132
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=96) yields 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0132',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0132 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 96);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(48);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0133
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0133
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=192) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0133',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0133 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 192);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(96);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(192);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0134
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0134
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=288) yields 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0134',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0134 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: number = subject.updateDisplay(720, 288);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(144);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(288);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0135
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0135
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=384) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0135',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0135 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: number = subject.updateDisplay(720, 384);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(192);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(384);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_UPDATE_DISPLAY_0136
     * @tc.name      WindowManage_SubWindowDragModelUpdateDisplay_0136
     * @tc.desc      SubWindowDragModel.updateDisplay(windowWidth=720, windowHeight=480) yields 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelUpdateDisplay_0136',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0136 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: number = subject.updateDisplay(720, 480);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(240);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`updateDisplay(windowWidth=720, windowHeig...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowDragModelUpdateDisplay_0136 end`);
    });
  });
}
