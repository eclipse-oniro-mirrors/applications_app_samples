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
const TAG: string = '[Sample_PatternLock_Compatibility]';

export default function CompatibilityCompatInstancesTest() {
  describe('CompatibilityCompatInstances', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testCompatInstances0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0001 begin');
      const index: number = 0;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0001 end');
    });

    it('testCompatInstances0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0002 begin');
      const index: number = 1;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0002 end');
    });

    it('testCompatInstances0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0003 begin');
      const index: number = 2;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0003 end');
    });

    it('testCompatInstances0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0004 begin');
      const index: number = 3;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0004 end');
    });

    it('testCompatInstances0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0005 begin');
      const index: number = 4;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0005 end');
    });

    it('testCompatInstances0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0006 begin');
      const index: number = 5;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0006 end');
    });

    it('testCompatInstances0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0007 begin');
      const index: number = 6;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0007 end');
    });

    it('testCompatInstances0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0008 begin');
      const index: number = 7;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0008 end');
    });

    it('testCompatInstances0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0009 begin');
      const index: number = 8;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0009 end');
    });

    it('testCompatInstances0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0010 begin');
      const index: number = 9;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0010 end');
    });

    it('testCompatInstances0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0011 begin');
      const index: number = 10;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0011 end');
    });

    it('testCompatInstances0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0012 begin');
      const index: number = 11;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0012 end');
    });

    it('testCompatInstances0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0013 begin');
      const index: number = 12;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0013 end');
    });

    it('testCompatInstances0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0014 begin');
      const index: number = 13;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0014 end');
    });

    it('testCompatInstances0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0015 begin');
      const index: number = 14;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0015 end');
    });

    it('testCompatInstances0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0016 begin');
      const index: number = 15;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0016 end');
    });

    it('testCompatInstances0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0017 begin');
      const index: number = 16;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0017 end');
    });

    it('testCompatInstances0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0018 begin');
      const index: number = 17;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0018 end');
    });

    it('testCompatInstances0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0019 begin');
      const index: number = 18;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0019 end');
    });

    it('testCompatInstances0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0020 begin');
      const index: number = 19;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0020 end');
    });

    it('testCompatInstances0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0021 begin');
      const index: number = 20;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0021 end');
    });

    it('testCompatInstances0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0022 begin');
      const index: number = 21;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0022 end');
    });

    it('testCompatInstances0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0023 begin');
      const index: number = 22;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0023 end');
    });

    it('testCompatInstances0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0024 begin');
      const index: number = 23;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0024 end');
    });

    it('testCompatInstances0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0025 begin');
      const index: number = 24;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0025 end');
    });

    it('testCompatInstances0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0026 begin');
      const index: number = 25;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0026 end');
    });

    it('testCompatInstances0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0027 begin');
      const index: number = 26;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0027 end');
    });

    it('testCompatInstances0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0028 begin');
      const index: number = 27;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0028 end');
    });

    it('testCompatInstances0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0029 begin');
      const index: number = 28;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0029 end');
    });

    it('testCompatInstances0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0030 begin');
      const index: number = 29;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0030 end');
    });

    it('testCompatInstances0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0031 begin');
      const index: number = 30;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0031 end');
    });

    it('testCompatInstances0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0032 begin');
      const index: number = 31;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0032 end');
    });

    it('testCompatInstances0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0033 begin');
      const index: number = 32;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0033 end');
    });

    it('testCompatInstances0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0034 begin');
      const index: number = 33;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0034 end');
    });

    it('testCompatInstances0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0035 begin');
      const index: number = 34;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0035 end');
    });

    it('testCompatInstances0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0036 begin');
      const index: number = 35;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0036 end');
    });

    it('testCompatInstances0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0037 begin');
      const index: number = 36;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0037 end');
    });

    it('testCompatInstances0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0038 begin');
      const index: number = 37;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0038 end');
    });

    it('testCompatInstances0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0039 begin');
      const index: number = 38;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0039 end');
    });

    it('testCompatInstances0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0040 begin');
      const index: number = 39;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0040 end');
    });

    it('testCompatInstances0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0041 begin');
      const index: number = 40;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0041 end');
    });

    it('testCompatInstances0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0042 begin');
      const index: number = 41;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0042 end');
    });

    it('testCompatInstances0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0043 begin');
      const index: number = 42;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0043 end');
    });

    it('testCompatInstances0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0044 begin');
      const index: number = 43;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0044 end');
    });

    it('testCompatInstances0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0045 begin');
      const index: number = 44;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0045 end');
    });

    it('testCompatInstances0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0046 begin');
      const index: number = 45;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0046 end');
    });

    it('testCompatInstances0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0047 begin');
      const index: number = 46;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0047 end');
    });

    it('testCompatInstances0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0048 begin');
      const index: number = 47;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0048 end');
    });

    it('testCompatInstances0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0049 begin');
      const index: number = 48;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0049 end');
    });

    it('testCompatInstances0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0050 begin');
      const index: number = 49;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0050 end');
    });

    it('testCompatInstances0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0051 begin');
      const index: number = 50;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0051 end');
    });

    it('testCompatInstances0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0052 begin');
      const index: number = 51;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0052 end');
    });

    it('testCompatInstances0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0053 begin');
      const index: number = 52;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0053 end');
    });

    it('testCompatInstances0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0054 begin');
      const index: number = 53;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0054 end');
    });

    it('testCompatInstances0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0055 begin');
      const index: number = 54;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0055 end');
    });

    it('testCompatInstances0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0056 begin');
      const index: number = 55;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0056 end');
    });

    it('testCompatInstances0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0057 begin');
      const index: number = 56;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0057 end');
    });

    it('testCompatInstances0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0058 begin');
      const index: number = 57;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0058 end');
    });

    it('testCompatInstances0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0059 begin');
      const index: number = 58;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0059 end');
    });

    it('testCompatInstances0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0060 begin');
      const index: number = 59;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0060 end');
    });

    it('testCompatInstances0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0061 begin');
      const index: number = 60;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0061 end');
    });

    it('testCompatInstances0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0062 begin');
      const index: number = 61;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0062 end');
    });

    it('testCompatInstances0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0063 begin');
      const index: number = 62;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0063 end');
    });

    it('testCompatInstances0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0064 begin');
      const index: number = 63;
      const first: CustomCircleStyleOptions = new CustomCircleStyleOptions('#111111', 3, true, false);
      const second: CustomCircleStyleOptions = new CustomCircleStyleOptions('#222222', 4, false, true);
      expect(first !== second).assertTrue();
      expect(first.color).assertEqual('#111111');
      expect(second.color).assertEqual('#222222');
      expect(first.radius).assertEqual(3);
      expect(second.radius).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatInstances0064 end');
    });

  });
}