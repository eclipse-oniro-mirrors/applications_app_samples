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

/** Logic checks for PullGestureModel.finishRefresh (50 cases). */
export default function pullGestureModelFinishRefreshTest(): void {
  describe('PullGestureModelFinishRefreshTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0001
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0001
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="close") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0001 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('close');
      logInfo(`finishRefresh(refreshText="close"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0002
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0002
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0002 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('');
      logInfo(`finishRefresh(refreshText=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0003
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0003
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="refresh") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0003 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('refresh');
      logInfo(`finishRefresh(refreshText="refresh"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0004
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0004
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="free") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0004 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('free');
      logInfo(`finishRefresh(refreshText="free"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0005
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0005
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="load") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0005 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('load');
      logInfo(`finishRefresh(refreshText="load"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0006
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0006
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="CLOSE") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0006 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('CLOSE');
      logInfo(`finishRefresh(refreshText="CLOSE"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0007
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0007
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="clos") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0007 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('clos');
      logInfo(`finishRefresh(refreshText="clos"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0008
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0008
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="closex") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0008 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('closex');
      logInfo(`finishRefresh(refreshText="closex"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0009
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0009
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="REFRESH") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0009 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('REFRESH');
      logInfo(`finishRefresh(refreshText="REFRESH"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0010
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0010
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="refres") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0010 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('refres');
      logInfo(`finishRefresh(refreshText="refres"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0011
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0011
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="refreshx") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0011 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('refreshx');
      logInfo(`finishRefresh(refreshText="refreshx"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0012
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0012
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="FREE") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0012 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('FREE');
      logInfo(`finishRefresh(refreshText="FREE"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0013
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0013
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="fre") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0013 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('fre');
      logInfo(`finishRefresh(refreshText="fre"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0014
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0014
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="freex") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0014 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('freex');
      logInfo(`finishRefresh(refreshText="freex"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0015
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0015
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="LOAD") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0015 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('LOAD');
      logInfo(`finishRefresh(refreshText="LOAD"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0016
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0016
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="loa") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0016 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('loa');
      logInfo(`finishRefresh(refreshText="loa"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0017
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0017
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="loadx") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0017 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('loadx');
      logInfo(`finishRefresh(refreshText="loadx"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0018
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0018
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="Hello") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0018 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('Hello');
      logInfo(`finishRefresh(refreshText="Hello"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0019
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0019
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="hello world") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0019 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('hello world');
      logInfo(`finishRefresh(refreshText="hello world"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0020
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0020
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0020 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh(' ');
      logInfo(`finishRefresh(refreshText=" "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0021
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0021
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="A") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0021 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('A');
      logInfo(`finishRefresh(refreshText="A"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0022
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0022
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="Sample Title 123") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0022 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('Sample Title 123');
      logInfo(`finishRefresh(refreshText="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0023
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0023
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="??") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0023 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('\u4e2d\u6587');
      logInfo(`finishRefresh(refreshText="??"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0024
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0024
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="a") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0024 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('a');
      logInfo(`finishRefresh(refreshText="a"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0025
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0025
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="abc") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0025 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('abc');
      logInfo(`finishRefresh(refreshText="abc"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0026
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0026
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="Hello World") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0026 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('Hello World');
      logInfo(`finishRefresh(refreshText="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0027
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0027
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="123") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0027 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('123');
      logInfo(`finishRefresh(refreshText="123"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0028
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0028
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" close ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0028 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh(' close ');
      logInfo(`finishRefresh(refreshText=" close "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0029
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0029
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="closeclose") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0029 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('closeclose');
      logInfo(`finishRefresh(refreshText="closeclose"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0030
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0030
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="close_1") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0030 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('close_1');
      logInfo(`finishRefresh(refreshText="close_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0031
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0031
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="xclose") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0031 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('xclose');
      logInfo(`finishRefresh(refreshText="xclose"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0032
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0032
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" refresh ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0032 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh(' refresh ');
      logInfo(`finishRefresh(refreshText=" refresh "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0033
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0033
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="refreshrefresh") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0033 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('refreshrefresh');
      logInfo(`finishRefresh(refreshText="refreshrefresh"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0034
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0034
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="refresh_1") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0034 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('refresh_1');
      logInfo(`finishRefresh(refreshText="refresh_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0035
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0035
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="xrefresh") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0035 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('xrefresh');
      logInfo(`finishRefresh(refreshText="xrefresh"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0036
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0036
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" free ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0036 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh(' free ');
      logInfo(`finishRefresh(refreshText=" free "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0037
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0037
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="freefree") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0037 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('freefree');
      logInfo(`finishRefresh(refreshText="freefree"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0038
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0038
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="free_1") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0038 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('free_1');
      logInfo(`finishRefresh(refreshText="free_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0039
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0039
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="xfree") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0039 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('xfree');
      logInfo(`finishRefresh(refreshText="xfree"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0040
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0040
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" load ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0040 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh(' load ');
      logInfo(`finishRefresh(refreshText=" load "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0041
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0041
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="loadload") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0041 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('loadload');
      logInfo(`finishRefresh(refreshText="loadload"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0042
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0042
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="load_1") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0042 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('load_1');
      logInfo(`finishRefresh(refreshText="load_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0043
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0043
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="xload") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0043 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('xload');
      logInfo(`finishRefresh(refreshText="xload"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0044
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0044
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" CLOSE ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0044 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh(' CLOSE ');
      logInfo(`finishRefresh(refreshText=" CLOSE "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0045
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0045
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="CLOSECLOSE") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0045 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh('CLOSECLOSE');
      logInfo(`finishRefresh(refreshText="CLOSECLOSE"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0046
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0046
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="CLOSE_1") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0046 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('CLOSE_1');
      logInfo(`finishRefresh(refreshText="CLOSE_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0047
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0047
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="xCLOSE") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0047 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('xCLOSE');
      logInfo(`finishRefresh(refreshText="xCLOSE"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0048
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0048
     * @tc.desc      PullGestureModel.finishRefresh(refreshText=" clos ") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0048 begin`);
      const subject: PullGestureModel = new PullGestureModel(2, 0, true, true);
      const actual: number = subject.finishRefresh(' clos ');
      logInfo(`finishRefresh(refreshText=" clos "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0049
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0049
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="closclos") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0049 begin`);
      const subject: PullGestureModel = new PullGestureModel(0, 0, true, true);
      const actual: number = subject.finishRefresh('closclos');
      logInfo(`finishRefresh(refreshText="closclos"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_GESTURE_MODEL_FINISH_REFRESH_0050
     * @tc.name      PullToRefresh_PullGestureModelFinishRefresh_0050
     * @tc.desc      PullGestureModel.finishRefresh(refreshText="clos_1") yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullGestureModelFinishRefresh_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0050 begin`);
      const subject: PullGestureModel = new PullGestureModel(1, 0, true, true);
      const actual: number = subject.finishRefresh('clos_1');
      logInfo(`finishRefresh(refreshText="clos_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullGestureModelFinishRefresh_0050 end`);
    });
  });
}
