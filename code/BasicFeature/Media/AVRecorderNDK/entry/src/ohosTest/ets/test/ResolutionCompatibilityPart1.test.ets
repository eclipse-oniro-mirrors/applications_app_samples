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
import { Resolution } from '../../../main/ets/services/CommonTypes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function ResolutionCompatibilityPart1Test(): void {
  describe('ResolutionCompatibilityPart1', () => {

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0100
     * @tc.name      testResolutionDefaultW0001
     * @tc.desc      Verify Resolution defaults width to zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaultW0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionDefaultW0001 begin');
      const r: Resolution = new Resolution();
      expect(r.frameWidth).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionDefaultW0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0200
     * @tc.name      testResolutionDefaultH0002
     * @tc.desc      Verify Resolution defaults height to zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaultH0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionDefaultH0002 begin');
      const r: Resolution = new Resolution();
      expect(r.frameHeight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionDefaultH0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0300
     * @tc.name      testResolutionPair0003
     * @tc.desc      Verify Resolution stores 1920x1080.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0003 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1920;
      r.frameHeight = 1080;
      expect(r.frameWidth).assertEqual(1920);
      expect(r.frameHeight).assertEqual(1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0400
     * @tc.name      testResolutionPair0004
     * @tc.desc      Verify Resolution stores 1280x720.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0004 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1280;
      r.frameHeight = 720;
      expect(r.frameWidth).assertEqual(1280);
      expect(r.frameHeight).assertEqual(720);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0500
     * @tc.name      testResolutionPair0005
     * @tc.desc      Verify Resolution stores 640x480.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0005 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 640;
      r.frameHeight = 480;
      expect(r.frameWidth).assertEqual(640);
      expect(r.frameHeight).assertEqual(480);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0600
     * @tc.name      testResolutionPair0006
     * @tc.desc      Verify Resolution stores 3840x2160.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0006 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 3840;
      r.frameHeight = 2160;
      expect(r.frameWidth).assertEqual(3840);
      expect(r.frameHeight).assertEqual(2160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0700
     * @tc.name      testResolutionPair0007
     * @tc.desc      Verify Resolution stores 720x1280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0007 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 720;
      r.frameHeight = 1280;
      expect(r.frameWidth).assertEqual(720);
      expect(r.frameHeight).assertEqual(1280);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0800
     * @tc.name      testResolutionPair0008
     * @tc.desc      Verify Resolution stores 1080x1920.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0008 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1080;
      r.frameHeight = 1920;
      expect(r.frameWidth).assertEqual(1080);
      expect(r.frameHeight).assertEqual(1920);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_0900
     * @tc.name      testResolutionPair0009
     * @tc.desc      Verify Resolution stores 2560x1440.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0009 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 2560;
      r.frameHeight = 1440;
      expect(r.frameWidth).assertEqual(2560);
      expect(r.frameHeight).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1000
     * @tc.name      testResolutionPair0010
     * @tc.desc      Verify Resolution stores 1600x900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0010 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1600;
      r.frameHeight = 900;
      expect(r.frameWidth).assertEqual(1600);
      expect(r.frameHeight).assertEqual(900);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1100
     * @tc.name      testResolutionPair0011
     * @tc.desc      Verify Resolution stores 1366x768.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0011 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1366;
      r.frameHeight = 768;
      expect(r.frameWidth).assertEqual(1366);
      expect(r.frameHeight).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1200
     * @tc.name      testResolutionPair0012
     * @tc.desc      Verify Resolution stores 1024x768.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0012 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1024;
      r.frameHeight = 768;
      expect(r.frameWidth).assertEqual(1024);
      expect(r.frameHeight).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1300
     * @tc.name      testResolutionPair0013
     * @tc.desc      Verify Resolution stores 800x600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0013 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 800;
      r.frameHeight = 600;
      expect(r.frameWidth).assertEqual(800);
      expect(r.frameHeight).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1400
     * @tc.name      testResolutionPair0014
     * @tc.desc      Verify Resolution stores 320x240.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionPair0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0014 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 320;
      r.frameHeight = 240;
      expect(r.frameWidth).assertEqual(320);
      expect(r.frameHeight).assertEqual(240);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionPair0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1500
     * @tc.name      testResolutionSwap0015
     * @tc.desc      Verify swapped orientation pair 2160x3840.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionSwap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0015 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 2160;
      r.frameHeight = 3840;
      expect(r.frameWidth).assertEqual(2160);
      expect(r.frameHeight).assertEqual(3840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1600
     * @tc.name      testResolutionSwap0016
     * @tc.desc      Verify swapped orientation pair 1440x2560.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionSwap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0016 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1440;
      r.frameHeight = 2560;
      expect(r.frameWidth).assertEqual(1440);
      expect(r.frameHeight).assertEqual(2560);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1700
     * @tc.name      testResolutionSwap0017
     * @tc.desc      Verify swapped orientation pair 900x1600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionSwap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0017 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 900;
      r.frameHeight = 1600;
      expect(r.frameWidth).assertEqual(900);
      expect(r.frameHeight).assertEqual(1600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1800
     * @tc.name      testResolutionSwap0018
     * @tc.desc      Verify swapped orientation pair 1200x1600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionSwap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0018 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1200;
      r.frameHeight = 1600;
      expect(r.frameWidth).assertEqual(1200);
      expect(r.frameHeight).assertEqual(1600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_1900
     * @tc.name      testResolutionSwap0019
     * @tc.desc      Verify swapped orientation pair 800x1280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionSwap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0019 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 800;
      r.frameHeight = 1280;
      expect(r.frameWidth).assertEqual(800);
      expect(r.frameHeight).assertEqual(1280);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2000
     * @tc.name      testResolutionSwap0020
     * @tc.desc      Verify swapped orientation pair 600x1024.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionSwap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0020 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 600;
      r.frameHeight = 1024;
      expect(r.frameWidth).assertEqual(600);
      expect(r.frameHeight).assertEqual(1024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionSwap0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2100
     * @tc.name      testResolutionExtreme0021
     * @tc.desc      Verify Resolution accepts extreme pair -1x-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResolutionExtreme0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0021 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = -1;
      r.frameHeight = -1;
      expect(r.frameWidth).assertEqual(-1);
      expect(r.frameHeight).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2200
     * @tc.name      testResolutionExtreme0022
     * @tc.desc      Verify Resolution accepts extreme pair 0x0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResolutionExtreme0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0022 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 0;
      r.frameHeight = 0;
      expect(r.frameWidth).assertEqual(0);
      expect(r.frameHeight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2300
     * @tc.name      testResolutionExtreme0023
     * @tc.desc      Verify Resolution accepts extreme pair 1x1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResolutionExtreme0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0023 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 1;
      r.frameHeight = 1;
      expect(r.frameWidth).assertEqual(1);
      expect(r.frameHeight).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2400
     * @tc.name      testResolutionExtreme0024
     * @tc.desc      Verify Resolution accepts extreme pair 999999x999999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResolutionExtreme0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0024 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 999999;
      r.frameHeight = 999999;
      expect(r.frameWidth).assertEqual(999999);
      expect(r.frameHeight).assertEqual(999999);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionExtreme0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2500
     * @tc.name      testResolutionIndependent0025
     * @tc.desc      Verify two Resolution instances keep independent fields.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResolutionIndependent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionIndependent0025 begin');
      const a: Resolution = new Resolution();
      const b: Resolution = new Resolution();
      a.frameWidth = 1920;
      a.frameHeight = 1080;
      expect(b.frameWidth).assertEqual(0);
      expect(b.frameHeight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionIndependent0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2600
     * @tc.name      testResolutionMore0026
     * @tc.desc      Verify Resolution stores 100x56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0026 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 100;
      r.frameHeight = 56;
      expect(r.frameWidth).assertEqual(100);
      expect(r.frameHeight).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2700
     * @tc.name      testResolutionMore0027
     * @tc.desc      Verify Resolution stores 113x63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0027 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 113;
      r.frameHeight = 63;
      expect(r.frameWidth).assertEqual(113);
      expect(r.frameHeight).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2800
     * @tc.name      testResolutionMore0028
     * @tc.desc      Verify Resolution stores 126x70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0028 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 126;
      r.frameHeight = 70;
      expect(r.frameWidth).assertEqual(126);
      expect(r.frameHeight).assertEqual(70);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_2900
     * @tc.name      testResolutionMore0029
     * @tc.desc      Verify Resolution stores 139x78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0029 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 139;
      r.frameHeight = 78;
      expect(r.frameWidth).assertEqual(139);
      expect(r.frameHeight).assertEqual(78);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3000
     * @tc.name      testResolutionMore0030
     * @tc.desc      Verify Resolution stores 152x85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0030 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 152;
      r.frameHeight = 85;
      expect(r.frameWidth).assertEqual(152);
      expect(r.frameHeight).assertEqual(85);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3100
     * @tc.name      testResolutionMore0031
     * @tc.desc      Verify Resolution stores 165x92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0031 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 165;
      r.frameHeight = 92;
      expect(r.frameWidth).assertEqual(165);
      expect(r.frameHeight).assertEqual(92);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3200
     * @tc.name      testResolutionMore0032
     * @tc.desc      Verify Resolution stores 178x100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0032 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 178;
      r.frameHeight = 100;
      expect(r.frameWidth).assertEqual(178);
      expect(r.frameHeight).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3300
     * @tc.name      testResolutionMore0033
     * @tc.desc      Verify Resolution stores 191x107.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0033 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 191;
      r.frameHeight = 107;
      expect(r.frameWidth).assertEqual(191);
      expect(r.frameHeight).assertEqual(107);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3400
     * @tc.name      testResolutionMore0034
     * @tc.desc      Verify Resolution stores 204x114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0034 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 204;
      r.frameHeight = 114;
      expect(r.frameWidth).assertEqual(204);
      expect(r.frameHeight).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3500
     * @tc.name      testResolutionMore0035
     * @tc.desc      Verify Resolution stores 217x122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0035 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 217;
      r.frameHeight = 122;
      expect(r.frameWidth).assertEqual(217);
      expect(r.frameHeight).assertEqual(122);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3600
     * @tc.name      testResolutionMore0036
     * @tc.desc      Verify Resolution stores 230x129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0036 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 230;
      r.frameHeight = 129;
      expect(r.frameWidth).assertEqual(230);
      expect(r.frameHeight).assertEqual(129);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3700
     * @tc.name      testResolutionMore0037
     * @tc.desc      Verify Resolution stores 243x136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0037 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 243;
      r.frameHeight = 136;
      expect(r.frameWidth).assertEqual(243);
      expect(r.frameHeight).assertEqual(136);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3800
     * @tc.name      testResolutionMore0038
     * @tc.desc      Verify Resolution stores 256x144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0038 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 256;
      r.frameHeight = 144;
      expect(r.frameWidth).assertEqual(256);
      expect(r.frameHeight).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_3900
     * @tc.name      testResolutionMore0039
     * @tc.desc      Verify Resolution stores 269x151.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0039 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 269;
      r.frameHeight = 151;
      expect(r.frameWidth).assertEqual(269);
      expect(r.frameHeight).assertEqual(151);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4000
     * @tc.name      testResolutionMore0040
     * @tc.desc      Verify Resolution stores 282x158.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0040 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 282;
      r.frameHeight = 158;
      expect(r.frameWidth).assertEqual(282);
      expect(r.frameHeight).assertEqual(158);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4100
     * @tc.name      testResolutionMore0041
     * @tc.desc      Verify Resolution stores 295x165.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0041 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 295;
      r.frameHeight = 165;
      expect(r.frameWidth).assertEqual(295);
      expect(r.frameHeight).assertEqual(165);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4200
     * @tc.name      testResolutionMore0042
     * @tc.desc      Verify Resolution stores 308x173.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0042 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 308;
      r.frameHeight = 173;
      expect(r.frameWidth).assertEqual(308);
      expect(r.frameHeight).assertEqual(173);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4300
     * @tc.name      testResolutionMore0043
     * @tc.desc      Verify Resolution stores 321x180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0043 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 321;
      r.frameHeight = 180;
      expect(r.frameWidth).assertEqual(321);
      expect(r.frameHeight).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4400
     * @tc.name      testResolutionMore0044
     * @tc.desc      Verify Resolution stores 334x187.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0044 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 334;
      r.frameHeight = 187;
      expect(r.frameWidth).assertEqual(334);
      expect(r.frameHeight).assertEqual(187);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4500
     * @tc.name      testResolutionMore0045
     * @tc.desc      Verify Resolution stores 347x195.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0045 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 347;
      r.frameHeight = 195;
      expect(r.frameWidth).assertEqual(347);
      expect(r.frameHeight).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4600
     * @tc.name      testResolutionMore0046
     * @tc.desc      Verify Resolution stores 360x202.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0046 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 360;
      r.frameHeight = 202;
      expect(r.frameWidth).assertEqual(360);
      expect(r.frameHeight).assertEqual(202);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4700
     * @tc.name      testResolutionMore0047
     * @tc.desc      Verify Resolution stores 373x209.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0047 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 373;
      r.frameHeight = 209;
      expect(r.frameWidth).assertEqual(373);
      expect(r.frameHeight).assertEqual(209);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4800
     * @tc.name      testResolutionMore0048
     * @tc.desc      Verify Resolution stores 386x217.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0048 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 386;
      r.frameHeight = 217;
      expect(r.frameWidth).assertEqual(386);
      expect(r.frameHeight).assertEqual(217);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_4900
     * @tc.name      testResolutionMore0049
     * @tc.desc      Verify Resolution stores 399x224.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0049 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 399;
      r.frameHeight = 224;
      expect(r.frameWidth).assertEqual(399);
      expect(r.frameHeight).assertEqual(224);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5000
     * @tc.name      testResolutionMore0050
     * @tc.desc      Verify Resolution stores 412x231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0050 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 412;
      r.frameHeight = 231;
      expect(r.frameWidth).assertEqual(412);
      expect(r.frameHeight).assertEqual(231);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5100
     * @tc.name      testResolutionMore0051
     * @tc.desc      Verify Resolution stores 425x239.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0051 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 425;
      r.frameHeight = 239;
      expect(r.frameWidth).assertEqual(425);
      expect(r.frameHeight).assertEqual(239);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5200
     * @tc.name      testResolutionMore0052
     * @tc.desc      Verify Resolution stores 438x246.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0052 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 438;
      r.frameHeight = 246;
      expect(r.frameWidth).assertEqual(438);
      expect(r.frameHeight).assertEqual(246);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5300
     * @tc.name      testResolutionMore0053
     * @tc.desc      Verify Resolution stores 451x253.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0053 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 451;
      r.frameHeight = 253;
      expect(r.frameWidth).assertEqual(451);
      expect(r.frameHeight).assertEqual(253);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5400
     * @tc.name      testResolutionMore0054
     * @tc.desc      Verify Resolution stores 464x261.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0054 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 464;
      r.frameHeight = 261;
      expect(r.frameWidth).assertEqual(464);
      expect(r.frameHeight).assertEqual(261);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5500
     * @tc.name      testResolutionMore0055
     * @tc.desc      Verify Resolution stores 477x268.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0055 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 477;
      r.frameHeight = 268;
      expect(r.frameWidth).assertEqual(477);
      expect(r.frameHeight).assertEqual(268);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5600
     * @tc.name      testResolutionMore0056
     * @tc.desc      Verify Resolution stores 490x275.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0056 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 490;
      r.frameHeight = 275;
      expect(r.frameWidth).assertEqual(490);
      expect(r.frameHeight).assertEqual(275);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5700
     * @tc.name      testResolutionMore0057
     * @tc.desc      Verify Resolution stores 503x282.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0057 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 503;
      r.frameHeight = 282;
      expect(r.frameWidth).assertEqual(503);
      expect(r.frameHeight).assertEqual(282);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5800
     * @tc.name      testResolutionMore0058
     * @tc.desc      Verify Resolution stores 516x290.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0058 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 516;
      r.frameHeight = 290;
      expect(r.frameWidth).assertEqual(516);
      expect(r.frameHeight).assertEqual(290);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_5900
     * @tc.name      testResolutionMore0059
     * @tc.desc      Verify Resolution stores 529x297.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0059 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 529;
      r.frameHeight = 297;
      expect(r.frameWidth).assertEqual(529);
      expect(r.frameHeight).assertEqual(297);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6000
     * @tc.name      testResolutionMore0060
     * @tc.desc      Verify Resolution stores 542x304.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0060 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 542;
      r.frameHeight = 304;
      expect(r.frameWidth).assertEqual(542);
      expect(r.frameHeight).assertEqual(304);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6100
     * @tc.name      testResolutionMore0061
     * @tc.desc      Verify Resolution stores 555x312.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0061 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 555;
      r.frameHeight = 312;
      expect(r.frameWidth).assertEqual(555);
      expect(r.frameHeight).assertEqual(312);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6200
     * @tc.name      testResolutionMore0062
     * @tc.desc      Verify Resolution stores 568x319.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0062 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 568;
      r.frameHeight = 319;
      expect(r.frameWidth).assertEqual(568);
      expect(r.frameHeight).assertEqual(319);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6300
     * @tc.name      testResolutionMore0063
     * @tc.desc      Verify Resolution stores 581x326.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0063 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 581;
      r.frameHeight = 326;
      expect(r.frameWidth).assertEqual(581);
      expect(r.frameHeight).assertEqual(326);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6400
     * @tc.name      testResolutionMore0064
     * @tc.desc      Verify Resolution stores 594x334.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0064 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 594;
      r.frameHeight = 334;
      expect(r.frameWidth).assertEqual(594);
      expect(r.frameHeight).assertEqual(334);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6500
     * @tc.name      testResolutionMore0065
     * @tc.desc      Verify Resolution stores 607x341.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0065 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 607;
      r.frameHeight = 341;
      expect(r.frameWidth).assertEqual(607);
      expect(r.frameHeight).assertEqual(341);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6600
     * @tc.name      testResolutionMore0066
     * @tc.desc      Verify Resolution stores 620x348.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0066 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 620;
      r.frameHeight = 348;
      expect(r.frameWidth).assertEqual(620);
      expect(r.frameHeight).assertEqual(348);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6700
     * @tc.name      testResolutionMore0067
     * @tc.desc      Verify Resolution stores 633x356.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0067 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 633;
      r.frameHeight = 356;
      expect(r.frameWidth).assertEqual(633);
      expect(r.frameHeight).assertEqual(356);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6800
     * @tc.name      testResolutionMore0068
     * @tc.desc      Verify Resolution stores 646x363.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0068 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 646;
      r.frameHeight = 363;
      expect(r.frameWidth).assertEqual(646);
      expect(r.frameHeight).assertEqual(363);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_6900
     * @tc.name      testResolutionMore0069
     * @tc.desc      Verify Resolution stores 659x370.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0069 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 659;
      r.frameHeight = 370;
      expect(r.frameWidth).assertEqual(659);
      expect(r.frameHeight).assertEqual(370);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7000
     * @tc.name      testResolutionMore0070
     * @tc.desc      Verify Resolution stores 672x378.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0070 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 672;
      r.frameHeight = 378;
      expect(r.frameWidth).assertEqual(672);
      expect(r.frameHeight).assertEqual(378);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7100
     * @tc.name      testResolutionMore0071
     * @tc.desc      Verify Resolution stores 685x385.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0071 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 685;
      r.frameHeight = 385;
      expect(r.frameWidth).assertEqual(685);
      expect(r.frameHeight).assertEqual(385);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7200
     * @tc.name      testResolutionMore0072
     * @tc.desc      Verify Resolution stores 698x392.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0072 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 698;
      r.frameHeight = 392;
      expect(r.frameWidth).assertEqual(698);
      expect(r.frameHeight).assertEqual(392);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7300
     * @tc.name      testResolutionMore0073
     * @tc.desc      Verify Resolution stores 711x399.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0073 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 711;
      r.frameHeight = 399;
      expect(r.frameWidth).assertEqual(711);
      expect(r.frameHeight).assertEqual(399);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7400
     * @tc.name      testResolutionMore0074
     * @tc.desc      Verify Resolution stores 724x407.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0074 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 724;
      r.frameHeight = 407;
      expect(r.frameWidth).assertEqual(724);
      expect(r.frameHeight).assertEqual(407);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7500
     * @tc.name      testResolutionMore0075
     * @tc.desc      Verify Resolution stores 737x414.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0075 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 737;
      r.frameHeight = 414;
      expect(r.frameWidth).assertEqual(737);
      expect(r.frameHeight).assertEqual(414);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7600
     * @tc.name      testResolutionMore0076
     * @tc.desc      Verify Resolution stores 750x421.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0076 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 750;
      r.frameHeight = 421;
      expect(r.frameWidth).assertEqual(750);
      expect(r.frameHeight).assertEqual(421);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0076 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7700
     * @tc.name      testResolutionMore0077
     * @tc.desc      Verify Resolution stores 763x429.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0077 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 763;
      r.frameHeight = 429;
      expect(r.frameWidth).assertEqual(763);
      expect(r.frameHeight).assertEqual(429);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0077 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7800
     * @tc.name      testResolutionMore0078
     * @tc.desc      Verify Resolution stores 776x436.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0078 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 776;
      r.frameHeight = 436;
      expect(r.frameWidth).assertEqual(776);
      expect(r.frameHeight).assertEqual(436);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0078 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_7900
     * @tc.name      testResolutionMore0079
     * @tc.desc      Verify Resolution stores 789x443.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0079 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 789;
      r.frameHeight = 443;
      expect(r.frameWidth).assertEqual(789);
      expect(r.frameHeight).assertEqual(443);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0079 end');
    })

    /**
     * @tc.number    SUB_AVREC_RESCOMPP1_8000
     * @tc.name      testResolutionMore0080
     * @tc.desc      Verify Resolution stores 802x451.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionMore0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0080 begin');
      const r: Resolution = new Resolution();
      r.frameWidth = 802;
      r.frameHeight = 451;
      expect(r.frameWidth).assertEqual(802);
      expect(r.frameHeight).assertEqual(451);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolutionMore0080 end');
    })

  })
}
