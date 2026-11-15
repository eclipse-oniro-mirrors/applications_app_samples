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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaByteLengthMatrixPart1Test(): void {
  describe('MediaByteLengthMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0100
     * @tc.name      testByteLength0001
     * @tc.desc      Verify byte length 0 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0001 begin');
      const actual: number = MediaTools.getMsFromByteLength(0);
      expect(Math.abs(actual - (0.0)) <= Math.abs(0.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0200
     * @tc.name      testByteLength0002
     * @tc.desc      Verify byte length 1 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0002 begin');
      const actual: number = MediaTools.getMsFromByteLength(1);
      expect(Math.abs(actual - (0.005208333333333333)) <= Math.abs(0.005208333333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0300
     * @tc.name      testByteLength0003
     * @tc.desc      Verify byte length 2 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0003 begin');
      const actual: number = MediaTools.getMsFromByteLength(2);
      expect(Math.abs(actual - (0.010416666666666666)) <= Math.abs(0.010416666666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0400
     * @tc.name      testByteLength0004
     * @tc.desc      Verify byte length 3 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0004 begin');
      const actual: number = MediaTools.getMsFromByteLength(3);
      expect(Math.abs(actual - (0.015625)) <= Math.abs(0.015625) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0500
     * @tc.name      testByteLength0005
     * @tc.desc      Verify byte length 5 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0005 begin');
      const actual: number = MediaTools.getMsFromByteLength(5);
      expect(Math.abs(actual - (0.026041666666666668)) <= Math.abs(0.026041666666666668) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0600
     * @tc.name      testByteLength0006
     * @tc.desc      Verify byte length 7 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0006 begin');
      const actual: number = MediaTools.getMsFromByteLength(7);
      expect(Math.abs(actual - (0.036458333333333336)) <= Math.abs(0.036458333333333336) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0700
     * @tc.name      testByteLength0007
     * @tc.desc      Verify byte length 11 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0007 begin');
      const actual: number = MediaTools.getMsFromByteLength(11);
      expect(Math.abs(actual - (0.057291666666666664)) <= Math.abs(0.057291666666666664) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0800
     * @tc.name      testByteLength0008
     * @tc.desc      Verify byte length 13 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0008 begin');
      const actual: number = MediaTools.getMsFromByteLength(13);
      expect(Math.abs(actual - (0.06770833333333333)) <= Math.abs(0.06770833333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_0900
     * @tc.name      testByteLength0009
     * @tc.desc      Verify byte length 17 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0009 begin');
      const actual: number = MediaTools.getMsFromByteLength(17);
      expect(Math.abs(actual - (0.08854166666666667)) <= Math.abs(0.08854166666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1000
     * @tc.name      testByteLength0010
     * @tc.desc      Verify byte length 19 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0010 begin');
      const actual: number = MediaTools.getMsFromByteLength(19);
      expect(Math.abs(actual - (0.09895833333333333)) <= Math.abs(0.09895833333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1100
     * @tc.name      testByteLength0011
     * @tc.desc      Verify byte length 23 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0011 begin');
      const actual: number = MediaTools.getMsFromByteLength(23);
      expect(Math.abs(actual - (0.11979166666666667)) <= Math.abs(0.11979166666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1200
     * @tc.name      testByteLength0012
     * @tc.desc      Verify byte length 29 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0012 begin');
      const actual: number = MediaTools.getMsFromByteLength(29);
      expect(Math.abs(actual - (0.15104166666666666)) <= Math.abs(0.15104166666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1300
     * @tc.name      testByteLength0013
     * @tc.desc      Verify byte length 31 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0013 begin');
      const actual: number = MediaTools.getMsFromByteLength(31);
      expect(Math.abs(actual - (0.16145833333333334)) <= Math.abs(0.16145833333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1400
     * @tc.name      testByteLength0014
     * @tc.desc      Verify byte length 37 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0014 begin');
      const actual: number = MediaTools.getMsFromByteLength(37);
      expect(Math.abs(actual - (0.19270833333333334)) <= Math.abs(0.19270833333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1500
     * @tc.name      testByteLength0015
     * @tc.desc      Verify byte length 41 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0015 begin');
      const actual: number = MediaTools.getMsFromByteLength(41);
      expect(Math.abs(actual - (0.21354166666666666)) <= Math.abs(0.21354166666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1600
     * @tc.name      testByteLength0016
     * @tc.desc      Verify byte length 43 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0016 begin');
      const actual: number = MediaTools.getMsFromByteLength(43);
      expect(Math.abs(actual - (0.22395833333333334)) <= Math.abs(0.22395833333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1700
     * @tc.name      testByteLength0017
     * @tc.desc      Verify byte length 47 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0017 begin');
      const actual: number = MediaTools.getMsFromByteLength(47);
      expect(Math.abs(actual - (0.24479166666666666)) <= Math.abs(0.24479166666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1800
     * @tc.name      testByteLength0018
     * @tc.desc      Verify byte length 53 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0018 begin');
      const actual: number = MediaTools.getMsFromByteLength(53);
      expect(Math.abs(actual - (0.2760416666666667)) <= Math.abs(0.2760416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_1900
     * @tc.name      testByteLength0019
     * @tc.desc      Verify byte length 59 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0019 begin');
      const actual: number = MediaTools.getMsFromByteLength(59);
      expect(Math.abs(actual - (0.3072916666666667)) <= Math.abs(0.3072916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2000
     * @tc.name      testByteLength0020
     * @tc.desc      Verify byte length 61 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0020 begin');
      const actual: number = MediaTools.getMsFromByteLength(61);
      expect(Math.abs(actual - (0.3177083333333333)) <= Math.abs(0.3177083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2100
     * @tc.name      testByteLength0021
     * @tc.desc      Verify byte length 67 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0021 begin');
      const actual: number = MediaTools.getMsFromByteLength(67);
      expect(Math.abs(actual - (0.3489583333333333)) <= Math.abs(0.3489583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2200
     * @tc.name      testByteLength0022
     * @tc.desc      Verify byte length 71 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0022 begin');
      const actual: number = MediaTools.getMsFromByteLength(71);
      expect(Math.abs(actual - (0.3697916666666667)) <= Math.abs(0.3697916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2300
     * @tc.name      testByteLength0023
     * @tc.desc      Verify byte length 73 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0023 begin');
      const actual: number = MediaTools.getMsFromByteLength(73);
      expect(Math.abs(actual - (0.3802083333333333)) <= Math.abs(0.3802083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2400
     * @tc.name      testByteLength0024
     * @tc.desc      Verify byte length 79 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0024 begin');
      const actual: number = MediaTools.getMsFromByteLength(79);
      expect(Math.abs(actual - (0.4114583333333333)) <= Math.abs(0.4114583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2500
     * @tc.name      testByteLength0025
     * @tc.desc      Verify byte length 83 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0025 begin');
      const actual: number = MediaTools.getMsFromByteLength(83);
      expect(Math.abs(actual - (0.4322916666666667)) <= Math.abs(0.4322916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2600
     * @tc.name      testByteLength0026
     * @tc.desc      Verify byte length 89 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0026 begin');
      const actual: number = MediaTools.getMsFromByteLength(89);
      expect(Math.abs(actual - (0.4635416666666667)) <= Math.abs(0.4635416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2700
     * @tc.name      testByteLength0027
     * @tc.desc      Verify byte length 97 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0027 begin');
      const actual: number = MediaTools.getMsFromByteLength(97);
      expect(Math.abs(actual - (0.5052083333333334)) <= Math.abs(0.5052083333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2800
     * @tc.name      testByteLength0028
     * @tc.desc      Verify byte length 101 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0028 begin');
      const actual: number = MediaTools.getMsFromByteLength(101);
      expect(Math.abs(actual - (0.5260416666666666)) <= Math.abs(0.5260416666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_2900
     * @tc.name      testByteLength0029
     * @tc.desc      Verify byte length 103 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0029 begin');
      const actual: number = MediaTools.getMsFromByteLength(103);
      expect(Math.abs(actual - (0.5364583333333334)) <= Math.abs(0.5364583333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3000
     * @tc.name      testByteLength0030
     * @tc.desc      Verify byte length 107 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0030 begin');
      const actual: number = MediaTools.getMsFromByteLength(107);
      expect(Math.abs(actual - (0.5572916666666666)) <= Math.abs(0.5572916666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3100
     * @tc.name      testByteLength0031
     * @tc.desc      Verify byte length 109 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0031 begin');
      const actual: number = MediaTools.getMsFromByteLength(109);
      expect(Math.abs(actual - (0.5677083333333334)) <= Math.abs(0.5677083333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3200
     * @tc.name      testByteLength0032
     * @tc.desc      Verify byte length 113 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0032 begin');
      const actual: number = MediaTools.getMsFromByteLength(113);
      expect(Math.abs(actual - (0.5885416666666666)) <= Math.abs(0.5885416666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3300
     * @tc.name      testByteLength0033
     * @tc.desc      Verify byte length 127 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0033 begin');
      const actual: number = MediaTools.getMsFromByteLength(127);
      expect(Math.abs(actual - (0.6614583333333334)) <= Math.abs(0.6614583333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3400
     * @tc.name      testByteLength0034
     * @tc.desc      Verify byte length 131 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0034 begin');
      const actual: number = MediaTools.getMsFromByteLength(131);
      expect(Math.abs(actual - (0.6822916666666666)) <= Math.abs(0.6822916666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3500
     * @tc.name      testByteLength0035
     * @tc.desc      Verify byte length 137 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0035 begin');
      const actual: number = MediaTools.getMsFromByteLength(137);
      expect(Math.abs(actual - (0.7135416666666666)) <= Math.abs(0.7135416666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3600
     * @tc.name      testByteLength0036
     * @tc.desc      Verify byte length 139 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0036 begin');
      const actual: number = MediaTools.getMsFromByteLength(139);
      expect(Math.abs(actual - (0.7239583333333334)) <= Math.abs(0.7239583333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3700
     * @tc.name      testByteLength0037
     * @tc.desc      Verify byte length 149 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0037 begin');
      const actual: number = MediaTools.getMsFromByteLength(149);
      expect(Math.abs(actual - (0.7760416666666666)) <= Math.abs(0.7760416666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3800
     * @tc.name      testByteLength0038
     * @tc.desc      Verify byte length 151 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0038 begin');
      const actual: number = MediaTools.getMsFromByteLength(151);
      expect(Math.abs(actual - (0.7864583333333334)) <= Math.abs(0.7864583333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_3900
     * @tc.name      testByteLength0039
     * @tc.desc      Verify byte length 157 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0039 begin');
      const actual: number = MediaTools.getMsFromByteLength(157);
      expect(Math.abs(actual - (0.8177083333333334)) <= Math.abs(0.8177083333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4000
     * @tc.name      testByteLength0040
     * @tc.desc      Verify byte length 163 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0040 begin');
      const actual: number = MediaTools.getMsFromByteLength(163);
      expect(Math.abs(actual - (0.8489583333333334)) <= Math.abs(0.8489583333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4100
     * @tc.name      testByteLength0041
     * @tc.desc      Verify byte length 167 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0041 begin');
      const actual: number = MediaTools.getMsFromByteLength(167);
      expect(Math.abs(actual - (0.8697916666666666)) <= Math.abs(0.8697916666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4200
     * @tc.name      testByteLength0042
     * @tc.desc      Verify byte length 173 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0042 begin');
      const actual: number = MediaTools.getMsFromByteLength(173);
      expect(Math.abs(actual - (0.9010416666666666)) <= Math.abs(0.9010416666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4300
     * @tc.name      testByteLength0043
     * @tc.desc      Verify byte length 179 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0043 begin');
      const actual: number = MediaTools.getMsFromByteLength(179);
      expect(Math.abs(actual - (0.9322916666666666)) <= Math.abs(0.9322916666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4400
     * @tc.name      testByteLength0044
     * @tc.desc      Verify byte length 181 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0044 begin');
      const actual: number = MediaTools.getMsFromByteLength(181);
      expect(Math.abs(actual - (0.9427083333333334)) <= Math.abs(0.9427083333333334) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4500
     * @tc.name      testByteLength0045
     * @tc.desc      Verify byte length 191 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0045 begin');
      const actual: number = MediaTools.getMsFromByteLength(191);
      expect(Math.abs(actual - (0.9947916666666666)) <= Math.abs(0.9947916666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4600
     * @tc.name      testByteLength0046
     * @tc.desc      Verify byte length 193 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0046 begin');
      const actual: number = MediaTools.getMsFromByteLength(193);
      expect(Math.abs(actual - (1.0052083333333333)) <= Math.abs(1.0052083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4700
     * @tc.name      testByteLength0047
     * @tc.desc      Verify byte length 197 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0047 begin');
      const actual: number = MediaTools.getMsFromByteLength(197);
      expect(Math.abs(actual - (1.0260416666666667)) <= Math.abs(1.0260416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4800
     * @tc.name      testByteLength0048
     * @tc.desc      Verify byte length 199 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0048 begin');
      const actual: number = MediaTools.getMsFromByteLength(199);
      expect(Math.abs(actual - (1.0364583333333333)) <= Math.abs(1.0364583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_4900
     * @tc.name      testByteLength0049
     * @tc.desc      Verify byte length 211 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0049 begin');
      const actual: number = MediaTools.getMsFromByteLength(211);
      expect(Math.abs(actual - (1.0989583333333333)) <= Math.abs(1.0989583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5000
     * @tc.name      testByteLength0050
     * @tc.desc      Verify byte length 223 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0050 begin');
      const actual: number = MediaTools.getMsFromByteLength(223);
      expect(Math.abs(actual - (1.1614583333333333)) <= Math.abs(1.1614583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5100
     * @tc.name      testByteLength0051
     * @tc.desc      Verify byte length 227 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0051 begin');
      const actual: number = MediaTools.getMsFromByteLength(227);
      expect(Math.abs(actual - (1.1822916666666667)) <= Math.abs(1.1822916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5200
     * @tc.name      testByteLength0052
     * @tc.desc      Verify byte length 229 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0052 begin');
      const actual: number = MediaTools.getMsFromByteLength(229);
      expect(Math.abs(actual - (1.1927083333333333)) <= Math.abs(1.1927083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5300
     * @tc.name      testByteLength0053
     * @tc.desc      Verify byte length 233 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0053 begin');
      const actual: number = MediaTools.getMsFromByteLength(233);
      expect(Math.abs(actual - (1.2135416666666667)) <= Math.abs(1.2135416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5400
     * @tc.name      testByteLength0054
     * @tc.desc      Verify byte length 239 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0054 begin');
      const actual: number = MediaTools.getMsFromByteLength(239);
      expect(Math.abs(actual - (1.2447916666666667)) <= Math.abs(1.2447916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5500
     * @tc.name      testByteLength0055
     * @tc.desc      Verify byte length 241 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0055 begin');
      const actual: number = MediaTools.getMsFromByteLength(241);
      expect(Math.abs(actual - (1.2552083333333333)) <= Math.abs(1.2552083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5600
     * @tc.name      testByteLength0056
     * @tc.desc      Verify byte length 251 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0056 begin');
      const actual: number = MediaTools.getMsFromByteLength(251);
      expect(Math.abs(actual - (1.3072916666666667)) <= Math.abs(1.3072916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5700
     * @tc.name      testByteLength0057
     * @tc.desc      Verify byte length 257 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0057 begin');
      const actual: number = MediaTools.getMsFromByteLength(257);
      expect(Math.abs(actual - (1.3385416666666667)) <= Math.abs(1.3385416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5800
     * @tc.name      testByteLength0058
     * @tc.desc      Verify byte length 263 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0058 begin');
      const actual: number = MediaTools.getMsFromByteLength(263);
      expect(Math.abs(actual - (1.3697916666666667)) <= Math.abs(1.3697916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_5900
     * @tc.name      testByteLength0059
     * @tc.desc      Verify byte length 269 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0059 begin');
      const actual: number = MediaTools.getMsFromByteLength(269);
      expect(Math.abs(actual - (1.4010416666666667)) <= Math.abs(1.4010416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6000
     * @tc.name      testByteLength0060
     * @tc.desc      Verify byte length 271 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0060 begin');
      const actual: number = MediaTools.getMsFromByteLength(271);
      expect(Math.abs(actual - (1.4114583333333333)) <= Math.abs(1.4114583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6100
     * @tc.name      testByteLength0061
     * @tc.desc      Verify byte length 277 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0061 begin');
      const actual: number = MediaTools.getMsFromByteLength(277);
      expect(Math.abs(actual - (1.4427083333333333)) <= Math.abs(1.4427083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6200
     * @tc.name      testByteLength0062
     * @tc.desc      Verify byte length 281 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0062 begin');
      const actual: number = MediaTools.getMsFromByteLength(281);
      expect(Math.abs(actual - (1.4635416666666667)) <= Math.abs(1.4635416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6300
     * @tc.name      testByteLength0063
     * @tc.desc      Verify byte length 283 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0063 begin');
      const actual: number = MediaTools.getMsFromByteLength(283);
      expect(Math.abs(actual - (1.4739583333333333)) <= Math.abs(1.4739583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6400
     * @tc.name      testByteLength0064
     * @tc.desc      Verify byte length 293 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0064 begin');
      const actual: number = MediaTools.getMsFromByteLength(293);
      expect(Math.abs(actual - (1.5260416666666667)) <= Math.abs(1.5260416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6500
     * @tc.name      testByteLength0065
     * @tc.desc      Verify byte length 307 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0065 begin');
      const actual: number = MediaTools.getMsFromByteLength(307);
      expect(Math.abs(actual - (1.5989583333333333)) <= Math.abs(1.5989583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6600
     * @tc.name      testByteLength0066
     * @tc.desc      Verify byte length 311 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0066 begin');
      const actual: number = MediaTools.getMsFromByteLength(311);
      expect(Math.abs(actual - (1.6197916666666667)) <= Math.abs(1.6197916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6700
     * @tc.name      testByteLength0067
     * @tc.desc      Verify byte length 313 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0067 begin');
      const actual: number = MediaTools.getMsFromByteLength(313);
      expect(Math.abs(actual - (1.6302083333333333)) <= Math.abs(1.6302083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6800
     * @tc.name      testByteLength0068
     * @tc.desc      Verify byte length 317 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0068 begin');
      const actual: number = MediaTools.getMsFromByteLength(317);
      expect(Math.abs(actual - (1.6510416666666667)) <= Math.abs(1.6510416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_6900
     * @tc.name      testByteLength0069
     * @tc.desc      Verify byte length 331 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0069 begin');
      const actual: number = MediaTools.getMsFromByteLength(331);
      expect(Math.abs(actual - (1.7239583333333333)) <= Math.abs(1.7239583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7000
     * @tc.name      testByteLength0070
     * @tc.desc      Verify byte length 337 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0070 begin');
      const actual: number = MediaTools.getMsFromByteLength(337);
      expect(Math.abs(actual - (1.7552083333333333)) <= Math.abs(1.7552083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7100
     * @tc.name      testByteLength0071
     * @tc.desc      Verify byte length 347 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0071 begin');
      const actual: number = MediaTools.getMsFromByteLength(347);
      expect(Math.abs(actual - (1.8072916666666667)) <= Math.abs(1.8072916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7200
     * @tc.name      testByteLength0072
     * @tc.desc      Verify byte length 349 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0072 begin');
      const actual: number = MediaTools.getMsFromByteLength(349);
      expect(Math.abs(actual - (1.8177083333333333)) <= Math.abs(1.8177083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7300
     * @tc.name      testByteLength0073
     * @tc.desc      Verify byte length 353 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0073 begin');
      const actual: number = MediaTools.getMsFromByteLength(353);
      expect(Math.abs(actual - (1.8385416666666667)) <= Math.abs(1.8385416666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7400
     * @tc.name      testByteLength0074
     * @tc.desc      Verify byte length 359 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0074 begin');
      const actual: number = MediaTools.getMsFromByteLength(359);
      expect(Math.abs(actual - (1.8697916666666667)) <= Math.abs(1.8697916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7500
     * @tc.name      testByteLength0075
     * @tc.desc      Verify byte length 367 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0075 begin');
      const actual: number = MediaTools.getMsFromByteLength(367);
      expect(Math.abs(actual - (1.9114583333333333)) <= Math.abs(1.9114583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7600
     * @tc.name      testByteLength0076
     * @tc.desc      Verify byte length 373 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0076 begin');
      const actual: number = MediaTools.getMsFromByteLength(373);
      expect(Math.abs(actual - (1.9427083333333333)) <= Math.abs(1.9427083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7700
     * @tc.name      testByteLength0077
     * @tc.desc      Verify byte length 379 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0077 begin');
      const actual: number = MediaTools.getMsFromByteLength(379);
      expect(Math.abs(actual - (1.9739583333333333)) <= Math.abs(1.9739583333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7800
     * @tc.name      testByteLength0078
     * @tc.desc      Verify byte length 383 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0078 begin');
      const actual: number = MediaTools.getMsFromByteLength(383);
      expect(Math.abs(actual - (1.9947916666666667)) <= Math.abs(1.9947916666666667) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_7900
     * @tc.name      testByteLength0079
     * @tc.desc      Verify byte length 389 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0079 begin');
      const actual: number = MediaTools.getMsFromByteLength(389);
      expect(Math.abs(actual - (2.0260416666666665)) <= Math.abs(2.0260416666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8000
     * @tc.name      testByteLength0080
     * @tc.desc      Verify byte length 397 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0080 begin');
      const actual: number = MediaTools.getMsFromByteLength(397);
      expect(Math.abs(actual - (2.0677083333333335)) <= Math.abs(2.0677083333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0080 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8100
     * @tc.name      testByteLength0081
     * @tc.desc      Verify byte length 401 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0081 begin');
      const actual: number = MediaTools.getMsFromByteLength(401);
      expect(Math.abs(actual - (2.0885416666666665)) <= Math.abs(2.0885416666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8200
     * @tc.name      testByteLength0082
     * @tc.desc      Verify byte length 409 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0082 begin');
      const actual: number = MediaTools.getMsFromByteLength(409);
      expect(Math.abs(actual - (2.1302083333333335)) <= Math.abs(2.1302083333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8300
     * @tc.name      testByteLength0083
     * @tc.desc      Verify byte length 419 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0083 begin');
      const actual: number = MediaTools.getMsFromByteLength(419);
      expect(Math.abs(actual - (2.1822916666666665)) <= Math.abs(2.1822916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8400
     * @tc.name      testByteLength0084
     * @tc.desc      Verify byte length 421 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0084 begin');
      const actual: number = MediaTools.getMsFromByteLength(421);
      expect(Math.abs(actual - (2.1927083333333335)) <= Math.abs(2.1927083333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8500
     * @tc.name      testByteLength0085
     * @tc.desc      Verify byte length 431 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0085 begin');
      const actual: number = MediaTools.getMsFromByteLength(431);
      expect(Math.abs(actual - (2.2447916666666665)) <= Math.abs(2.2447916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8600
     * @tc.name      testByteLength0086
     * @tc.desc      Verify byte length 433 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0086 begin');
      const actual: number = MediaTools.getMsFromByteLength(433);
      expect(Math.abs(actual - (2.2552083333333335)) <= Math.abs(2.2552083333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8700
     * @tc.name      testByteLength0087
     * @tc.desc      Verify byte length 439 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0087 begin');
      const actual: number = MediaTools.getMsFromByteLength(439);
      expect(Math.abs(actual - (2.2864583333333335)) <= Math.abs(2.2864583333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8800
     * @tc.name      testByteLength0088
     * @tc.desc      Verify byte length 443 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0088 begin');
      const actual: number = MediaTools.getMsFromByteLength(443);
      expect(Math.abs(actual - (2.3072916666666665)) <= Math.abs(2.3072916666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_8900
     * @tc.name      testByteLength0089
     * @tc.desc      Verify byte length 449 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0089 begin');
      const actual: number = MediaTools.getMsFromByteLength(449);
      expect(Math.abs(actual - (2.3385416666666665)) <= Math.abs(2.3385416666666665) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELENP1_9000
     * @tc.name      testByteLength0090
     * @tc.desc      Verify byte length 457 converts to the documented milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testByteLength0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0090 begin');
      const actual: number = MediaTools.getMsFromByteLength(457);
      expect(Math.abs(actual - (2.3802083333333335)) <= Math.abs(2.3802083333333335) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteLength0090 end');
    })

  })
}
