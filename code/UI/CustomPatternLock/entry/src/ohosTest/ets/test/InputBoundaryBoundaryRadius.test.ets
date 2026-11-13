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
import {
  CustomCircleStyleOptions,
  CustomPatternLockChallengeResult,
  CustomPatternLockController
} from '../../../main/ets/pages/CustomPatternLock';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_InputBoundary]';

export default function InputBoundaryBoundaryRadiusTest() {
  describe('InputBoundaryBoundaryRadius', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testBoundaryRadius0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0001 begin');
      const index: number = 0;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0001 end');
    });

    it('testBoundaryRadius0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0002 begin');
      const index: number = 1;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0002 end');
    });

    it('testBoundaryRadius0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0003 begin');
      const index: number = 2;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0003 end');
    });

    it('testBoundaryRadius0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0004 begin');
      const index: number = 3;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0004 end');
    });

    it('testBoundaryRadius0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0005 begin');
      const index: number = 4;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0005 end');
    });

    it('testBoundaryRadius0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0006 begin');
      const index: number = 5;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0006 end');
    });

    it('testBoundaryRadius0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0007 begin');
      const index: number = 6;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0007 end');
    });

    it('testBoundaryRadius0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0008 begin');
      const index: number = 7;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0008 end');
    });

    it('testBoundaryRadius0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0009 begin');
      const index: number = 8;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0009 end');
    });

    it('testBoundaryRadius0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0010 begin');
      const index: number = 9;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0010 end');
    });

    it('testBoundaryRadius0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0011 begin');
      const index: number = 10;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0011 end');
    });

    it('testBoundaryRadius0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0012 begin');
      const index: number = 11;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0012 end');
    });

    it('testBoundaryRadius0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0013 begin');
      const index: number = 12;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0013 end');
    });

    it('testBoundaryRadius0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0014 begin');
      const index: number = 13;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0014 end');
    });

    it('testBoundaryRadius0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0015 begin');
      const index: number = 14;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0015 end');
    });

    it('testBoundaryRadius0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0016 begin');
      const index: number = 15;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0016 end');
    });

    it('testBoundaryRadius0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0017 begin');
      const index: number = 16;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0017 end');
    });

    it('testBoundaryRadius0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0018 begin');
      const index: number = 17;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0018 end');
    });

    it('testBoundaryRadius0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0019 begin');
      const index: number = 18;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0019 end');
    });

    it('testBoundaryRadius0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0020 begin');
      const index: number = 19;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0020 end');
    });

    it('testBoundaryRadius0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0021 begin');
      const index: number = 20;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0021 end');
    });

    it('testBoundaryRadius0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0022 begin');
      const index: number = 21;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0022 end');
    });

    it('testBoundaryRadius0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0023 begin');
      const index: number = 22;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0023 end');
    });

    it('testBoundaryRadius0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0024 begin');
      const index: number = 23;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0024 end');
    });

    it('testBoundaryRadius0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0025 begin');
      const index: number = 24;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0025 end');
    });

    it('testBoundaryRadius0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0026 begin');
      const index: number = 25;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0026 end');
    });

    it('testBoundaryRadius0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0027 begin');
      const index: number = 26;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0027 end');
    });

    it('testBoundaryRadius0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0028 begin');
      const index: number = 27;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0028 end');
    });

    it('testBoundaryRadius0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0029 begin');
      const index: number = 28;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0029 end');
    });

    it('testBoundaryRadius0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0030 begin');
      const index: number = 29;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0030 end');
    });

    it('testBoundaryRadius0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0031 begin');
      const index: number = 30;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0031 end');
    });

    it('testBoundaryRadius0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0032 begin');
      const index: number = 31;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0032 end');
    });

    it('testBoundaryRadius0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0033 begin');
      const index: number = 32;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0033 end');
    });

    it('testBoundaryRadius0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0034 begin');
      const index: number = 33;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0034 end');
    });

    it('testBoundaryRadius0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0035 begin');
      const index: number = 34;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0035 end');
    });

    it('testBoundaryRadius0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0036 begin');
      const index: number = 35;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0036 end');
    });

    it('testBoundaryRadius0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0037 begin');
      const index: number = 36;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0037 end');
    });

    it('testBoundaryRadius0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0038 begin');
      const index: number = 37;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0038 end');
    });

    it('testBoundaryRadius0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0039 begin');
      const index: number = 38;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0039 end');
    });

    it('testBoundaryRadius0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0040 begin');
      const index: number = 39;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0040 end');
    });

    it('testBoundaryRadius0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0041 begin');
      const index: number = 40;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0041 end');
    });

    it('testBoundaryRadius0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0042 begin');
      const index: number = 41;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0042 end');
    });

    it('testBoundaryRadius0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0043 begin');
      const index: number = 42;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0043 end');
    });

    it('testBoundaryRadius0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0044 begin');
      const index: number = 43;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0044 end');
    });

    it('testBoundaryRadius0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0045 begin');
      const index: number = 44;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0045 end');
    });

    it('testBoundaryRadius0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0046 begin');
      const index: number = 45;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0046 end');
    });

    it('testBoundaryRadius0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0047 begin');
      const index: number = 46;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0047 end');
    });

    it('testBoundaryRadius0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0048 begin');
      const index: number = 47;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0048 end');
    });

    it('testBoundaryRadius0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0049 begin');
      const index: number = 48;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0049 end');
    });

    it('testBoundaryRadius0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0050 begin');
      const index: number = 49;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0050 end');
    });

    it('testBoundaryRadius0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0051 begin');
      const index: number = 50;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0051 end');
    });

    it('testBoundaryRadius0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0052 begin');
      const index: number = 51;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0052 end');
    });

    it('testBoundaryRadius0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0053 begin');
      const index: number = 52;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0053 end');
    });

    it('testBoundaryRadius0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0054 begin');
      const index: number = 53;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0054 end');
    });

    it('testBoundaryRadius0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0055 begin');
      const index: number = 54;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0055 end');
    });

    it('testBoundaryRadius0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0056 begin');
      const index: number = 55;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0056 end');
    });

    it('testBoundaryRadius0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0057 begin');
      const index: number = 56;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0057 end');
    });

    it('testBoundaryRadius0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0058 begin');
      const index: number = 57;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0058 end');
    });

    it('testBoundaryRadius0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0059 begin');
      const index: number = 58;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0059 end');
    });

    it('testBoundaryRadius0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0060 begin');
      const index: number = 59;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0060 end');
    });

    it('testBoundaryRadius0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0061 begin');
      const index: number = 60;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0061 end');
    });

    it('testBoundaryRadius0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0062 begin');
      const index: number = 61;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0062 end');
    });

    it('testBoundaryRadius0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0063 begin');
      const index: number = 62;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0063 end');
    });

    it('testBoundaryRadius0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0064 begin');
      const index: number = 63;
      const radius: number = index % 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions('#123456', radius, true, true);
      expect(options.radius).assertEqual(radius);
      expect(options.color).assertEqual('#123456');
      expect(options.enableWaveEffect).assertTrue();
      expect(options.enableForeground).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryRadius0064 end');
    });

  });
}