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
import { PullGestureModel } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for PullGestureModel.move (50 cases). */
export default function pullGestureModelMoveTest(): void {
  describe('PullGestureModelMoveTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0001
     * @tc.name      PullToRefresh_PullGestureModelMove_0001
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=-100, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullGestureModelMove_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0001 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, -100, true);
      logInfo(`move(offsetY=-100, yOffset=-100, isAtEnd=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0002
     * @tc.name      PullToRefresh_PullGestureModelMove_0002
     * @tc.desc      PullGestureModel.move(offsetY=1, yOffset=0, isAtEnd=true) yields 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullGestureModelMove_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0002 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(1, 0, true);
      logInfo(`move(offsetY=1, yOffset=0, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullGestureModelMove_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0003
     * @tc.name      PullToRefresh_PullGestureModelMove_0003
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=-100, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0003 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, -100, false);
      logInfo(`move(offsetY=-100, yOffset=-100, isAtEnd=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0004
     * @tc.name      PullToRefresh_PullGestureModelMove_0004
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=-1, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0004 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, -1, true);
      logInfo(`move(offsetY=-100, yOffset=-1, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0005
     * @tc.name      PullToRefresh_PullGestureModelMove_0005
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=-1, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0005 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, -1, false);
      logInfo(`move(offsetY=-100, yOffset=-1, isAtEnd=fa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0006
     * @tc.name      PullToRefresh_PullGestureModelMove_0006
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=0, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0006 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 0, true);
      logInfo(`move(offsetY=-100, yOffset=0, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0007
     * @tc.name      PullToRefresh_PullGestureModelMove_0007
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=0, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0007 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 0, false);
      logInfo(`move(offsetY=-100, yOffset=0, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0008
     * @tc.name      PullToRefresh_PullGestureModelMove_0008
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=1, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0008 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, 1, true);
      logInfo(`move(offsetY=-100, yOffset=1, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0009
     * @tc.name      PullToRefresh_PullGestureModelMove_0009
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=1, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0009 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 1, false);
      logInfo(`move(offsetY=-100, yOffset=1, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0010
     * @tc.name      PullToRefresh_PullGestureModelMove_0010
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=0.75, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0010 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 0.75, true);
      logInfo(`move(offsetY=-100, yOffset=0.75, isAtEnd=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0011
     * @tc.name      PullToRefresh_PullGestureModelMove_0011
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=0.75, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0011 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, 0.75, false);
      logInfo(`move(offsetY=-100, yOffset=0.75, isAtEnd=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0012
     * @tc.name      PullToRefresh_PullGestureModelMove_0012
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=1.5, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0012 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 1.5, true);
      logInfo(`move(offsetY=-100, yOffset=1.5, isAtEnd=t...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0013
     * @tc.name      PullToRefresh_PullGestureModelMove_0013
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=1.5, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0013 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 1.5, false);
      logInfo(`move(offsetY=-100, yOffset=1.5, isAtEnd=f...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0014
     * @tc.name      PullToRefresh_PullGestureModelMove_0014
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=0.375, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0014 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, 0.375, true);
      logInfo(`move(offsetY=-100, yOffset=0.375, isAtEnd...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0015
     * @tc.name      PullToRefresh_PullGestureModelMove_0015
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=0.375, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0015 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 0.375, false);
      logInfo(`move(offsetY=-100, yOffset=0.375, isAtEnd...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0016
     * @tc.name      PullToRefresh_PullGestureModelMove_0016
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=50, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0016 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 50, true);
      logInfo(`move(offsetY=-100, yOffset=50, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0017
     * @tc.name      PullToRefresh_PullGestureModelMove_0017
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=50, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0017 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, 50, false);
      logInfo(`move(offsetY=-100, yOffset=50, isAtEnd=fa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0018
     * @tc.name      PullToRefresh_PullGestureModelMove_0018
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=100, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0018 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 100, true);
      logInfo(`move(offsetY=-100, yOffset=100, isAtEnd=t...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0019
     * @tc.name      PullToRefresh_PullGestureModelMove_0019
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=100, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0019 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 100, false);
      logInfo(`move(offsetY=-100, yOffset=100, isAtEnd=f...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0020
     * @tc.name      PullToRefresh_PullGestureModelMove_0020
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=2, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0020 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, 2, true);
      logInfo(`move(offsetY=-100, yOffset=2, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0021
     * @tc.name      PullToRefresh_PullGestureModelMove_0021
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=2, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0021 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 2, false);
      logInfo(`move(offsetY=-100, yOffset=2, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0022
     * @tc.name      PullToRefresh_PullGestureModelMove_0022
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=3, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0022 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 3, true);
      logInfo(`move(offsetY=-100, yOffset=3, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0023
     * @tc.name      PullToRefresh_PullGestureModelMove_0023
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=3, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0023 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-100, 3, false);
      logInfo(`move(offsetY=-100, yOffset=3, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0024
     * @tc.name      PullToRefresh_PullGestureModelMove_0024
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=10, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0024 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-100, 10, true);
      logInfo(`move(offsetY=-100, yOffset=10, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0025
     * @tc.name      PullToRefresh_PullGestureModelMove_0025
     * @tc.desc      PullGestureModel.move(offsetY=-100, yOffset=10, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0025 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-100, 10, false);
      logInfo(`move(offsetY=-100, yOffset=10, isAtEnd=fa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0026
     * @tc.name      PullToRefresh_PullGestureModelMove_0026
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=-100, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0026 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, -100, true);
      logInfo(`move(offsetY=-1, yOffset=-100, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0027
     * @tc.name      PullToRefresh_PullGestureModelMove_0027
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=-100, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0027 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, -100, false);
      logInfo(`move(offsetY=-1, yOffset=-100, isAtEnd=fa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0028
     * @tc.name      PullToRefresh_PullGestureModelMove_0028
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=-1, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0028 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, -1, true);
      logInfo(`move(offsetY=-1, yOffset=-1, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0029
     * @tc.name      PullToRefresh_PullGestureModelMove_0029
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=-1, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0029 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, -1, false);
      logInfo(`move(offsetY=-1, yOffset=-1, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0030
     * @tc.name      PullToRefresh_PullGestureModelMove_0030
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=0, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0030 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 0, true);
      logInfo(`move(offsetY=-1, yOffset=0, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0031
     * @tc.name      PullToRefresh_PullGestureModelMove_0031
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=0, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0031 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 0, false);
      logInfo(`move(offsetY=-1, yOffset=0, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0032
     * @tc.name      PullToRefresh_PullGestureModelMove_0032
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=1, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0032 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, 1, true);
      logInfo(`move(offsetY=-1, yOffset=1, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0033
     * @tc.name      PullToRefresh_PullGestureModelMove_0033
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=1, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0033 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 1, false);
      logInfo(`move(offsetY=-1, yOffset=1, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0034
     * @tc.name      PullToRefresh_PullGestureModelMove_0034
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=0.75, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0034 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 0.75, true);
      logInfo(`move(offsetY=-1, yOffset=0.75, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0035
     * @tc.name      PullToRefresh_PullGestureModelMove_0035
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=0.75, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0035 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, 0.75, false);
      logInfo(`move(offsetY=-1, yOffset=0.75, isAtEnd=fa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0036
     * @tc.name      PullToRefresh_PullGestureModelMove_0036
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=1.5, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0036 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 1.5, true);
      logInfo(`move(offsetY=-1, yOffset=1.5, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0037
     * @tc.name      PullToRefresh_PullGestureModelMove_0037
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=1.5, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0037 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 1.5, false);
      logInfo(`move(offsetY=-1, yOffset=1.5, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0038
     * @tc.name      PullToRefresh_PullGestureModelMove_0038
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=0.375, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0038 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, 0.375, true);
      logInfo(`move(offsetY=-1, yOffset=0.375, isAtEnd=t...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0039
     * @tc.name      PullToRefresh_PullGestureModelMove_0039
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=0.375, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0039 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 0.375, false);
      logInfo(`move(offsetY=-1, yOffset=0.375, isAtEnd=f...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0040
     * @tc.name      PullToRefresh_PullGestureModelMove_0040
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=50, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0040 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 50, true);
      logInfo(`move(offsetY=-1, yOffset=50, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0041
     * @tc.name      PullToRefresh_PullGestureModelMove_0041
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=50, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0041 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, 50, false);
      logInfo(`move(offsetY=-1, yOffset=50, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0042
     * @tc.name      PullToRefresh_PullGestureModelMove_0042
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=100, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0042 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 100, true);
      logInfo(`move(offsetY=-1, yOffset=100, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0043
     * @tc.name      PullToRefresh_PullGestureModelMove_0043
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=100, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0043 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 100, false);
      logInfo(`move(offsetY=-1, yOffset=100, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0044
     * @tc.name      PullToRefresh_PullGestureModelMove_0044
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=2, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0044 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, 2, true);
      logInfo(`move(offsetY=-1, yOffset=2, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0045
     * @tc.name      PullToRefresh_PullGestureModelMove_0045
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=2, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0045 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 2, false);
      logInfo(`move(offsetY=-1, yOffset=2, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0046
     * @tc.name      PullToRefresh_PullGestureModelMove_0046
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=3, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0046 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 3, true);
      logInfo(`move(offsetY=-1, yOffset=3, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0047
     * @tc.name      PullToRefresh_PullGestureModelMove_0047
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=3, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0047 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(-1, 3, false);
      logInfo(`move(offsetY=-1, yOffset=3, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0048
     * @tc.name      PullToRefresh_PullGestureModelMove_0048
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=10, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0048 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.move(-1, 10, true);
      logInfo(`move(offsetY=-1, yOffset=10, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0049
     * @tc.name      PullToRefresh_PullGestureModelMove_0049
     * @tc.desc      PullGestureModel.move(offsetY=-1, yOffset=10, isAtEnd=false) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0049 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.move(-1, 10, false);
      logInfo(`move(offsetY=-1, yOffset=10, isAtEnd=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_MOVE_0050
     * @tc.name      PullToRefresh_PullGestureModelMove_0050
     * @tc.desc      PullGestureModel.move(offsetY=0, yOffset=-100, isAtEnd=true) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelMove_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelMove_0050 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.move(0, -100, true);
      logInfo(`move(offsetY=0, yOffset=-100, isAtEnd=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelMove_0050 end`);
    });
  });
}
