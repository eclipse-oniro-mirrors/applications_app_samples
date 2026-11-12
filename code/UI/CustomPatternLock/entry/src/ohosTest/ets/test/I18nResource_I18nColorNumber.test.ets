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

export default function I18nResourceI18nColorNumberTest() {
  describe('I18nResource_i18nColorNumber', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testI18nColorNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0001 begin');
      const index: number = 0;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0001 end');
    });

    it('testI18nColorNumber0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0002 begin');
      const index: number = 1;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0002 end');
    });

    it('testI18nColorNumber0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0003 begin');
      const index: number = 2;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0003 end');
    });

    it('testI18nColorNumber0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0004 begin');
      const index: number = 3;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0004 end');
    });

    it('testI18nColorNumber0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0005 begin');
      const index: number = 4;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0005 end');
    });

    it('testI18nColorNumber0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0006 begin');
      const index: number = 5;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0006 end');
    });

    it('testI18nColorNumber0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0007 begin');
      const index: number = 6;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0007 end');
    });

    it('testI18nColorNumber0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0008 begin');
      const index: number = 7;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0008 end');
    });

    it('testI18nColorNumber0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0009 begin');
      const index: number = 8;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0009 end');
    });

    it('testI18nColorNumber0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0010 begin');
      const index: number = 9;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0010 end');
    });

    it('testI18nColorNumber0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0011 begin');
      const index: number = 10;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0011 end');
    });

    it('testI18nColorNumber0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0012 begin');
      const index: number = 11;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0012 end');
    });

    it('testI18nColorNumber0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0013 begin');
      const index: number = 12;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0013 end');
    });

    it('testI18nColorNumber0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0014 begin');
      const index: number = 13;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0014 end');
    });

    it('testI18nColorNumber0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0015 begin');
      const index: number = 14;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0015 end');
    });

    it('testI18nColorNumber0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0016 begin');
      const index: number = 15;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0016 end');
    });

    it('testI18nColorNumber0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0017 begin');
      const index: number = 16;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0017 end');
    });

    it('testI18nColorNumber0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0018 begin');
      const index: number = 17;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0018 end');
    });

    it('testI18nColorNumber0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0019 begin');
      const index: number = 18;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0019 end');
    });

    it('testI18nColorNumber0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0020 begin');
      const index: number = 19;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0020 end');
    });

    it('testI18nColorNumber0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0021 begin');
      const index: number = 20;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0021 end');
    });

    it('testI18nColorNumber0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0022 begin');
      const index: number = 21;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0022 end');
    });

    it('testI18nColorNumber0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0023 begin');
      const index: number = 22;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0023 end');
    });

    it('testI18nColorNumber0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0024 begin');
      const index: number = 23;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0024 end');
    });

    it('testI18nColorNumber0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0025 begin');
      const index: number = 24;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0025 end');
    });

    it('testI18nColorNumber0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0026 begin');
      const index: number = 25;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0026 end');
    });

    it('testI18nColorNumber0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0027 begin');
      const index: number = 26;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0027 end');
    });

    it('testI18nColorNumber0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0028 begin');
      const index: number = 27;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0028 end');
    });

    it('testI18nColorNumber0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0029 begin');
      const index: number = 28;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0029 end');
    });

    it('testI18nColorNumber0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0030 begin');
      const index: number = 29;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0030 end');
    });

    it('testI18nColorNumber0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0031 begin');
      const index: number = 30;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0031 end');
    });

    it('testI18nColorNumber0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0032 begin');
      const index: number = 31;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0032 end');
    });

    it('testI18nColorNumber0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0033 begin');
      const index: number = 32;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0033 end');
    });

    it('testI18nColorNumber0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0034 begin');
      const index: number = 33;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0034 end');
    });

    it('testI18nColorNumber0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0035 begin');
      const index: number = 34;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0035 end');
    });

    it('testI18nColorNumber0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0036 begin');
      const index: number = 35;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0036 end');
    });

    it('testI18nColorNumber0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0037 begin');
      const index: number = 36;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0037 end');
    });

    it('testI18nColorNumber0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0038 begin');
      const index: number = 37;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0038 end');
    });

    it('testI18nColorNumber0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0039 begin');
      const index: number = 38;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0039 end');
    });

    it('testI18nColorNumber0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0040 begin');
      const index: number = 39;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0040 end');
    });

    it('testI18nColorNumber0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0041 begin');
      const index: number = 40;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0041 end');
    });

    it('testI18nColorNumber0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0042 begin');
      const index: number = 41;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0042 end');
    });

    it('testI18nColorNumber0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0043 begin');
      const index: number = 42;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0043 end');
    });

    it('testI18nColorNumber0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0044 begin');
      const index: number = 43;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0044 end');
    });

    it('testI18nColorNumber0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0045 begin');
      const index: number = 44;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0045 end');
    });

    it('testI18nColorNumber0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0046 begin');
      const index: number = 45;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0046 end');
    });

    it('testI18nColorNumber0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0047 begin');
      const index: number = 46;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0047 end');
    });

    it('testI18nColorNumber0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0048 begin');
      const index: number = 47;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0048 end');
    });

    it('testI18nColorNumber0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0049 begin');
      const index: number = 48;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0049 end');
    });

    it('testI18nColorNumber0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0050 begin');
      const index: number = 49;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0050 end');
    });

    it('testI18nColorNumber0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0051 begin');
      const index: number = 50;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0051 end');
    });

    it('testI18nColorNumber0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0052 begin');
      const index: number = 51;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0052 end');
    });

    it('testI18nColorNumber0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0053 begin');
      const index: number = 52;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0053 end');
    });

    it('testI18nColorNumber0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0054 begin');
      const index: number = 53;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0054 end');
    });

    it('testI18nColorNumber0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0055 begin');
      const index: number = 54;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0055 end');
    });

    it('testI18nColorNumber0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0056 begin');
      const index: number = 55;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0056 end');
    });

    it('testI18nColorNumber0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0057 begin');
      const index: number = 56;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0057 end');
    });

    it('testI18nColorNumber0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0058 begin');
      const index: number = 57;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0058 end');
    });

    it('testI18nColorNumber0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0059 begin');
      const index: number = 58;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0059 end');
    });

    it('testI18nColorNumber0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0060 begin');
      const index: number = 59;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0060 end');
    });

    it('testI18nColorNumber0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0061 begin');
      const index: number = 60;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0061 end');
    });

    it('testI18nColorNumber0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0062 begin');
      const index: number = 61;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0062 end');
    });

    it('testI18nColorNumber0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0063 begin');
      const index: number = 62;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0063 end');
    });

    it('testI18nColorNumber0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0064 begin');
      const index: number = 63;
      const color: number = 0x112233 + index;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect(typeof options.color).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorNumber0064 end');
    });

  });
}