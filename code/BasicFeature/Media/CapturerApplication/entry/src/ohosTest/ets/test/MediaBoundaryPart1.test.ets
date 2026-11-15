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

export default function MediaBoundaryPart1Test(): void {
  describe('MediaBoundaryPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0100
     * @tc.name      testByteEdge0001
     * @tc.desc      Verify byte edge input -192000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0001 begin');
      const actual: number = MediaTools.getMsFromByteLength(-192000);
      expect(Math.abs(actual - (-1000.0)) <= Math.abs(-1000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0200
     * @tc.name      testByteEdge0002
     * @tc.desc      Verify byte edge input -96000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0002 begin');
      const actual: number = MediaTools.getMsFromByteLength(-96000);
      expect(Math.abs(actual - (-500.0)) <= Math.abs(-500.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0300
     * @tc.name      testByteEdge0003
     * @tc.desc      Verify byte edge input -1920 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0003 begin');
      const actual: number = MediaTools.getMsFromByteLength(-1920);
      expect(Math.abs(actual - (-10.0)) <= Math.abs(-10.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0400
     * @tc.name      testByteEdge0004
     * @tc.desc      Verify byte edge input -1 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0004 begin');
      const actual: number = MediaTools.getMsFromByteLength(-1);
      expect(Math.abs(actual - (-0.005208333333333333)) <= Math.abs(-0.005208333333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0500
     * @tc.name      testByteEdge0005
     * @tc.desc      Verify byte edge input 0 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0005 begin');
      const actual: number = MediaTools.getMsFromByteLength(0);
      expect(Math.abs(actual - (0.0)) <= Math.abs(0.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0600
     * @tc.name      testByteEdge0006
     * @tc.desc      Verify byte edge input 1 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0006 begin');
      const actual: number = MediaTools.getMsFromByteLength(1);
      expect(Math.abs(actual - (0.005208333333333333)) <= Math.abs(0.005208333333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0700
     * @tc.name      testByteEdge0007
     * @tc.desc      Verify byte edge input 96 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0007 begin');
      const actual: number = MediaTools.getMsFromByteLength(96);
      expect(Math.abs(actual - (0.5)) <= Math.abs(0.5) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0800
     * @tc.name      testByteEdge0008
     * @tc.desc      Verify byte edge input 191 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0008 begin');
      const actual: number = MediaTools.getMsFromByteLength(191);
      expect(Math.abs(actual - (0.9947916666666666)) <= Math.abs(0.9947916666666666) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_0900
     * @tc.name      testByteEdge0009
     * @tc.desc      Verify byte edge input 192 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0009 begin');
      const actual: number = MediaTools.getMsFromByteLength(192);
      expect(Math.abs(actual - (1.0)) <= Math.abs(1.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1000
     * @tc.name      testByteEdge0010
     * @tc.desc      Verify byte edge input 193 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0010 begin');
      const actual: number = MediaTools.getMsFromByteLength(193);
      expect(Math.abs(actual - (1.0052083333333333)) <= Math.abs(1.0052083333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1100
     * @tc.name      testByteEdge0011
     * @tc.desc      Verify byte edge input 480 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0011 begin');
      const actual: number = MediaTools.getMsFromByteLength(480);
      expect(Math.abs(actual - (2.5)) <= Math.abs(2.5) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1200
     * @tc.name      testByteEdge0012
     * @tc.desc      Verify byte edge input 960 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0012 begin');
      const actual: number = MediaTools.getMsFromByteLength(960);
      expect(Math.abs(actual - (5.0)) <= Math.abs(5.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1300
     * @tc.name      testByteEdge0013
     * @tc.desc      Verify byte edge input 1920 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0013 begin');
      const actual: number = MediaTools.getMsFromByteLength(1920);
      expect(Math.abs(actual - (10.0)) <= Math.abs(10.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1400
     * @tc.name      testByteEdge0014
     * @tc.desc      Verify byte edge input 4800 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0014 begin');
      const actual: number = MediaTools.getMsFromByteLength(4800);
      expect(Math.abs(actual - (25.0)) <= Math.abs(25.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1500
     * @tc.name      testByteEdge0015
     * @tc.desc      Verify byte edge input 9600 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0015 begin');
      const actual: number = MediaTools.getMsFromByteLength(9600);
      expect(Math.abs(actual - (50.0)) <= Math.abs(50.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1600
     * @tc.name      testByteEdge0016
     * @tc.desc      Verify byte edge input 19200 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0016 begin');
      const actual: number = MediaTools.getMsFromByteLength(19200);
      expect(Math.abs(actual - (100.0)) <= Math.abs(100.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1700
     * @tc.name      testByteEdge0017
     * @tc.desc      Verify byte edge input 38400 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0017 begin');
      const actual: number = MediaTools.getMsFromByteLength(38400);
      expect(Math.abs(actual - (200.0)) <= Math.abs(200.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1800
     * @tc.name      testByteEdge0018
     * @tc.desc      Verify byte edge input 48000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0018 begin');
      const actual: number = MediaTools.getMsFromByteLength(48000);
      expect(Math.abs(actual - (250.0)) <= Math.abs(250.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_1900
     * @tc.name      testByteEdge0019
     * @tc.desc      Verify byte edge input 96000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0019 begin');
      const actual: number = MediaTools.getMsFromByteLength(96000);
      expect(Math.abs(actual - (500.0)) <= Math.abs(500.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2000
     * @tc.name      testByteEdge0020
     * @tc.desc      Verify byte edge input 144000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0020 begin');
      const actual: number = MediaTools.getMsFromByteLength(144000);
      expect(Math.abs(actual - (750.0)) <= Math.abs(750.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2100
     * @tc.name      testByteEdge0021
     * @tc.desc      Verify byte edge input 192000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0021 begin');
      const actual: number = MediaTools.getMsFromByteLength(192000);
      expect(Math.abs(actual - (1000.0)) <= Math.abs(1000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2200
     * @tc.name      testByteEdge0022
     * @tc.desc      Verify byte edge input 240000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0022 begin');
      const actual: number = MediaTools.getMsFromByteLength(240000);
      expect(Math.abs(actual - (1250.0)) <= Math.abs(1250.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2300
     * @tc.name      testByteEdge0023
     * @tc.desc      Verify byte edge input 288000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0023 begin');
      const actual: number = MediaTools.getMsFromByteLength(288000);
      expect(Math.abs(actual - (1500.0)) <= Math.abs(1500.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2400
     * @tc.name      testByteEdge0024
     * @tc.desc      Verify byte edge input 384000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0024 begin');
      const actual: number = MediaTools.getMsFromByteLength(384000);
      expect(Math.abs(actual - (2000.0)) <= Math.abs(2000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2500
     * @tc.name      testByteEdge0025
     * @tc.desc      Verify byte edge input 480000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0025 begin');
      const actual: number = MediaTools.getMsFromByteLength(480000);
      expect(Math.abs(actual - (2500.0)) <= Math.abs(2500.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2600
     * @tc.name      testByteEdge0026
     * @tc.desc      Verify byte edge input 960000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0026 begin');
      const actual: number = MediaTools.getMsFromByteLength(960000);
      expect(Math.abs(actual - (5000.0)) <= Math.abs(5000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2700
     * @tc.name      testByteEdge0027
     * @tc.desc      Verify byte edge input 1000000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0027 begin');
      const actual: number = MediaTools.getMsFromByteLength(1000000);
      expect(Math.abs(actual - (5208.333333333333)) <= Math.abs(5208.333333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2800
     * @tc.name      testByteEdge0028
     * @tc.desc      Verify byte edge input 1920000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0028 begin');
      const actual: number = MediaTools.getMsFromByteLength(1920000);
      expect(Math.abs(actual - (10000.0)) <= Math.abs(10000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_2900
     * @tc.name      testByteEdge0029
     * @tc.desc      Verify byte edge input 10000000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0029 begin');
      const actual: number = MediaTools.getMsFromByteLength(10000000);
      expect(Math.abs(actual - (52083.333333333336)) <= Math.abs(52083.333333333336) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3000
     * @tc.name      testByteEdge0030
     * @tc.desc      Verify byte edge input 1000000000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0030 begin');
      const actual: number = MediaTools.getMsFromByteLength(1000000000);
      expect(Math.abs(actual - (5208333.333333333)) <= Math.abs(5208333.333333333) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteEdge0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3100
     * @tc.name      testByteNaN0031
     * @tc.desc      Verify byte conversion handles NaN.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteNaN0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteNaN0031 begin');
      expect(Number.isNaN(MediaTools.getMsFromByteLength(NaN))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteNaN0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3200
     * @tc.name      testByteInfinity0032
     * @tc.desc      Verify byte conversion handles positive infinity.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteInfinity0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteInfinity0032 begin');
      expect(MediaTools.getMsFromByteLength(Infinity) === Infinity).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteInfinity0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3300
     * @tc.name      testByteNegInfinity0033
     * @tc.desc      Verify byte conversion handles negative infinity.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteNegInfinity0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteNegInfinity0033 begin');
      expect(MediaTools.getMsFromByteLength(-Infinity) === -Infinity).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteNegInfinity0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3400
     * @tc.name      testOffsetEdge0034
     * @tc.desc      Verify offset edge input -1000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0034 begin');
      const actual: number = MediaTools.getOffsetFromTime(-1000);
      expect(Math.abs(actual - (-192000.0)) <= Math.abs(-192000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3500
     * @tc.name      testOffsetEdge0035
     * @tc.desc      Verify offset edge input -1 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0035 begin');
      const actual: number = MediaTools.getOffsetFromTime(-1);
      expect(Math.abs(actual - (-192.0)) <= Math.abs(-192.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3600
     * @tc.name      testOffsetEdge0036
     * @tc.desc      Verify offset edge input 0 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0036 begin');
      const actual: number = MediaTools.getOffsetFromTime(0);
      expect(Math.abs(actual - (0.0)) <= Math.abs(0.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3700
     * @tc.name      testOffsetEdge0037
     * @tc.desc      Verify offset edge input 1 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0037 begin');
      const actual: number = MediaTools.getOffsetFromTime(1);
      expect(Math.abs(actual - (192.0)) <= Math.abs(192.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3800
     * @tc.name      testOffsetEdge0038
     * @tc.desc      Verify offset edge input 2 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0038 begin');
      const actual: number = MediaTools.getOffsetFromTime(2);
      expect(Math.abs(actual - (384.0)) <= Math.abs(384.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_3900
     * @tc.name      testOffsetEdge0039
     * @tc.desc      Verify offset edge input 5 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0039 begin');
      const actual: number = MediaTools.getOffsetFromTime(5);
      expect(Math.abs(actual - (960.0)) <= Math.abs(960.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4000
     * @tc.name      testOffsetEdge0040
     * @tc.desc      Verify offset edge input 10 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0040 begin');
      const actual: number = MediaTools.getOffsetFromTime(10);
      expect(Math.abs(actual - (1920.0)) <= Math.abs(1920.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4100
     * @tc.name      testOffsetEdge0041
     * @tc.desc      Verify offset edge input 100 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0041 begin');
      const actual: number = MediaTools.getOffsetFromTime(100);
      expect(Math.abs(actual - (19200.0)) <= Math.abs(19200.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4200
     * @tc.name      testOffsetEdge0042
     * @tc.desc      Verify offset edge input 500 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0042 begin');
      const actual: number = MediaTools.getOffsetFromTime(500);
      expect(Math.abs(actual - (96000.0)) <= Math.abs(96000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4300
     * @tc.name      testOffsetEdge0043
     * @tc.desc      Verify offset edge input 999 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0043 begin');
      const actual: number = MediaTools.getOffsetFromTime(999);
      expect(Math.abs(actual - (191808.0)) <= Math.abs(191808.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4400
     * @tc.name      testOffsetEdge0044
     * @tc.desc      Verify offset edge input 1000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0044 begin');
      const actual: number = MediaTools.getOffsetFromTime(1000);
      expect(Math.abs(actual - (192000.0)) <= Math.abs(192000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4500
     * @tc.name      testOffsetEdge0045
     * @tc.desc      Verify offset edge input 1500 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0045 begin');
      const actual: number = MediaTools.getOffsetFromTime(1500);
      expect(Math.abs(actual - (288000.0)) <= Math.abs(288000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4600
     * @tc.name      testOffsetEdge0046
     * @tc.desc      Verify offset edge input 2000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0046 begin');
      const actual: number = MediaTools.getOffsetFromTime(2000);
      expect(Math.abs(actual - (384000.0)) <= Math.abs(384000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4700
     * @tc.name      testOffsetEdge0047
     * @tc.desc      Verify offset edge input 5000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0047 begin');
      const actual: number = MediaTools.getOffsetFromTime(5000);
      expect(Math.abs(actual - (960000.0)) <= Math.abs(960000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4800
     * @tc.name      testOffsetEdge0048
     * @tc.desc      Verify offset edge input 10000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0048 begin');
      const actual: number = MediaTools.getOffsetFromTime(10000);
      expect(Math.abs(actual - (1920000.0)) <= Math.abs(1920000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_4900
     * @tc.name      testOffsetEdge0049
     * @tc.desc      Verify offset edge input 60000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0049 begin');
      const actual: number = MediaTools.getOffsetFromTime(60000);
      expect(Math.abs(actual - (11520000.0)) <= Math.abs(11520000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5000
     * @tc.name      testOffsetEdge0050
     * @tc.desc      Verify offset edge input 120000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0050 begin');
      const actual: number = MediaTools.getOffsetFromTime(120000);
      expect(Math.abs(actual - (23040000.0)) <= Math.abs(23040000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5100
     * @tc.name      testOffsetEdge0051
     * @tc.desc      Verify offset edge input 3600000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0051 begin');
      const actual: number = MediaTools.getOffsetFromTime(3600000);
      expect(Math.abs(actual - (691200000.0)) <= Math.abs(691200000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5200
     * @tc.name      testOffsetEdge0052
     * @tc.desc      Verify offset edge input 7200000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0052 begin');
      const actual: number = MediaTools.getOffsetFromTime(7200000);
      expect(Math.abs(actual - (1382400000.0)) <= Math.abs(1382400000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5300
     * @tc.name      testOffsetEdge0053
     * @tc.desc      Verify offset edge input 86400000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0053 begin');
      const actual: number = MediaTools.getOffsetFromTime(86400000);
      expect(Math.abs(actual - (16588800000.0)) <= Math.abs(16588800000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5400
     * @tc.name      testOffsetEdge0054
     * @tc.desc      Verify offset edge input 86461000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0054 begin');
      const actual: number = MediaTools.getOffsetFromTime(86461000);
      expect(Math.abs(actual - (16600512000.0)) <= Math.abs(16600512000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5500
     * @tc.name      testOffsetEdge0055
     * @tc.desc      Verify offset edge input 100000000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0055 begin');
      const actual: number = MediaTools.getOffsetFromTime(100000000);
      expect(Math.abs(actual - (19200000000.0)) <= Math.abs(19200000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5600
     * @tc.name      testOffsetEdge0056
     * @tc.desc      Verify offset edge input 1000000000 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0056 begin');
      const actual: number = MediaTools.getOffsetFromTime(1000000000);
      expect(Math.abs(actual - (192000000000.0)) <= Math.abs(192000000000.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5700
     * @tc.name      testOffsetEdge0057
     * @tc.desc      Verify offset edge input 1.5 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0057 begin');
      const actual: number = MediaTools.getOffsetFromTime(1.5);
      expect(Math.abs(actual - (288.0)) <= Math.abs(288.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5800
     * @tc.name      testOffsetEdge0058
     * @tc.desc      Verify offset edge input 0.5 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0058 begin');
      const actual: number = MediaTools.getOffsetFromTime(0.5);
      expect(Math.abs(actual - (96.0)) <= Math.abs(96.0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_5900
     * @tc.name      testOffsetEdge0059
     * @tc.desc      Verify offset edge input 123.456 keeps the conversion.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetEdge0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0059 begin');
      const actual: number = MediaTools.getOffsetFromTime(123.456);
      expect(Math.abs(actual - (23703.552)) <= Math.abs(23703.552) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetEdge0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6000
     * @tc.name      testOffsetNaN0060
     * @tc.desc      Verify offset conversion handles NaN.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetNaN0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetNaN0060 begin');
      expect(Number.isNaN(MediaTools.getOffsetFromTime(NaN))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetNaN0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6100
     * @tc.name      testOffsetInfinity0061
     * @tc.desc      Verify offset conversion handles positive infinity.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetInfinity0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetInfinity0061 begin');
      expect(MediaTools.getOffsetFromTime(Infinity) === Infinity).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetInfinity0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6200
     * @tc.name      testOffsetNegInfinity0062
     * @tc.desc      Verify offset conversion handles negative infinity.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetNegInfinity0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetNegInfinity0062 begin');
      expect(MediaTools.getOffsetFromTime(-Infinity) === -Infinity).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetNegInfinity0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6300
     * @tc.name      testCountdownEdge0063
     * @tc.desc      Verify countdown edge input 0 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0063 begin');
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6400
     * @tc.name      testCountdownEdge0064
     * @tc.desc      Verify countdown edge input 1 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0064 begin');
      expect(MediaTools.msToCountdownTime(1)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6500
     * @tc.name      testCountdownEdge0065
     * @tc.desc      Verify countdown edge input 500 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0065 begin');
      expect(MediaTools.msToCountdownTime(500)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6600
     * @tc.name      testCountdownEdge0066
     * @tc.desc      Verify countdown edge input 999 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0066 begin');
      expect(MediaTools.msToCountdownTime(999)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6700
     * @tc.name      testCountdownEdge0067
     * @tc.desc      Verify countdown edge input 1000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0067 begin');
      expect(MediaTools.msToCountdownTime(1000)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6800
     * @tc.name      testCountdownEdge0068
     * @tc.desc      Verify countdown edge input 1500 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0068 begin');
      expect(MediaTools.msToCountdownTime(1500)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_6900
     * @tc.name      testCountdownEdge0069
     * @tc.desc      Verify countdown edge input 59999 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0069 begin');
      expect(MediaTools.msToCountdownTime(59999)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7000
     * @tc.name      testCountdownEdge0070
     * @tc.desc      Verify countdown edge input 60000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0070 begin');
      expect(MediaTools.msToCountdownTime(60000)).assertEqual('01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7100
     * @tc.name      testCountdownEdge0071
     * @tc.desc      Verify countdown edge input 61000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0071 begin');
      expect(MediaTools.msToCountdownTime(61000)).assertEqual('01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7200
     * @tc.name      testCountdownEdge0072
     * @tc.desc      Verify countdown edge input 3599000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0072 begin');
      expect(MediaTools.msToCountdownTime(3599000)).assertEqual('59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7300
     * @tc.name      testCountdownEdge0073
     * @tc.desc      Verify countdown edge input 3600000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0073 begin');
      expect(MediaTools.msToCountdownTime(3600000)).assertEqual('01:\n      00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7400
     * @tc.name      testCountdownEdge0074
     * @tc.desc      Verify countdown edge input 3661000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0074 begin');
      expect(MediaTools.msToCountdownTime(3661000)).assertEqual('01:\n      01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7500
     * @tc.name      testCountdownEdge0075
     * @tc.desc      Verify countdown edge input 86399999 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0075 begin');
      expect(MediaTools.msToCountdownTime(86399999)).assertEqual('23:\n      59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7600
     * @tc.name      testCountdownEdge0076
     * @tc.desc      Verify countdown edge input 86400000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0076 begin');
      expect(MediaTools.msToCountdownTime(86400000)).assertEqual('01:\n      00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7700
     * @tc.name      testCountdownEdge0077
     * @tc.desc      Verify countdown edge input 90061000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0077 begin');
      expect(MediaTools.msToCountdownTime(90061000)).assertEqual('01:01:\n      01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7800
     * @tc.name      testCountdownEdge0078
     * @tc.desc      Verify countdown edge input 172800000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0078 begin');
      expect(MediaTools.msToCountdownTime(172800000)).assertEqual('02:\n      00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_7900
     * @tc.name      testCountdownEdge0079
     * @tc.desc      Verify countdown edge input 1000000000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0079 begin');
      expect(MediaTools.msToCountdownTime(1000000000)).assertEqual('11:13:\n      46:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8000
     * @tc.name      testCountdownEdge0080
     * @tc.desc      Verify countdown edge input 123456789 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0080 begin');
      expect(MediaTools.msToCountdownTime(123456789)).assertEqual('01:10:\n      17:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0080 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8100
     * @tc.name      testCountdownEdge0081
     * @tc.desc      Verify countdown edge input 1000000000000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0081 begin');
      expect(MediaTools.msToCountdownTime(1000000000000)).assertEqual('11574:01:\n      46:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8200
     * @tc.name      testCountdownEdge0082
     * @tc.desc      Verify countdown edge input -1 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0082 begin');
      expect(MediaTools.msToCountdownTime(-1)).assertEqual('-1:-1:\n      -1:-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8300
     * @tc.name      testCountdownEdge0083
     * @tc.desc      Verify countdown edge input -1000 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0083 begin');
      expect(MediaTools.msToCountdownTime(-1000)).assertEqual('-1:-1:\n      -1:-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8400
     * @tc.name      testCountdownEdge0084
     * @tc.desc      Verify countdown edge input 0.5 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0084 begin');
      expect(MediaTools.msToCountdownTime(0.5)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8500
     * @tc.name      testCountdownEdge0085
     * @tc.desc      Verify countdown edge input 1.5 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0085 begin');
      expect(MediaTools.msToCountdownTime(1.5)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8600
     * @tc.name      testCountdownEdge0086
     * @tc.desc      Verify countdown edge input 3599.5 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0086 begin');
      expect(MediaTools.msToCountdownTime(3599.5)).assertEqual('00:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8700
     * @tc.name      testCountdownEdge0087
     * @tc.desc      Verify countdown edge input 3599999.5 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0087 begin');
      expect(MediaTools.msToCountdownTime(3599999.5)).assertEqual('59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8800
     * @tc.name      testCountdownEdge0088
     * @tc.desc      Verify countdown edge input 86399999.5 keeps the formatting.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownEdge0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0088 begin');
      expect(MediaTools.msToCountdownTime(86399999.5)).assertEqual('23:\n      59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownEdge0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_8900
     * @tc.name      testCountdownNaN0089
     * @tc.desc      Verify countdown handles NaN as an empty duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownNaN0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownNaN0089 begin');
      expect(MediaTools.msToCountdownTime(NaN)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownNaN0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP1_9000
     * @tc.name      testCountdownInfinity0090
     * @tc.desc      Verify countdown handles positive infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownInfinity0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownInfinity0090 begin');
      expect(MediaTools.msToCountdownTime(Infinity)).assertEqual('Infinity:\n      NaN:NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownInfinity0090 end');
    })

  })
}
