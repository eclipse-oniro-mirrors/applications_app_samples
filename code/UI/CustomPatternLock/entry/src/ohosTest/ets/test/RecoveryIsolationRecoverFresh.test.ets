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

export default function RecoveryIsolationRecoverFreshTest() {
  describe('RecoveryIsolationRecoverFresh', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testRecoverFresh0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0001 begin');
      const index: number = 0;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0001 end');
    });

    it('testRecoverFresh0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0002 begin');
      const index: number = 1;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0002 end');
    });

    it('testRecoverFresh0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0003 begin');
      const index: number = 2;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0003 end');
    });

    it('testRecoverFresh0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0004 begin');
      const index: number = 3;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0004 end');
    });

    it('testRecoverFresh0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0005 begin');
      const index: number = 4;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0005 end');
    });

    it('testRecoverFresh0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0006 begin');
      const index: number = 5;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0006 end');
    });

    it('testRecoverFresh0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0007 begin');
      const index: number = 6;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0007 end');
    });

    it('testRecoverFresh0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0008 begin');
      const index: number = 7;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0008 end');
    });

    it('testRecoverFresh0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0009 begin');
      const index: number = 8;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0009 end');
    });

    it('testRecoverFresh0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0010 begin');
      const index: number = 9;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0010 end');
    });

    it('testRecoverFresh0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0011 begin');
      const index: number = 10;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0011 end');
    });

    it('testRecoverFresh0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0012 begin');
      const index: number = 11;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0012 end');
    });

    it('testRecoverFresh0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0013 begin');
      const index: number = 12;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0013 end');
    });

    it('testRecoverFresh0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0014 begin');
      const index: number = 13;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0014 end');
    });

    it('testRecoverFresh0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0015 begin');
      const index: number = 14;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0015 end');
    });

    it('testRecoverFresh0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0016 begin');
      const index: number = 15;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0016 end');
    });

    it('testRecoverFresh0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0017 begin');
      const index: number = 16;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0017 end');
    });

    it('testRecoverFresh0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0018 begin');
      const index: number = 17;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0018 end');
    });

    it('testRecoverFresh0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0019 begin');
      const index: number = 18;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0019 end');
    });

    it('testRecoverFresh0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0020 begin');
      const index: number = 19;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0020 end');
    });

    it('testRecoverFresh0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0021 begin');
      const index: number = 20;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0021 end');
    });

    it('testRecoverFresh0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0022 begin');
      const index: number = 21;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0022 end');
    });

    it('testRecoverFresh0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0023 begin');
      const index: number = 22;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0023 end');
    });

    it('testRecoverFresh0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0024 begin');
      const index: number = 23;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0024 end');
    });

    it('testRecoverFresh0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0025 begin');
      const index: number = 24;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0025 end');
    });

    it('testRecoverFresh0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0026 begin');
      const index: number = 25;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0026 end');
    });

    it('testRecoverFresh0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0027 begin');
      const index: number = 26;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0027 end');
    });

    it('testRecoverFresh0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0028 begin');
      const index: number = 27;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0028 end');
    });

    it('testRecoverFresh0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0029 begin');
      const index: number = 28;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0029 end');
    });

    it('testRecoverFresh0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0030 begin');
      const index: number = 29;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0030 end');
    });

    it('testRecoverFresh0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0031 begin');
      const index: number = 30;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0031 end');
    });

    it('testRecoverFresh0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0032 begin');
      const index: number = 31;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0032 end');
    });

    it('testRecoverFresh0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0033 begin');
      const index: number = 32;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0033 end');
    });

    it('testRecoverFresh0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0034 begin');
      const index: number = 33;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0034 end');
    });

    it('testRecoverFresh0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0035 begin');
      const index: number = 34;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0035 end');
    });

    it('testRecoverFresh0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0036 begin');
      const index: number = 35;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0036 end');
    });

    it('testRecoverFresh0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0037 begin');
      const index: number = 36;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0037 end');
    });

    it('testRecoverFresh0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0038 begin');
      const index: number = 37;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0038 end');
    });

    it('testRecoverFresh0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0039 begin');
      const index: number = 38;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0039 end');
    });

    it('testRecoverFresh0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0040 begin');
      const index: number = 39;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0040 end');
    });

    it('testRecoverFresh0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0041 begin');
      const index: number = 40;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0041 end');
    });

    it('testRecoverFresh0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0042 begin');
      const index: number = 41;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0042 end');
    });

    it('testRecoverFresh0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0043 begin');
      const index: number = 42;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0043 end');
    });

    it('testRecoverFresh0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0044 begin');
      const index: number = 43;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0044 end');
    });

    it('testRecoverFresh0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0045 begin');
      const index: number = 44;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0045 end');
    });

    it('testRecoverFresh0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0046 begin');
      const index: number = 45;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0046 end');
    });

    it('testRecoverFresh0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0047 begin');
      const index: number = 46;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0047 end');
    });

    it('testRecoverFresh0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0048 begin');
      const index: number = 47;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0048 end');
    });

    it('testRecoverFresh0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0049 begin');
      const index: number = 48;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0049 end');
    });

    it('testRecoverFresh0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0050 begin');
      const index: number = 49;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0050 end');
    });

    it('testRecoverFresh0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0051 begin');
      const index: number = 50;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0051 end');
    });

    it('testRecoverFresh0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0052 begin');
      const index: number = 51;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0052 end');
    });

    it('testRecoverFresh0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0053 begin');
      const index: number = 52;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0053 end');
    });

    it('testRecoverFresh0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0054 begin');
      const index: number = 53;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0054 end');
    });

    it('testRecoverFresh0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0055 begin');
      const index: number = 54;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0055 end');
    });

    it('testRecoverFresh0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0056 begin');
      const index: number = 55;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0056 end');
    });

    it('testRecoverFresh0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0057 begin');
      const index: number = 56;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0057 end');
    });

    it('testRecoverFresh0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0058 begin');
      const index: number = 57;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0058 end');
    });

    it('testRecoverFresh0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0059 begin');
      const index: number = 58;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0059 end');
    });

    it('testRecoverFresh0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0060 begin');
      const index: number = 59;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0060 end');
    });

    it('testRecoverFresh0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0061 begin');
      const index: number = 60;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0061 end');
    });

    it('testRecoverFresh0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0062 begin');
      const index: number = 61;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0062 end');
    });

    it('testRecoverFresh0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0063 begin');
      const index: number = 62;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0063 end');
    });

    it('testRecoverFresh0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0064 begin');
      const index: number = 63;
      const used: CustomPatternLockController = new CustomPatternLockController();
      let usedCount: number = 0;
      used.registerResetCallback(() => {
        usedCount++;
      });
      used.reset();
      expect(usedCount).assertEqual(1);
      const fresh: CustomPatternLockController = new CustomPatternLockController();
      fresh.reset();
      expect(usedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverFresh0064 end');
    });

  });
}