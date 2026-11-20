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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SubWindowDragModel.touch (74 cases). */
export default function subWindowDragModelTouch2Test(): void {
  describe('SubWindowDragModelTouch2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0075
     * @tc.name      WindowManage_SubWindowDragModelTouch_0075
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=-1, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0075 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, -1, -1);
      logInfo(`touch(x=-1, y=-1, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=-1, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=-1, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0076
     * @tc.name      WindowManage_SubWindowDragModelTouch_0076
     * @tc.desc      SubWindowDragModel.touch(x=100, y=0, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0076 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 0, 0);
      logInfo(`touch(x=100, y=0, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=0, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0077
     * @tc.name      WindowManage_SubWindowDragModelTouch_0077
     * @tc.desc      SubWindowDragModel.touch(x=1, y=0, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0077 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 0, 3);
      logInfo(`touch(x=1, y=0, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=0, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0078
     * @tc.name      WindowManage_SubWindowDragModelTouch_0078
     * @tc.desc      SubWindowDragModel.touch(x=1, y=3, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0078 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 3, 1);
      logInfo(`touch(x=1, y=3, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=3, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=3, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0079
     * @tc.name      WindowManage_SubWindowDragModelTouch_0079
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=10, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0079 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-1, 10, 20);
      logInfo(`touch(x=-1, y=10, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=10, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=10, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0080
     * @tc.name      WindowManage_SubWindowDragModelTouch_0080
     * @tc.desc      SubWindowDragModel.touch(x=5, y=50, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0080 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(5, 50, 5);
      logInfo(`touch(x=5, y=50, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=50, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=50, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0081
     * @tc.name      WindowManage_SubWindowDragModelTouch_0081
     * @tc.desc      SubWindowDragModel.touch(x=0, y=50, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0081 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, 50, 20);
      logInfo(`touch(x=0, y=50, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=50, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0082
     * @tc.name      WindowManage_SubWindowDragModelTouch_0082
     * @tc.desc      SubWindowDragModel.touch(x=3, y=-1, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0082 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, -1, 25);
      logInfo(`touch(x=3, y=-1, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=-1, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=-1, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0083
     * @tc.name      WindowManage_SubWindowDragModelTouch_0083
     * @tc.desc      SubWindowDragModel.touch(x=10, y=10, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0083 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, 10, 10);
      logInfo(`touch(x=10, y=10, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=10, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=10, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0084
     * @tc.name      WindowManage_SubWindowDragModelTouch_0084
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=5, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0084 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 5, 25);
      logInfo(`touch(x=-1, y=5, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=5, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=5, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0085
     * @tc.name      WindowManage_SubWindowDragModelTouch_0085
     * @tc.desc      SubWindowDragModel.touch(x=2, y=15, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0085 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 15, -1);
      logInfo(`touch(x=2, y=15, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=15, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=15, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0086
     * @tc.name      WindowManage_SubWindowDragModelTouch_0086
     * @tc.desc      SubWindowDragModel.touch(x=100, y=5, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0086 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(100, 5, 10);
      logInfo(`touch(x=100, y=5, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=5, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=5, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0087
     * @tc.name      WindowManage_SubWindowDragModelTouch_0087
     * @tc.desc      SubWindowDragModel.touch(x=196, y=5, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0087 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(196, 5, -8);
      logInfo(`touch(x=196, y=5, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=5, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=5, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0088
     * @tc.name      WindowManage_SubWindowDragModelTouch_0088
     * @tc.desc      SubWindowDragModel.touch(x=1, y=1, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0088 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(1, 1, 3);
      logInfo(`touch(x=1, y=1, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=1, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=1, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0089
     * @tc.name      WindowManage_SubWindowDragModelTouch_0089
     * @tc.desc      SubWindowDragModel.touch(x=5, y=100, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0089 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, 100, -1);
      logInfo(`touch(x=5, y=100, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=100, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=100, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0090
     * @tc.name      WindowManage_SubWindowDragModelTouch_0090
     * @tc.desc      SubWindowDragModel.touch(x=15, y=2, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0090 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, 2, 25);
      logInfo(`touch(x=15, y=2, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=2, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=2, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0091
     * @tc.name      WindowManage_SubWindowDragModelTouch_0091
     * @tc.desc      SubWindowDragModel.touch(x=10, y=100, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0091 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(10, 100, 20);
      logInfo(`touch(x=10, y=100, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=100, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=100, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0092
     * @tc.name      WindowManage_SubWindowDragModelTouch_0092
     * @tc.desc      SubWindowDragModel.touch(x=50, y=100, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0092 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(50, 100, 20);
      logInfo(`touch(x=50, y=100, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=100, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=100, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0093
     * @tc.name      WindowManage_SubWindowDragModelTouch_0093
     * @tc.desc      SubWindowDragModel.touch(x=196, y=10, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0093 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 10, 100);
      logInfo(`touch(x=196, y=10, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=10, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=10, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0094
     * @tc.name      WindowManage_SubWindowDragModelTouch_0094
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=3, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0094 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 3, -8);
      logInfo(`touch(x=-1, y=3, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=3, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=3, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0095
     * @tc.name      WindowManage_SubWindowDragModelTouch_0095
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=1, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0095 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-1, 1, 2);
      logInfo(`touch(x=-1, y=1, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=1, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=1, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0096
     * @tc.name      WindowManage_SubWindowDragModelTouch_0096
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0096 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-1, 100, 0);
      logInfo(`touch(x=-1, y=100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0097
     * @tc.name      WindowManage_SubWindowDragModelTouch_0097
     * @tc.desc      SubWindowDragModel.touch(x=10, y=-1, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0097 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(10, -1, 2);
      logInfo(`touch(x=10, y=-1, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=-1, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=-1, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0098
     * @tc.name      WindowManage_SubWindowDragModelTouch_0098
     * @tc.desc      SubWindowDragModel.touch(x=3, y=50, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0098 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 50, 15);
      logInfo(`touch(x=3, y=50, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=50, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=50, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0099
     * @tc.name      WindowManage_SubWindowDragModelTouch_0099
     * @tc.desc      SubWindowDragModel.touch(x=100, y=10, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0099 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(100, 10, -1);
      logInfo(`touch(x=100, y=10, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=10, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=10, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0100
     * @tc.name      WindowManage_SubWindowDragModelTouch_0100
     * @tc.desc      SubWindowDragModel.touch(x=50, y=15, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0100 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 15, 1);
      logInfo(`touch(x=50, y=15, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=15, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=15, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0101
     * @tc.name      WindowManage_SubWindowDragModelTouch_0101
     * @tc.desc      SubWindowDragModel.touch(x=1, y=-1, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0101 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(1, -1, 100);
      logInfo(`touch(x=1, y=-1, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=-1, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=-1, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0102
     * @tc.name      WindowManage_SubWindowDragModelTouch_0102
     * @tc.desc      SubWindowDragModel.touch(x=50, y=2, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0102 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(50, 2, -1);
      logInfo(`touch(x=50, y=2, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=2, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=2, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0103
     * @tc.name      WindowManage_SubWindowDragModelTouch_0103
     * @tc.desc      SubWindowDragModel.touch(x=1, y=2, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0103 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(1, 2, 15);
      logInfo(`touch(x=1, y=2, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=2, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=2, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0104
     * @tc.name      WindowManage_SubWindowDragModelTouch_0104
     * @tc.desc      SubWindowDragModel.touch(x=2, y=97, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0104 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(2, 97, 5);
      logInfo(`touch(x=2, y=97, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=97, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=97, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0105
     * @tc.name      WindowManage_SubWindowDragModelTouch_0105
     * @tc.desc      SubWindowDragModel.touch(x=196, y=1, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0105 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 1, 3);
      logInfo(`touch(x=196, y=1, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=1, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=1, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0106
     * @tc.name      WindowManage_SubWindowDragModelTouch_0106
     * @tc.desc      SubWindowDragModel.touch(x=5, y=1, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0106 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, 1, 20);
      logInfo(`touch(x=5, y=1, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=1, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=1, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0107
     * @tc.name      WindowManage_SubWindowDragModelTouch_0107
     * @tc.desc      SubWindowDragModel.touch(x=2, y=5, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0107 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(2, 5, -8);
      logInfo(`touch(x=2, y=5, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=5, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=5, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0108
     * @tc.name      WindowManage_SubWindowDragModelTouch_0108
     * @tc.desc      SubWindowDragModel.touch(x=0, y=100, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0108 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(0, 100, -1);
      logInfo(`touch(x=0, y=100, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=100, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0109
     * @tc.name      WindowManage_SubWindowDragModelTouch_0109
     * @tc.desc      SubWindowDragModel.touch(x=5, y=97, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0109 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(5, 97, 0);
      logInfo(`touch(x=5, y=97, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=97, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=97, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0110
     * @tc.name      WindowManage_SubWindowDragModelTouch_0110
     * @tc.desc      SubWindowDragModel.touch(x=50, y=3, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0110 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 3, 25);
      logInfo(`touch(x=50, y=3, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=3, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=3, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0111
     * @tc.name      WindowManage_SubWindowDragModelTouch_0111
     * @tc.desc      SubWindowDragModel.touch(x=5, y=10, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0111 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(5, 10, 20);
      logInfo(`touch(x=5, y=10, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=10, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=10, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0112
     * @tc.name      WindowManage_SubWindowDragModelTouch_0112
     * @tc.desc      SubWindowDragModel.touch(x=0, y=1, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0112 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, 1, 1);
      logInfo(`touch(x=0, y=1, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=1, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0113
     * @tc.name      WindowManage_SubWindowDragModelTouch_0113
     * @tc.desc      SubWindowDragModel.touch(x=100, y=-1, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0113 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(100, -1, 10);
      logInfo(`touch(x=100, y=-1, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=-1, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=-1, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0114
     * @tc.name      WindowManage_SubWindowDragModelTouch_0114
     * @tc.desc      SubWindowDragModel.touch(x=2, y=50, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0114 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 50, 1);
      logInfo(`touch(x=2, y=50, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=50, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=50, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0115
     * @tc.name      WindowManage_SubWindowDragModelTouch_0115
     * @tc.desc      SubWindowDragModel.touch(x=196, y=100, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0115 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 100, 3);
      logInfo(`touch(x=196, y=100, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=100, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=100, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0116
     * @tc.name      WindowManage_SubWindowDragModelTouch_0116
     * @tc.desc      SubWindowDragModel.touch(x=5, y=0, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0116 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(5, 0, 10);
      logInfo(`touch(x=5, y=0, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=0, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0117
     * @tc.name      WindowManage_SubWindowDragModelTouch_0117
     * @tc.desc      SubWindowDragModel.touch(x=2, y=-1, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0117 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, -1, -8);
      logInfo(`touch(x=2, y=-1, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=-1, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=-1, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0118
     * @tc.name      WindowManage_SubWindowDragModelTouch_0118
     * @tc.desc      SubWindowDragModel.touch(x=50, y=97, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0118 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 97, 25);
      logInfo(`touch(x=50, y=97, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=97, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=97, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0119
     * @tc.name      WindowManage_SubWindowDragModelTouch_0119
     * @tc.desc      SubWindowDragModel.touch(x=10, y=50, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0119 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(10, 50, 10);
      logInfo(`touch(x=10, y=50, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=50, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=50, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0120
     * @tc.name      WindowManage_SubWindowDragModelTouch_0120
     * @tc.desc      SubWindowDragModel.touch(x=10, y=3, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0120 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(10, 3, 3);
      logInfo(`touch(x=10, y=3, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=3, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=3, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0121
     * @tc.name      WindowManage_SubWindowDragModelTouch_0121
     * @tc.desc      SubWindowDragModel.touch(x=15, y=1, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0121 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 1, 10);
      logInfo(`touch(x=15, y=1, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=1, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=1, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0122
     * @tc.name      WindowManage_SubWindowDragModelTouch_0122
     * @tc.desc      SubWindowDragModel.touch(x=100, y=2, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0122 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 2, 2);
      logInfo(`touch(x=100, y=2, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=2, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=2, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0123
     * @tc.name      WindowManage_SubWindowDragModelTouch_0123
     * @tc.desc      SubWindowDragModel.touch(x=10, y=2, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0123 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(10, 2, 5);
      logInfo(`touch(x=10, y=2, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=2, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=2, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0124
     * @tc.name      WindowManage_SubWindowDragModelTouch_0124
     * @tc.desc      SubWindowDragModel.touch(x=3, y=97, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0124 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 97, 5);
      logInfo(`touch(x=3, y=97, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=97, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=97, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0125
     * @tc.name      WindowManage_SubWindowDragModelTouch_0125
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=2, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0125 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-1, 2, 20);
      logInfo(`touch(x=-1, y=2, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=2, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=2, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0126
     * @tc.name      WindowManage_SubWindowDragModelTouch_0126
     * @tc.desc      SubWindowDragModel.touch(x=50, y=0, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0126 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(50, 0, -8);
      logInfo(`touch(x=50, y=0, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=0, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0127
     * @tc.name      WindowManage_SubWindowDragModelTouch_0127
     * @tc.desc      SubWindowDragModel.touch(x=15, y=5, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0127 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, 5, 1);
      logInfo(`touch(x=15, y=5, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=5, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=5, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0128
     * @tc.name      WindowManage_SubWindowDragModelTouch_0128
     * @tc.desc      SubWindowDragModel.touch(x=3, y=15, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0128 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 15, 5);
      logInfo(`touch(x=3, y=15, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=15, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=15, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0129
     * @tc.name      WindowManage_SubWindowDragModelTouch_0129
     * @tc.desc      SubWindowDragModel.touch(x=196, y=3, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0129 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(196, 3, 3);
      logInfo(`touch(x=196, y=3, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=3, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=3, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0130
     * @tc.name      WindowManage_SubWindowDragModelTouch_0130
     * @tc.desc      SubWindowDragModel.touch(x=0, y=3, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0130 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, 3, 20);
      logInfo(`touch(x=0, y=3, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=3, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0131
     * @tc.name      WindowManage_SubWindowDragModelTouch_0131
     * @tc.desc      SubWindowDragModel.touch(x=10, y=15, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0131 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(10, 15, 20);
      logInfo(`touch(x=10, y=15, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=15, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=15, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0132
     * @tc.name      WindowManage_SubWindowDragModelTouch_0132
     * @tc.desc      SubWindowDragModel.touch(x=1, y=15, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0132 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 15, 5);
      logInfo(`touch(x=1, y=15, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=15, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=15, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0133
     * @tc.name      WindowManage_SubWindowDragModelTouch_0133
     * @tc.desc      SubWindowDragModel.touch(x=100, y=100, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0133 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 100, -1);
      logInfo(`touch(x=100, y=100, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=100, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=100, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0134
     * @tc.name      WindowManage_SubWindowDragModelTouch_0134
     * @tc.desc      SubWindowDragModel.touch(x=10, y=1, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0134 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, 1, 100);
      logInfo(`touch(x=10, y=1, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=1, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=1, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0135
     * @tc.name      WindowManage_SubWindowDragModelTouch_0135
     * @tc.desc      SubWindowDragModel.touch(x=100, y=50, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0135 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(100, 50, -1);
      logInfo(`touch(x=100, y=50, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=50, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=50, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0136
     * @tc.name      WindowManage_SubWindowDragModelTouch_0136
     * @tc.desc      SubWindowDragModel.touch(x=15, y=3, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0136 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(15, 3, 10);
      logInfo(`touch(x=15, y=3, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=3, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=3, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0137
     * @tc.name      WindowManage_SubWindowDragModelTouch_0137
     * @tc.desc      SubWindowDragModel.touch(x=5, y=5, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0137 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, 5, 20);
      logInfo(`touch(x=5, y=5, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=5, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=5, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0138
     * @tc.name      WindowManage_SubWindowDragModelTouch_0138
     * @tc.desc      SubWindowDragModel.touch(x=1, y=97, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0138 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(1, 97, 1);
      logInfo(`touch(x=1, y=97, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=97, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=97, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0139
     * @tc.name      WindowManage_SubWindowDragModelTouch_0139
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=50, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0139 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 50, 1);
      logInfo(`touch(x=-1, y=50, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=50, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=50, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0140
     * @tc.name      WindowManage_SubWindowDragModelTouch_0140
     * @tc.desc      SubWindowDragModel.touch(x=3, y=10, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0140 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(3, 10, 15);
      logInfo(`touch(x=3, y=10, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=10, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=10, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0141
     * @tc.name      WindowManage_SubWindowDragModelTouch_0141
     * @tc.desc      SubWindowDragModel.touch(x=100, y=1, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0141 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(100, 1, 20);
      logInfo(`touch(x=100, y=1, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=1, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=1, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0142
     * @tc.name      WindowManage_SubWindowDragModelTouch_0142
     * @tc.desc      SubWindowDragModel.touch(x=1, y=100, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0142 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 100, 1);
      logInfo(`touch(x=1, y=100, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=100, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=100, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0143
     * @tc.name      WindowManage_SubWindowDragModelTouch_0143
     * @tc.desc      SubWindowDragModel.touch(x=50, y=-1, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0143 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, -1, 100);
      logInfo(`touch(x=50, y=-1, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=-1, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=-1, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0144
     * @tc.name      WindowManage_SubWindowDragModelTouch_0144
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=97, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0144 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-1, 97, 15);
      logInfo(`touch(x=-1, y=97, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=97, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=97, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0145
     * @tc.name      WindowManage_SubWindowDragModelTouch_0145
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0145 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 1);
      logInfo(`touch(x=-100, y=-100, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0146
     * @tc.name      WindowManage_SubWindowDragModelTouch_0146
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0146 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -100, -1);
      logInfo(`touch(x=-100, y=-100, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0147
     * @tc.name      WindowManage_SubWindowDragModelTouch_0147
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0147 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 2);
      logInfo(`touch(x=-100, y=-100, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0148
     * @tc.name      WindowManage_SubWindowDragModelTouch_0148
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0148 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 3);
      logInfo(`touch(x=-100, y=-100, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0148 end`);
    });
  });
}
