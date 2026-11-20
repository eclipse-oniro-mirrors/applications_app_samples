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
import { heightChangeOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for heightChangeOf (96 cases). */
export default function heightChangeOfTest(): void {
  describe('HeightChangeOfTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0001
     * @tc.name      ExpandTitle_HeightChangeOf_0001
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_HeightChangeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0001 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0002
     * @tc.name      ExpandTitle_HeightChangeOf_0002
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1, normalTitleHeight=0, expandTitleHeight=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_HeightChangeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0002 begin`);
      const actual: number = heightChangeOf(-100, 1, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0003
     * @tc.name      ExpandTitle_HeightChangeOf_0003
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=0, expandTitleHeight=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0003 begin`);
      const actual: number = heightChangeOf(-100, 100, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0004
     * @tc.name      ExpandTitle_HeightChangeOf_0004
     * @tc.desc      heightChangeOf(offset=-100, heightValue=360, normalTitleHeight=0, expandTitleHeight=0) returns -360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0004 begin`);
      const actual: number = heightChangeOf(-100, 360, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=3...: actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}HeightChangeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0005
     * @tc.name      ExpandTitle_HeightChangeOf_0005
     * @tc.desc      heightChangeOf(offset=-100, heightValue=720, normalTitleHeight=0, expandTitleHeight=0) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0005 begin`);
      const actual: number = heightChangeOf(-100, 720, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=7...: actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}HeightChangeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0006
     * @tc.name      ExpandTitle_HeightChangeOf_0006
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=0, expandTitleHeight=0) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0006 begin`);
      const actual: number = heightChangeOf(-100, 1080, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-1080);
      logInfo(`${BUNDLE}HeightChangeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0007
     * @tc.name      ExpandTitle_HeightChangeOf_0007
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1920, normalTitleHeight=0, expandTitleHeight=0) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0007 begin`);
      const actual: number = heightChangeOf(-100, 1920, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-1920);
      logInfo(`${BUNDLE}HeightChangeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0008
     * @tc.name      ExpandTitle_HeightChangeOf_0008
     * @tc.desc      heightChangeOf(offset=-100, heightValue=-1, normalTitleHeight=0, expandTitleHeight=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0008 begin`);
      const actual: number = heightChangeOf(-100, -1, 0, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0009
     * @tc.name      ExpandTitle_HeightChangeOf_0009
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=100, expandTitleHeight=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0009 begin`);
      const actual: number = heightChangeOf(-100, 0, 100, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}HeightChangeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0010
     * @tc.name      ExpandTitle_HeightChangeOf_0010
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=360, expandTitleHeight=0) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0010 begin`);
      const actual: number = heightChangeOf(-100, 0, 360, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0011
     * @tc.name      ExpandTitle_HeightChangeOf_0011
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=720, expandTitleHeight=0) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0011 begin`);
      const actual: number = heightChangeOf(-100, 0, 720, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0012
     * @tc.name      ExpandTitle_HeightChangeOf_0012
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=1080, expandTitleHeight=0) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0012 begin`);
      const actual: number = heightChangeOf(-100, 0, 1080, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightChangeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0013
     * @tc.name      ExpandTitle_HeightChangeOf_0013
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=1920, expandTitleHeight=0) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0013 begin`);
      const actual: number = heightChangeOf(-100, 0, 1920, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}HeightChangeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0014
     * @tc.name      ExpandTitle_HeightChangeOf_0014
     * @tc.desc      heightChangeOf(offset=50, heightValue=360, normalTitleHeight=-1, expandTitleHeight=1) returns -359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0014 begin`);
      const actual: number = heightChangeOf(50, 360, -1, 1);
      logInfo(`heightChangeOf(offset=50, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(-359);
      logInfo(`${BUNDLE}HeightChangeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0015
     * @tc.name      ExpandTitle_HeightChangeOf_0015
     * @tc.desc      heightChangeOf(offset=2, heightValue=720, normalTitleHeight=1920, expandTitleHeight=1080) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0015 begin`);
      const actual: number = heightChangeOf(2, 720, 1920, 1080);
      logInfo(`heightChangeOf(offset=2, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}HeightChangeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0016
     * @tc.name      ExpandTitle_HeightChangeOf_0016
     * @tc.desc      heightChangeOf(offset=2, heightValue=100, normalTitleHeight=1, expandTitleHeight=720) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0016 begin`);
      const actual: number = heightChangeOf(2, 100, 1, 720);
      logInfo(`heightChangeOf(offset=2, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0017
     * @tc.name      ExpandTitle_HeightChangeOf_0017
     * @tc.desc      heightChangeOf(offset=1, heightValue=1, normalTitleHeight=100, expandTitleHeight=1080) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0017 begin`);
      const actual: number = heightChangeOf(1, 1, 100, 1080);
      logInfo(`heightChangeOf(offset=1, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}HeightChangeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0018
     * @tc.name      ExpandTitle_HeightChangeOf_0018
     * @tc.desc      heightChangeOf(offset=1, heightValue=1920, normalTitleHeight=0, expandTitleHeight=720) returns -...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0018 begin`);
      const actual: number = heightChangeOf(1, 1920, 0, 720);
      logInfo(`heightChangeOf(offset=1, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0019
     * @tc.name      ExpandTitle_HeightChangeOf_0019
     * @tc.desc      heightChangeOf(offset=3, heightValue=1920, normalTitleHeight=1, expandTitleHeight=1) returns -1919
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0019 begin`);
      const actual: number = heightChangeOf(3, 1920, 1, 1);
      logInfo(`heightChangeOf(offset=3, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1919);
      logInfo(`${BUNDLE}HeightChangeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0020
     * @tc.name      ExpandTitle_HeightChangeOf_0020
     * @tc.desc      heightChangeOf(offset=100, heightValue=-1, normalTitleHeight=360, expandTitleHeight=720) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0020 begin`);
      const actual: number = heightChangeOf(100, -1, 360, 720);
      logInfo(`heightChangeOf(offset=100, heightValue=-1...: actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}HeightChangeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0021
     * @tc.name      ExpandTitle_HeightChangeOf_0021
     * @tc.desc      heightChangeOf(offset=-1, heightValue=-1, normalTitleHeight=1920, expandTitleHeight=360) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0021 begin`);
      const actual: number = heightChangeOf(-1, -1, 1920, 360);
      logInfo(`heightChangeOf(offset=-1, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}HeightChangeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0022
     * @tc.name      ExpandTitle_HeightChangeOf_0022
     * @tc.desc      heightChangeOf(offset=1, heightValue=-1, normalTitleHeight=100, expandTitleHeight=1920) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0022 begin`);
      const actual: number = heightChangeOf(1, -1, 100, 1920);
      logInfo(`heightChangeOf(offset=1, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}HeightChangeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0023
     * @tc.name      ExpandTitle_HeightChangeOf_0023
     * @tc.desc      heightChangeOf(offset=100, heightValue=1, normalTitleHeight=1080, expandTitleHeight=1920) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0023 begin`);
      const actual: number = heightChangeOf(100, 1, 1080, 1920);
      logInfo(`heightChangeOf(offset=100, heightValue=1,...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}HeightChangeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0024
     * @tc.name      ExpandTitle_HeightChangeOf_0024
     * @tc.desc      heightChangeOf(offset=1, heightValue=1080, normalTitleHeight=1920, expandTitleHeight=1920) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0024 begin`);
      const actual: number = heightChangeOf(1, 1080, 1920, 1920);
      logInfo(`heightChangeOf(offset=1, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}HeightChangeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0025
     * @tc.name      ExpandTitle_HeightChangeOf_0025
     * @tc.desc      heightChangeOf(offset=100, heightValue=1920, normalTitleHeight=100, expandTitleHeight=360) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0025 begin`);
      const actual: number = heightChangeOf(100, 1920, 100, 360);
      logInfo(`heightChangeOf(offset=100, heightValue=19...: actual=${actual}`);
      expect(actual).assertEqual(-1560);
      logInfo(`${BUNDLE}HeightChangeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0026
     * @tc.name      ExpandTitle_HeightChangeOf_0026
     * @tc.desc      heightChangeOf(offset=2, heightValue=1920, normalTitleHeight=1080, expandTitleHeight=1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0026 begin`);
      const actual: number = heightChangeOf(2, 1920, 1080, 1);
      logInfo(`heightChangeOf(offset=2, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-840);
      logInfo(`${BUNDLE}HeightChangeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0027
     * @tc.name      ExpandTitle_HeightChangeOf_0027
     * @tc.desc      heightChangeOf(offset=100, heightValue=720, normalTitleHeight=100, expandTitleHeight=-1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0027 begin`);
      const actual: number = heightChangeOf(100, 720, 100, -1);
      logInfo(`heightChangeOf(offset=100, heightValue=72...: actual=${actual}`);
      expect(actual).assertEqual(-620);
      logInfo(`${BUNDLE}HeightChangeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0028
     * @tc.name      ExpandTitle_HeightChangeOf_0028
     * @tc.desc      heightChangeOf(offset=-1, heightValue=-1, normalTitleHeight=720, expandTitleHeight=1920) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0028 begin`);
      const actual: number = heightChangeOf(-1, -1, 720, 1920);
      logInfo(`heightChangeOf(offset=-1, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}HeightChangeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0029
     * @tc.name      ExpandTitle_HeightChangeOf_0029
     * @tc.desc      heightChangeOf(offset=2, heightValue=100, normalTitleHeight=-1, expandTitleHeight=1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0029 begin`);
      const actual: number = heightChangeOf(2, 100, -1, 1);
      logInfo(`heightChangeOf(offset=2, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}HeightChangeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0030
     * @tc.name      ExpandTitle_HeightChangeOf_0030
     * @tc.desc      heightChangeOf(offset=2, heightValue=100, normalTitleHeight=1080, expandTitleHeight=1) returns 980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0030 begin`);
      const actual: number = heightChangeOf(2, 100, 1080, 1);
      logInfo(`heightChangeOf(offset=2, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(980);
      logInfo(`${BUNDLE}HeightChangeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0031
     * @tc.name      ExpandTitle_HeightChangeOf_0031
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1, normalTitleHeight=720, expandTitleHeight=720) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0031 begin`);
      const actual: number = heightChangeOf(-100, 1, 720, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(719);
      logInfo(`${BUNDLE}HeightChangeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0032
     * @tc.name      ExpandTitle_HeightChangeOf_0032
     * @tc.desc      heightChangeOf(offset=0, heightValue=360, normalTitleHeight=1920, expandTitleHeight=720) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0032 begin`);
      const actual: number = heightChangeOf(0, 360, 1920, 720);
      logInfo(`heightChangeOf(offset=0, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(1560);
      logInfo(`${BUNDLE}HeightChangeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0033
     * @tc.name      ExpandTitle_HeightChangeOf_0033
     * @tc.desc      heightChangeOf(offset=100, heightValue=1, normalTitleHeight=360, expandTitleHeight=720) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0033 begin`);
      const actual: number = heightChangeOf(100, 1, 360, 720);
      logInfo(`heightChangeOf(offset=100, heightValue=1,...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}HeightChangeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0034
     * @tc.name      ExpandTitle_HeightChangeOf_0034
     * @tc.desc      heightChangeOf(offset=0, heightValue=100, normalTitleHeight=720, expandTitleHeight=1920) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0034 begin`);
      const actual: number = heightChangeOf(0, 100, 720, 1920);
      logInfo(`heightChangeOf(offset=0, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(620);
      logInfo(`${BUNDLE}HeightChangeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0035
     * @tc.name      ExpandTitle_HeightChangeOf_0035
     * @tc.desc      heightChangeOf(offset=50, heightValue=360, normalTitleHeight=-1, expandTitleHeight=1920) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0035 begin`);
      const actual: number = heightChangeOf(50, 360, -1, 1920);
      logInfo(`heightChangeOf(offset=50, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}HeightChangeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0036
     * @tc.name      ExpandTitle_HeightChangeOf_0036
     * @tc.desc      heightChangeOf(offset=100, heightValue=720, normalTitleHeight=-1, expandTitleHeight=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0036 begin`);
      const actual: number = heightChangeOf(100, 720, -1, -1);
      logInfo(`heightChangeOf(offset=100, heightValue=72...: actual=${actual}`);
      expect(actual).assertEqual(-721);
      logInfo(`${BUNDLE}HeightChangeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0037
     * @tc.name      ExpandTitle_HeightChangeOf_0037
     * @tc.desc      heightChangeOf(offset=1, heightValue=1920, normalTitleHeight=100, expandTitleHeight=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0037 begin`);
      const actual: number = heightChangeOf(1, 1920, 100, -1);
      logInfo(`heightChangeOf(offset=1, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1820);
      logInfo(`${BUNDLE}HeightChangeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0038
     * @tc.name      ExpandTitle_HeightChangeOf_0038
     * @tc.desc      heightChangeOf(offset=0, heightValue=1080, normalTitleHeight=0, expandTitleHeight=1) returns -1079
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0038 begin`);
      const actual: number = heightChangeOf(0, 1080, 0, 1);
      logInfo(`heightChangeOf(offset=0, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(-1079);
      logInfo(`${BUNDLE}HeightChangeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0039
     * @tc.name      ExpandTitle_HeightChangeOf_0039
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=1920, expandTitleHeight=720) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0039 begin`);
      const actual: number = heightChangeOf(-100, 100, 1920, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(1820);
      logInfo(`${BUNDLE}HeightChangeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0040
     * @tc.name      ExpandTitle_HeightChangeOf_0040
     * @tc.desc      heightChangeOf(offset=0, heightValue=720, normalTitleHeight=1, expandTitleHeight=0) returns -719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0040 begin`);
      const actual: number = heightChangeOf(0, 720, 1, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(-719);
      logInfo(`${BUNDLE}HeightChangeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0041
     * @tc.name      ExpandTitle_HeightChangeOf_0041
     * @tc.desc      heightChangeOf(offset=50, heightValue=360, normalTitleHeight=-1, expandTitleHeight=-1) returns -361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0041 begin`);
      const actual: number = heightChangeOf(50, 360, -1, -1);
      logInfo(`heightChangeOf(offset=50, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(-361);
      logInfo(`${BUNDLE}HeightChangeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0042
     * @tc.name      ExpandTitle_HeightChangeOf_0042
     * @tc.desc      heightChangeOf(offset=3, heightValue=100, normalTitleHeight=-1, expandTitleHeight=360) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0042 begin`);
      const actual: number = heightChangeOf(3, 100, -1, 360);
      logInfo(`heightChangeOf(offset=3, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}HeightChangeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0043
     * @tc.name      ExpandTitle_HeightChangeOf_0043
     * @tc.desc      heightChangeOf(offset=50, heightValue=360, normalTitleHeight=0, expandTitleHeight=100) returns -260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0043 begin`);
      const actual: number = heightChangeOf(50, 360, 0, 100);
      logInfo(`heightChangeOf(offset=50, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(-260);
      logInfo(`${BUNDLE}HeightChangeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0044
     * @tc.name      ExpandTitle_HeightChangeOf_0044
     * @tc.desc      heightChangeOf(offset=0, heightValue=100, normalTitleHeight=360, expandTitleHeight=1) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0044 begin`);
      const actual: number = heightChangeOf(0, 100, 360, 1);
      logInfo(`heightChangeOf(offset=0, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(260);
      logInfo(`${BUNDLE}HeightChangeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0045
     * @tc.name      ExpandTitle_HeightChangeOf_0045
     * @tc.desc      heightChangeOf(offset=0, heightValue=1080, normalTitleHeight=100, expandTitleHeight=0) returns -980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0045 begin`);
      const actual: number = heightChangeOf(0, 1080, 100, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(-980);
      logInfo(`${BUNDLE}HeightChangeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0046
     * @tc.name      ExpandTitle_HeightChangeOf_0046
     * @tc.desc      heightChangeOf(offset=2, heightValue=1, normalTitleHeight=1920, expandTitleHeight=1080) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0046 begin`);
      const actual: number = heightChangeOf(2, 1, 1920, 1080);
      logInfo(`heightChangeOf(offset=2, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(1919);
      logInfo(`${BUNDLE}HeightChangeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0047
     * @tc.name      ExpandTitle_HeightChangeOf_0047
     * @tc.desc      heightChangeOf(offset=-100, heightValue=-1, normalTitleHeight=1080, expandTitleHeight=360) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0047 begin`);
      const actual: number = heightChangeOf(-100, -1, 1080, 360);
      logInfo(`heightChangeOf(offset=-100, heightValue=-...: actual=${actual}`);
      expect(actual).assertEqual(1081);
      logInfo(`${BUNDLE}HeightChangeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0048
     * @tc.name      ExpandTitle_HeightChangeOf_0048
     * @tc.desc      heightChangeOf(offset=2, heightValue=1920, normalTitleHeight=-1, expandTitleHeight=-1) returns -...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0048 begin`);
      const actual: number = heightChangeOf(2, 1920, -1, -1);
      logInfo(`heightChangeOf(offset=2, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1921);
      logInfo(`${BUNDLE}HeightChangeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0049
     * @tc.name      ExpandTitle_HeightChangeOf_0049
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=-1, expandTitleHeight=-1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0049 begin`);
      const actual: number = heightChangeOf(-100, 100, -1, -1);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-101);
      logInfo(`${BUNDLE}HeightChangeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0050
     * @tc.name      ExpandTitle_HeightChangeOf_0050
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1, normalTitleHeight=-1, expandTitleHeight=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0050 begin`);
      const actual: number = heightChangeOf(-1, 1, -1, -1);
      logInfo(`heightChangeOf(offset=-1, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}HeightChangeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0051
     * @tc.name      ExpandTitle_HeightChangeOf_0051
     * @tc.desc      heightChangeOf(offset=100, heightValue=1080, normalTitleHeight=-1, expandTitleHeight=-1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0051 begin`);
      const actual: number = heightChangeOf(100, 1080, -1, -1);
      logInfo(`heightChangeOf(offset=100, heightValue=10...: actual=${actual}`);
      expect(actual).assertEqual(-1081);
      logInfo(`${BUNDLE}HeightChangeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0052
     * @tc.name      ExpandTitle_HeightChangeOf_0052
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0052 begin`);
      const actual: number = heightChangeOf(-1, 0, 0, 0);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0053
     * @tc.name      ExpandTitle_HeightChangeOf_0053
     * @tc.desc      heightChangeOf(offset=0, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0053 begin`);
      const actual: number = heightChangeOf(0, 0, 0, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0054
     * @tc.name      ExpandTitle_HeightChangeOf_0054
     * @tc.desc      heightChangeOf(offset=1, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0054 begin`);
      const actual: number = heightChangeOf(1, 0, 0, 0);
      logInfo(`heightChangeOf(offset=1, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0055
     * @tc.name      ExpandTitle_HeightChangeOf_0055
     * @tc.desc      heightChangeOf(offset=50, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0055 begin`);
      const actual: number = heightChangeOf(50, 0, 0, 0);
      logInfo(`heightChangeOf(offset=50, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0056
     * @tc.name      ExpandTitle_HeightChangeOf_0056
     * @tc.desc      heightChangeOf(offset=100, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0056 begin`);
      const actual: number = heightChangeOf(100, 0, 0, 0);
      logInfo(`heightChangeOf(offset=100, heightValue=0,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0057
     * @tc.name      ExpandTitle_HeightChangeOf_0057
     * @tc.desc      heightChangeOf(offset=2, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0057 begin`);
      const actual: number = heightChangeOf(2, 0, 0, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0058
     * @tc.name      ExpandTitle_HeightChangeOf_0058
     * @tc.desc      heightChangeOf(offset=3, heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0058 begin`);
      const actual: number = heightChangeOf(3, 0, 0, 0);
      logInfo(`heightChangeOf(offset=3, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0059
     * @tc.name      ExpandTitle_HeightChangeOf_0059
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=1, expandTitleHeight=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0059 begin`);
      const actual: number = heightChangeOf(-100, 0, 1, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0060
     * @tc.name      ExpandTitle_HeightChangeOf_0060
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=-1, expandTitleHeight=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0060 begin`);
      const actual: number = heightChangeOf(-100, 0, -1, 0);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0061
     * @tc.name      ExpandTitle_HeightChangeOf_0061
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0061 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 1);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0062
     * @tc.name      ExpandTitle_HeightChangeOf_0062
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0062 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 100);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0063
     * @tc.name      ExpandTitle_HeightChangeOf_0063
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0063 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 360);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0064
     * @tc.name      ExpandTitle_HeightChangeOf_0064
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0064 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0065
     * @tc.name      ExpandTitle_HeightChangeOf_0065
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0065 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 1080);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0066
     * @tc.name      ExpandTitle_HeightChangeOf_0066
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0066 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0067
     * @tc.name      ExpandTitle_HeightChangeOf_0067
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=0, expandTitleHeight=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0067 begin`);
      const actual: number = heightChangeOf(-100, 0, 0, -1);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0068
     * @tc.name      ExpandTitle_HeightChangeOf_0068
     * @tc.desc      heightChangeOf(offset=0, heightValue=720, normalTitleHeight=720, expandTitleHeight=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0068 begin`);
      const actual: number = heightChangeOf(0, 720, 720, 360);
      logInfo(`heightChangeOf(offset=0, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0069
     * @tc.name      ExpandTitle_HeightChangeOf_0069
     * @tc.desc      heightChangeOf(offset=0, heightValue=1920, normalTitleHeight=1920, expandTitleHeight=1080) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0069 begin`);
      const actual: number = heightChangeOf(0, 1920, 1920, 1080);
      logInfo(`heightChangeOf(offset=0, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0070
     * @tc.name      ExpandTitle_HeightChangeOf_0070
     * @tc.desc      heightChangeOf(offset=2, heightValue=360, normalTitleHeight=1080, expandTitleHeight=1) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0070 begin`);
      const actual: number = heightChangeOf(2, 360, 1080, 1);
      logInfo(`heightChangeOf(offset=2, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0071
     * @tc.name      ExpandTitle_HeightChangeOf_0071
     * @tc.desc      heightChangeOf(offset=0, heightValue=1920, normalTitleHeight=1920, expandTitleHeight=1920) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0071 begin`);
      const actual: number = heightChangeOf(0, 1920, 1920, 1920);
      logInfo(`heightChangeOf(offset=0, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0072
     * @tc.name      ExpandTitle_HeightChangeOf_0072
     * @tc.desc      heightChangeOf(offset=0, heightValue=100, normalTitleHeight=0, expandTitleHeight=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0072 begin`);
      const actual: number = heightChangeOf(0, 100, 0, 1080);
      logInfo(`heightChangeOf(offset=0, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0073
     * @tc.name      ExpandTitle_HeightChangeOf_0073
     * @tc.desc      heightChangeOf(offset=-1, heightValue=720, normalTitleHeight=0, expandTitleHeight=1080) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0073 begin`);
      const actual: number = heightChangeOf(-1, 720, 0, 1080);
      logInfo(`heightChangeOf(offset=-1, heightValue=720...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0074
     * @tc.name      ExpandTitle_HeightChangeOf_0074
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1, normalTitleHeight=1, expandTitleHeight=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0074 begin`);
      const actual: number = heightChangeOf(-100, 1, 1, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0075
     * @tc.name      ExpandTitle_HeightChangeOf_0075
     * @tc.desc      heightChangeOf(offset=100, heightValue=100, normalTitleHeight=0, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0075 begin`);
      const actual: number = heightChangeOf(100, 100, 0, 100);
      logInfo(`heightChangeOf(offset=100, heightValue=10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0076
     * @tc.name      ExpandTitle_HeightChangeOf_0076
     * @tc.desc      heightChangeOf(offset=100, heightValue=360, normalTitleHeight=100, expandTitleHeight=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0076 begin`);
      const actual: number = heightChangeOf(100, 360, 100, 360);
      logInfo(`heightChangeOf(offset=100, heightValue=36...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0077
     * @tc.name      ExpandTitle_HeightChangeOf_0077
     * @tc.desc      heightChangeOf(offset=50, heightValue=1080, normalTitleHeight=0, expandTitleHeight=0) returns -1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0077 begin`);
      const actual: number = heightChangeOf(50, 1080, 0, 0);
      logInfo(`heightChangeOf(offset=50, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(-1080);
      logInfo(`${BUNDLE}HeightChangeOf_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0078
     * @tc.name      ExpandTitle_HeightChangeOf_0078
     * @tc.desc      heightChangeOf(offset=3, heightValue=0, normalTitleHeight=720, expandTitleHeight=0) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0078 begin`);
      const actual: number = heightChangeOf(3, 0, 720, 0);
      logInfo(`heightChangeOf(offset=3, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0079
     * @tc.name      ExpandTitle_HeightChangeOf_0079
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1, normalTitleHeight=1, expandTitleHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0079 begin`);
      const actual: number = heightChangeOf(-100, 1, 1, 1);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0080
     * @tc.name      ExpandTitle_HeightChangeOf_0080
     * @tc.desc      heightChangeOf(offset=3, heightValue=-1, normalTitleHeight=-1, expandTitleHeight=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0080 begin`);
      const actual: number = heightChangeOf(3, -1, -1, 1);
      logInfo(`heightChangeOf(offset=3, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0081
     * @tc.name      ExpandTitle_HeightChangeOf_0081
     * @tc.desc      heightChangeOf(offset=3, heightValue=1080, normalTitleHeight=0, expandTitleHeight=360) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0081 begin`);
      const actual: number = heightChangeOf(3, 1080, 0, 360);
      logInfo(`heightChangeOf(offset=3, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}HeightChangeOf_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0082
     * @tc.name      ExpandTitle_HeightChangeOf_0082
     * @tc.desc      heightChangeOf(offset=-1, heightValue=-1, normalTitleHeight=-1, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0082 begin`);
      const actual: number = heightChangeOf(-1, -1, -1, 100);
      logInfo(`heightChangeOf(offset=-1, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0083
     * @tc.name      ExpandTitle_HeightChangeOf_0083
     * @tc.desc      heightChangeOf(offset=1, heightValue=720, normalTitleHeight=100, expandTitleHeight=1080) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0083 begin`);
      const actual: number = heightChangeOf(1, 720, 100, 1080);
      logInfo(`heightChangeOf(offset=1, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0084
     * @tc.name      ExpandTitle_HeightChangeOf_0084
     * @tc.desc      heightChangeOf(offset=100, heightValue=360, normalTitleHeight=360, expandTitleHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0084 begin`);
      const actual: number = heightChangeOf(100, 360, 360, 0);
      logInfo(`heightChangeOf(offset=100, heightValue=36...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0085
     * @tc.name      ExpandTitle_HeightChangeOf_0085
     * @tc.desc      heightChangeOf(offset=50, heightValue=1920, normalTitleHeight=360, expandTitleHeight=720) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0085 begin`);
      const actual: number = heightChangeOf(50, 1920, 360, 720);
      logInfo(`heightChangeOf(offset=50, heightValue=192...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0086
     * @tc.name      ExpandTitle_HeightChangeOf_0086
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=720, expandTitleHeight=1920) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0086 begin`);
      const actual: number = heightChangeOf(-1, 0, 720, 1920);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0087
     * @tc.name      ExpandTitle_HeightChangeOf_0087
     * @tc.desc      heightChangeOf(offset=2, heightValue=360, normalTitleHeight=720, expandTitleHeight=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0087 begin`);
      const actual: number = heightChangeOf(2, 360, 720, 1);
      logInfo(`heightChangeOf(offset=2, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0088
     * @tc.name      ExpandTitle_HeightChangeOf_0088
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=360, expandTitleHeight=0) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0088 begin`);
      const actual: number = heightChangeOf(-1, 0, 360, 0);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0089
     * @tc.name      ExpandTitle_HeightChangeOf_0089
     * @tc.desc      heightChangeOf(offset=1, heightValue=0, normalTitleHeight=720, expandTitleHeight=100) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0089 begin`);
      const actual: number = heightChangeOf(1, 0, 720, 100);
      logInfo(`heightChangeOf(offset=1, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0090
     * @tc.name      ExpandTitle_HeightChangeOf_0090
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=720, expandTitleHeight=100) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0090 begin`);
      const actual: number = heightChangeOf(-1, 0, 720, 100);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0091
     * @tc.name      ExpandTitle_HeightChangeOf_0091
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=100, expandTitleHeight=360) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0091 begin`);
      const actual: number = heightChangeOf(-100, 1080, 100, 360);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}HeightChangeOf_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0092
     * @tc.name      ExpandTitle_HeightChangeOf_0092
     * @tc.desc      heightChangeOf(offset=2, heightValue=100, normalTitleHeight=100, expandTitleHeight=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0092 begin`);
      const actual: number = heightChangeOf(2, 100, 100, -1);
      logInfo(`heightChangeOf(offset=2, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0093
     * @tc.name      ExpandTitle_HeightChangeOf_0093
     * @tc.desc      heightChangeOf(offset=2, heightValue=0, normalTitleHeight=1080, expandTitleHeight=720) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0093 begin`);
      const actual: number = heightChangeOf(2, 0, 1080, 720);
      logInfo(`heightChangeOf(offset=2, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightChangeOf_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0094
     * @tc.name      ExpandTitle_HeightChangeOf_0094
     * @tc.desc      heightChangeOf(offset=-100, heightValue=360, normalTitleHeight=1, expandTitleHeight=1920) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0094 begin`);
      const actual: number = heightChangeOf(-100, 360, 1, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=3...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0095
     * @tc.name      ExpandTitle_HeightChangeOf_0095
     * @tc.desc      heightChangeOf(offset=3, heightValue=720, normalTitleHeight=100, expandTitleHeight=0) returns -620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0095 begin`);
      const actual: number = heightChangeOf(3, 720, 100, 0);
      logInfo(`heightChangeOf(offset=3, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(-620);
      logInfo(`${BUNDLE}HeightChangeOf_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0096
     * @tc.name      ExpandTitle_HeightChangeOf_0096
     * @tc.desc      heightChangeOf(offset=2, heightValue=1, normalTitleHeight=0, expandTitleHeight=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0096 begin`);
      const actual: number = heightChangeOf(2, 1, 0, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0096 end`);
    });
  });
}
