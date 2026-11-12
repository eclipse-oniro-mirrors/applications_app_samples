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
const TAG: string = '[Sample_PatternLock_PerfBudget]';

export default function PerfBudgetPerfOptionsTest() {
  describe('PerfBudget_perfOptions', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testPerfOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0001 end');
    });

    it('testPerfOptions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0002 begin');
      const index: number = 1;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0002 end');
    });

    it('testPerfOptions0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0003 begin');
      const index: number = 2;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0003 end');
    });

    it('testPerfOptions0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0004 begin');
      const index: number = 3;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0004 end');
    });

    it('testPerfOptions0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0005 begin');
      const index: number = 4;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0005 end');
    });

    it('testPerfOptions0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0006 begin');
      const index: number = 5;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0006 end');
    });

    it('testPerfOptions0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0007 begin');
      const index: number = 6;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0007 end');
    });

    it('testPerfOptions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0008 begin');
      const index: number = 7;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0008 end');
    });

    it('testPerfOptions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0009 begin');
      const index: number = 8;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0009 end');
    });

    it('testPerfOptions0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0010 begin');
      const index: number = 9;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0010 end');
    });

    it('testPerfOptions0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0011 begin');
      const index: number = 10;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0011 end');
    });

    it('testPerfOptions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0012 begin');
      const index: number = 11;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0012 end');
    });

    it('testPerfOptions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0013 begin');
      const index: number = 12;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0013 end');
    });

    it('testPerfOptions0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0014 begin');
      const index: number = 13;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0014 end');
    });

    it('testPerfOptions0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0015 begin');
      const index: number = 14;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0015 end');
    });

    it('testPerfOptions0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0016 begin');
      const index: number = 15;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0016 end');
    });

    it('testPerfOptions0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0017 begin');
      const index: number = 16;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0017 end');
    });

    it('testPerfOptions0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0018 begin');
      const index: number = 17;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0018 end');
    });

    it('testPerfOptions0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0019 begin');
      const index: number = 18;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0019 end');
    });

    it('testPerfOptions0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0020 begin');
      const index: number = 19;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0020 end');
    });

    it('testPerfOptions0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0021 begin');
      const index: number = 20;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0021 end');
    });

    it('testPerfOptions0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0022 begin');
      const index: number = 21;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0022 end');
    });

    it('testPerfOptions0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0023 begin');
      const index: number = 22;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0023 end');
    });

    it('testPerfOptions0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0024 begin');
      const index: number = 23;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0024 end');
    });

    it('testPerfOptions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0025 begin');
      const index: number = 24;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0025 end');
    });

    it('testPerfOptions0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0026 begin');
      const index: number = 25;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0026 end');
    });

    it('testPerfOptions0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0027 begin');
      const index: number = 26;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0027 end');
    });

    it('testPerfOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0028 begin');
      const index: number = 27;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0028 end');
    });

    it('testPerfOptions0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0029 begin');
      const index: number = 28;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0029 end');
    });

    it('testPerfOptions0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0030 begin');
      const index: number = 29;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0030 end');
    });

    it('testPerfOptions0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0031 begin');
      const index: number = 30;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0031 end');
    });

    it('testPerfOptions0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0032 begin');
      const index: number = 31;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0032 end');
    });

    it('testPerfOptions0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0033 begin');
      const index: number = 32;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0033 end');
    });

    it('testPerfOptions0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0034 begin');
      const index: number = 33;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0034 end');
    });

    it('testPerfOptions0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0035 begin');
      const index: number = 34;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0035 end');
    });

    it('testPerfOptions0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0036 begin');
      const index: number = 35;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0036 end');
    });

    it('testPerfOptions0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0037 begin');
      const index: number = 36;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0037 end');
    });

    it('testPerfOptions0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0038 begin');
      const index: number = 37;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0038 end');
    });

    it('testPerfOptions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0039 begin');
      const index: number = 38;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0039 end');
    });

    it('testPerfOptions0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0040 begin');
      const index: number = 39;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0040 end');
    });

    it('testPerfOptions0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0041 begin');
      const index: number = 40;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0041 end');
    });

    it('testPerfOptions0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0042 begin');
      const index: number = 41;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0042 end');
    });

    it('testPerfOptions0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0043 begin');
      const index: number = 42;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0043 end');
    });

    it('testPerfOptions0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0044 begin');
      const index: number = 43;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0044 end');
    });

    it('testPerfOptions0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0045 begin');
      const index: number = 44;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0045 end');
    });

    it('testPerfOptions0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0046 begin');
      const index: number = 45;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0046 end');
    });

    it('testPerfOptions0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0047 begin');
      const index: number = 46;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0047 end');
    });

    it('testPerfOptions0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0048 begin');
      const index: number = 47;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0048 end');
    });

    it('testPerfOptions0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0049 begin');
      const index: number = 48;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0049 end');
    });

    it('testPerfOptions0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0050 begin');
      const index: number = 49;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0050 end');
    });

    it('testPerfOptions0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0051 begin');
      const index: number = 50;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0051 end');
    });

    it('testPerfOptions0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0052 begin');
      const index: number = 51;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0052 end');
    });

    it('testPerfOptions0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0053 begin');
      const index: number = 52;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0053 end');
    });

    it('testPerfOptions0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0054 begin');
      const index: number = 53;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0054 end');
    });

    it('testPerfOptions0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0055 begin');
      const index: number = 54;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0055 end');
    });

    it('testPerfOptions0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0056 begin');
      const index: number = 55;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0056 end');
    });

    it('testPerfOptions0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0057 begin');
      const index: number = 56;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0057 end');
    });

    it('testPerfOptions0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0058 begin');
      const index: number = 57;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0058 end');
    });

    it('testPerfOptions0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0059 begin');
      const index: number = 58;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0059 end');
    });

    it('testPerfOptions0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0060 begin');
      const index: number = 59;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0060 end');
    });

    it('testPerfOptions0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0061 begin');
      const index: number = 60;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0061 end');
    });

    it('testPerfOptions0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0062 begin');
      const index: number = 61;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0062 end');
    });

    it('testPerfOptions0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0063 begin');
      const index: number = 62;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0063 end');
    });

    it('testPerfOptions0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const start: number = Date.now();
      let last: CustomCircleStyleOptions = new CustomCircleStyleOptions();
      for (let n: number = 0; n < repeat; n++) {
        last = new CustomCircleStyleOptions('#AABBCC', (n % 10) + 1, n % 2 === 0, n % 3 === 0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(last.color).assertEqual('#AABBCC');
      expect(last.enableWaveEffect).assertEqual((repeat - 1) % 2 === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfOptions0064 end');
    });

  });
}