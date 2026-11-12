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

export default function I18nResourceI18nUndefinedTest() {
  describe('I18nResource_i18nUndefined', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testI18nUndefined0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0001 begin');
      const index: number = 0;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0001 end');
    });

    it('testI18nUndefined0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0002 begin');
      const index: number = 1;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0002 end');
    });

    it('testI18nUndefined0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0003 begin');
      const index: number = 2;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0003 end');
    });

    it('testI18nUndefined0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0004 begin');
      const index: number = 3;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0004 end');
    });

    it('testI18nUndefined0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0005 begin');
      const index: number = 4;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0005 end');
    });

    it('testI18nUndefined0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0006 begin');
      const index: number = 5;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0006 end');
    });

    it('testI18nUndefined0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0007 begin');
      const index: number = 6;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0007 end');
    });

    it('testI18nUndefined0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0008 begin');
      const index: number = 7;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0008 end');
    });

    it('testI18nUndefined0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0009 begin');
      const index: number = 8;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0009 end');
    });

    it('testI18nUndefined0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0010 begin');
      const index: number = 9;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0010 end');
    });

    it('testI18nUndefined0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0011 begin');
      const index: number = 10;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0011 end');
    });

    it('testI18nUndefined0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0012 begin');
      const index: number = 11;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0012 end');
    });

    it('testI18nUndefined0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0013 begin');
      const index: number = 12;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0013 end');
    });

    it('testI18nUndefined0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0014 begin');
      const index: number = 13;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0014 end');
    });

    it('testI18nUndefined0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0015 begin');
      const index: number = 14;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0015 end');
    });

    it('testI18nUndefined0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0016 begin');
      const index: number = 15;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0016 end');
    });

    it('testI18nUndefined0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0017 begin');
      const index: number = 16;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0017 end');
    });

    it('testI18nUndefined0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0018 begin');
      const index: number = 17;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0018 end');
    });

    it('testI18nUndefined0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0019 begin');
      const index: number = 18;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0019 end');
    });

    it('testI18nUndefined0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0020 begin');
      const index: number = 19;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0020 end');
    });

    it('testI18nUndefined0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0021 begin');
      const index: number = 20;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0021 end');
    });

    it('testI18nUndefined0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0022 begin');
      const index: number = 21;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0022 end');
    });

    it('testI18nUndefined0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0023 begin');
      const index: number = 22;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0023 end');
    });

    it('testI18nUndefined0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0024 begin');
      const index: number = 23;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0024 end');
    });

    it('testI18nUndefined0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0025 begin');
      const index: number = 24;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0025 end');
    });

    it('testI18nUndefined0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0026 begin');
      const index: number = 25;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0026 end');
    });

    it('testI18nUndefined0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0027 begin');
      const index: number = 26;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0027 end');
    });

    it('testI18nUndefined0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0028 begin');
      const index: number = 27;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0028 end');
    });

    it('testI18nUndefined0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0029 begin');
      const index: number = 28;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0029 end');
    });

    it('testI18nUndefined0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0030 begin');
      const index: number = 29;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0030 end');
    });

    it('testI18nUndefined0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0031 begin');
      const index: number = 30;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0031 end');
    });

    it('testI18nUndefined0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0032 begin');
      const index: number = 31;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0032 end');
    });

    it('testI18nUndefined0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0033 begin');
      const index: number = 32;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0033 end');
    });

    it('testI18nUndefined0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0034 begin');
      const index: number = 33;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0034 end');
    });

    it('testI18nUndefined0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0035 begin');
      const index: number = 34;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0035 end');
    });

    it('testI18nUndefined0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0036 begin');
      const index: number = 35;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0036 end');
    });

    it('testI18nUndefined0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0037 begin');
      const index: number = 36;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0037 end');
    });

    it('testI18nUndefined0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0038 begin');
      const index: number = 37;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0038 end');
    });

    it('testI18nUndefined0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0039 begin');
      const index: number = 38;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0039 end');
    });

    it('testI18nUndefined0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0040 begin');
      const index: number = 39;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0040 end');
    });

    it('testI18nUndefined0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0041 begin');
      const index: number = 40;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0041 end');
    });

    it('testI18nUndefined0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0042 begin');
      const index: number = 41;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0042 end');
    });

    it('testI18nUndefined0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0043 begin');
      const index: number = 42;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0043 end');
    });

    it('testI18nUndefined0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0044 begin');
      const index: number = 43;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0044 end');
    });

    it('testI18nUndefined0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0045 begin');
      const index: number = 44;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0045 end');
    });

    it('testI18nUndefined0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0046 begin');
      const index: number = 45;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0046 end');
    });

    it('testI18nUndefined0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0047 begin');
      const index: number = 46;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0047 end');
    });

    it('testI18nUndefined0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0048 begin');
      const index: number = 47;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0048 end');
    });

    it('testI18nUndefined0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0049 begin');
      const index: number = 48;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0049 end');
    });

    it('testI18nUndefined0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0050 begin');
      const index: number = 49;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0050 end');
    });

    it('testI18nUndefined0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0051 begin');
      const index: number = 50;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0051 end');
    });

    it('testI18nUndefined0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0052 begin');
      const index: number = 51;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0052 end');
    });

    it('testI18nUndefined0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0053 begin');
      const index: number = 52;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0053 end');
    });

    it('testI18nUndefined0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0054 begin');
      const index: number = 53;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0054 end');
    });

    it('testI18nUndefined0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0055 begin');
      const index: number = 54;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0055 end');
    });

    it('testI18nUndefined0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0056 begin');
      const index: number = 55;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0056 end');
    });

    it('testI18nUndefined0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0057 begin');
      const index: number = 56;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0057 end');
    });

    it('testI18nUndefined0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0058 begin');
      const index: number = 57;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0058 end');
    });

    it('testI18nUndefined0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0059 begin');
      const index: number = 58;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0059 end');
    });

    it('testI18nUndefined0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0060 begin');
      const index: number = 59;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0060 end');
    });

    it('testI18nUndefined0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0061 begin');
      const index: number = 60;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0061 end');
    });

    it('testI18nUndefined0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0062 begin');
      const index: number = 61;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0062 end');
    });

    it('testI18nUndefined0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0063 begin');
      const index: number = 62;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0063 end');
    });

    it('testI18nUndefined0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0064 begin');
      const index: number = 63;
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(undefined, undefined, undefined, undefined);
      expect(options.color === undefined).assertTrue();
      expect(options.radius === undefined).assertTrue();
      expect(options.enableWaveEffect === undefined).assertTrue();
      expect(options.enableForeground === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testI18nUndefined0064 end');
    });

  });
}