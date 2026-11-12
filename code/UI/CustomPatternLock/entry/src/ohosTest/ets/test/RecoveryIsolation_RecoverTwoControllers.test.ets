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
const TAG: string = '[Sample_PatternLock_RecoveryIsolation]';

export default function RecoveryIsolationRecoverTwoControllersTest() {
  describe('RecoveryIsolation_recoverTwoControllers', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testRecoverTwoControllers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0001 begin');
      const index: number = 0;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0001 end');
    });

    it('testRecoverTwoControllers0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0002 begin');
      const index: number = 1;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0002 end');
    });

    it('testRecoverTwoControllers0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0003 begin');
      const index: number = 2;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0003 end');
    });

    it('testRecoverTwoControllers0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0004 begin');
      const index: number = 3;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0004 end');
    });

    it('testRecoverTwoControllers0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0005 begin');
      const index: number = 4;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0005 end');
    });

    it('testRecoverTwoControllers0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0006 begin');
      const index: number = 5;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0006 end');
    });

    it('testRecoverTwoControllers0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0007 begin');
      const index: number = 6;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0007 end');
    });

    it('testRecoverTwoControllers0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0008 begin');
      const index: number = 7;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0008 end');
    });

    it('testRecoverTwoControllers0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0009 begin');
      const index: number = 8;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0009 end');
    });

    it('testRecoverTwoControllers0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0010 begin');
      const index: number = 9;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0010 end');
    });

    it('testRecoverTwoControllers0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0011 begin');
      const index: number = 10;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0011 end');
    });

    it('testRecoverTwoControllers0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0012 begin');
      const index: number = 11;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0012 end');
    });

    it('testRecoverTwoControllers0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0013 begin');
      const index: number = 12;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0013 end');
    });

    it('testRecoverTwoControllers0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0014 begin');
      const index: number = 13;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0014 end');
    });

    it('testRecoverTwoControllers0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0015 begin');
      const index: number = 14;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0015 end');
    });

    it('testRecoverTwoControllers0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0016 begin');
      const index: number = 15;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0016 end');
    });

    it('testRecoverTwoControllers0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0017 begin');
      const index: number = 16;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0017 end');
    });

    it('testRecoverTwoControllers0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0018 begin');
      const index: number = 17;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0018 end');
    });

    it('testRecoverTwoControllers0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0019 begin');
      const index: number = 18;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0019 end');
    });

    it('testRecoverTwoControllers0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0020 begin');
      const index: number = 19;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0020 end');
    });

    it('testRecoverTwoControllers0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0021 begin');
      const index: number = 20;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0021 end');
    });

    it('testRecoverTwoControllers0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0022 begin');
      const index: number = 21;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0022 end');
    });

    it('testRecoverTwoControllers0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0023 begin');
      const index: number = 22;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0023 end');
    });

    it('testRecoverTwoControllers0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0024 begin');
      const index: number = 23;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0024 end');
    });

    it('testRecoverTwoControllers0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0025 begin');
      const index: number = 24;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0025 end');
    });

    it('testRecoverTwoControllers0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0026 begin');
      const index: number = 25;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0026 end');
    });

    it('testRecoverTwoControllers0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0027 begin');
      const index: number = 26;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0027 end');
    });

    it('testRecoverTwoControllers0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0028 begin');
      const index: number = 27;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0028 end');
    });

    it('testRecoverTwoControllers0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0029 begin');
      const index: number = 28;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0029 end');
    });

    it('testRecoverTwoControllers0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0030 begin');
      const index: number = 29;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0030 end');
    });

    it('testRecoverTwoControllers0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0031 begin');
      const index: number = 30;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0031 end');
    });

    it('testRecoverTwoControllers0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0032 begin');
      const index: number = 31;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0032 end');
    });

    it('testRecoverTwoControllers0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0033 begin');
      const index: number = 32;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0033 end');
    });

    it('testRecoverTwoControllers0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0034 begin');
      const index: number = 33;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0034 end');
    });

    it('testRecoverTwoControllers0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0035 begin');
      const index: number = 34;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0035 end');
    });

    it('testRecoverTwoControllers0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0036 begin');
      const index: number = 35;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0036 end');
    });

    it('testRecoverTwoControllers0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0037 begin');
      const index: number = 36;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0037 end');
    });

    it('testRecoverTwoControllers0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0038 begin');
      const index: number = 37;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0038 end');
    });

    it('testRecoverTwoControllers0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0039 begin');
      const index: number = 38;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0039 end');
    });

    it('testRecoverTwoControllers0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0040 begin');
      const index: number = 39;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0040 end');
    });

    it('testRecoverTwoControllers0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0041 begin');
      const index: number = 40;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0041 end');
    });

    it('testRecoverTwoControllers0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0042 begin');
      const index: number = 41;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0042 end');
    });

    it('testRecoverTwoControllers0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0043 begin');
      const index: number = 42;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0043 end');
    });

    it('testRecoverTwoControllers0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0044 begin');
      const index: number = 43;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0044 end');
    });

    it('testRecoverTwoControllers0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0045 begin');
      const index: number = 44;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0045 end');
    });

    it('testRecoverTwoControllers0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0046 begin');
      const index: number = 45;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0046 end');
    });

    it('testRecoverTwoControllers0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0047 begin');
      const index: number = 46;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0047 end');
    });

    it('testRecoverTwoControllers0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0048 begin');
      const index: number = 47;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0048 end');
    });

    it('testRecoverTwoControllers0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0049 begin');
      const index: number = 48;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0049 end');
    });

    it('testRecoverTwoControllers0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0050 begin');
      const index: number = 49;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0050 end');
    });

    it('testRecoverTwoControllers0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0051 begin');
      const index: number = 50;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0051 end');
    });

    it('testRecoverTwoControllers0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0052 begin');
      const index: number = 51;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0052 end');
    });

    it('testRecoverTwoControllers0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0053 begin');
      const index: number = 52;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0053 end');
    });

    it('testRecoverTwoControllers0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0054 begin');
      const index: number = 53;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0054 end');
    });

    it('testRecoverTwoControllers0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0055 begin');
      const index: number = 54;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0055 end');
    });

    it('testRecoverTwoControllers0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0056 begin');
      const index: number = 55;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0056 end');
    });

    it('testRecoverTwoControllers0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0057 begin');
      const index: number = 56;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0057 end');
    });

    it('testRecoverTwoControllers0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0058 begin');
      const index: number = 57;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0058 end');
    });

    it('testRecoverTwoControllers0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0059 begin');
      const index: number = 58;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0059 end');
    });

    it('testRecoverTwoControllers0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0060 begin');
      const index: number = 59;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0060 end');
    });

    it('testRecoverTwoControllers0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0061 begin');
      const index: number = 60;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0061 end');
    });

    it('testRecoverTwoControllers0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0062 begin');
      const index: number = 61;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0062 end');
    });

    it('testRecoverTwoControllers0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0063 begin');
      const index: number = 62;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0063 end');
    });

    it('testRecoverTwoControllers0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0064 begin');
      const index: number = 63;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstCount: number = 0;
      let secondCount: number = 0;
      first.registerResetCallback(() => {
        firstCount++;
      });
      second.registerResetCallback(() => {
        secondCount++;
      });
      first.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(0);
      second.reset();
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTwoControllers0064 end');
    });

  });
}