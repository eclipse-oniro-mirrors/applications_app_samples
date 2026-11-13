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

const TAG: string = '[Sample_resolutionFieldsCore]';
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
export default function resolutionFieldsCoreTest(): void {
  describe('resolutionFieldsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0100
     * @tc.name      testResolutionFields0001
     * @tc.desc      Verify resolutionFieldsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0200
     * @tc.name      testResolutionFields0002
     * @tc.desc      Verify resolutionFieldsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0300
     * @tc.name      testResolutionFields0003
     * @tc.desc      Verify resolutionFieldsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0400
     * @tc.name      testResolutionFields0004
     * @tc.desc      Verify resolutionFieldsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0500
     * @tc.name      testResolutionFields0005
     * @tc.desc      Verify resolutionFieldsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0600
     * @tc.name      testResolutionFields0006
     * @tc.desc      Verify resolutionFieldsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0700
     * @tc.name      testResolutionFields0007
     * @tc.desc      Verify resolutionFieldsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0800
     * @tc.name      testResolutionFields0008
     * @tc.desc      Verify resolutionFieldsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_0900
     * @tc.name      testResolutionFields0009
     * @tc.desc      Verify resolutionFieldsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1000
     * @tc.name      testResolutionFields0010
     * @tc.desc      Verify resolutionFieldsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1100
     * @tc.name      testResolutionFields0011
     * @tc.desc      Verify resolutionFieldsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1200
     * @tc.name      testResolutionFields0012
     * @tc.desc      Verify resolutionFieldsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1300
     * @tc.name      testResolutionFields0013
     * @tc.desc      Verify resolutionFieldsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1400
     * @tc.name      testResolutionFields0014
     * @tc.desc      Verify resolutionFieldsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1500
     * @tc.name      testResolutionFields0015
     * @tc.desc      Verify resolutionFieldsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1600
     * @tc.name      testResolutionFields0016
     * @tc.desc      Verify resolutionFieldsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1700
     * @tc.name      testResolutionFields0017
     * @tc.desc      Verify resolutionFieldsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1800
     * @tc.name      testResolutionFields0018
     * @tc.desc      Verify resolutionFieldsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_1900
     * @tc.name      testResolutionFields0019
     * @tc.desc      Verify resolutionFieldsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2000
     * @tc.name      testResolutionFields0020
     * @tc.desc      Verify resolutionFieldsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2100
     * @tc.name      testResolutionFields0021
     * @tc.desc      Verify resolutionFieldsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2200
     * @tc.name      testResolutionFields0022
     * @tc.desc      Verify resolutionFieldsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2300
     * @tc.name      testResolutionFields0023
     * @tc.desc      Verify resolutionFieldsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2400
     * @tc.name      testResolutionFields0024
     * @tc.desc      Verify resolutionFieldsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2500
     * @tc.name      testResolutionFields0025
     * @tc.desc      Verify resolutionFieldsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2600
     * @tc.name      testResolutionFields0026
     * @tc.desc      Verify resolutionFieldsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2700
     * @tc.name      testResolutionFields0027
     * @tc.desc      Verify resolutionFieldsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2800
     * @tc.name      testResolutionFields0028
     * @tc.desc      Verify resolutionFieldsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_2900
     * @tc.name      testResolutionFields0029
     * @tc.desc      Verify resolutionFieldsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3000
     * @tc.name      testResolutionFields0030
     * @tc.desc      Verify resolutionFieldsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3100
     * @tc.name      testResolutionFields0031
     * @tc.desc      Verify resolutionFieldsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3200
     * @tc.name      testResolutionFields0032
     * @tc.desc      Verify resolutionFieldsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3300
     * @tc.name      testResolutionFields0033
     * @tc.desc      Verify resolutionFieldsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3400
     * @tc.name      testResolutionFields0034
     * @tc.desc      Verify resolutionFieldsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3500
     * @tc.name      testResolutionFields0035
     * @tc.desc      Verify resolutionFieldsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3600
     * @tc.name      testResolutionFields0036
     * @tc.desc      Verify resolutionFieldsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3700
     * @tc.name      testResolutionFields0037
     * @tc.desc      Verify resolutionFieldsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3800
     * @tc.name      testResolutionFields0038
     * @tc.desc      Verify resolutionFieldsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_3900
     * @tc.name      testResolutionFields0039
     * @tc.desc      Verify resolutionFieldsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4000
     * @tc.name      testResolutionFields0040
     * @tc.desc      Verify resolutionFieldsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4100
     * @tc.name      testResolutionFields0041
     * @tc.desc      Verify resolutionFieldsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4200
     * @tc.name      testResolutionFields0042
     * @tc.desc      Verify resolutionFieldsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4300
     * @tc.name      testResolutionFields0043
     * @tc.desc      Verify resolutionFieldsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4400
     * @tc.name      testResolutionFields0044
     * @tc.desc      Verify resolutionFieldsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4500
     * @tc.name      testResolutionFields0045
     * @tc.desc      Verify resolutionFieldsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4600
     * @tc.name      testResolutionFields0046
     * @tc.desc      Verify resolutionFieldsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4700
     * @tc.name      testResolutionFields0047
     * @tc.desc      Verify resolutionFieldsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4800
     * @tc.name      testResolutionFields0048
     * @tc.desc      Verify resolutionFieldsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_4900
     * @tc.name      testResolutionFields0049
     * @tc.desc      Verify resolutionFieldsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5000
     * @tc.name      testResolutionFields0050
     * @tc.desc      Verify resolutionFieldsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5100
     * @tc.name      testResolutionFields0051
     * @tc.desc      Verify resolutionFieldsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5200
     * @tc.name      testResolutionFields0052
     * @tc.desc      Verify resolutionFieldsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5300
     * @tc.name      testResolutionFields0053
     * @tc.desc      Verify resolutionFieldsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5400
     * @tc.name      testResolutionFields0054
     * @tc.desc      Verify resolutionFieldsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5500
     * @tc.name      testResolutionFields0055
     * @tc.desc      Verify resolutionFieldsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5600
     * @tc.name      testResolutionFields0056
     * @tc.desc      Verify resolutionFieldsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5700
     * @tc.name      testResolutionFields0057
     * @tc.desc      Verify resolutionFieldsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5800
     * @tc.name      testResolutionFields0058
     * @tc.desc      Verify resolutionFieldsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_5900
     * @tc.name      testResolutionFields0059
     * @tc.desc      Verify resolutionFieldsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6000
     * @tc.name      testResolutionFields0060
     * @tc.desc      Verify resolutionFieldsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6100
     * @tc.name      testResolutionFields0061
     * @tc.desc      Verify resolutionFieldsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6200
     * @tc.name      testResolutionFields0062
     * @tc.desc      Verify resolutionFieldsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6300
     * @tc.name      testResolutionFields0063
     * @tc.desc      Verify resolutionFieldsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6400
     * @tc.name      testResolutionFields0064
     * @tc.desc      Verify resolutionFieldsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6500
     * @tc.name      testResolutionFields0065
     * @tc.desc      Verify resolutionFieldsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6600
     * @tc.name      testResolutionFields0066
     * @tc.desc      Verify resolutionFieldsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6700
     * @tc.name      testResolutionFields0067
     * @tc.desc      Verify resolutionFieldsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6800
     * @tc.name      testResolutionFields0068
     * @tc.desc      Verify resolutionFieldsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_6900
     * @tc.name      testResolutionFields0069
     * @tc.desc      Verify resolutionFieldsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7000
     * @tc.name      testResolutionFields0070
     * @tc.desc      Verify resolutionFieldsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7100
     * @tc.name      testResolutionFields0071
     * @tc.desc      Verify resolutionFieldsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7200
     * @tc.name      testResolutionFields0072
     * @tc.desc      Verify resolutionFieldsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7300
     * @tc.name      testResolutionFields0073
     * @tc.desc      Verify resolutionFieldsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7400
     * @tc.name      testResolutionFields0074
     * @tc.desc      Verify resolutionFieldsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7500
     * @tc.name      testResolutionFields0075
     * @tc.desc      Verify resolutionFieldsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7600
     * @tc.name      testResolutionFields0076
     * @tc.desc      Verify resolutionFieldsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7700
     * @tc.name      testResolutionFields0077
     * @tc.desc      Verify resolutionFieldsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 800;
      resolution.frameHeight = 600;
      expect(resolution.frameWidth).assertEqual(800);
      expect(resolution.frameHeight).assertEqual(600);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7800
     * @tc.name      testResolutionFields0078
     * @tc.desc      Verify resolutionFieldsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 960;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(960);
      expect(resolution.frameHeight).assertEqual(720);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_7900
     * @tc.name      testResolutionFields0079
     * @tc.desc      Verify resolutionFieldsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1120;
      resolution.frameHeight = 840;
      expect(resolution.frameWidth).assertEqual(1120);
      expect(resolution.frameHeight).assertEqual(840);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_8000
     * @tc.name      testResolutionFields0080
     * @tc.desc      Verify resolutionFieldsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 960;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(960);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_FIELD_8100
     * @tc.name      testResolutionFields0081
     * @tc.desc      Verify resolutionFieldsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionFields0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
    });

  });
}
