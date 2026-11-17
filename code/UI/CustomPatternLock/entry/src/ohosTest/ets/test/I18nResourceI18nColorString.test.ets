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

export default function I18nResourceI18nColorStringTest() {
  describe('I18nResourceI18nColorString', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testI18nColorString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0001 begin');
      const index: number = 0;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0001 end');
    });

    it('testI18nColorString0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0002 begin');
      const index: number = 1;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0002 end');
    });

    it('testI18nColorString0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0003 begin');
      const index: number = 2;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0003 end');
    });

    it('testI18nColorString0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0004 begin');
      const index: number = 3;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0004 end');
    });

    it('testI18nColorString0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0005 begin');
      const index: number = 4;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0005 end');
    });

    it('testI18nColorString0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0006 begin');
      const index: number = 5;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0006 end');
    });

    it('testI18nColorString0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0007 begin');
      const index: number = 6;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0007 end');
    });

    it('testI18nColorString0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0008 begin');
      const index: number = 7;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0008 end');
    });

    it('testI18nColorString0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0009 begin');
      const index: number = 8;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0009 end');
    });

    it('testI18nColorString0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0010 begin');
      const index: number = 9;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0010 end');
    });

    it('testI18nColorString0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0011 begin');
      const index: number = 10;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0011 end');
    });

    it('testI18nColorString0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0012 begin');
      const index: number = 11;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0012 end');
    });

    it('testI18nColorString0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0013 begin');
      const index: number = 12;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0013 end');
    });

    it('testI18nColorString0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0014 begin');
      const index: number = 13;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0014 end');
    });

    it('testI18nColorString0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0015 begin');
      const index: number = 14;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0015 end');
    });

    it('testI18nColorString0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0016 begin');
      const index: number = 15;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0016 end');
    });

    it('testI18nColorString0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0017 begin');
      const index: number = 16;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0017 end');
    });

    it('testI18nColorString0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0018 begin');
      const index: number = 17;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0018 end');
    });

    it('testI18nColorString0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0019 begin');
      const index: number = 18;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0019 end');
    });

    it('testI18nColorString0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0020 begin');
      const index: number = 19;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0020 end');
    });

    it('testI18nColorString0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0021 begin');
      const index: number = 20;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0021 end');
    });

    it('testI18nColorString0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0022 begin');
      const index: number = 21;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0022 end');
    });

    it('testI18nColorString0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0023 begin');
      const index: number = 22;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0023 end');
    });

    it('testI18nColorString0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0024 begin');
      const index: number = 23;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0024 end');
    });

    it('testI18nColorString0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0025 begin');
      const index: number = 24;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0025 end');
    });

    it('testI18nColorString0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0026 begin');
      const index: number = 25;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0026 end');
    });

    it('testI18nColorString0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0027 begin');
      const index: number = 26;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0027 end');
    });

    it('testI18nColorString0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0028 begin');
      const index: number = 27;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0028 end');
    });

    it('testI18nColorString0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0029 begin');
      const index: number = 28;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0029 end');
    });

    it('testI18nColorString0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0030 begin');
      const index: number = 29;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0030 end');
    });

    it('testI18nColorString0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0031 begin');
      const index: number = 30;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0031 end');
    });

    it('testI18nColorString0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0032 begin');
      const index: number = 31;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0032 end');
    });

    it('testI18nColorString0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0033 begin');
      const index: number = 32;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0033 end');
    });

    it('testI18nColorString0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0034 begin');
      const index: number = 33;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0034 end');
    });

    it('testI18nColorString0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0035 begin');
      const index: number = 34;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0035 end');
    });

    it('testI18nColorString0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0036 begin');
      const index: number = 35;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0036 end');
    });

    it('testI18nColorString0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0037 begin');
      const index: number = 36;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0037 end');
    });

    it('testI18nColorString0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0038 begin');
      const index: number = 37;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0038 end');
    });

    it('testI18nColorString0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0039 begin');
      const index: number = 38;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0039 end');
    });

    it('testI18nColorString0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0040 begin');
      const index: number = 39;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0040 end');
    });

    it('testI18nColorString0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0041 begin');
      const index: number = 40;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0041 end');
    });

    it('testI18nColorString0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0042 begin');
      const index: number = 41;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0042 end');
    });

    it('testI18nColorString0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0043 begin');
      const index: number = 42;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0043 end');
    });

    it('testI18nColorString0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0044 begin');
      const index: number = 43;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0044 end');
    });

    it('testI18nColorString0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0045 begin');
      const index: number = 44;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0045 end');
    });

    it('testI18nColorString0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0046 begin');
      const index: number = 45;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0046 end');
    });

    it('testI18nColorString0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0047 begin');
      const index: number = 46;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0047 end');
    });

    it('testI18nColorString0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0048 begin');
      const index: number = 47;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0048 end');
    });

    it('testI18nColorString0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0049 begin');
      const index: number = 48;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0049 end');
    });

    it('testI18nColorString0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0050 begin');
      const index: number = 49;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0050 end');
    });

    it('testI18nColorString0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0051 begin');
      const index: number = 50;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0051 end');
    });

    it('testI18nColorString0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0052 begin');
      const index: number = 51;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0052 end');
    });

    it('testI18nColorString0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0053 begin');
      const index: number = 52;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0053 end');
    });

    it('testI18nColorString0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0054 begin');
      const index: number = 53;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0054 end');
    });

    it('testI18nColorString0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0055 begin');
      const index: number = 54;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0055 end');
    });

    it('testI18nColorString0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0056 begin');
      const index: number = 55;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0056 end');
    });

    it('testI18nColorString0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0057 begin');
      const index: number = 56;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0057 end');
    });

    it('testI18nColorString0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0058 begin');
      const index: number = 57;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0058 end');
    });

    it('testI18nColorString0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0059 begin');
      const index: number = 58;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0059 end');
    });

    it('testI18nColorString0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0060 begin');
      const index: number = 59;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0060 end');
    });

    it('testI18nColorString0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0061 begin');
      const index: number = 60;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0061 end');
    });

    it('testI18nColorString0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0062 begin');
      const index: number = 61;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0062 end');
    });

    it('testI18nColorString0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0063 begin');
      const index: number = 62;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0063 end');
    });

    it('testI18nColorString0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0064 begin');
      const index: number = 63;
      const samples: string[] = ['#AABBCC', '#AABBCCDD', '#ff0000', '#00FF00'];
      const color: string = samples[index % samples.length];
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, 6, true, false);
      expect(options.color).assertEqual(color);
      expect((options.color as string).startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nColorString0064 end');
    });

  });
}