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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaOffsetMatrixPart1Test(): void {
  describe('MediaOffsetMatrixPart1', () => {

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0100
     * @tc.name      testOffset0001
     * @tc.desc      Verify offset for 0 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0001 begin');
      const actual: number = MediaTools.getOffsetFromTime(0);
      expect(Math.abs(actual - (0.0)) <= Math.abs(0.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0200
     * @tc.name      testOffset0002
     * @tc.desc      Verify offset for 1 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0002 begin');
      const actual: number = MediaTools.getOffsetFromTime(1);
      expect(Math.abs(actual - (192.0)) <= Math.abs(192.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0300
     * @tc.name      testOffset0003
     * @tc.desc      Verify offset for 2 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0003 begin');
      const actual: number = MediaTools.getOffsetFromTime(2);
      expect(Math.abs(actual - (384.0)) <= Math.abs(384.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0400
     * @tc.name      testOffset0004
     * @tc.desc      Verify offset for 3 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0004 begin');
      const actual: number = MediaTools.getOffsetFromTime(3);
      expect(Math.abs(actual - (576.0)) <= Math.abs(576.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0500
     * @tc.name      testOffset0005
     * @tc.desc      Verify offset for 4 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0005 begin');
      const actual: number = MediaTools.getOffsetFromTime(4);
      expect(Math.abs(actual - (768.0)) <= Math.abs(768.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0600
     * @tc.name      testOffset0006
     * @tc.desc      Verify offset for 5 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0006 begin');
      const actual: number = MediaTools.getOffsetFromTime(5);
      expect(Math.abs(actual - (960.0)) <= Math.abs(960.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0700
     * @tc.name      testOffset0007
     * @tc.desc      Verify offset for 6 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0007 begin');
      const actual: number = MediaTools.getOffsetFromTime(6);
      expect(Math.abs(actual - (1152.0)) <= Math.abs(1152.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0800
     * @tc.name      testOffset0008
     * @tc.desc      Verify offset for 7 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0008 begin');
      const actual: number = MediaTools.getOffsetFromTime(7);
      expect(Math.abs(actual - (1344.0)) <= Math.abs(1344.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_0900
     * @tc.name      testOffset0009
     * @tc.desc      Verify offset for 8 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0009 begin');
      const actual: number = MediaTools.getOffsetFromTime(8);
      expect(Math.abs(actual - (1536.0)) <= Math.abs(1536.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1000
     * @tc.name      testOffset0010
     * @tc.desc      Verify offset for 9 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0010 begin');
      const actual: number = MediaTools.getOffsetFromTime(9);
      expect(Math.abs(actual - (1728.0)) <= Math.abs(1728.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1100
     * @tc.name      testOffset0011
     * @tc.desc      Verify offset for 10 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0011 begin');
      const actual: number = MediaTools.getOffsetFromTime(10);
      expect(Math.abs(actual - (1920.0)) <= Math.abs(1920.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1200
     * @tc.name      testOffset0012
     * @tc.desc      Verify offset for 11 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0012 begin');
      const actual: number = MediaTools.getOffsetFromTime(11);
      expect(Math.abs(actual - (2112.0)) <= Math.abs(2112.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1300
     * @tc.name      testOffset0013
     * @tc.desc      Verify offset for 12 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0013 begin');
      const actual: number = MediaTools.getOffsetFromTime(12);
      expect(Math.abs(actual - (2304.0)) <= Math.abs(2304.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1400
     * @tc.name      testOffset0014
     * @tc.desc      Verify offset for 13 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0014 begin');
      const actual: number = MediaTools.getOffsetFromTime(13);
      expect(Math.abs(actual - (2496.0)) <= Math.abs(2496.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1500
     * @tc.name      testOffset0015
     * @tc.desc      Verify offset for 14 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0015 begin');
      const actual: number = MediaTools.getOffsetFromTime(14);
      expect(Math.abs(actual - (2688.0)) <= Math.abs(2688.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1600
     * @tc.name      testOffset0016
     * @tc.desc      Verify offset for 15 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0016 begin');
      const actual: number = MediaTools.getOffsetFromTime(15);
      expect(Math.abs(actual - (2880.0)) <= Math.abs(2880.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1700
     * @tc.name      testOffset0017
     * @tc.desc      Verify offset for 16 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0017 begin');
      const actual: number = MediaTools.getOffsetFromTime(16);
      expect(Math.abs(actual - (3072.0)) <= Math.abs(3072.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1800
     * @tc.name      testOffset0018
     * @tc.desc      Verify offset for 17 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0018 begin');
      const actual: number = MediaTools.getOffsetFromTime(17);
      expect(Math.abs(actual - (3264.0)) <= Math.abs(3264.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_1900
     * @tc.name      testOffset0019
     * @tc.desc      Verify offset for 18 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0019 begin');
      const actual: number = MediaTools.getOffsetFromTime(18);
      expect(Math.abs(actual - (3456.0)) <= Math.abs(3456.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2000
     * @tc.name      testOffset0020
     * @tc.desc      Verify offset for 19 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0020 begin');
      const actual: number = MediaTools.getOffsetFromTime(19);
      expect(Math.abs(actual - (3648.0)) <= Math.abs(3648.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2100
     * @tc.name      testOffset0021
     * @tc.desc      Verify offset for 20 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0021 begin');
      const actual: number = MediaTools.getOffsetFromTime(20);
      expect(Math.abs(actual - (3840.0)) <= Math.abs(3840.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2200
     * @tc.name      testOffset0022
     * @tc.desc      Verify offset for 21 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0022 begin');
      const actual: number = MediaTools.getOffsetFromTime(21);
      expect(Math.abs(actual - (4032.0)) <= Math.abs(4032.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2300
     * @tc.name      testOffset0023
     * @tc.desc      Verify offset for 22 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0023 begin');
      const actual: number = MediaTools.getOffsetFromTime(22);
      expect(Math.abs(actual - (4224.0)) <= Math.abs(4224.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2400
     * @tc.name      testOffset0024
     * @tc.desc      Verify offset for 23 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0024 begin');
      const actual: number = MediaTools.getOffsetFromTime(23);
      expect(Math.abs(actual - (4416.0)) <= Math.abs(4416.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2500
     * @tc.name      testOffset0025
     * @tc.desc      Verify offset for 24 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0025 begin');
      const actual: number = MediaTools.getOffsetFromTime(24);
      expect(Math.abs(actual - (4608.0)) <= Math.abs(4608.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2600
     * @tc.name      testOffset0026
     * @tc.desc      Verify offset for 25 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0026 begin');
      const actual: number = MediaTools.getOffsetFromTime(25);
      expect(Math.abs(actual - (4800.0)) <= Math.abs(4800.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2700
     * @tc.name      testOffset0027
     * @tc.desc      Verify offset for 26 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0027 begin');
      const actual: number = MediaTools.getOffsetFromTime(26);
      expect(Math.abs(actual - (4992.0)) <= Math.abs(4992.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2800
     * @tc.name      testOffset0028
     * @tc.desc      Verify offset for 27 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0028 begin');
      const actual: number = MediaTools.getOffsetFromTime(27);
      expect(Math.abs(actual - (5184.0)) <= Math.abs(5184.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_2900
     * @tc.name      testOffset0029
     * @tc.desc      Verify offset for 28 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0029 begin');
      const actual: number = MediaTools.getOffsetFromTime(28);
      expect(Math.abs(actual - (5376.0)) <= Math.abs(5376.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3000
     * @tc.name      testOffset0030
     * @tc.desc      Verify offset for 29 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0030 begin');
      const actual: number = MediaTools.getOffsetFromTime(29);
      expect(Math.abs(actual - (5568.0)) <= Math.abs(5568.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3100
     * @tc.name      testOffset0031
     * @tc.desc      Verify offset for 30 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0031 begin');
      const actual: number = MediaTools.getOffsetFromTime(30);
      expect(Math.abs(actual - (5760.0)) <= Math.abs(5760.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3200
     * @tc.name      testOffset0032
     * @tc.desc      Verify offset for 31 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0032 begin');
      const actual: number = MediaTools.getOffsetFromTime(31);
      expect(Math.abs(actual - (5952.0)) <= Math.abs(5952.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3300
     * @tc.name      testOffset0033
     * @tc.desc      Verify offset for 32 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0033 begin');
      const actual: number = MediaTools.getOffsetFromTime(32);
      expect(Math.abs(actual - (6144.0)) <= Math.abs(6144.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3400
     * @tc.name      testOffset0034
     * @tc.desc      Verify offset for 33 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0034 begin');
      const actual: number = MediaTools.getOffsetFromTime(33);
      expect(Math.abs(actual - (6336.0)) <= Math.abs(6336.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3500
     * @tc.name      testOffset0035
     * @tc.desc      Verify offset for 34 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0035 begin');
      const actual: number = MediaTools.getOffsetFromTime(34);
      expect(Math.abs(actual - (6528.0)) <= Math.abs(6528.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3600
     * @tc.name      testOffset0036
     * @tc.desc      Verify offset for 35 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0036 begin');
      const actual: number = MediaTools.getOffsetFromTime(35);
      expect(Math.abs(actual - (6720.0)) <= Math.abs(6720.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3700
     * @tc.name      testOffset0037
     * @tc.desc      Verify offset for 36 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0037 begin');
      const actual: number = MediaTools.getOffsetFromTime(36);
      expect(Math.abs(actual - (6912.0)) <= Math.abs(6912.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3800
     * @tc.name      testOffset0038
     * @tc.desc      Verify offset for 37 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0038 begin');
      const actual: number = MediaTools.getOffsetFromTime(37);
      expect(Math.abs(actual - (7104.0)) <= Math.abs(7104.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_3900
     * @tc.name      testOffset0039
     * @tc.desc      Verify offset for 38 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0039 begin');
      const actual: number = MediaTools.getOffsetFromTime(38);
      expect(Math.abs(actual - (7296.0)) <= Math.abs(7296.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4000
     * @tc.name      testOffset0040
     * @tc.desc      Verify offset for 39 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0040 begin');
      const actual: number = MediaTools.getOffsetFromTime(39);
      expect(Math.abs(actual - (7488.0)) <= Math.abs(7488.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4100
     * @tc.name      testOffset0041
     * @tc.desc      Verify offset for 40 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0041 begin');
      const actual: number = MediaTools.getOffsetFromTime(40);
      expect(Math.abs(actual - (7680.0)) <= Math.abs(7680.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4200
     * @tc.name      testOffset0042
     * @tc.desc      Verify offset for 41 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0042 begin');
      const actual: number = MediaTools.getOffsetFromTime(41);
      expect(Math.abs(actual - (7872.0)) <= Math.abs(7872.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4300
     * @tc.name      testOffset0043
     * @tc.desc      Verify offset for 42 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0043 begin');
      const actual: number = MediaTools.getOffsetFromTime(42);
      expect(Math.abs(actual - (8064.0)) <= Math.abs(8064.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4400
     * @tc.name      testOffset0044
     * @tc.desc      Verify offset for 43 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0044 begin');
      const actual: number = MediaTools.getOffsetFromTime(43);
      expect(Math.abs(actual - (8256.0)) <= Math.abs(8256.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4500
     * @tc.name      testOffset0045
     * @tc.desc      Verify offset for 44 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0045 begin');
      const actual: number = MediaTools.getOffsetFromTime(44);
      expect(Math.abs(actual - (8448.0)) <= Math.abs(8448.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4600
     * @tc.name      testOffset0046
     * @tc.desc      Verify offset for 45 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0046 begin');
      const actual: number = MediaTools.getOffsetFromTime(45);
      expect(Math.abs(actual - (8640.0)) <= Math.abs(8640.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4700
     * @tc.name      testOffset0047
     * @tc.desc      Verify offset for 46 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0047 begin');
      const actual: number = MediaTools.getOffsetFromTime(46);
      expect(Math.abs(actual - (8832.0)) <= Math.abs(8832.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4800
     * @tc.name      testOffset0048
     * @tc.desc      Verify offset for 47 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0048 begin');
      const actual: number = MediaTools.getOffsetFromTime(47);
      expect(Math.abs(actual - (9024.0)) <= Math.abs(9024.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_4900
     * @tc.name      testOffset0049
     * @tc.desc      Verify offset for 48 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0049 begin');
      const actual: number = MediaTools.getOffsetFromTime(48);
      expect(Math.abs(actual - (9216.0)) <= Math.abs(9216.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5000
     * @tc.name      testOffset0050
     * @tc.desc      Verify offset for 49 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0050 begin');
      const actual: number = MediaTools.getOffsetFromTime(49);
      expect(Math.abs(actual - (9408.0)) <= Math.abs(9408.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5100
     * @tc.name      testOffset0051
     * @tc.desc      Verify offset for 50 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0051 begin');
      const actual: number = MediaTools.getOffsetFromTime(50);
      expect(Math.abs(actual - (9600.0)) <= Math.abs(9600.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5200
     * @tc.name      testOffset0052
     * @tc.desc      Verify offset for 51 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0052 begin');
      const actual: number = MediaTools.getOffsetFromTime(51);
      expect(Math.abs(actual - (9792.0)) <= Math.abs(9792.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5300
     * @tc.name      testOffset0053
     * @tc.desc      Verify offset for 52 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0053 begin');
      const actual: number = MediaTools.getOffsetFromTime(52);
      expect(Math.abs(actual - (9984.0)) <= Math.abs(9984.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5400
     * @tc.name      testOffset0054
     * @tc.desc      Verify offset for 53 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0054 begin');
      const actual: number = MediaTools.getOffsetFromTime(53);
      expect(Math.abs(actual - (10176.0)) <= Math.abs(10176.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5500
     * @tc.name      testOffset0055
     * @tc.desc      Verify offset for 54 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0055 begin');
      const actual: number = MediaTools.getOffsetFromTime(54);
      expect(Math.abs(actual - (10368.0)) <= Math.abs(10368.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5600
     * @tc.name      testOffset0056
     * @tc.desc      Verify offset for 55 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0056 begin');
      const actual: number = MediaTools.getOffsetFromTime(55);
      expect(Math.abs(actual - (10560.0)) <= Math.abs(10560.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5700
     * @tc.name      testOffset0057
     * @tc.desc      Verify offset for 56 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0057 begin');
      const actual: number = MediaTools.getOffsetFromTime(56);
      expect(Math.abs(actual - (10752.0)) <= Math.abs(10752.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5800
     * @tc.name      testOffset0058
     * @tc.desc      Verify offset for 57 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0058 begin');
      const actual: number = MediaTools.getOffsetFromTime(57);
      expect(Math.abs(actual - (10944.0)) <= Math.abs(10944.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_5900
     * @tc.name      testOffset0059
     * @tc.desc      Verify offset for 58 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0059 begin');
      const actual: number = MediaTools.getOffsetFromTime(58);
      expect(Math.abs(actual - (11136.0)) <= Math.abs(11136.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6000
     * @tc.name      testOffset0060
     * @tc.desc      Verify offset for 59 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0060 begin');
      const actual: number = MediaTools.getOffsetFromTime(59);
      expect(Math.abs(actual - (11328.0)) <= Math.abs(11328.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6100
     * @tc.name      testOffset0061
     * @tc.desc      Verify offset for 60 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0061 begin');
      const actual: number = MediaTools.getOffsetFromTime(60);
      expect(Math.abs(actual - (11520.0)) <= Math.abs(11520.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6200
     * @tc.name      testOffset0062
     * @tc.desc      Verify offset for 61 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0062 begin');
      const actual: number = MediaTools.getOffsetFromTime(61);
      expect(Math.abs(actual - (11712.0)) <= Math.abs(11712.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6300
     * @tc.name      testOffset0063
     * @tc.desc      Verify offset for 62 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0063 begin');
      const actual: number = MediaTools.getOffsetFromTime(62);
      expect(Math.abs(actual - (11904.0)) <= Math.abs(11904.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6400
     * @tc.name      testOffset0064
     * @tc.desc      Verify offset for 63 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0064 begin');
      const actual: number = MediaTools.getOffsetFromTime(63);
      expect(Math.abs(actual - (12096.0)) <= Math.abs(12096.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6500
     * @tc.name      testOffset0065
     * @tc.desc      Verify offset for 64 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0065 begin');
      const actual: number = MediaTools.getOffsetFromTime(64);
      expect(Math.abs(actual - (12288.0)) <= Math.abs(12288.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6600
     * @tc.name      testOffset0066
     * @tc.desc      Verify offset for 65 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0066 begin');
      const actual: number = MediaTools.getOffsetFromTime(65);
      expect(Math.abs(actual - (12480.0)) <= Math.abs(12480.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6700
     * @tc.name      testOffset0067
     * @tc.desc      Verify offset for 66 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0067 begin');
      const actual: number = MediaTools.getOffsetFromTime(66);
      expect(Math.abs(actual - (12672.0)) <= Math.abs(12672.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6800
     * @tc.name      testOffset0068
     * @tc.desc      Verify offset for 67 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0068 begin');
      const actual: number = MediaTools.getOffsetFromTime(67);
      expect(Math.abs(actual - (12864.0)) <= Math.abs(12864.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_6900
     * @tc.name      testOffset0069
     * @tc.desc      Verify offset for 68 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0069 begin');
      const actual: number = MediaTools.getOffsetFromTime(68);
      expect(Math.abs(actual - (13056.0)) <= Math.abs(13056.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7000
     * @tc.name      testOffset0070
     * @tc.desc      Verify offset for 69 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0070 begin');
      const actual: number = MediaTools.getOffsetFromTime(69);
      expect(Math.abs(actual - (13248.0)) <= Math.abs(13248.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7100
     * @tc.name      testOffset0071
     * @tc.desc      Verify offset for 70 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0071 begin');
      const actual: number = MediaTools.getOffsetFromTime(70);
      expect(Math.abs(actual - (13440.0)) <= Math.abs(13440.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7200
     * @tc.name      testOffset0072
     * @tc.desc      Verify offset for 71 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0072 begin');
      const actual: number = MediaTools.getOffsetFromTime(71);
      expect(Math.abs(actual - (13632.0)) <= Math.abs(13632.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7300
     * @tc.name      testOffset0073
     * @tc.desc      Verify offset for 72 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0073 begin');
      const actual: number = MediaTools.getOffsetFromTime(72);
      expect(Math.abs(actual - (13824.0)) <= Math.abs(13824.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7400
     * @tc.name      testOffset0074
     * @tc.desc      Verify offset for 73 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0074 begin');
      const actual: number = MediaTools.getOffsetFromTime(73);
      expect(Math.abs(actual - (14016.0)) <= Math.abs(14016.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7500
     * @tc.name      testOffset0075
     * @tc.desc      Verify offset for 74 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0075 begin');
      const actual: number = MediaTools.getOffsetFromTime(74);
      expect(Math.abs(actual - (14208.0)) <= Math.abs(14208.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7600
     * @tc.name      testOffset0076
     * @tc.desc      Verify offset for 75 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0076 begin');
      const actual: number = MediaTools.getOffsetFromTime(75);
      expect(Math.abs(actual - (14400.0)) <= Math.abs(14400.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7700
     * @tc.name      testOffset0077
     * @tc.desc      Verify offset for 76 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0077 begin');
      const actual: number = MediaTools.getOffsetFromTime(76);
      expect(Math.abs(actual - (14592.0)) <= Math.abs(14592.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7800
     * @tc.name      testOffset0078
     * @tc.desc      Verify offset for 77 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0078 begin');
      const actual: number = MediaTools.getOffsetFromTime(77);
      expect(Math.abs(actual - (14784.0)) <= Math.abs(14784.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_7900
     * @tc.name      testOffset0079
     * @tc.desc      Verify offset for 78 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0079 begin');
      const actual: number = MediaTools.getOffsetFromTime(78);
      expect(Math.abs(actual - (14976.0)) <= Math.abs(14976.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8000
     * @tc.name      testOffset0080
     * @tc.desc      Verify offset for 79 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0080 begin');
      const actual: number = MediaTools.getOffsetFromTime(79);
      expect(Math.abs(actual - (15168.0)) <= Math.abs(15168.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0080 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8100
     * @tc.name      testOffset0081
     * @tc.desc      Verify offset for 80 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0081 begin');
      const actual: number = MediaTools.getOffsetFromTime(80);
      expect(Math.abs(actual - (15360.0)) <= Math.abs(15360.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8200
     * @tc.name      testOffset0082
     * @tc.desc      Verify offset for 81 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0082 begin');
      const actual: number = MediaTools.getOffsetFromTime(81);
      expect(Math.abs(actual - (15552.0)) <= Math.abs(15552.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8300
     * @tc.name      testOffset0083
     * @tc.desc      Verify offset for 82 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0083 begin');
      const actual: number = MediaTools.getOffsetFromTime(82);
      expect(Math.abs(actual - (15744.0)) <= Math.abs(15744.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8400
     * @tc.name      testOffset0084
     * @tc.desc      Verify offset for 83 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0084 begin');
      const actual: number = MediaTools.getOffsetFromTime(83);
      expect(Math.abs(actual - (15936.0)) <= Math.abs(15936.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8500
     * @tc.name      testOffset0085
     * @tc.desc      Verify offset for 84 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0085 begin');
      const actual: number = MediaTools.getOffsetFromTime(84);
      expect(Math.abs(actual - (16128.0)) <= Math.abs(16128.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8600
     * @tc.name      testOffset0086
     * @tc.desc      Verify offset for 85 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0086 begin');
      const actual: number = MediaTools.getOffsetFromTime(85);
      expect(Math.abs(actual - (16320.0)) <= Math.abs(16320.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8700
     * @tc.name      testOffset0087
     * @tc.desc      Verify offset for 86 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0087 begin');
      const actual: number = MediaTools.getOffsetFromTime(86);
      expect(Math.abs(actual - (16512.0)) <= Math.abs(16512.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8800
     * @tc.name      testOffset0088
     * @tc.desc      Verify offset for 87 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0088 begin');
      const actual: number = MediaTools.getOffsetFromTime(87);
      expect(Math.abs(actual - (16704.0)) <= Math.abs(16704.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_8900
     * @tc.name      testOffset0089
     * @tc.desc      Verify offset for 88 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0089 begin');
      const actual: number = MediaTools.getOffsetFromTime(88);
      expect(Math.abs(actual - (16896.0)) <= Math.abs(16896.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSETP1_9000
     * @tc.name      testOffset0090
     * @tc.desc      Verify offset for 89 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testOffset0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0090 begin');
      const actual: number = MediaTools.getOffsetFromTime(89);
      expect(Math.abs(actual - (17088.0)) <= Math.abs(17088.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffset0090 end');
    })

  })
}
