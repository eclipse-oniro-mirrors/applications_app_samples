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
import { subWindowStartYOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subWindowStartYOf (60 cases). */
export default function subWindowStartYOfTest(): void {
  describe('SubWindowStartYOfTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0001
     * @tc.name      WindowManage_SubWindowStartYOf_0001
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowStartYOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0001 begin`);
      const actual: number = subWindowStartYOf(true, 0);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowStartYOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0002
     * @tc.name      WindowManage_SubWindowStartYOf_0002
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=500) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowStartYOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0002 begin`);
      const actual: number = subWindowStartYOf(true, 500);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}SubWindowStartYOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0003
     * @tc.name      WindowManage_SubWindowStartYOf_0003
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=999) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0003 begin`);
      const actual: number = subWindowStartYOf(true, 999);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}SubWindowStartYOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0004
     * @tc.name      WindowManage_SubWindowStartYOf_0004
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1000) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0004 begin`);
      const actual: number = subWindowStartYOf(true, 1000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0005
     * @tc.name      WindowManage_SubWindowStartYOf_0005
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=59999) returns 59999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0005 begin`);
      const actual: number = subWindowStartYOf(true, 59999);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(59999);
      logInfo(`${BUNDLE}SubWindowStartYOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0006
     * @tc.name      WindowManage_SubWindowStartYOf_0006
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=60000) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0006 begin`);
      const actual: number = subWindowStartYOf(true, 60000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0007
     * @tc.name      WindowManage_SubWindowStartYOf_0007
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=61000) returns 61000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0007 begin`);
      const actual: number = subWindowStartYOf(true, 61000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(61000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0008
     * @tc.name      WindowManage_SubWindowStartYOf_0008
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=3599000) returns 3599000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0008 begin`);
      const actual: number = subWindowStartYOf(true, 3599000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(3599000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0009
     * @tc.name      WindowManage_SubWindowStartYOf_0009
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=3600000) returns 3600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0009 begin`);
      const actual: number = subWindowStartYOf(true, 3600000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(3600000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0010
     * @tc.name      WindowManage_SubWindowStartYOf_0010
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0010 begin`);
      const actual: number = subWindowStartYOf(true, 1);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowStartYOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0011
     * @tc.name      WindowManage_SubWindowStartYOf_0011
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowStartYOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0011 begin`);
      const actual: number = subWindowStartYOf(true, -1);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowStartYOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0012
     * @tc.name      WindowManage_SubWindowStartYOf_0012
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0012 begin`);
      const actual: number = subWindowStartYOf(true, 2);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowStartYOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0013
     * @tc.name      WindowManage_SubWindowStartYOf_0013
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0013 begin`);
      const actual: number = subWindowStartYOf(true, 3);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowStartYOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0014
     * @tc.name      WindowManage_SubWindowStartYOf_0014
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0014 begin`);
      const actual: number = subWindowStartYOf(true, 10);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowStartYOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0015
     * @tc.name      WindowManage_SubWindowStartYOf_0015
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0015 begin`);
      const actual: number = subWindowStartYOf(true, 100);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowStartYOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0016
     * @tc.name      WindowManage_SubWindowStartYOf_0016
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=180000) returns 180000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0016 begin`);
      const actual: number = subWindowStartYOf(true, 180000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(180000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0017
     * @tc.name      WindowManage_SubWindowStartYOf_0017
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=360000) returns 360000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0017 begin`);
      const actual: number = subWindowStartYOf(true, 360000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(360000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0018
     * @tc.name      WindowManage_SubWindowStartYOf_0018
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=540000) returns 540000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0018 begin`);
      const actual: number = subWindowStartYOf(true, 540000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(540000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0019
     * @tc.name      WindowManage_SubWindowStartYOf_0019
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=720000) returns 720000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0019 begin`);
      const actual: number = subWindowStartYOf(true, 720000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(720000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0020
     * @tc.name      WindowManage_SubWindowStartYOf_0020
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=900000) returns 900000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0020 begin`);
      const actual: number = subWindowStartYOf(true, 900000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(900000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0021
     * @tc.name      WindowManage_SubWindowStartYOf_0021
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1080000) returns 1080000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0021 begin`);
      const actual: number = subWindowStartYOf(true, 1080000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1080000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0022
     * @tc.name      WindowManage_SubWindowStartYOf_0022
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1260000) returns 1260000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0022 begin`);
      const actual: number = subWindowStartYOf(true, 1260000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1260000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0023
     * @tc.name      WindowManage_SubWindowStartYOf_0023
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1440000) returns 1440000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0023 begin`);
      const actual: number = subWindowStartYOf(true, 1440000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1440000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0024
     * @tc.name      WindowManage_SubWindowStartYOf_0024
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1620000) returns 1620000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0024 begin`);
      const actual: number = subWindowStartYOf(true, 1620000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1620000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0025
     * @tc.name      WindowManage_SubWindowStartYOf_0025
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1800000) returns 1800000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0025 begin`);
      const actual: number = subWindowStartYOf(true, 1800000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1800000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0026
     * @tc.name      WindowManage_SubWindowStartYOf_0026
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=1980000) returns 1980000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0026 begin`);
      const actual: number = subWindowStartYOf(true, 1980000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(1980000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0027
     * @tc.name      WindowManage_SubWindowStartYOf_0027
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=2160000) returns 2160000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0027 begin`);
      const actual: number = subWindowStartYOf(true, 2160000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(2160000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0028
     * @tc.name      WindowManage_SubWindowStartYOf_0028
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=2340000) returns 2340000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0028 begin`);
      const actual: number = subWindowStartYOf(true, 2340000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(2340000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0029
     * @tc.name      WindowManage_SubWindowStartYOf_0029
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=2520000) returns 2520000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0029 begin`);
      const actual: number = subWindowStartYOf(true, 2520000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(2520000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0030
     * @tc.name      WindowManage_SubWindowStartYOf_0030
     * @tc.desc      subWindowStartYOf(isPortrait=true, currentMoveY=2700000) returns 2700000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0030 begin`);
      const actual: number = subWindowStartYOf(true, 2700000);
      logInfo(`subWindowStartYOf(isPortrait=true, curren...: actual=${actual}`);
      expect(actual).assertEqual(2700000);
      logInfo(`${BUNDLE}SubWindowStartYOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0031
     * @tc.name      WindowManage_SubWindowStartYOf_0031
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=0) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0031 begin`);
      const actual: number = subWindowStartYOf(false, 0);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0032
     * @tc.name      WindowManage_SubWindowStartYOf_0032
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=500) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0032 begin`);
      const actual: number = subWindowStartYOf(false, 500);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0033
     * @tc.name      WindowManage_SubWindowStartYOf_0033
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=999) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0033 begin`);
      const actual: number = subWindowStartYOf(false, 999);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0034
     * @tc.name      WindowManage_SubWindowStartYOf_0034
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0034 begin`);
      const actual: number = subWindowStartYOf(false, 1000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0035
     * @tc.name      WindowManage_SubWindowStartYOf_0035
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=59999) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0035 begin`);
      const actual: number = subWindowStartYOf(false, 59999);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0036
     * @tc.name      WindowManage_SubWindowStartYOf_0036
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=60000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0036 begin`);
      const actual: number = subWindowStartYOf(false, 60000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0037
     * @tc.name      WindowManage_SubWindowStartYOf_0037
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=61000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0037 begin`);
      const actual: number = subWindowStartYOf(false, 61000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0038
     * @tc.name      WindowManage_SubWindowStartYOf_0038
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=3599000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0038 begin`);
      const actual: number = subWindowStartYOf(false, 3599000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0039
     * @tc.name      WindowManage_SubWindowStartYOf_0039
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=3600000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0039 begin`);
      const actual: number = subWindowStartYOf(false, 3600000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0040
     * @tc.name      WindowManage_SubWindowStartYOf_0040
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0040 begin`);
      const actual: number = subWindowStartYOf(false, 1);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0041
     * @tc.name      WindowManage_SubWindowStartYOf_0041
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=-1) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowStartYOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0041 begin`);
      const actual: number = subWindowStartYOf(false, -1);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0042
     * @tc.name      WindowManage_SubWindowStartYOf_0042
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=2) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0042 begin`);
      const actual: number = subWindowStartYOf(false, 2);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0043
     * @tc.name      WindowManage_SubWindowStartYOf_0043
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=3) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0043 begin`);
      const actual: number = subWindowStartYOf(false, 3);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0044
     * @tc.name      WindowManage_SubWindowStartYOf_0044
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=10) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0044 begin`);
      const actual: number = subWindowStartYOf(false, 10);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0045
     * @tc.name      WindowManage_SubWindowStartYOf_0045
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=100) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0045 begin`);
      const actual: number = subWindowStartYOf(false, 100);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0046
     * @tc.name      WindowManage_SubWindowStartYOf_0046
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=180000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0046 begin`);
      const actual: number = subWindowStartYOf(false, 180000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0047
     * @tc.name      WindowManage_SubWindowStartYOf_0047
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=360000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0047 begin`);
      const actual: number = subWindowStartYOf(false, 360000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0048
     * @tc.name      WindowManage_SubWindowStartYOf_0048
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=540000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0048 begin`);
      const actual: number = subWindowStartYOf(false, 540000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0049
     * @tc.name      WindowManage_SubWindowStartYOf_0049
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=720000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0049 begin`);
      const actual: number = subWindowStartYOf(false, 720000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0050
     * @tc.name      WindowManage_SubWindowStartYOf_0050
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=900000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0050 begin`);
      const actual: number = subWindowStartYOf(false, 900000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0051
     * @tc.name      WindowManage_SubWindowStartYOf_0051
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1080000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0051 begin`);
      const actual: number = subWindowStartYOf(false, 1080000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0052
     * @tc.name      WindowManage_SubWindowStartYOf_0052
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1260000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0052 begin`);
      const actual: number = subWindowStartYOf(false, 1260000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0053
     * @tc.name      WindowManage_SubWindowStartYOf_0053
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1440000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0053 begin`);
      const actual: number = subWindowStartYOf(false, 1440000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0054
     * @tc.name      WindowManage_SubWindowStartYOf_0054
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1620000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0054 begin`);
      const actual: number = subWindowStartYOf(false, 1620000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0055
     * @tc.name      WindowManage_SubWindowStartYOf_0055
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1800000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0055 begin`);
      const actual: number = subWindowStartYOf(false, 1800000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0056
     * @tc.name      WindowManage_SubWindowStartYOf_0056
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=1980000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0056 begin`);
      const actual: number = subWindowStartYOf(false, 1980000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0057
     * @tc.name      WindowManage_SubWindowStartYOf_0057
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=2160000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0057 begin`);
      const actual: number = subWindowStartYOf(false, 2160000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0058
     * @tc.name      WindowManage_SubWindowStartYOf_0058
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=2340000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0058 begin`);
      const actual: number = subWindowStartYOf(false, 2340000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0059
     * @tc.name      WindowManage_SubWindowStartYOf_0059
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=2520000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0059 begin`);
      const actual: number = subWindowStartYOf(false, 2520000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_START_YOF_0060
     * @tc.name      WindowManage_SubWindowStartYOf_0060
     * @tc.desc      subWindowStartYOf(isPortrait=false, currentMoveY=2700000) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowStartYOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowStartYOf_0060 begin`);
      const actual: number = subWindowStartYOf(false, 2700000);
      logInfo(`subWindowStartYOf(isPortrait=false, curre...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SubWindowStartYOf_0060 end`);
    });
  });
}
