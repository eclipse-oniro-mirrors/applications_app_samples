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

export default function CompatibilityCompatControllersTest() {
  describe('CompatibilityCompatControllers', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testCompatControllers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0001 begin');
      const index: number = 0;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0001 end');
    });

    it('testCompatControllers0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0002 begin');
      const index: number = 1;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0002 end');
    });

    it('testCompatControllers0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0003 begin');
      const index: number = 2;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0003 end');
    });

    it('testCompatControllers0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0004 begin');
      const index: number = 3;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0004 end');
    });

    it('testCompatControllers0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0005 begin');
      const index: number = 4;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0005 end');
    });

    it('testCompatControllers0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0006 begin');
      const index: number = 5;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0006 end');
    });

    it('testCompatControllers0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0007 begin');
      const index: number = 6;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0007 end');
    });

    it('testCompatControllers0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0008 begin');
      const index: number = 7;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0008 end');
    });

    it('testCompatControllers0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0009 begin');
      const index: number = 8;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0009 end');
    });

    it('testCompatControllers0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0010 begin');
      const index: number = 9;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0010 end');
    });

    it('testCompatControllers0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0011 begin');
      const index: number = 10;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0011 end');
    });

    it('testCompatControllers0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0012 begin');
      const index: number = 11;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0012 end');
    });

    it('testCompatControllers0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0013 begin');
      const index: number = 12;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0013 end');
    });

    it('testCompatControllers0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0014 begin');
      const index: number = 13;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0014 end');
    });

    it('testCompatControllers0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0015 begin');
      const index: number = 14;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0015 end');
    });

    it('testCompatControllers0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0016 begin');
      const index: number = 15;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0016 end');
    });

    it('testCompatControllers0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0017 begin');
      const index: number = 16;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0017 end');
    });

    it('testCompatControllers0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0018 begin');
      const index: number = 17;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0018 end');
    });

    it('testCompatControllers0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0019 begin');
      const index: number = 18;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0019 end');
    });

    it('testCompatControllers0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0020 begin');
      const index: number = 19;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0020 end');
    });

    it('testCompatControllers0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0021 begin');
      const index: number = 20;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0021 end');
    });

    it('testCompatControllers0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0022 begin');
      const index: number = 21;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0022 end');
    });

    it('testCompatControllers0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0023 begin');
      const index: number = 22;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0023 end');
    });

    it('testCompatControllers0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0024 begin');
      const index: number = 23;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0024 end');
    });

    it('testCompatControllers0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0025 begin');
      const index: number = 24;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0025 end');
    });

    it('testCompatControllers0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0026 begin');
      const index: number = 25;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0026 end');
    });

    it('testCompatControllers0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0027 begin');
      const index: number = 26;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0027 end');
    });

    it('testCompatControllers0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0028 begin');
      const index: number = 27;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0028 end');
    });

    it('testCompatControllers0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0029 begin');
      const index: number = 28;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0029 end');
    });

    it('testCompatControllers0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0030 begin');
      const index: number = 29;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0030 end');
    });

    it('testCompatControllers0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0031 begin');
      const index: number = 30;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0031 end');
    });

    it('testCompatControllers0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0032 begin');
      const index: number = 31;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0032 end');
    });

    it('testCompatControllers0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0033 begin');
      const index: number = 32;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0033 end');
    });

    it('testCompatControllers0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0034 begin');
      const index: number = 33;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0034 end');
    });

    it('testCompatControllers0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0035 begin');
      const index: number = 34;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0035 end');
    });

    it('testCompatControllers0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0036 begin');
      const index: number = 35;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0036 end');
    });

    it('testCompatControllers0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0037 begin');
      const index: number = 36;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0037 end');
    });

    it('testCompatControllers0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0038 begin');
      const index: number = 37;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0038 end');
    });

    it('testCompatControllers0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0039 begin');
      const index: number = 38;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0039 end');
    });

    it('testCompatControllers0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0040 begin');
      const index: number = 39;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0040 end');
    });

    it('testCompatControllers0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0041 begin');
      const index: number = 40;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0041 end');
    });

    it('testCompatControllers0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0042 begin');
      const index: number = 41;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0042 end');
    });

    it('testCompatControllers0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0043 begin');
      const index: number = 42;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0043 end');
    });

    it('testCompatControllers0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0044 begin');
      const index: number = 43;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0044 end');
    });

    it('testCompatControllers0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0045 begin');
      const index: number = 44;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0045 end');
    });

    it('testCompatControllers0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0046 begin');
      const index: number = 45;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0046 end');
    });

    it('testCompatControllers0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0047 begin');
      const index: number = 46;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0047 end');
    });

    it('testCompatControllers0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0048 begin');
      const index: number = 47;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0048 end');
    });

    it('testCompatControllers0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0049 begin');
      const index: number = 48;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0049 end');
    });

    it('testCompatControllers0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0050 begin');
      const index: number = 49;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0050 end');
    });

    it('testCompatControllers0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0051 begin');
      const index: number = 50;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0051 end');
    });

    it('testCompatControllers0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0052 begin');
      const index: number = 51;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0052 end');
    });

    it('testCompatControllers0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0053 begin');
      const index: number = 52;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0053 end');
    });

    it('testCompatControllers0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0054 begin');
      const index: number = 53;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0054 end');
    });

    it('testCompatControllers0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0055 begin');
      const index: number = 54;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0055 end');
    });

    it('testCompatControllers0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0056 begin');
      const index: number = 55;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0056 end');
    });

    it('testCompatControllers0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0057 begin');
      const index: number = 56;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0057 end');
    });

    it('testCompatControllers0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0058 begin');
      const index: number = 57;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0058 end');
    });

    it('testCompatControllers0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0059 begin');
      const index: number = 58;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0059 end');
    });

    it('testCompatControllers0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0060 begin');
      const index: number = 59;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0060 end');
    });

    it('testCompatControllers0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0061 begin');
      const index: number = 60;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0061 end');
    });

    it('testCompatControllers0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0062 begin');
      const index: number = 61;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0062 end');
    });

    it('testCompatControllers0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0063 begin');
      const index: number = 62;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0063 end');
    });

    it('testCompatControllers0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0064 begin');
      const index: number = 63;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      const third: CustomPatternLockController = new CustomPatternLockController();
      let counts: number = 0;
      first.registerResetCallback(() => {
        counts++;
      });
      second.registerResetCallback(() => {
        counts += 10;
      });
      third.registerResetCallback(() => {
        counts += 100;
      });
      first.reset();
      expect(counts).assertEqual(1);
      second.reset();
      expect(counts).assertEqual(11);
      third.reset();
      expect(counts).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatControllers0064 end');
    });

  });
}