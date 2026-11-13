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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Resolution } from '../../../main/ets/services/CommonTypes';

const TAG: string = '[Sample_resolutionIndependenceCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function resolutionIndependenceCoreTest(): void {
  describe('resolutionIndependenceCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0100
     * @tc.name      testResolutionIndependence0001
     * @tc.desc      Verify resolutionIndependenceCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 100;
      first.frameHeight = 200;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(100);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0200
     * @tc.name      testResolutionIndependence0002
     * @tc.desc      Verify resolutionIndependenceCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 101;
      first.frameHeight = 201;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(101);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0300
     * @tc.name      testResolutionIndependence0003
     * @tc.desc      Verify resolutionIndependenceCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 102;
      first.frameHeight = 202;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(102);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0400
     * @tc.name      testResolutionIndependence0004
     * @tc.desc      Verify resolutionIndependenceCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 103;
      first.frameHeight = 203;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(103);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0500
     * @tc.name      testResolutionIndependence0005
     * @tc.desc      Verify resolutionIndependenceCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 104;
      first.frameHeight = 204;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(104);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0600
     * @tc.name      testResolutionIndependence0006
     * @tc.desc      Verify resolutionIndependenceCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 105;
      first.frameHeight = 205;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(105);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0700
     * @tc.name      testResolutionIndependence0007
     * @tc.desc      Verify resolutionIndependenceCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 106;
      first.frameHeight = 206;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(106);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0800
     * @tc.name      testResolutionIndependence0008
     * @tc.desc      Verify resolutionIndependenceCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 107;
      first.frameHeight = 207;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(107);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_0900
     * @tc.name      testResolutionIndependence0009
     * @tc.desc      Verify resolutionIndependenceCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 108;
      first.frameHeight = 208;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(108);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1000
     * @tc.name      testResolutionIndependence0010
     * @tc.desc      Verify resolutionIndependenceCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 109;
      first.frameHeight = 209;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(109);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1100
     * @tc.name      testResolutionIndependence0011
     * @tc.desc      Verify resolutionIndependenceCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 110;
      first.frameHeight = 210;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(110);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1200
     * @tc.name      testResolutionIndependence0012
     * @tc.desc      Verify resolutionIndependenceCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 111;
      first.frameHeight = 211;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(111);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1300
     * @tc.name      testResolutionIndependence0013
     * @tc.desc      Verify resolutionIndependenceCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 112;
      first.frameHeight = 212;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(112);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1400
     * @tc.name      testResolutionIndependence0014
     * @tc.desc      Verify resolutionIndependenceCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 113;
      first.frameHeight = 213;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(113);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1500
     * @tc.name      testResolutionIndependence0015
     * @tc.desc      Verify resolutionIndependenceCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 114;
      first.frameHeight = 214;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(114);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1600
     * @tc.name      testResolutionIndependence0016
     * @tc.desc      Verify resolutionIndependenceCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 115;
      first.frameHeight = 215;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(115);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1700
     * @tc.name      testResolutionIndependence0017
     * @tc.desc      Verify resolutionIndependenceCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 116;
      first.frameHeight = 216;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(116);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1800
     * @tc.name      testResolutionIndependence0018
     * @tc.desc      Verify resolutionIndependenceCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 117;
      first.frameHeight = 217;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(117);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_1900
     * @tc.name      testResolutionIndependence0019
     * @tc.desc      Verify resolutionIndependenceCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 118;
      first.frameHeight = 218;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(118);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2000
     * @tc.name      testResolutionIndependence0020
     * @tc.desc      Verify resolutionIndependenceCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 119;
      first.frameHeight = 219;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(119);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2100
     * @tc.name      testResolutionIndependence0021
     * @tc.desc      Verify resolutionIndependenceCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 120;
      first.frameHeight = 220;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(120);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2200
     * @tc.name      testResolutionIndependence0022
     * @tc.desc      Verify resolutionIndependenceCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 121;
      first.frameHeight = 221;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(121);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2300
     * @tc.name      testResolutionIndependence0023
     * @tc.desc      Verify resolutionIndependenceCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 122;
      first.frameHeight = 222;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(122);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2400
     * @tc.name      testResolutionIndependence0024
     * @tc.desc      Verify resolutionIndependenceCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 123;
      first.frameHeight = 223;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(123);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2500
     * @tc.name      testResolutionIndependence0025
     * @tc.desc      Verify resolutionIndependenceCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 124;
      first.frameHeight = 224;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(124);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2600
     * @tc.name      testResolutionIndependence0026
     * @tc.desc      Verify resolutionIndependenceCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 125;
      first.frameHeight = 225;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(125);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2700
     * @tc.name      testResolutionIndependence0027
     * @tc.desc      Verify resolutionIndependenceCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 126;
      first.frameHeight = 226;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(126);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2800
     * @tc.name      testResolutionIndependence0028
     * @tc.desc      Verify resolutionIndependenceCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 127;
      first.frameHeight = 227;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(127);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_2900
     * @tc.name      testResolutionIndependence0029
     * @tc.desc      Verify resolutionIndependenceCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 128;
      first.frameHeight = 228;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(128);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3000
     * @tc.name      testResolutionIndependence0030
     * @tc.desc      Verify resolutionIndependenceCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 129;
      first.frameHeight = 229;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(129);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3100
     * @tc.name      testResolutionIndependence0031
     * @tc.desc      Verify resolutionIndependenceCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 130;
      first.frameHeight = 230;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(130);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3200
     * @tc.name      testResolutionIndependence0032
     * @tc.desc      Verify resolutionIndependenceCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 131;
      first.frameHeight = 231;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(131);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3300
     * @tc.name      testResolutionIndependence0033
     * @tc.desc      Verify resolutionIndependenceCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 132;
      first.frameHeight = 232;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(132);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3400
     * @tc.name      testResolutionIndependence0034
     * @tc.desc      Verify resolutionIndependenceCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 133;
      first.frameHeight = 233;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(133);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3500
     * @tc.name      testResolutionIndependence0035
     * @tc.desc      Verify resolutionIndependenceCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 134;
      first.frameHeight = 234;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(134);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3600
     * @tc.name      testResolutionIndependence0036
     * @tc.desc      Verify resolutionIndependenceCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 135;
      first.frameHeight = 235;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(135);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3700
     * @tc.name      testResolutionIndependence0037
     * @tc.desc      Verify resolutionIndependenceCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 136;
      first.frameHeight = 236;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(136);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3800
     * @tc.name      testResolutionIndependence0038
     * @tc.desc      Verify resolutionIndependenceCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 137;
      first.frameHeight = 237;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(137);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_3900
     * @tc.name      testResolutionIndependence0039
     * @tc.desc      Verify resolutionIndependenceCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 138;
      first.frameHeight = 238;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(138);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4000
     * @tc.name      testResolutionIndependence0040
     * @tc.desc      Verify resolutionIndependenceCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 139;
      first.frameHeight = 239;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(139);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4100
     * @tc.name      testResolutionIndependence0041
     * @tc.desc      Verify resolutionIndependenceCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 140;
      first.frameHeight = 240;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(140);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4200
     * @tc.name      testResolutionIndependence0042
     * @tc.desc      Verify resolutionIndependenceCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 141;
      first.frameHeight = 241;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(141);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4300
     * @tc.name      testResolutionIndependence0043
     * @tc.desc      Verify resolutionIndependenceCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 142;
      first.frameHeight = 242;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(142);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4400
     * @tc.name      testResolutionIndependence0044
     * @tc.desc      Verify resolutionIndependenceCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 143;
      first.frameHeight = 243;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(143);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4500
     * @tc.name      testResolutionIndependence0045
     * @tc.desc      Verify resolutionIndependenceCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 144;
      first.frameHeight = 244;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(144);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4600
     * @tc.name      testResolutionIndependence0046
     * @tc.desc      Verify resolutionIndependenceCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 145;
      first.frameHeight = 245;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(145);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4700
     * @tc.name      testResolutionIndependence0047
     * @tc.desc      Verify resolutionIndependenceCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 146;
      first.frameHeight = 246;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(146);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4800
     * @tc.name      testResolutionIndependence0048
     * @tc.desc      Verify resolutionIndependenceCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 147;
      first.frameHeight = 247;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(147);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_4900
     * @tc.name      testResolutionIndependence0049
     * @tc.desc      Verify resolutionIndependenceCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 148;
      first.frameHeight = 248;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(148);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5000
     * @tc.name      testResolutionIndependence0050
     * @tc.desc      Verify resolutionIndependenceCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 149;
      first.frameHeight = 249;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(149);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5100
     * @tc.name      testResolutionIndependence0051
     * @tc.desc      Verify resolutionIndependenceCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 150;
      first.frameHeight = 250;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(150);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5200
     * @tc.name      testResolutionIndependence0052
     * @tc.desc      Verify resolutionIndependenceCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 151;
      first.frameHeight = 251;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(151);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5300
     * @tc.name      testResolutionIndependence0053
     * @tc.desc      Verify resolutionIndependenceCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 152;
      first.frameHeight = 252;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(152);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5400
     * @tc.name      testResolutionIndependence0054
     * @tc.desc      Verify resolutionIndependenceCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 153;
      first.frameHeight = 253;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(153);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5500
     * @tc.name      testResolutionIndependence0055
     * @tc.desc      Verify resolutionIndependenceCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 154;
      first.frameHeight = 254;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(154);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5600
     * @tc.name      testResolutionIndependence0056
     * @tc.desc      Verify resolutionIndependenceCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 155;
      first.frameHeight = 255;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(155);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5700
     * @tc.name      testResolutionIndependence0057
     * @tc.desc      Verify resolutionIndependenceCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 156;
      first.frameHeight = 256;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(156);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5800
     * @tc.name      testResolutionIndependence0058
     * @tc.desc      Verify resolutionIndependenceCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 157;
      first.frameHeight = 257;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(157);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_5900
     * @tc.name      testResolutionIndependence0059
     * @tc.desc      Verify resolutionIndependenceCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 158;
      first.frameHeight = 258;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(158);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6000
     * @tc.name      testResolutionIndependence0060
     * @tc.desc      Verify resolutionIndependenceCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 159;
      first.frameHeight = 259;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(159);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6100
     * @tc.name      testResolutionIndependence0061
     * @tc.desc      Verify resolutionIndependenceCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 160;
      first.frameHeight = 260;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(160);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6200
     * @tc.name      testResolutionIndependence0062
     * @tc.desc      Verify resolutionIndependenceCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 161;
      first.frameHeight = 261;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(161);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6300
     * @tc.name      testResolutionIndependence0063
     * @tc.desc      Verify resolutionIndependenceCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 162;
      first.frameHeight = 262;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(162);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6400
     * @tc.name      testResolutionIndependence0064
     * @tc.desc      Verify resolutionIndependenceCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 163;
      first.frameHeight = 263;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(163);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6500
     * @tc.name      testResolutionIndependence0065
     * @tc.desc      Verify resolutionIndependenceCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 164;
      first.frameHeight = 264;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(164);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6600
     * @tc.name      testResolutionIndependence0066
     * @tc.desc      Verify resolutionIndependenceCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 165;
      first.frameHeight = 265;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(165);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6700
     * @tc.name      testResolutionIndependence0067
     * @tc.desc      Verify resolutionIndependenceCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 166;
      first.frameHeight = 266;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(166);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6800
     * @tc.name      testResolutionIndependence0068
     * @tc.desc      Verify resolutionIndependenceCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 167;
      first.frameHeight = 267;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(167);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_6900
     * @tc.name      testResolutionIndependence0069
     * @tc.desc      Verify resolutionIndependenceCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 168;
      first.frameHeight = 268;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(168);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7000
     * @tc.name      testResolutionIndependence0070
     * @tc.desc      Verify resolutionIndependenceCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 169;
      first.frameHeight = 269;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(169);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7100
     * @tc.name      testResolutionIndependence0071
     * @tc.desc      Verify resolutionIndependenceCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 170;
      first.frameHeight = 270;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(170);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7200
     * @tc.name      testResolutionIndependence0072
     * @tc.desc      Verify resolutionIndependenceCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 171;
      first.frameHeight = 271;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(171);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7300
     * @tc.name      testResolutionIndependence0073
     * @tc.desc      Verify resolutionIndependenceCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 172;
      first.frameHeight = 272;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(172);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7400
     * @tc.name      testResolutionIndependence0074
     * @tc.desc      Verify resolutionIndependenceCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 173;
      first.frameHeight = 273;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(173);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7500
     * @tc.name      testResolutionIndependence0075
     * @tc.desc      Verify resolutionIndependenceCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 174;
      first.frameHeight = 274;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(174);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7600
     * @tc.name      testResolutionIndependence0076
     * @tc.desc      Verify resolutionIndependenceCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 175;
      first.frameHeight = 275;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(175);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7700
     * @tc.name      testResolutionIndependence0077
     * @tc.desc      Verify resolutionIndependenceCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 176;
      first.frameHeight = 276;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(176);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7800
     * @tc.name      testResolutionIndependence0078
     * @tc.desc      Verify resolutionIndependenceCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 177;
      first.frameHeight = 277;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(177);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_7900
     * @tc.name      testResolutionIndependence0079
     * @tc.desc      Verify resolutionIndependenceCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 178;
      first.frameHeight = 278;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(178);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_8000
     * @tc.name      testResolutionIndependence0080
     * @tc.desc      Verify resolutionIndependenceCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 179;
      first.frameHeight = 279;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(179);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_IND_8100
     * @tc.name      testResolutionIndependence0081
     * @tc.desc      Verify resolutionIndependenceCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionIndependence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: Resolution = new Resolution();
      const second: Resolution = new Resolution();
      first.frameWidth = 180;
      first.frameHeight = 280;
      expect(second.frameWidth).assertEqual(0);
      expect(second.frameHeight).assertEqual(0);
      expect(first.frameWidth).assertEqual(180);
    });

  });
}
