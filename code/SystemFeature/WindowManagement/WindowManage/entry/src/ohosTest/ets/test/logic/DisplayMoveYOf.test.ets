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
import { displayMoveYOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for displayMoveYOf (96 cases). */
export default function displayMoveYOfTest(): void {
  describe('DisplayMoveYOfTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0001
     * @tc.name      WindowManage_DisplayMoveYOf_0001
     * @tc.desc      displayMoveYOf(windowHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_DisplayMoveYOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0001 begin`);
      const actual: number = displayMoveYOf(0);
      logInfo(`displayMoveYOf(windowHeight=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DisplayMoveYOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0002
     * @tc.name      WindowManage_DisplayMoveYOf_0002
     * @tc.desc      displayMoveYOf(windowHeight=1) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_DisplayMoveYOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0002 begin`);
      const actual: number = displayMoveYOf(1);
      logInfo(`displayMoveYOf(windowHeight=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0003
     * @tc.name      WindowManage_DisplayMoveYOf_0003
     * @tc.desc      displayMoveYOf(windowHeight=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_DisplayMoveYOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0003 begin`);
      const actual: number = displayMoveYOf(2);
      logInfo(`displayMoveYOf(windowHeight=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DisplayMoveYOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0004
     * @tc.name      WindowManage_DisplayMoveYOf_0004
     * @tc.desc      displayMoveYOf(windowHeight=3) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_DisplayMoveYOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0004 begin`);
      const actual: number = displayMoveYOf(3);
      logInfo(`displayMoveYOf(windowHeight=3): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0005
     * @tc.name      WindowManage_DisplayMoveYOf_0005
     * @tc.desc      displayMoveYOf(windowHeight=100) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0005 begin`);
      const actual: number = displayMoveYOf(100);
      logInfo(`displayMoveYOf(windowHeight=100): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}DisplayMoveYOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0006
     * @tc.name      WindowManage_DisplayMoveYOf_0006
     * @tc.desc      displayMoveYOf(windowHeight=360) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0006 begin`);
      const actual: number = displayMoveYOf(360);
      logInfo(`displayMoveYOf(windowHeight=360): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}DisplayMoveYOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0007
     * @tc.name      WindowManage_DisplayMoveYOf_0007
     * @tc.desc      displayMoveYOf(windowHeight=720) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0007 begin`);
      const actual: number = displayMoveYOf(720);
      logInfo(`displayMoveYOf(windowHeight=720): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}DisplayMoveYOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0008
     * @tc.name      WindowManage_DisplayMoveYOf_0008
     * @tc.desc      displayMoveYOf(windowHeight=1080) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0008 begin`);
      const actual: number = displayMoveYOf(1080);
      logInfo(`displayMoveYOf(windowHeight=1080): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}DisplayMoveYOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0009
     * @tc.name      WindowManage_DisplayMoveYOf_0009
     * @tc.desc      displayMoveYOf(windowHeight=1920) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0009 begin`);
      const actual: number = displayMoveYOf(1920);
      logInfo(`displayMoveYOf(windowHeight=1920): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}DisplayMoveYOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0010
     * @tc.name      WindowManage_DisplayMoveYOf_0010
     * @tc.desc      displayMoveYOf(windowHeight=-1) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0010 begin`);
      const actual: number = displayMoveYOf(-1);
      logInfo(`displayMoveYOf(windowHeight=-1): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0011
     * @tc.name      WindowManage_DisplayMoveYOf_0011
     * @tc.desc      displayMoveYOf(windowHeight=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0011 begin`);
      const actual: number = displayMoveYOf(10);
      logInfo(`displayMoveYOf(windowHeight=10): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}DisplayMoveYOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0012
     * @tc.name      WindowManage_DisplayMoveYOf_0012
     * @tc.desc      displayMoveYOf(windowHeight=96) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0012 begin`);
      const actual: number = displayMoveYOf(96);
      logInfo(`displayMoveYOf(windowHeight=96): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}DisplayMoveYOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0013
     * @tc.name      WindowManage_DisplayMoveYOf_0013
     * @tc.desc      displayMoveYOf(windowHeight=192) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0013 begin`);
      const actual: number = displayMoveYOf(192);
      logInfo(`displayMoveYOf(windowHeight=192): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}DisplayMoveYOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0014
     * @tc.name      WindowManage_DisplayMoveYOf_0014
     * @tc.desc      displayMoveYOf(windowHeight=288) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0014 begin`);
      const actual: number = displayMoveYOf(288);
      logInfo(`displayMoveYOf(windowHeight=288): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}DisplayMoveYOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0015
     * @tc.name      WindowManage_DisplayMoveYOf_0015
     * @tc.desc      displayMoveYOf(windowHeight=384) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0015 begin`);
      const actual: number = displayMoveYOf(384);
      logInfo(`displayMoveYOf(windowHeight=384): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}DisplayMoveYOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0016
     * @tc.name      WindowManage_DisplayMoveYOf_0016
     * @tc.desc      displayMoveYOf(windowHeight=480) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0016 begin`);
      const actual: number = displayMoveYOf(480);
      logInfo(`displayMoveYOf(windowHeight=480): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}DisplayMoveYOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0017
     * @tc.name      WindowManage_DisplayMoveYOf_0017
     * @tc.desc      displayMoveYOf(windowHeight=576) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0017 begin`);
      const actual: number = displayMoveYOf(576);
      logInfo(`displayMoveYOf(windowHeight=576): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}DisplayMoveYOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0018
     * @tc.name      WindowManage_DisplayMoveYOf_0018
     * @tc.desc      displayMoveYOf(windowHeight=672) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0018 begin`);
      const actual: number = displayMoveYOf(672);
      logInfo(`displayMoveYOf(windowHeight=672): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}DisplayMoveYOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0019
     * @tc.name      WindowManage_DisplayMoveYOf_0019
     * @tc.desc      displayMoveYOf(windowHeight=768) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0019 begin`);
      const actual: number = displayMoveYOf(768);
      logInfo(`displayMoveYOf(windowHeight=768): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}DisplayMoveYOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0020
     * @tc.name      WindowManage_DisplayMoveYOf_0020
     * @tc.desc      displayMoveYOf(windowHeight=864) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0020 begin`);
      const actual: number = displayMoveYOf(864);
      logInfo(`displayMoveYOf(windowHeight=864): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}DisplayMoveYOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0021
     * @tc.name      WindowManage_DisplayMoveYOf_0021
     * @tc.desc      displayMoveYOf(windowHeight=960) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0021 begin`);
      const actual: number = displayMoveYOf(960);
      logInfo(`displayMoveYOf(windowHeight=960): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}DisplayMoveYOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0022
     * @tc.name      WindowManage_DisplayMoveYOf_0022
     * @tc.desc      displayMoveYOf(windowHeight=1056) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0022 begin`);
      const actual: number = displayMoveYOf(1056);
      logInfo(`displayMoveYOf(windowHeight=1056): actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}DisplayMoveYOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0023
     * @tc.name      WindowManage_DisplayMoveYOf_0023
     * @tc.desc      displayMoveYOf(windowHeight=1152) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0023 begin`);
      const actual: number = displayMoveYOf(1152);
      logInfo(`displayMoveYOf(windowHeight=1152): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}DisplayMoveYOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0024
     * @tc.name      WindowManage_DisplayMoveYOf_0024
     * @tc.desc      displayMoveYOf(windowHeight=1248) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0024 begin`);
      const actual: number = displayMoveYOf(1248);
      logInfo(`displayMoveYOf(windowHeight=1248): actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}DisplayMoveYOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0025
     * @tc.name      WindowManage_DisplayMoveYOf_0025
     * @tc.desc      displayMoveYOf(windowHeight=1344) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0025 begin`);
      const actual: number = displayMoveYOf(1344);
      logInfo(`displayMoveYOf(windowHeight=1344): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}DisplayMoveYOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0026
     * @tc.name      WindowManage_DisplayMoveYOf_0026
     * @tc.desc      displayMoveYOf(windowHeight=1440) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0026 begin`);
      const actual: number = displayMoveYOf(1440);
      logInfo(`displayMoveYOf(windowHeight=1440): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}DisplayMoveYOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0027
     * @tc.name      WindowManage_DisplayMoveYOf_0027
     * @tc.desc      displayMoveYOf(windowHeight=1536) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0027 begin`);
      const actual: number = displayMoveYOf(1536);
      logInfo(`displayMoveYOf(windowHeight=1536): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}DisplayMoveYOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0028
     * @tc.name      WindowManage_DisplayMoveYOf_0028
     * @tc.desc      displayMoveYOf(windowHeight=1632) returns 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0028 begin`);
      const actual: number = displayMoveYOf(1632);
      logInfo(`displayMoveYOf(windowHeight=1632): actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`${BUNDLE}DisplayMoveYOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0029
     * @tc.name      WindowManage_DisplayMoveYOf_0029
     * @tc.desc      displayMoveYOf(windowHeight=1728) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0029 begin`);
      const actual: number = displayMoveYOf(1728);
      logInfo(`displayMoveYOf(windowHeight=1728): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}DisplayMoveYOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0030
     * @tc.name      WindowManage_DisplayMoveYOf_0030
     * @tc.desc      displayMoveYOf(windowHeight=1824) returns 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0030 begin`);
      const actual: number = displayMoveYOf(1824);
      logInfo(`displayMoveYOf(windowHeight=1824): actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`${BUNDLE}DisplayMoveYOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0031
     * @tc.name      WindowManage_DisplayMoveYOf_0031
     * @tc.desc      displayMoveYOf(windowHeight=2016) returns 1008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0031 begin`);
      const actual: number = displayMoveYOf(2016);
      logInfo(`displayMoveYOf(windowHeight=2016): actual=${actual}`);
      expect(actual).assertEqual(1008);
      logInfo(`${BUNDLE}DisplayMoveYOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0032
     * @tc.name      WindowManage_DisplayMoveYOf_0032
     * @tc.desc      displayMoveYOf(windowHeight=2112) returns 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0032 begin`);
      const actual: number = displayMoveYOf(2112);
      logInfo(`displayMoveYOf(windowHeight=2112): actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}DisplayMoveYOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0033
     * @tc.name      WindowManage_DisplayMoveYOf_0033
     * @tc.desc      displayMoveYOf(windowHeight=2208) returns 1104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0033 begin`);
      const actual: number = displayMoveYOf(2208);
      logInfo(`displayMoveYOf(windowHeight=2208): actual=${actual}`);
      expect(actual).assertEqual(1104);
      logInfo(`${BUNDLE}DisplayMoveYOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0034
     * @tc.name      WindowManage_DisplayMoveYOf_0034
     * @tc.desc      displayMoveYOf(windowHeight=2304) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0034 begin`);
      const actual: number = displayMoveYOf(2304);
      logInfo(`displayMoveYOf(windowHeight=2304): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}DisplayMoveYOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0035
     * @tc.name      WindowManage_DisplayMoveYOf_0035
     * @tc.desc      displayMoveYOf(windowHeight=2400) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0035 begin`);
      const actual: number = displayMoveYOf(2400);
      logInfo(`displayMoveYOf(windowHeight=2400): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}DisplayMoveYOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0036
     * @tc.name      WindowManage_DisplayMoveYOf_0036
     * @tc.desc      displayMoveYOf(windowHeight=2496) returns 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0036 begin`);
      const actual: number = displayMoveYOf(2496);
      logInfo(`displayMoveYOf(windowHeight=2496): actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}DisplayMoveYOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0037
     * @tc.name      WindowManage_DisplayMoveYOf_0037
     * @tc.desc      displayMoveYOf(windowHeight=2592) returns 1296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0037 begin`);
      const actual: number = displayMoveYOf(2592);
      logInfo(`displayMoveYOf(windowHeight=2592): actual=${actual}`);
      expect(actual).assertEqual(1296);
      logInfo(`${BUNDLE}DisplayMoveYOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0038
     * @tc.name      WindowManage_DisplayMoveYOf_0038
     * @tc.desc      displayMoveYOf(windowHeight=2688) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0038 begin`);
      const actual: number = displayMoveYOf(2688);
      logInfo(`displayMoveYOf(windowHeight=2688): actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}DisplayMoveYOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0039
     * @tc.name      WindowManage_DisplayMoveYOf_0039
     * @tc.desc      displayMoveYOf(windowHeight=2784) returns 1392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0039 begin`);
      const actual: number = displayMoveYOf(2784);
      logInfo(`displayMoveYOf(windowHeight=2784): actual=${actual}`);
      expect(actual).assertEqual(1392);
      logInfo(`${BUNDLE}DisplayMoveYOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0040
     * @tc.name      WindowManage_DisplayMoveYOf_0040
     * @tc.desc      displayMoveYOf(windowHeight=2880) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0040 begin`);
      const actual: number = displayMoveYOf(2880);
      logInfo(`displayMoveYOf(windowHeight=2880): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}DisplayMoveYOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0041
     * @tc.name      WindowManage_DisplayMoveYOf_0041
     * @tc.desc      displayMoveYOf(windowHeight=2976) returns 1488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0041 begin`);
      const actual: number = displayMoveYOf(2976);
      logInfo(`displayMoveYOf(windowHeight=2976): actual=${actual}`);
      expect(actual).assertEqual(1488);
      logInfo(`${BUNDLE}DisplayMoveYOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0042
     * @tc.name      WindowManage_DisplayMoveYOf_0042
     * @tc.desc      displayMoveYOf(windowHeight=3072) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0042 begin`);
      const actual: number = displayMoveYOf(3072);
      logInfo(`displayMoveYOf(windowHeight=3072): actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}DisplayMoveYOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0043
     * @tc.name      WindowManage_DisplayMoveYOf_0043
     * @tc.desc      displayMoveYOf(windowHeight=3168) returns 1584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0043 begin`);
      const actual: number = displayMoveYOf(3168);
      logInfo(`displayMoveYOf(windowHeight=3168): actual=${actual}`);
      expect(actual).assertEqual(1584);
      logInfo(`${BUNDLE}DisplayMoveYOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0044
     * @tc.name      WindowManage_DisplayMoveYOf_0044
     * @tc.desc      displayMoveYOf(windowHeight=3264) returns 1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0044 begin`);
      const actual: number = displayMoveYOf(3264);
      logInfo(`displayMoveYOf(windowHeight=3264): actual=${actual}`);
      expect(actual).assertEqual(1632);
      logInfo(`${BUNDLE}DisplayMoveYOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0045
     * @tc.name      WindowManage_DisplayMoveYOf_0045
     * @tc.desc      displayMoveYOf(windowHeight=3360) returns 1680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0045 begin`);
      const actual: number = displayMoveYOf(3360);
      logInfo(`displayMoveYOf(windowHeight=3360): actual=${actual}`);
      expect(actual).assertEqual(1680);
      logInfo(`${BUNDLE}DisplayMoveYOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0046
     * @tc.name      WindowManage_DisplayMoveYOf_0046
     * @tc.desc      displayMoveYOf(windowHeight=3456) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0046 begin`);
      const actual: number = displayMoveYOf(3456);
      logInfo(`displayMoveYOf(windowHeight=3456): actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}DisplayMoveYOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0047
     * @tc.name      WindowManage_DisplayMoveYOf_0047
     * @tc.desc      displayMoveYOf(windowHeight=3552) returns 1776
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0047 begin`);
      const actual: number = displayMoveYOf(3552);
      logInfo(`displayMoveYOf(windowHeight=3552): actual=${actual}`);
      expect(actual).assertEqual(1776);
      logInfo(`${BUNDLE}DisplayMoveYOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0048
     * @tc.name      WindowManage_DisplayMoveYOf_0048
     * @tc.desc      displayMoveYOf(windowHeight=3648) returns 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0048 begin`);
      const actual: number = displayMoveYOf(3648);
      logInfo(`displayMoveYOf(windowHeight=3648): actual=${actual}`);
      expect(actual).assertEqual(1824);
      logInfo(`${BUNDLE}DisplayMoveYOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0049
     * @tc.name      WindowManage_DisplayMoveYOf_0049
     * @tc.desc      displayMoveYOf(windowHeight=3744) returns 1872
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0049 begin`);
      const actual: number = displayMoveYOf(3744);
      logInfo(`displayMoveYOf(windowHeight=3744): actual=${actual}`);
      expect(actual).assertEqual(1872);
      logInfo(`${BUNDLE}DisplayMoveYOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0050
     * @tc.name      WindowManage_DisplayMoveYOf_0050
     * @tc.desc      displayMoveYOf(windowHeight=3840) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0050 begin`);
      const actual: number = displayMoveYOf(3840);
      logInfo(`displayMoveYOf(windowHeight=3840): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}DisplayMoveYOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0051
     * @tc.name      WindowManage_DisplayMoveYOf_0051
     * @tc.desc      displayMoveYOf(windowHeight=724) returns 362
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0051 begin`);
      const actual: number = displayMoveYOf(724);
      logInfo(`displayMoveYOf(windowHeight=724): actual=${actual}`);
      expect(actual).assertEqual(362);
      logInfo(`${BUNDLE}DisplayMoveYOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0052
     * @tc.name      WindowManage_DisplayMoveYOf_0052
     * @tc.desc      displayMoveYOf(windowHeight=1561) returns 780.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0052 begin`);
      const actual: number = displayMoveYOf(1561);
      logInfo(`displayMoveYOf(windowHeight=1561): actual=${actual}`);
      expect(actual).assertClose(780.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0053
     * @tc.name      WindowManage_DisplayMoveYOf_0053
     * @tc.desc      displayMoveYOf(windowHeight=-468) returns -234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0053 begin`);
      const actual: number = displayMoveYOf(-468);
      logInfo(`displayMoveYOf(windowHeight=-468): actual=${actual}`);
      expect(actual).assertEqual(-234);
      logInfo(`${BUNDLE}DisplayMoveYOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0054
     * @tc.name      WindowManage_DisplayMoveYOf_0054
     * @tc.desc      displayMoveYOf(windowHeight=2801) returns 1400.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0054 begin`);
      const actual: number = displayMoveYOf(2801);
      logInfo(`displayMoveYOf(windowHeight=2801): actual=${actual}`);
      expect(actual).assertClose(1400.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0055
     * @tc.name      WindowManage_DisplayMoveYOf_0055
     * @tc.desc      displayMoveYOf(windowHeight=44.42) returns 22.21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0055 begin`);
      const actual: number = displayMoveYOf(44.42);
      logInfo(`displayMoveYOf(windowHeight=44.42): actual=${actual}`);
      expect(actual).assertClose(22.21, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0056
     * @tc.name      WindowManage_DisplayMoveYOf_0056
     * @tc.desc      displayMoveYOf(windowHeight=-753) returns -376.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0056 begin`);
      const actual: number = displayMoveYOf(-753);
      logInfo(`displayMoveYOf(windowHeight=-753): actual=${actual}`);
      expect(actual).assertClose(-376.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0057
     * @tc.name      WindowManage_DisplayMoveYOf_0057
     * @tc.desc      displayMoveYOf(windowHeight=3531) returns 1765.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0057 begin`);
      const actual: number = displayMoveYOf(3531);
      logInfo(`displayMoveYOf(windowHeight=3531): actual=${actual}`);
      expect(actual).assertClose(1765.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0058
     * @tc.name      WindowManage_DisplayMoveYOf_0058
     * @tc.desc      displayMoveYOf(windowHeight=1191.47) returns 595.735
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0058 begin`);
      const actual: number = displayMoveYOf(1191.47);
      logInfo(`displayMoveYOf(windowHeight=1191.47): actual=${actual}`);
      expect(actual).assertClose(595.735, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0059
     * @tc.name      WindowManage_DisplayMoveYOf_0059
     * @tc.desc      displayMoveYOf(windowHeight=-1331) returns -665.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0059 begin`);
      const actual: number = displayMoveYOf(-1331);
      logInfo(`displayMoveYOf(windowHeight=-1331): actual=${actual}`);
      expect(actual).assertClose(-665.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0060
     * @tc.name      WindowManage_DisplayMoveYOf_0060
     * @tc.desc      displayMoveYOf(windowHeight=1587.98) returns 793.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0060 begin`);
      const actual: number = displayMoveYOf(1587.98);
      logInfo(`displayMoveYOf(windowHeight=1587.98): actual=${actual}`);
      expect(actual).assertClose(793.99, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0061
     * @tc.name      WindowManage_DisplayMoveYOf_0061
     * @tc.desc      displayMoveYOf(windowHeight=1531) returns 765.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0061 begin`);
      const actual: number = displayMoveYOf(1531);
      logInfo(`displayMoveYOf(windowHeight=1531): actual=${actual}`);
      expect(actual).assertClose(765.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0062
     * @tc.name      WindowManage_DisplayMoveYOf_0062
     * @tc.desc      displayMoveYOf(windowHeight=1567.12) returns 783.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0062 begin`);
      const actual: number = displayMoveYOf(1567.12);
      logInfo(`displayMoveYOf(windowHeight=1567.12): actual=${actual}`);
      expect(actual).assertClose(783.56, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0063
     * @tc.name      WindowManage_DisplayMoveYOf_0063
     * @tc.desc      displayMoveYOf(windowHeight=2210) returns 1105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0063 begin`);
      const actual: number = displayMoveYOf(2210);
      logInfo(`displayMoveYOf(windowHeight=2210): actual=${actual}`);
      expect(actual).assertEqual(1105);
      logInfo(`${BUNDLE}DisplayMoveYOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0064
     * @tc.name      WindowManage_DisplayMoveYOf_0064
     * @tc.desc      displayMoveYOf(windowHeight=365) returns 182.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0064 begin`);
      const actual: number = displayMoveYOf(365);
      logInfo(`displayMoveYOf(windowHeight=365): actual=${actual}`);
      expect(actual).assertClose(182.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0065
     * @tc.name      WindowManage_DisplayMoveYOf_0065
     * @tc.desc      displayMoveYOf(windowHeight=1713.17) returns 856.585
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0065 begin`);
      const actual: number = displayMoveYOf(1713.17);
      logInfo(`displayMoveYOf(windowHeight=1713.17): actual=${actual}`);
      expect(actual).assertClose(856.585, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0066
     * @tc.name      WindowManage_DisplayMoveYOf_0066
     * @tc.desc      displayMoveYOf(windowHeight=-501) returns -250.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0066 begin`);
      const actual: number = displayMoveYOf(-501);
      logInfo(`displayMoveYOf(windowHeight=-501): actual=${actual}`);
      expect(actual).assertClose(-250.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0067
     * @tc.name      WindowManage_DisplayMoveYOf_0067
     * @tc.desc      displayMoveYOf(windowHeight=711.07) returns 355.535
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0067 begin`);
      const actual: number = displayMoveYOf(711.07);
      logInfo(`displayMoveYOf(windowHeight=711.07): actual=${actual}`);
      expect(actual).assertClose(355.535, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0068
     * @tc.name      WindowManage_DisplayMoveYOf_0068
     * @tc.desc      displayMoveYOf(windowHeight=2090) returns 1045
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0068 begin`);
      const actual: number = displayMoveYOf(2090);
      logInfo(`displayMoveYOf(windowHeight=2090): actual=${actual}`);
      expect(actual).assertEqual(1045);
      logInfo(`${BUNDLE}DisplayMoveYOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0069
     * @tc.name      WindowManage_DisplayMoveYOf_0069
     * @tc.desc      displayMoveYOf(windowHeight=1181) returns 590.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0069 begin`);
      const actual: number = displayMoveYOf(1181);
      logInfo(`displayMoveYOf(windowHeight=1181): actual=${actual}`);
      expect(actual).assertClose(590.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0070
     * @tc.name      WindowManage_DisplayMoveYOf_0070
     * @tc.desc      displayMoveYOf(windowHeight=-470) returns -235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0070 begin`);
      const actual: number = displayMoveYOf(-470);
      logInfo(`displayMoveYOf(windowHeight=-470): actual=${actual}`);
      expect(actual).assertEqual(-235);
      logInfo(`${BUNDLE}DisplayMoveYOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0071
     * @tc.name      WindowManage_DisplayMoveYOf_0071
     * @tc.desc      displayMoveYOf(windowHeight=2301) returns 1150.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0071 begin`);
      const actual: number = displayMoveYOf(2301);
      logInfo(`displayMoveYOf(windowHeight=2301): actual=${actual}`);
      expect(actual).assertClose(1150.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0072
     * @tc.name      WindowManage_DisplayMoveYOf_0072
     * @tc.desc      displayMoveYOf(windowHeight=3308) returns 1654
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0072 begin`);
      const actual: number = displayMoveYOf(3308);
      logInfo(`displayMoveYOf(windowHeight=3308): actual=${actual}`);
      expect(actual).assertEqual(1654);
      logInfo(`${BUNDLE}DisplayMoveYOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0073
     * @tc.name      WindowManage_DisplayMoveYOf_0073
     * @tc.desc      displayMoveYOf(windowHeight=1274.97) returns 637.485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0073 begin`);
      const actual: number = displayMoveYOf(1274.97);
      logInfo(`displayMoveYOf(windowHeight=1274.97): actual=${actual}`);
      expect(actual).assertClose(637.485, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0074
     * @tc.name      WindowManage_DisplayMoveYOf_0074
     * @tc.desc      displayMoveYOf(windowHeight=3074) returns 1537
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0074 begin`);
      const actual: number = displayMoveYOf(3074);
      logInfo(`displayMoveYOf(windowHeight=3074): actual=${actual}`);
      expect(actual).assertEqual(1537);
      logInfo(`${BUNDLE}DisplayMoveYOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0075
     * @tc.name      WindowManage_DisplayMoveYOf_0075
     * @tc.desc      displayMoveYOf(windowHeight=2487) returns 1243.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0075 begin`);
      const actual: number = displayMoveYOf(2487);
      logInfo(`displayMoveYOf(windowHeight=2487): actual=${actual}`);
      expect(actual).assertClose(1243.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0076
     * @tc.name      WindowManage_DisplayMoveYOf_0076
     * @tc.desc      displayMoveYOf(windowHeight=1333) returns 666.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0076 begin`);
      const actual: number = displayMoveYOf(1333);
      logInfo(`displayMoveYOf(windowHeight=1333): actual=${actual}`);
      expect(actual).assertClose(666.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0077
     * @tc.name      WindowManage_DisplayMoveYOf_0077
     * @tc.desc      displayMoveYOf(windowHeight=1815) returns 907.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0077 begin`);
      const actual: number = displayMoveYOf(1815);
      logInfo(`displayMoveYOf(windowHeight=1815): actual=${actual}`);
      expect(actual).assertClose(907.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0078
     * @tc.name      WindowManage_DisplayMoveYOf_0078
     * @tc.desc      displayMoveYOf(windowHeight=1841.89) returns 920.945
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0078 begin`);
      const actual: number = displayMoveYOf(1841.89);
      logInfo(`displayMoveYOf(windowHeight=1841.89): actual=${actual}`);
      expect(actual).assertClose(920.945, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0079
     * @tc.name      WindowManage_DisplayMoveYOf_0079
     * @tc.desc      displayMoveYOf(windowHeight=3200) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0079 begin`);
      const actual: number = displayMoveYOf(3200);
      logInfo(`displayMoveYOf(windowHeight=3200): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}DisplayMoveYOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0080
     * @tc.name      WindowManage_DisplayMoveYOf_0080
     * @tc.desc      displayMoveYOf(windowHeight=564.22) returns 282.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0080 begin`);
      const actual: number = displayMoveYOf(564.22);
      logInfo(`displayMoveYOf(windowHeight=564.22): actual=${actual}`);
      expect(actual).assertClose(282.11, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0081
     * @tc.name      WindowManage_DisplayMoveYOf_0081
     * @tc.desc      displayMoveYOf(windowHeight=2989) returns 1494.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0081 begin`);
      const actual: number = displayMoveYOf(2989);
      logInfo(`displayMoveYOf(windowHeight=2989): actual=${actual}`);
      expect(actual).assertClose(1494.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0082
     * @tc.name      WindowManage_DisplayMoveYOf_0082
     * @tc.desc      displayMoveYOf(windowHeight=-1439) returns -719.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0082 begin`);
      const actual: number = displayMoveYOf(-1439);
      logInfo(`displayMoveYOf(windowHeight=-1439): actual=${actual}`);
      expect(actual).assertClose(-719.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0083
     * @tc.name      WindowManage_DisplayMoveYOf_0083
     * @tc.desc      displayMoveYOf(windowHeight=-45) returns -22.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0083 begin`);
      const actual: number = displayMoveYOf(-45);
      logInfo(`displayMoveYOf(windowHeight=-45): actual=${actual}`);
      expect(actual).assertClose(-22.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0084
     * @tc.name      WindowManage_DisplayMoveYOf_0084
     * @tc.desc      displayMoveYOf(windowHeight=2806) returns 1403
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0084 begin`);
      const actual: number = displayMoveYOf(2806);
      logInfo(`displayMoveYOf(windowHeight=2806): actual=${actual}`);
      expect(actual).assertEqual(1403);
      logInfo(`${BUNDLE}DisplayMoveYOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0085
     * @tc.name      WindowManage_DisplayMoveYOf_0085
     * @tc.desc      displayMoveYOf(windowHeight=-299) returns -149.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0085 begin`);
      const actual: number = displayMoveYOf(-299);
      logInfo(`displayMoveYOf(windowHeight=-299): actual=${actual}`);
      expect(actual).assertClose(-149.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0086
     * @tc.name      WindowManage_DisplayMoveYOf_0086
     * @tc.desc      displayMoveYOf(windowHeight=-925) returns -462.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0086 begin`);
      const actual: number = displayMoveYOf(-925);
      logInfo(`displayMoveYOf(windowHeight=-925): actual=${actual}`);
      expect(actual).assertClose(-462.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0087
     * @tc.name      WindowManage_DisplayMoveYOf_0087
     * @tc.desc      displayMoveYOf(windowHeight=1119.54) returns 559.77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0087 begin`);
      const actual: number = displayMoveYOf(1119.54);
      logInfo(`displayMoveYOf(windowHeight=1119.54): actual=${actual}`);
      expect(actual).assertClose(559.77, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0088
     * @tc.name      WindowManage_DisplayMoveYOf_0088
     * @tc.desc      displayMoveYOf(windowHeight=-1459) returns -729.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0088 begin`);
      const actual: number = displayMoveYOf(-1459);
      logInfo(`displayMoveYOf(windowHeight=-1459): actual=${actual}`);
      expect(actual).assertClose(-729.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0089
     * @tc.name      WindowManage_DisplayMoveYOf_0089
     * @tc.desc      displayMoveYOf(windowHeight=1872) returns 936
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0089 begin`);
      const actual: number = displayMoveYOf(1872);
      logInfo(`displayMoveYOf(windowHeight=1872): actual=${actual}`);
      expect(actual).assertEqual(936);
      logInfo(`${BUNDLE}DisplayMoveYOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0090
     * @tc.name      WindowManage_DisplayMoveYOf_0090
     * @tc.desc      displayMoveYOf(windowHeight=12.33) returns 6.165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0090 begin`);
      const actual: number = displayMoveYOf(12.33);
      logInfo(`displayMoveYOf(windowHeight=12.33): actual=${actual}`);
      expect(actual).assertClose(6.165, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0091
     * @tc.name      WindowManage_DisplayMoveYOf_0091
     * @tc.desc      displayMoveYOf(windowHeight=2839) returns 1419.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0091 begin`);
      const actual: number = displayMoveYOf(2839);
      logInfo(`displayMoveYOf(windowHeight=2839): actual=${actual}`);
      expect(actual).assertClose(1419.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0092
     * @tc.name      WindowManage_DisplayMoveYOf_0092
     * @tc.desc      displayMoveYOf(windowHeight=2938) returns 1469
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0092 begin`);
      const actual: number = displayMoveYOf(2938);
      logInfo(`displayMoveYOf(windowHeight=2938): actual=${actual}`);
      expect(actual).assertEqual(1469);
      logInfo(`${BUNDLE}DisplayMoveYOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0093
     * @tc.name      WindowManage_DisplayMoveYOf_0093
     * @tc.desc      displayMoveYOf(windowHeight=-60) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0093 begin`);
      const actual: number = displayMoveYOf(-60);
      logInfo(`displayMoveYOf(windowHeight=-60): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}DisplayMoveYOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0094
     * @tc.name      WindowManage_DisplayMoveYOf_0094
     * @tc.desc      displayMoveYOf(windowHeight=1570.11) returns 785.055
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0094 begin`);
      const actual: number = displayMoveYOf(1570.11);
      logInfo(`displayMoveYOf(windowHeight=1570.11): actual=${actual}`);
      expect(actual).assertClose(785.055, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0095
     * @tc.name      WindowManage_DisplayMoveYOf_0095
     * @tc.desc      displayMoveYOf(windowHeight=118) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0095 begin`);
      const actual: number = displayMoveYOf(118);
      logInfo(`displayMoveYOf(windowHeight=118): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}DisplayMoveYOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0096
     * @tc.name      WindowManage_DisplayMoveYOf_0096
     * @tc.desc      displayMoveYOf(windowHeight=584) returns 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0096 begin`);
      const actual: number = displayMoveYOf(584);
      logInfo(`displayMoveYOf(windowHeight=584): actual=${actual}`);
      expect(actual).assertEqual(292);
      logInfo(`${BUNDLE}DisplayMoveYOf_0096 end`);
    });
  });
}
