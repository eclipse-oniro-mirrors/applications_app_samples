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
import { settleHeightOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for settleHeightOf (50 cases). */
export default function settleHeightOfTest(): void {
  describe('SettleHeightOfTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0001
     * @tc.name      ExpandTitle_SettleHeightOf_0001
     * @tc.desc      settleHeightOf(heightValue=0) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_SettleHeightOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0001 begin`);
      const actual: number = settleHeightOf(0);
      logInfo(`settleHeightOf(heightValue=0): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0002
     * @tc.name      ExpandTitle_SettleHeightOf_0002
     * @tc.desc      settleHeightOf(heightValue=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_SettleHeightOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0002 begin`);
      const actual: number = settleHeightOf(100);
      logInfo(`settleHeightOf(heightValue=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0003
     * @tc.name      ExpandTitle_SettleHeightOf_0003
     * @tc.desc      settleHeightOf(heightValue=1) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0003 begin`);
      const actual: number = settleHeightOf(1);
      logInfo(`settleHeightOf(heightValue=1): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0004
     * @tc.name      ExpandTitle_SettleHeightOf_0004
     * @tc.desc      settleHeightOf(heightValue=99) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_SettleHeightOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0004 begin`);
      const actual: number = settleHeightOf(99);
      logInfo(`settleHeightOf(heightValue=99): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0005
     * @tc.name      ExpandTitle_SettleHeightOf_0005
     * @tc.desc      settleHeightOf(heightValue=101) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_SettleHeightOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0005 begin`);
      const actual: number = settleHeightOf(101);
      logInfo(`settleHeightOf(heightValue=101): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0006
     * @tc.name      ExpandTitle_SettleHeightOf_0006
     * @tc.desc      settleHeightOf(heightValue=200) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0006 begin`);
      const actual: number = settleHeightOf(200);
      logInfo(`settleHeightOf(heightValue=200): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0007
     * @tc.name      ExpandTitle_SettleHeightOf_0007
     * @tc.desc      settleHeightOf(heightValue=50) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0007 begin`);
      const actual: number = settleHeightOf(50);
      logInfo(`settleHeightOf(heightValue=50): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0008
     * @tc.name      ExpandTitle_SettleHeightOf_0008
     * @tc.desc      settleHeightOf(heightValue=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_SettleHeightOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0008 begin`);
      const actual: number = settleHeightOf(80);
      logInfo(`settleHeightOf(heightValue=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0009
     * @tc.name      ExpandTitle_SettleHeightOf_0009
     * @tc.desc      settleHeightOf(heightValue=79) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_SettleHeightOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0009 begin`);
      const actual: number = settleHeightOf(79);
      logInfo(`settleHeightOf(heightValue=79): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0010
     * @tc.name      ExpandTitle_SettleHeightOf_0010
     * @tc.desc      settleHeightOf(heightValue=81) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_SettleHeightOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0010 begin`);
      const actual: number = settleHeightOf(81);
      logInfo(`settleHeightOf(heightValue=81): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0011
     * @tc.name      ExpandTitle_SettleHeightOf_0011
     * @tc.desc      settleHeightOf(heightValue=160) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0011 begin`);
      const actual: number = settleHeightOf(160);
      logInfo(`settleHeightOf(heightValue=160): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0012
     * @tc.name      ExpandTitle_SettleHeightOf_0012
     * @tc.desc      settleHeightOf(heightValue=40) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0012 begin`);
      const actual: number = settleHeightOf(40);
      logInfo(`settleHeightOf(heightValue=40): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0013
     * @tc.name      ExpandTitle_SettleHeightOf_0013
     * @tc.desc      settleHeightOf(heightValue=360) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0013 begin`);
      const actual: number = settleHeightOf(360);
      logInfo(`settleHeightOf(heightValue=360): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0014
     * @tc.name      ExpandTitle_SettleHeightOf_0014
     * @tc.desc      settleHeightOf(heightValue=720) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0014 begin`);
      const actual: number = settleHeightOf(720);
      logInfo(`settleHeightOf(heightValue=720): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0015
     * @tc.name      ExpandTitle_SettleHeightOf_0015
     * @tc.desc      settleHeightOf(heightValue=1080) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0015 begin`);
      const actual: number = settleHeightOf(1080);
      logInfo(`settleHeightOf(heightValue=1080): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0016
     * @tc.name      ExpandTitle_SettleHeightOf_0016
     * @tc.desc      settleHeightOf(heightValue=1920) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0016 begin`);
      const actual: number = settleHeightOf(1920);
      logInfo(`settleHeightOf(heightValue=1920): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0017
     * @tc.name      ExpandTitle_SettleHeightOf_0017
     * @tc.desc      settleHeightOf(heightValue=-1) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_SettleHeightOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0017 begin`);
      const actual: number = settleHeightOf(-1);
      logInfo(`settleHeightOf(heightValue=-1): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0018
     * @tc.name      ExpandTitle_SettleHeightOf_0018
     * @tc.desc      settleHeightOf(heightValue=2) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0018 begin`);
      const actual: number = settleHeightOf(2);
      logInfo(`settleHeightOf(heightValue=2): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0019
     * @tc.name      ExpandTitle_SettleHeightOf_0019
     * @tc.desc      settleHeightOf(heightValue=3) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0019 begin`);
      const actual: number = settleHeightOf(3);
      logInfo(`settleHeightOf(heightValue=3): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0020
     * @tc.name      ExpandTitle_SettleHeightOf_0020
     * @tc.desc      settleHeightOf(heightValue=10) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0020 begin`);
      const actual: number = settleHeightOf(10);
      logInfo(`settleHeightOf(heightValue=10): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SettleHeightOf_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0021
     * @tc.name      ExpandTitle_SettleHeightOf_0021
     * @tc.desc      settleHeightOf(heightValue=96) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0021 begin`);
      const actual: number = settleHeightOf(96);
      logInfo(`settleHeightOf(heightValue=96): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0022
     * @tc.name      ExpandTitle_SettleHeightOf_0022
     * @tc.desc      settleHeightOf(heightValue=192) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0022 begin`);
      const actual: number = settleHeightOf(192);
      logInfo(`settleHeightOf(heightValue=192): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0023
     * @tc.name      ExpandTitle_SettleHeightOf_0023
     * @tc.desc      settleHeightOf(heightValue=288) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0023 begin`);
      const actual: number = settleHeightOf(288);
      logInfo(`settleHeightOf(heightValue=288): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0024
     * @tc.name      ExpandTitle_SettleHeightOf_0024
     * @tc.desc      settleHeightOf(heightValue=384) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0024 begin`);
      const actual: number = settleHeightOf(384);
      logInfo(`settleHeightOf(heightValue=384): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0025
     * @tc.name      ExpandTitle_SettleHeightOf_0025
     * @tc.desc      settleHeightOf(heightValue=480) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0025 begin`);
      const actual: number = settleHeightOf(480);
      logInfo(`settleHeightOf(heightValue=480): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0026
     * @tc.name      ExpandTitle_SettleHeightOf_0026
     * @tc.desc      settleHeightOf(heightValue=576) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0026 begin`);
      const actual: number = settleHeightOf(576);
      logInfo(`settleHeightOf(heightValue=576): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0027
     * @tc.name      ExpandTitle_SettleHeightOf_0027
     * @tc.desc      settleHeightOf(heightValue=672) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0027 begin`);
      const actual: number = settleHeightOf(672);
      logInfo(`settleHeightOf(heightValue=672): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0028
     * @tc.name      ExpandTitle_SettleHeightOf_0028
     * @tc.desc      settleHeightOf(heightValue=768) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0028 begin`);
      const actual: number = settleHeightOf(768);
      logInfo(`settleHeightOf(heightValue=768): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0029
     * @tc.name      ExpandTitle_SettleHeightOf_0029
     * @tc.desc      settleHeightOf(heightValue=864) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0029 begin`);
      const actual: number = settleHeightOf(864);
      logInfo(`settleHeightOf(heightValue=864): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0030
     * @tc.name      ExpandTitle_SettleHeightOf_0030
     * @tc.desc      settleHeightOf(heightValue=960) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0030 begin`);
      const actual: number = settleHeightOf(960);
      logInfo(`settleHeightOf(heightValue=960): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0031
     * @tc.name      ExpandTitle_SettleHeightOf_0031
     * @tc.desc      settleHeightOf(heightValue=1056) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0031 begin`);
      const actual: number = settleHeightOf(1056);
      logInfo(`settleHeightOf(heightValue=1056): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0032
     * @tc.name      ExpandTitle_SettleHeightOf_0032
     * @tc.desc      settleHeightOf(heightValue=1152) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0032 begin`);
      const actual: number = settleHeightOf(1152);
      logInfo(`settleHeightOf(heightValue=1152): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0033
     * @tc.name      ExpandTitle_SettleHeightOf_0033
     * @tc.desc      settleHeightOf(heightValue=1248) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0033 begin`);
      const actual: number = settleHeightOf(1248);
      logInfo(`settleHeightOf(heightValue=1248): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0034
     * @tc.name      ExpandTitle_SettleHeightOf_0034
     * @tc.desc      settleHeightOf(heightValue=1344) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0034 begin`);
      const actual: number = settleHeightOf(1344);
      logInfo(`settleHeightOf(heightValue=1344): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0035
     * @tc.name      ExpandTitle_SettleHeightOf_0035
     * @tc.desc      settleHeightOf(heightValue=1440) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0035 begin`);
      const actual: number = settleHeightOf(1440);
      logInfo(`settleHeightOf(heightValue=1440): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0036
     * @tc.name      ExpandTitle_SettleHeightOf_0036
     * @tc.desc      settleHeightOf(heightValue=1536) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0036 begin`);
      const actual: number = settleHeightOf(1536);
      logInfo(`settleHeightOf(heightValue=1536): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0037
     * @tc.name      ExpandTitle_SettleHeightOf_0037
     * @tc.desc      settleHeightOf(heightValue=1632) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0037 begin`);
      const actual: number = settleHeightOf(1632);
      logInfo(`settleHeightOf(heightValue=1632): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0038
     * @tc.name      ExpandTitle_SettleHeightOf_0038
     * @tc.desc      settleHeightOf(heightValue=1728) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0038 begin`);
      const actual: number = settleHeightOf(1728);
      logInfo(`settleHeightOf(heightValue=1728): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0039
     * @tc.name      ExpandTitle_SettleHeightOf_0039
     * @tc.desc      settleHeightOf(heightValue=1824) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0039 begin`);
      const actual: number = settleHeightOf(1824);
      logInfo(`settleHeightOf(heightValue=1824): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0040
     * @tc.name      ExpandTitle_SettleHeightOf_0040
     * @tc.desc      settleHeightOf(heightValue=2016) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0040 begin`);
      const actual: number = settleHeightOf(2016);
      logInfo(`settleHeightOf(heightValue=2016): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0041
     * @tc.name      ExpandTitle_SettleHeightOf_0041
     * @tc.desc      settleHeightOf(heightValue=2112) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0041 begin`);
      const actual: number = settleHeightOf(2112);
      logInfo(`settleHeightOf(heightValue=2112): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0042
     * @tc.name      ExpandTitle_SettleHeightOf_0042
     * @tc.desc      settleHeightOf(heightValue=2208) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0042 begin`);
      const actual: number = settleHeightOf(2208);
      logInfo(`settleHeightOf(heightValue=2208): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0043
     * @tc.name      ExpandTitle_SettleHeightOf_0043
     * @tc.desc      settleHeightOf(heightValue=2304) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0043 begin`);
      const actual: number = settleHeightOf(2304);
      logInfo(`settleHeightOf(heightValue=2304): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0044
     * @tc.name      ExpandTitle_SettleHeightOf_0044
     * @tc.desc      settleHeightOf(heightValue=2400) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0044 begin`);
      const actual: number = settleHeightOf(2400);
      logInfo(`settleHeightOf(heightValue=2400): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0045
     * @tc.name      ExpandTitle_SettleHeightOf_0045
     * @tc.desc      settleHeightOf(heightValue=2496) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0045 begin`);
      const actual: number = settleHeightOf(2496);
      logInfo(`settleHeightOf(heightValue=2496): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0046
     * @tc.name      ExpandTitle_SettleHeightOf_0046
     * @tc.desc      settleHeightOf(heightValue=2592) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0046 begin`);
      const actual: number = settleHeightOf(2592);
      logInfo(`settleHeightOf(heightValue=2592): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0047
     * @tc.name      ExpandTitle_SettleHeightOf_0047
     * @tc.desc      settleHeightOf(heightValue=2688) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0047 begin`);
      const actual: number = settleHeightOf(2688);
      logInfo(`settleHeightOf(heightValue=2688): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0048
     * @tc.name      ExpandTitle_SettleHeightOf_0048
     * @tc.desc      settleHeightOf(heightValue=2784) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0048 begin`);
      const actual: number = settleHeightOf(2784);
      logInfo(`settleHeightOf(heightValue=2784): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0049
     * @tc.name      ExpandTitle_SettleHeightOf_0049
     * @tc.desc      settleHeightOf(heightValue=2880) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0049 begin`);
      const actual: number = settleHeightOf(2880);
      logInfo(`settleHeightOf(heightValue=2880): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SETTLE_HEIGHT_OF_0050
     * @tc.name      ExpandTitle_SettleHeightOf_0050
     * @tc.desc      settleHeightOf(heightValue=2976) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_SettleHeightOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SettleHeightOf_0050 begin`);
      const actual: number = settleHeightOf(2976);
      logInfo(`settleHeightOf(heightValue=2976): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SettleHeightOf_0050 end`);
    });
  });
}
