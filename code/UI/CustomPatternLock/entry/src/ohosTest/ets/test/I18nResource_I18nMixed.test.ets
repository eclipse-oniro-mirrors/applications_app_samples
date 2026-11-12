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
const TAG: string = '[Sample_PatternLock_I18nResource]';

export default function I18nResourceI18nMixedTest() {
  describe('I18nResource_i18nMixed', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testI18nMixed0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0001 begin');
      const index: number = 0;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0001 end');
    });

    it('testI18nMixed0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0002 begin');
      const index: number = 1;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0002 end');
    });

    it('testI18nMixed0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0003 begin');
      const index: number = 2;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0003 end');
    });

    it('testI18nMixed0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0004 begin');
      const index: number = 3;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0004 end');
    });

    it('testI18nMixed0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0005 begin');
      const index: number = 4;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0005 end');
    });

    it('testI18nMixed0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0006 begin');
      const index: number = 5;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0006 end');
    });

    it('testI18nMixed0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0007 begin');
      const index: number = 6;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0007 end');
    });

    it('testI18nMixed0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0008 begin');
      const index: number = 7;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0008 end');
    });

    it('testI18nMixed0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0009 begin');
      const index: number = 8;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0009 end');
    });

    it('testI18nMixed0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0010 begin');
      const index: number = 9;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0010 end');
    });

    it('testI18nMixed0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0011 begin');
      const index: number = 10;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0011 end');
    });

    it('testI18nMixed0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0012 begin');
      const index: number = 11;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0012 end');
    });

    it('testI18nMixed0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0013 begin');
      const index: number = 12;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0013 end');
    });

    it('testI18nMixed0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0014 begin');
      const index: number = 13;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0014 end');
    });

    it('testI18nMixed0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0015 begin');
      const index: number = 14;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0015 end');
    });

    it('testI18nMixed0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0016 begin');
      const index: number = 15;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0016 end');
    });

    it('testI18nMixed0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0017 begin');
      const index: number = 16;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0017 end');
    });

    it('testI18nMixed0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0018 begin');
      const index: number = 17;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0018 end');
    });

    it('testI18nMixed0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0019 begin');
      const index: number = 18;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0019 end');
    });

    it('testI18nMixed0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0020 begin');
      const index: number = 19;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0020 end');
    });

    it('testI18nMixed0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0021 begin');
      const index: number = 20;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0021 end');
    });

    it('testI18nMixed0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0022 begin');
      const index: number = 21;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0022 end');
    });

    it('testI18nMixed0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0023 begin');
      const index: number = 22;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0023 end');
    });

    it('testI18nMixed0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0024 begin');
      const index: number = 23;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0024 end');
    });

    it('testI18nMixed0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0025 begin');
      const index: number = 24;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0025 end');
    });

    it('testI18nMixed0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0026 begin');
      const index: number = 25;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0026 end');
    });

    it('testI18nMixed0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0027 begin');
      const index: number = 26;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0027 end');
    });

    it('testI18nMixed0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0028 begin');
      const index: number = 27;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0028 end');
    });

    it('testI18nMixed0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0029 begin');
      const index: number = 28;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0029 end');
    });

    it('testI18nMixed0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0030 begin');
      const index: number = 29;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0030 end');
    });

    it('testI18nMixed0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0031 begin');
      const index: number = 30;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0031 end');
    });

    it('testI18nMixed0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0032 begin');
      const index: number = 31;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0032 end');
    });

    it('testI18nMixed0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0033 begin');
      const index: number = 32;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0033 end');
    });

    it('testI18nMixed0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0034 begin');
      const index: number = 33;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0034 end');
    });

    it('testI18nMixed0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0035 begin');
      const index: number = 34;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0035 end');
    });

    it('testI18nMixed0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0036 begin');
      const index: number = 35;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0036 end');
    });

    it('testI18nMixed0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0037 begin');
      const index: number = 36;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0037 end');
    });

    it('testI18nMixed0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0038 begin');
      const index: number = 37;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0038 end');
    });

    it('testI18nMixed0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0039 begin');
      const index: number = 38;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0039 end');
    });

    it('testI18nMixed0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0040 begin');
      const index: number = 39;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0040 end');
    });

    it('testI18nMixed0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0041 begin');
      const index: number = 40;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0041 end');
    });

    it('testI18nMixed0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0042 begin');
      const index: number = 41;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0042 end');
    });

    it('testI18nMixed0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0043 begin');
      const index: number = 42;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0043 end');
    });

    it('testI18nMixed0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0044 begin');
      const index: number = 43;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0044 end');
    });

    it('testI18nMixed0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0045 begin');
      const index: number = 44;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0045 end');
    });

    it('testI18nMixed0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0046 begin');
      const index: number = 45;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0046 end');
    });

    it('testI18nMixed0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0047 begin');
      const index: number = 46;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0047 end');
    });

    it('testI18nMixed0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0048 begin');
      const index: number = 47;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0048 end');
    });

    it('testI18nMixed0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0049 begin');
      const index: number = 48;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0049 end');
    });

    it('testI18nMixed0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0050 begin');
      const index: number = 49;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0050 end');
    });

    it('testI18nMixed0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0051 begin');
      const index: number = 50;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0051 end');
    });

    it('testI18nMixed0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0052 begin');
      const index: number = 51;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0052 end');
    });

    it('testI18nMixed0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0053 begin');
      const index: number = 52;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0053 end');
    });

    it('testI18nMixed0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0054 begin');
      const index: number = 53;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0054 end');
    });

    it('testI18nMixed0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0055 begin');
      const index: number = 54;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0055 end');
    });

    it('testI18nMixed0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0056 begin');
      const index: number = 55;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0056 end');
    });

    it('testI18nMixed0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0057 begin');
      const index: number = 56;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0057 end');
    });

    it('testI18nMixed0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0058 begin');
      const index: number = 57;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0058 end');
    });

    it('testI18nMixed0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0059 begin');
      const index: number = 58;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0059 end');
    });

    it('testI18nMixed0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0060 begin');
      const index: number = 59;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0060 end');
    });

    it('testI18nMixed0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0061 begin');
      const index: number = 60;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0061 end');
    });

    it('testI18nMixed0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0062 begin');
      const index: number = 61;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0062 end');
    });

    it('testI18nMixed0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0063 begin');
      const index: number = 62;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0063 end');
    });

    it('testI18nMixed0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0064 begin');
      const index: number = 63;
      const color: number | string | undefined = index % 2 === 0 ? '#123ABC' : 0x654321;
      const radius: number | undefined = index % 3 === 0 ? undefined : (index % 9) + 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, index % 3 !== 0);
      expect(options.color).assertEqual(color);
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nMixed0064 end');
    });

  });
}