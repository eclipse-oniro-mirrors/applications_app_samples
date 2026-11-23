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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { nextClassifyIndex } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextClassifyIndex (96 cases). */
export default function nextClassifyIndexTest(): void {
  describe('NextClassifyIndexTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0001
     * @tc.name      SearchComponent_NextClassifyIndex_0001
     * @tc.desc      nextClassifyIndex(current=0, index=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_NextClassifyIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0001 begin`);
      const actual: number = nextClassifyIndex(0, 0);
      logInfo(`nextClassifyIndex(current=0, index=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0002
     * @tc.name      SearchComponent_NextClassifyIndex_0002
     * @tc.desc      nextClassifyIndex(current=0, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_NextClassifyIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0002 begin`);
      const actual: number = nextClassifyIndex(0, 1);
      logInfo(`nextClassifyIndex(current=0, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0003
     * @tc.name      SearchComponent_NextClassifyIndex_0003
     * @tc.desc      nextClassifyIndex(current=0, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0003 begin`);
      const actual: number = nextClassifyIndex(0, -2);
      logInfo(`nextClassifyIndex(current=0, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0004
     * @tc.name      SearchComponent_NextClassifyIndex_0004
     * @tc.desc      nextClassifyIndex(current=0, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0004 begin`);
      const actual: number = nextClassifyIndex(0, 2);
      logInfo(`nextClassifyIndex(current=0, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0005
     * @tc.name      SearchComponent_NextClassifyIndex_0005
     * @tc.desc      nextClassifyIndex(current=0, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0005 begin`);
      const actual: number = nextClassifyIndex(0, 5);
      logInfo(`nextClassifyIndex(current=0, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0006
     * @tc.name      SearchComponent_NextClassifyIndex_0006
     * @tc.desc      nextClassifyIndex(current=0, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0006 begin`);
      const actual: number = nextClassifyIndex(0, 10);
      logInfo(`nextClassifyIndex(current=0, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0007
     * @tc.name      SearchComponent_NextClassifyIndex_0007
     * @tc.desc      nextClassifyIndex(current=0, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0007 begin`);
      const actual: number = nextClassifyIndex(0, 3);
      logInfo(`nextClassifyIndex(current=0, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0008
     * @tc.name      SearchComponent_NextClassifyIndex_0008
     * @tc.desc      nextClassifyIndex(current=0, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0008 begin`);
      const actual: number = nextClassifyIndex(0, 100);
      logInfo(`nextClassifyIndex(current=0, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0009
     * @tc.name      SearchComponent_NextClassifyIndex_0009
     * @tc.desc      nextClassifyIndex(current=0, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0009 begin`);
      const actual: number = nextClassifyIndex(0, 15);
      logInfo(`nextClassifyIndex(current=0, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0010
     * @tc.name      SearchComponent_NextClassifyIndex_0010
     * @tc.desc      nextClassifyIndex(current=0, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0010 begin`);
      const actual: number = nextClassifyIndex(0, 20);
      logInfo(`nextClassifyIndex(current=0, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0011
     * @tc.name      SearchComponent_NextClassifyIndex_0011
     * @tc.desc      nextClassifyIndex(current=0, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0011 begin`);
      const actual: number = nextClassifyIndex(0, 25);
      logInfo(`nextClassifyIndex(current=0, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0012
     * @tc.name      SearchComponent_NextClassifyIndex_0012
     * @tc.desc      nextClassifyIndex(current=0, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0012 begin`);
      const actual: number = nextClassifyIndex(0, 30);
      logInfo(`nextClassifyIndex(current=0, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0013
     * @tc.name      SearchComponent_NextClassifyIndex_0013
     * @tc.desc      nextClassifyIndex(current=0, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0013 begin`);
      const actual: number = nextClassifyIndex(0, 35);
      logInfo(`nextClassifyIndex(current=0, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0014
     * @tc.name      SearchComponent_NextClassifyIndex_0014
     * @tc.desc      nextClassifyIndex(current=0, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0014 begin`);
      const actual: number = nextClassifyIndex(0, 40);
      logInfo(`nextClassifyIndex(current=0, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0015
     * @tc.name      SearchComponent_NextClassifyIndex_0015
     * @tc.desc      nextClassifyIndex(current=0, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0015 begin`);
      const actual: number = nextClassifyIndex(0, 45);
      logInfo(`nextClassifyIndex(current=0, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0016
     * @tc.name      SearchComponent_NextClassifyIndex_0016
     * @tc.desc      nextClassifyIndex(current=0, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0016 begin`);
      const actual: number = nextClassifyIndex(0, 50);
      logInfo(`nextClassifyIndex(current=0, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0017
     * @tc.name      SearchComponent_NextClassifyIndex_0017
     * @tc.desc      nextClassifyIndex(current=0, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0017 begin`);
      const actual: number = nextClassifyIndex(0, 55);
      logInfo(`nextClassifyIndex(current=0, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0018
     * @tc.name      SearchComponent_NextClassifyIndex_0018
     * @tc.desc      nextClassifyIndex(current=0, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0018 begin`);
      const actual: number = nextClassifyIndex(0, 60);
      logInfo(`nextClassifyIndex(current=0, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0019
     * @tc.name      SearchComponent_NextClassifyIndex_0019
     * @tc.desc      nextClassifyIndex(current=0, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0019 begin`);
      const actual: number = nextClassifyIndex(0, 65);
      logInfo(`nextClassifyIndex(current=0, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0020
     * @tc.name      SearchComponent_NextClassifyIndex_0020
     * @tc.desc      nextClassifyIndex(current=0, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0020 begin`);
      const actual: number = nextClassifyIndex(0, 70);
      logInfo(`nextClassifyIndex(current=0, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0021
     * @tc.name      SearchComponent_NextClassifyIndex_0021
     * @tc.desc      nextClassifyIndex(current=0, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0021 begin`);
      const actual: number = nextClassifyIndex(0, 75);
      logInfo(`nextClassifyIndex(current=0, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0022
     * @tc.name      SearchComponent_NextClassifyIndex_0022
     * @tc.desc      nextClassifyIndex(current=0, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0022 begin`);
      const actual: number = nextClassifyIndex(0, 80);
      logInfo(`nextClassifyIndex(current=0, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0023
     * @tc.name      SearchComponent_NextClassifyIndex_0023
     * @tc.desc      nextClassifyIndex(current=0, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0023 begin`);
      const actual: number = nextClassifyIndex(0, 85);
      logInfo(`nextClassifyIndex(current=0, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0024
     * @tc.name      SearchComponent_NextClassifyIndex_0024
     * @tc.desc      nextClassifyIndex(current=0, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0024 begin`);
      const actual: number = nextClassifyIndex(0, 90);
      logInfo(`nextClassifyIndex(current=0, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0025
     * @tc.name      SearchComponent_NextClassifyIndex_0025
     * @tc.desc      nextClassifyIndex(current=0, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0025 begin`);
      const actual: number = nextClassifyIndex(0, 95);
      logInfo(`nextClassifyIndex(current=0, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0026
     * @tc.name      SearchComponent_NextClassifyIndex_0026
     * @tc.desc      nextClassifyIndex(current=0, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0026 begin`);
      const actual: number = nextClassifyIndex(0, 105);
      logInfo(`nextClassifyIndex(current=0, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0027
     * @tc.name      SearchComponent_NextClassifyIndex_0027
     * @tc.desc      nextClassifyIndex(current=0, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0027 begin`);
      const actual: number = nextClassifyIndex(0, -45);
      logInfo(`nextClassifyIndex(current=0, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0028
     * @tc.name      SearchComponent_NextClassifyIndex_0028
     * @tc.desc      nextClassifyIndex(current=0, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0028 begin`);
      const actual: number = nextClassifyIndex(0, -77);
      logInfo(`nextClassifyIndex(current=0, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0029
     * @tc.name      SearchComponent_NextClassifyIndex_0029
     * @tc.desc      nextClassifyIndex(current=0, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0029 begin`);
      const actual: number = nextClassifyIndex(0, 109);
      logInfo(`nextClassifyIndex(current=0, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0030
     * @tc.name      SearchComponent_NextClassifyIndex_0030
     * @tc.desc      nextClassifyIndex(current=500, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0030 begin`);
      const actual: number = nextClassifyIndex(500, 0);
      logInfo(`nextClassifyIndex(current=500, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0031
     * @tc.name      SearchComponent_NextClassifyIndex_0031
     * @tc.desc      nextClassifyIndex(current=0, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0031 begin`);
      const actual: number = nextClassifyIndex(0, -1);
      logInfo(`nextClassifyIndex(current=0, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0032
     * @tc.name      SearchComponent_NextClassifyIndex_0032
     * @tc.desc      nextClassifyIndex(current=500, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0032 begin`);
      const actual: number = nextClassifyIndex(500, 1);
      logInfo(`nextClassifyIndex(current=500, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0033
     * @tc.name      SearchComponent_NextClassifyIndex_0033
     * @tc.desc      nextClassifyIndex(current=500, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0033 begin`);
      const actual: number = nextClassifyIndex(500, -1);
      logInfo(`nextClassifyIndex(current=500, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0034
     * @tc.name      SearchComponent_NextClassifyIndex_0034
     * @tc.desc      nextClassifyIndex(current=500, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0034 begin`);
      const actual: number = nextClassifyIndex(500, -2);
      logInfo(`nextClassifyIndex(current=500, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0035
     * @tc.name      SearchComponent_NextClassifyIndex_0035
     * @tc.desc      nextClassifyIndex(current=500, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0035 begin`);
      const actual: number = nextClassifyIndex(500, 2);
      logInfo(`nextClassifyIndex(current=500, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0036
     * @tc.name      SearchComponent_NextClassifyIndex_0036
     * @tc.desc      nextClassifyIndex(current=500, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0036 begin`);
      const actual: number = nextClassifyIndex(500, 5);
      logInfo(`nextClassifyIndex(current=500, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0037
     * @tc.name      SearchComponent_NextClassifyIndex_0037
     * @tc.desc      nextClassifyIndex(current=500, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0037 begin`);
      const actual: number = nextClassifyIndex(500, 10);
      logInfo(`nextClassifyIndex(current=500, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0038
     * @tc.name      SearchComponent_NextClassifyIndex_0038
     * @tc.desc      nextClassifyIndex(current=500, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0038 begin`);
      const actual: number = nextClassifyIndex(500, 3);
      logInfo(`nextClassifyIndex(current=500, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0039
     * @tc.name      SearchComponent_NextClassifyIndex_0039
     * @tc.desc      nextClassifyIndex(current=500, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0039 begin`);
      const actual: number = nextClassifyIndex(500, 100);
      logInfo(`nextClassifyIndex(current=500, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0040
     * @tc.name      SearchComponent_NextClassifyIndex_0040
     * @tc.desc      nextClassifyIndex(current=500, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0040 begin`);
      const actual: number = nextClassifyIndex(500, 15);
      logInfo(`nextClassifyIndex(current=500, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0041
     * @tc.name      SearchComponent_NextClassifyIndex_0041
     * @tc.desc      nextClassifyIndex(current=500, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0041 begin`);
      const actual: number = nextClassifyIndex(500, 20);
      logInfo(`nextClassifyIndex(current=500, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0042
     * @tc.name      SearchComponent_NextClassifyIndex_0042
     * @tc.desc      nextClassifyIndex(current=500, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0042 begin`);
      const actual: number = nextClassifyIndex(500, 25);
      logInfo(`nextClassifyIndex(current=500, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0043
     * @tc.name      SearchComponent_NextClassifyIndex_0043
     * @tc.desc      nextClassifyIndex(current=500, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0043 begin`);
      const actual: number = nextClassifyIndex(500, 30);
      logInfo(`nextClassifyIndex(current=500, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0044
     * @tc.name      SearchComponent_NextClassifyIndex_0044
     * @tc.desc      nextClassifyIndex(current=500, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0044 begin`);
      const actual: number = nextClassifyIndex(500, 35);
      logInfo(`nextClassifyIndex(current=500, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0045
     * @tc.name      SearchComponent_NextClassifyIndex_0045
     * @tc.desc      nextClassifyIndex(current=500, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0045 begin`);
      const actual: number = nextClassifyIndex(500, 40);
      logInfo(`nextClassifyIndex(current=500, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0046
     * @tc.name      SearchComponent_NextClassifyIndex_0046
     * @tc.desc      nextClassifyIndex(current=500, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0046 begin`);
      const actual: number = nextClassifyIndex(500, 45);
      logInfo(`nextClassifyIndex(current=500, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0047
     * @tc.name      SearchComponent_NextClassifyIndex_0047
     * @tc.desc      nextClassifyIndex(current=500, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0047 begin`);
      const actual: number = nextClassifyIndex(500, 50);
      logInfo(`nextClassifyIndex(current=500, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0048
     * @tc.name      SearchComponent_NextClassifyIndex_0048
     * @tc.desc      nextClassifyIndex(current=500, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0048 begin`);
      const actual: number = nextClassifyIndex(500, 55);
      logInfo(`nextClassifyIndex(current=500, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0049
     * @tc.name      SearchComponent_NextClassifyIndex_0049
     * @tc.desc      nextClassifyIndex(current=500, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0049 begin`);
      const actual: number = nextClassifyIndex(500, 60);
      logInfo(`nextClassifyIndex(current=500, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0050
     * @tc.name      SearchComponent_NextClassifyIndex_0050
     * @tc.desc      nextClassifyIndex(current=500, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0050 begin`);
      const actual: number = nextClassifyIndex(500, 65);
      logInfo(`nextClassifyIndex(current=500, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0051
     * @tc.name      SearchComponent_NextClassifyIndex_0051
     * @tc.desc      nextClassifyIndex(current=500, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0051 begin`);
      const actual: number = nextClassifyIndex(500, 70);
      logInfo(`nextClassifyIndex(current=500, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0052
     * @tc.name      SearchComponent_NextClassifyIndex_0052
     * @tc.desc      nextClassifyIndex(current=500, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0052 begin`);
      const actual: number = nextClassifyIndex(500, 75);
      logInfo(`nextClassifyIndex(current=500, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0053
     * @tc.name      SearchComponent_NextClassifyIndex_0053
     * @tc.desc      nextClassifyIndex(current=500, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0053 begin`);
      const actual: number = nextClassifyIndex(500, 80);
      logInfo(`nextClassifyIndex(current=500, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0054
     * @tc.name      SearchComponent_NextClassifyIndex_0054
     * @tc.desc      nextClassifyIndex(current=500, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0054 begin`);
      const actual: number = nextClassifyIndex(500, 85);
      logInfo(`nextClassifyIndex(current=500, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0055
     * @tc.name      SearchComponent_NextClassifyIndex_0055
     * @tc.desc      nextClassifyIndex(current=500, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0055 begin`);
      const actual: number = nextClassifyIndex(500, 90);
      logInfo(`nextClassifyIndex(current=500, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0056
     * @tc.name      SearchComponent_NextClassifyIndex_0056
     * @tc.desc      nextClassifyIndex(current=500, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0056 begin`);
      const actual: number = nextClassifyIndex(500, 95);
      logInfo(`nextClassifyIndex(current=500, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0057
     * @tc.name      SearchComponent_NextClassifyIndex_0057
     * @tc.desc      nextClassifyIndex(current=500, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0057 begin`);
      const actual: number = nextClassifyIndex(500, 105);
      logInfo(`nextClassifyIndex(current=500, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0058
     * @tc.name      SearchComponent_NextClassifyIndex_0058
     * @tc.desc      nextClassifyIndex(current=500, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0058 begin`);
      const actual: number = nextClassifyIndex(500, -45);
      logInfo(`nextClassifyIndex(current=500, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0059
     * @tc.name      SearchComponent_NextClassifyIndex_0059
     * @tc.desc      nextClassifyIndex(current=500, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0059 begin`);
      const actual: number = nextClassifyIndex(500, -77);
      logInfo(`nextClassifyIndex(current=500, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0060
     * @tc.name      SearchComponent_NextClassifyIndex_0060
     * @tc.desc      nextClassifyIndex(current=500, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0060 begin`);
      const actual: number = nextClassifyIndex(500, 109);
      logInfo(`nextClassifyIndex(current=500, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0061
     * @tc.name      SearchComponent_NextClassifyIndex_0061
     * @tc.desc      nextClassifyIndex(current=-1, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0061 begin`);
      const actual: number = nextClassifyIndex(-1, 0);
      logInfo(`nextClassifyIndex(current=-1, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0062
     * @tc.name      SearchComponent_NextClassifyIndex_0062
     * @tc.desc      nextClassifyIndex(current=-1, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0062 begin`);
      const actual: number = nextClassifyIndex(-1, 1);
      logInfo(`nextClassifyIndex(current=-1, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0063
     * @tc.name      SearchComponent_NextClassifyIndex_0063
     * @tc.desc      nextClassifyIndex(current=-1, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0063 begin`);
      const actual: number = nextClassifyIndex(-1, -1);
      logInfo(`nextClassifyIndex(current=-1, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0064
     * @tc.name      SearchComponent_NextClassifyIndex_0064
     * @tc.desc      nextClassifyIndex(current=-1, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0064 begin`);
      const actual: number = nextClassifyIndex(-1, -2);
      logInfo(`nextClassifyIndex(current=-1, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0065
     * @tc.name      SearchComponent_NextClassifyIndex_0065
     * @tc.desc      nextClassifyIndex(current=-1, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0065 begin`);
      const actual: number = nextClassifyIndex(-1, 2);
      logInfo(`nextClassifyIndex(current=-1, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0066
     * @tc.name      SearchComponent_NextClassifyIndex_0066
     * @tc.desc      nextClassifyIndex(current=-1, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0066 begin`);
      const actual: number = nextClassifyIndex(-1, 5);
      logInfo(`nextClassifyIndex(current=-1, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0067
     * @tc.name      SearchComponent_NextClassifyIndex_0067
     * @tc.desc      nextClassifyIndex(current=-1, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0067 begin`);
      const actual: number = nextClassifyIndex(-1, 10);
      logInfo(`nextClassifyIndex(current=-1, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0068
     * @tc.name      SearchComponent_NextClassifyIndex_0068
     * @tc.desc      nextClassifyIndex(current=-1, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0068 begin`);
      const actual: number = nextClassifyIndex(-1, 3);
      logInfo(`nextClassifyIndex(current=-1, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0069
     * @tc.name      SearchComponent_NextClassifyIndex_0069
     * @tc.desc      nextClassifyIndex(current=-1, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0069 begin`);
      const actual: number = nextClassifyIndex(-1, 100);
      logInfo(`nextClassifyIndex(current=-1, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0070
     * @tc.name      SearchComponent_NextClassifyIndex_0070
     * @tc.desc      nextClassifyIndex(current=-1, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0070 begin`);
      const actual: number = nextClassifyIndex(-1, 15);
      logInfo(`nextClassifyIndex(current=-1, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0071
     * @tc.name      SearchComponent_NextClassifyIndex_0071
     * @tc.desc      nextClassifyIndex(current=-1, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0071 begin`);
      const actual: number = nextClassifyIndex(-1, 20);
      logInfo(`nextClassifyIndex(current=-1, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0072
     * @tc.name      SearchComponent_NextClassifyIndex_0072
     * @tc.desc      nextClassifyIndex(current=-1, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0072 begin`);
      const actual: number = nextClassifyIndex(-1, 25);
      logInfo(`nextClassifyIndex(current=-1, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0073
     * @tc.name      SearchComponent_NextClassifyIndex_0073
     * @tc.desc      nextClassifyIndex(current=-1, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0073 begin`);
      const actual: number = nextClassifyIndex(-1, 30);
      logInfo(`nextClassifyIndex(current=-1, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0074
     * @tc.name      SearchComponent_NextClassifyIndex_0074
     * @tc.desc      nextClassifyIndex(current=-1, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0074 begin`);
      const actual: number = nextClassifyIndex(-1, 35);
      logInfo(`nextClassifyIndex(current=-1, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0075
     * @tc.name      SearchComponent_NextClassifyIndex_0075
     * @tc.desc      nextClassifyIndex(current=-1, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0075 begin`);
      const actual: number = nextClassifyIndex(-1, 40);
      logInfo(`nextClassifyIndex(current=-1, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0076
     * @tc.name      SearchComponent_NextClassifyIndex_0076
     * @tc.desc      nextClassifyIndex(current=-1, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0076 begin`);
      const actual: number = nextClassifyIndex(-1, 45);
      logInfo(`nextClassifyIndex(current=-1, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0077
     * @tc.name      SearchComponent_NextClassifyIndex_0077
     * @tc.desc      nextClassifyIndex(current=-1, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0077 begin`);
      const actual: number = nextClassifyIndex(-1, 50);
      logInfo(`nextClassifyIndex(current=-1, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0078
     * @tc.name      SearchComponent_NextClassifyIndex_0078
     * @tc.desc      nextClassifyIndex(current=-1, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0078 begin`);
      const actual: number = nextClassifyIndex(-1, 55);
      logInfo(`nextClassifyIndex(current=-1, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0079
     * @tc.name      SearchComponent_NextClassifyIndex_0079
     * @tc.desc      nextClassifyIndex(current=-1, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0079 begin`);
      const actual: number = nextClassifyIndex(-1, 60);
      logInfo(`nextClassifyIndex(current=-1, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0080
     * @tc.name      SearchComponent_NextClassifyIndex_0080
     * @tc.desc      nextClassifyIndex(current=-1, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0080 begin`);
      const actual: number = nextClassifyIndex(-1, 65);
      logInfo(`nextClassifyIndex(current=-1, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0081
     * @tc.name      SearchComponent_NextClassifyIndex_0081
     * @tc.desc      nextClassifyIndex(current=-1, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0081 begin`);
      const actual: number = nextClassifyIndex(-1, 70);
      logInfo(`nextClassifyIndex(current=-1, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0082
     * @tc.name      SearchComponent_NextClassifyIndex_0082
     * @tc.desc      nextClassifyIndex(current=-1, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0082 begin`);
      const actual: number = nextClassifyIndex(-1, 75);
      logInfo(`nextClassifyIndex(current=-1, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0083
     * @tc.name      SearchComponent_NextClassifyIndex_0083
     * @tc.desc      nextClassifyIndex(current=-1, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0083 begin`);
      const actual: number = nextClassifyIndex(-1, 80);
      logInfo(`nextClassifyIndex(current=-1, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0084
     * @tc.name      SearchComponent_NextClassifyIndex_0084
     * @tc.desc      nextClassifyIndex(current=-1, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0084 begin`);
      const actual: number = nextClassifyIndex(-1, 85);
      logInfo(`nextClassifyIndex(current=-1, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0085
     * @tc.name      SearchComponent_NextClassifyIndex_0085
     * @tc.desc      nextClassifyIndex(current=-1, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0085 begin`);
      const actual: number = nextClassifyIndex(-1, 90);
      logInfo(`nextClassifyIndex(current=-1, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0086
     * @tc.name      SearchComponent_NextClassifyIndex_0086
     * @tc.desc      nextClassifyIndex(current=-1, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0086 begin`);
      const actual: number = nextClassifyIndex(-1, 95);
      logInfo(`nextClassifyIndex(current=-1, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0087
     * @tc.name      SearchComponent_NextClassifyIndex_0087
     * @tc.desc      nextClassifyIndex(current=-1, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0087 begin`);
      const actual: number = nextClassifyIndex(-1, 105);
      logInfo(`nextClassifyIndex(current=-1, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0088
     * @tc.name      SearchComponent_NextClassifyIndex_0088
     * @tc.desc      nextClassifyIndex(current=-1, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0088 begin`);
      const actual: number = nextClassifyIndex(-1, -45);
      logInfo(`nextClassifyIndex(current=-1, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0089
     * @tc.name      SearchComponent_NextClassifyIndex_0089
     * @tc.desc      nextClassifyIndex(current=-1, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0089 begin`);
      const actual: number = nextClassifyIndex(-1, -77);
      logInfo(`nextClassifyIndex(current=-1, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0090
     * @tc.name      SearchComponent_NextClassifyIndex_0090
     * @tc.desc      nextClassifyIndex(current=-1, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0090 begin`);
      const actual: number = nextClassifyIndex(-1, 109);
      logInfo(`nextClassifyIndex(current=-1, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0091
     * @tc.name      SearchComponent_NextClassifyIndex_0091
     * @tc.desc      nextClassifyIndex(current=-2, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0091 begin`);
      const actual: number = nextClassifyIndex(-2, 0);
      logInfo(`nextClassifyIndex(current=-2, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0092
     * @tc.name      SearchComponent_NextClassifyIndex_0092
     * @tc.desc      nextClassifyIndex(current=-2, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0092 begin`);
      const actual: number = nextClassifyIndex(-2, 1);
      logInfo(`nextClassifyIndex(current=-2, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0093
     * @tc.name      SearchComponent_NextClassifyIndex_0093
     * @tc.desc      nextClassifyIndex(current=-2, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0093 begin`);
      const actual: number = nextClassifyIndex(-2, -1);
      logInfo(`nextClassifyIndex(current=-2, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0094
     * @tc.name      SearchComponent_NextClassifyIndex_0094
     * @tc.desc      nextClassifyIndex(current=-2, index=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0094 begin`);
      const actual: number = nextClassifyIndex(-2, -2);
      logInfo(`nextClassifyIndex(current=-2, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0095
     * @tc.name      SearchComponent_NextClassifyIndex_0095
     * @tc.desc      nextClassifyIndex(current=-2, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0095 begin`);
      const actual: number = nextClassifyIndex(-2, 2);
      logInfo(`nextClassifyIndex(current=-2, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0096
     * @tc.name      SearchComponent_NextClassifyIndex_0096
     * @tc.desc      nextClassifyIndex(current=-2, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0096 begin`);
      const actual: number = nextClassifyIndex(-2, 5);
      logInfo(`nextClassifyIndex(current=-2, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0096 end`);
    });
  });
}
