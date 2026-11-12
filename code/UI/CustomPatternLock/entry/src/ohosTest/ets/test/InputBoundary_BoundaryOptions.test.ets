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

export default function InputBoundaryBoundaryOptionsTest() {
  describe('InputBoundary_boundaryOptions', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testBoundaryOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0001 begin');
      const index: number = 0;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0001 end');
    });

    it('testBoundaryOptions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0002 begin');
      const index: number = 1;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0002 end');
    });

    it('testBoundaryOptions0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0003 begin');
      const index: number = 2;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0003 end');
    });

    it('testBoundaryOptions0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0004 begin');
      const index: number = 3;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0004 end');
    });

    it('testBoundaryOptions0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0005 begin');
      const index: number = 4;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0005 end');
    });

    it('testBoundaryOptions0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0006 begin');
      const index: number = 5;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0006 end');
    });

    it('testBoundaryOptions0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0007 begin');
      const index: number = 6;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0007 end');
    });

    it('testBoundaryOptions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0008 begin');
      const index: number = 7;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0008 end');
    });

    it('testBoundaryOptions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0009 begin');
      const index: number = 8;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0009 end');
    });

    it('testBoundaryOptions0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0010 begin');
      const index: number = 9;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0010 end');
    });

    it('testBoundaryOptions0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0011 begin');
      const index: number = 10;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0011 end');
    });

    it('testBoundaryOptions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0012 begin');
      const index: number = 11;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0012 end');
    });

    it('testBoundaryOptions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0013 begin');
      const index: number = 12;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0013 end');
    });

    it('testBoundaryOptions0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0014 begin');
      const index: number = 13;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0014 end');
    });

    it('testBoundaryOptions0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0015 begin');
      const index: number = 14;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0015 end');
    });

    it('testBoundaryOptions0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0016 begin');
      const index: number = 15;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0016 end');
    });

    it('testBoundaryOptions0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0017 begin');
      const index: number = 16;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0017 end');
    });

    it('testBoundaryOptions0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0018 begin');
      const index: number = 17;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0018 end');
    });

    it('testBoundaryOptions0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0019 begin');
      const index: number = 18;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0019 end');
    });

    it('testBoundaryOptions0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0020 begin');
      const index: number = 19;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0020 end');
    });

    it('testBoundaryOptions0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0021 begin');
      const index: number = 20;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0021 end');
    });

    it('testBoundaryOptions0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0022 begin');
      const index: number = 21;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0022 end');
    });

    it('testBoundaryOptions0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0023 begin');
      const index: number = 22;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0023 end');
    });

    it('testBoundaryOptions0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0024 begin');
      const index: number = 23;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0024 end');
    });

    it('testBoundaryOptions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0025 begin');
      const index: number = 24;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0025 end');
    });

    it('testBoundaryOptions0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0026 begin');
      const index: number = 25;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0026 end');
    });

    it('testBoundaryOptions0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0027 begin');
      const index: number = 26;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0027 end');
    });

    it('testBoundaryOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0028 begin');
      const index: number = 27;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0028 end');
    });

    it('testBoundaryOptions0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0029 begin');
      const index: number = 28;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0029 end');
    });

    it('testBoundaryOptions0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0030 begin');
      const index: number = 29;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0030 end');
    });

    it('testBoundaryOptions0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0031 begin');
      const index: number = 30;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0031 end');
    });

    it('testBoundaryOptions0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0032 begin');
      const index: number = 31;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0032 end');
    });

    it('testBoundaryOptions0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0033 begin');
      const index: number = 32;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0033 end');
    });

    it('testBoundaryOptions0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0034 begin');
      const index: number = 33;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0034 end');
    });

    it('testBoundaryOptions0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0035 begin');
      const index: number = 34;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0035 end');
    });

    it('testBoundaryOptions0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0036 begin');
      const index: number = 35;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0036 end');
    });

    it('testBoundaryOptions0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0037 begin');
      const index: number = 36;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0037 end');
    });

    it('testBoundaryOptions0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0038 begin');
      const index: number = 37;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0038 end');
    });

    it('testBoundaryOptions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0039 begin');
      const index: number = 38;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0039 end');
    });

    it('testBoundaryOptions0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0040 begin');
      const index: number = 39;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0040 end');
    });

    it('testBoundaryOptions0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0041 begin');
      const index: number = 40;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0041 end');
    });

    it('testBoundaryOptions0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0042 begin');
      const index: number = 41;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0042 end');
    });

    it('testBoundaryOptions0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0043 begin');
      const index: number = 42;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0043 end');
    });

    it('testBoundaryOptions0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0044 begin');
      const index: number = 43;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0044 end');
    });

    it('testBoundaryOptions0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0045 begin');
      const index: number = 44;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0045 end');
    });

    it('testBoundaryOptions0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0046 begin');
      const index: number = 45;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0046 end');
    });

    it('testBoundaryOptions0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0047 begin');
      const index: number = 46;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0047 end');
    });

    it('testBoundaryOptions0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0048 begin');
      const index: number = 47;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0048 end');
    });

    it('testBoundaryOptions0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0049 begin');
      const index: number = 48;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0049 end');
    });

    it('testBoundaryOptions0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0050 begin');
      const index: number = 49;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0050 end');
    });

    it('testBoundaryOptions0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0051 begin');
      const index: number = 50;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0051 end');
    });

    it('testBoundaryOptions0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0052 begin');
      const index: number = 51;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0052 end');
    });

    it('testBoundaryOptions0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0053 begin');
      const index: number = 52;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0053 end');
    });

    it('testBoundaryOptions0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0054 begin');
      const index: number = 53;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0054 end');
    });

    it('testBoundaryOptions0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0055 begin');
      const index: number = 54;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0055 end');
    });

    it('testBoundaryOptions0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0056 begin');
      const index: number = 55;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0056 end');
    });

    it('testBoundaryOptions0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0057 begin');
      const index: number = 56;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0057 end');
    });

    it('testBoundaryOptions0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0058 begin');
      const index: number = 57;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0058 end');
    });

    it('testBoundaryOptions0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0059 begin');
      const index: number = 58;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0059 end');
    });

    it('testBoundaryOptions0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0060 begin');
      const index: number = 59;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0060 end');
    });

    it('testBoundaryOptions0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0061 begin');
      const index: number = 60;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0061 end');
    });

    it('testBoundaryOptions0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0062 begin');
      const index: number = 61;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0062 end');
    });

    it('testBoundaryOptions0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0063 begin');
      const index: number = 62;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0063 end');
    });

    it('testBoundaryOptions0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0064 begin');
      const index: number = 63;
      const color: number | string | undefined = index % 3 === 0 ? '' : (index % 3 === 1 ? 0 : undefined);
      const radius: number | undefined = index % 4 === 0 ? 0 : (index % 4 === 1 ? -1 : undefined);
      const options: CustomCircleStyleOptions = new CustomCircleStyleOptions(color, radius, index % 2 === 0, false);
      if (color === undefined) {
        expect(options.color === undefined).assertTrue();
      } else {
        expect(options.color).assertEqual(color);
      }
      if (radius === undefined) {
        expect(options.radius === undefined).assertTrue();
      } else {
        expect(options.radius).assertEqual(radius);
      }
      expect(options.enableWaveEffect).assertEqual(index % 2 === 0);
      expect(options.enableForeground).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryOptions0064 end');
    });

  });
}