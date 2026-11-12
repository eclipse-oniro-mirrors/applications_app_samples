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

export default function CompatibilityCompatColorsTest() {
  describe('Compatibility_compatColors', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testCompatColors0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0001 begin');
      const index: number = 0;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0001 end');
    });

    it('testCompatColors0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0002 begin');
      const index: number = 1;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0002 end');
    });

    it('testCompatColors0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0003 begin');
      const index: number = 2;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0003 end');
    });

    it('testCompatColors0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0004 begin');
      const index: number = 3;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0004 end');
    });

    it('testCompatColors0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0005 begin');
      const index: number = 4;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0005 end');
    });

    it('testCompatColors0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0006 begin');
      const index: number = 5;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0006 end');
    });

    it('testCompatColors0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0007 begin');
      const index: number = 6;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0007 end');
    });

    it('testCompatColors0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0008 begin');
      const index: number = 7;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0008 end');
    });

    it('testCompatColors0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0009 begin');
      const index: number = 8;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0009 end');
    });

    it('testCompatColors0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0010 begin');
      const index: number = 9;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0010 end');
    });

    it('testCompatColors0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0011 begin');
      const index: number = 10;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0011 end');
    });

    it('testCompatColors0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0012 begin');
      const index: number = 11;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0012 end');
    });

    it('testCompatColors0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0013 begin');
      const index: number = 12;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0013 end');
    });

    it('testCompatColors0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0014 begin');
      const index: number = 13;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0014 end');
    });

    it('testCompatColors0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0015 begin');
      const index: number = 14;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0015 end');
    });

    it('testCompatColors0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0016 begin');
      const index: number = 15;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0016 end');
    });

    it('testCompatColors0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0017 begin');
      const index: number = 16;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0017 end');
    });

    it('testCompatColors0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0018 begin');
      const index: number = 17;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0018 end');
    });

    it('testCompatColors0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0019 begin');
      const index: number = 18;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0019 end');
    });

    it('testCompatColors0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0020 begin');
      const index: number = 19;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0020 end');
    });

    it('testCompatColors0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0021 begin');
      const index: number = 20;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0021 end');
    });

    it('testCompatColors0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0022 begin');
      const index: number = 21;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0022 end');
    });

    it('testCompatColors0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0023 begin');
      const index: number = 22;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0023 end');
    });

    it('testCompatColors0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0024 begin');
      const index: number = 23;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0024 end');
    });

    it('testCompatColors0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0025 begin');
      const index: number = 24;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0025 end');
    });

    it('testCompatColors0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0026 begin');
      const index: number = 25;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0026 end');
    });

    it('testCompatColors0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0027 begin');
      const index: number = 26;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0027 end');
    });

    it('testCompatColors0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0028 begin');
      const index: number = 27;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0028 end');
    });

    it('testCompatColors0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0029 begin');
      const index: number = 28;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0029 end');
    });

    it('testCompatColors0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0030 begin');
      const index: number = 29;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0030 end');
    });

    it('testCompatColors0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0031 begin');
      const index: number = 30;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0031 end');
    });

    it('testCompatColors0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0032 begin');
      const index: number = 31;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0032 end');
    });

    it('testCompatColors0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0033 begin');
      const index: number = 32;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0033 end');
    });

    it('testCompatColors0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0034 begin');
      const index: number = 33;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0034 end');
    });

    it('testCompatColors0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0035 begin');
      const index: number = 34;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0035 end');
    });

    it('testCompatColors0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0036 begin');
      const index: number = 35;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0036 end');
    });

    it('testCompatColors0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0037 begin');
      const index: number = 36;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0037 end');
    });

    it('testCompatColors0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0038 begin');
      const index: number = 37;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0038 end');
    });

    it('testCompatColors0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0039 begin');
      const index: number = 38;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0039 end');
    });

    it('testCompatColors0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0040 begin');
      const index: number = 39;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0040 end');
    });

    it('testCompatColors0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0041 begin');
      const index: number = 40;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0041 end');
    });

    it('testCompatColors0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0042 begin');
      const index: number = 41;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0042 end');
    });

    it('testCompatColors0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0043 begin');
      const index: number = 42;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0043 end');
    });

    it('testCompatColors0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0044 begin');
      const index: number = 43;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0044 end');
    });

    it('testCompatColors0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0045 begin');
      const index: number = 44;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0045 end');
    });

    it('testCompatColors0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0046 begin');
      const index: number = 45;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0046 end');
    });

    it('testCompatColors0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0047 begin');
      const index: number = 46;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0047 end');
    });

    it('testCompatColors0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0048 begin');
      const index: number = 47;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0048 end');
    });

    it('testCompatColors0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0049 begin');
      const index: number = 48;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0049 end');
    });

    it('testCompatColors0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0050 begin');
      const index: number = 49;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0050 end');
    });

    it('testCompatColors0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0051 begin');
      const index: number = 50;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0051 end');
    });

    it('testCompatColors0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0052 begin');
      const index: number = 51;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0052 end');
    });

    it('testCompatColors0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0053 begin');
      const index: number = 52;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0053 end');
    });

    it('testCompatColors0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0054 begin');
      const index: number = 53;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0054 end');
    });

    it('testCompatColors0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0055 begin');
      const index: number = 54;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0055 end');
    });

    it('testCompatColors0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0056 begin');
      const index: number = 55;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0056 end');
    });

    it('testCompatColors0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0057 begin');
      const index: number = 56;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0057 end');
    });

    it('testCompatColors0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0058 begin');
      const index: number = 57;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0058 end');
    });

    it('testCompatColors0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0059 begin');
      const index: number = 58;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0059 end');
    });

    it('testCompatColors0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0060 begin');
      const index: number = 59;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0060 end');
    });

    it('testCompatColors0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0061 begin');
      const index: number = 60;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0061 end');
    });

    it('testCompatColors0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0062 begin');
      const index: number = 61;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0062 end');
    });

    it('testCompatColors0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0063 begin');
      const index: number = 62;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0063 end');
    });

    it('testCompatColors0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0064 begin');
      const index: number = 63;
      const variant: number = index % 3;
      const color: number | string | undefined = variant === 0 ? '#AABBCC' : (variant === 1 ? 0x112233 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 8, true, false);
      if (variant === 2) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      expect(options.radius).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatColors0064 end');
    });

  });
}