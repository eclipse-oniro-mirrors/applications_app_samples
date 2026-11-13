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

export default function RecoveryIsolationRecoverReplaceTest() {
  describe('RecoveryIsolationRecoverReplace', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testRecoverReplace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0001 begin');
      const index: number = 0;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0001 end');
    });

    it('testRecoverReplace0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0002 begin');
      const index: number = 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0002 end');
    });

    it('testRecoverReplace0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0003 begin');
      const index: number = 2;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0003 end');
    });

    it('testRecoverReplace0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0004 begin');
      const index: number = 3;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0004 end');
    });

    it('testRecoverReplace0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0005 begin');
      const index: number = 4;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0005 end');
    });

    it('testRecoverReplace0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0006 begin');
      const index: number = 5;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0006 end');
    });

    it('testRecoverReplace0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0007 begin');
      const index: number = 6;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0007 end');
    });

    it('testRecoverReplace0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0008 begin');
      const index: number = 7;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0008 end');
    });

    it('testRecoverReplace0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0009 begin');
      const index: number = 8;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0009 end');
    });

    it('testRecoverReplace0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0010 begin');
      const index: number = 9;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0010 end');
    });

    it('testRecoverReplace0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0011 begin');
      const index: number = 10;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0011 end');
    });

    it('testRecoverReplace0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0012 begin');
      const index: number = 11;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0012 end');
    });

    it('testRecoverReplace0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0013 begin');
      const index: number = 12;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0013 end');
    });

    it('testRecoverReplace0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0014 begin');
      const index: number = 13;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0014 end');
    });

    it('testRecoverReplace0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0015 begin');
      const index: number = 14;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0015 end');
    });

    it('testRecoverReplace0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0016 begin');
      const index: number = 15;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0016 end');
    });

    it('testRecoverReplace0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0017 begin');
      const index: number = 16;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0017 end');
    });

    it('testRecoverReplace0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0018 begin');
      const index: number = 17;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0018 end');
    });

    it('testRecoverReplace0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0019 begin');
      const index: number = 18;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0019 end');
    });

    it('testRecoverReplace0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0020 begin');
      const index: number = 19;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0020 end');
    });

    it('testRecoverReplace0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0021 begin');
      const index: number = 20;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0021 end');
    });

    it('testRecoverReplace0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0022 begin');
      const index: number = 21;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0022 end');
    });

    it('testRecoverReplace0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0023 begin');
      const index: number = 22;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0023 end');
    });

    it('testRecoverReplace0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0024 begin');
      const index: number = 23;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0024 end');
    });

    it('testRecoverReplace0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0025 begin');
      const index: number = 24;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0025 end');
    });

    it('testRecoverReplace0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0026 begin');
      const index: number = 25;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0026 end');
    });

    it('testRecoverReplace0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0027 begin');
      const index: number = 26;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0027 end');
    });

    it('testRecoverReplace0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0028 begin');
      const index: number = 27;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0028 end');
    });

    it('testRecoverReplace0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0029 begin');
      const index: number = 28;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0029 end');
    });

    it('testRecoverReplace0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0030 begin');
      const index: number = 29;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0030 end');
    });

    it('testRecoverReplace0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0031 begin');
      const index: number = 30;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0031 end');
    });

    it('testRecoverReplace0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0032 begin');
      const index: number = 31;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0032 end');
    });

    it('testRecoverReplace0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0033 begin');
      const index: number = 32;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0033 end');
    });

    it('testRecoverReplace0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0034 begin');
      const index: number = 33;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0034 end');
    });

    it('testRecoverReplace0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0035 begin');
      const index: number = 34;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0035 end');
    });

    it('testRecoverReplace0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0036 begin');
      const index: number = 35;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0036 end');
    });

    it('testRecoverReplace0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0037 begin');
      const index: number = 36;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0037 end');
    });

    it('testRecoverReplace0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0038 begin');
      const index: number = 37;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0038 end');
    });

    it('testRecoverReplace0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0039 begin');
      const index: number = 38;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0039 end');
    });

    it('testRecoverReplace0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0040 begin');
      const index: number = 39;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0040 end');
    });

    it('testRecoverReplace0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0041 begin');
      const index: number = 40;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0041 end');
    });

    it('testRecoverReplace0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0042 begin');
      const index: number = 41;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0042 end');
    });

    it('testRecoverReplace0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0043 begin');
      const index: number = 42;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0043 end');
    });

    it('testRecoverReplace0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0044 begin');
      const index: number = 43;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0044 end');
    });

    it('testRecoverReplace0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0045 begin');
      const index: number = 44;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0045 end');
    });

    it('testRecoverReplace0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0046 begin');
      const index: number = 45;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0046 end');
    });

    it('testRecoverReplace0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0047 begin');
      const index: number = 46;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0047 end');
    });

    it('testRecoverReplace0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0048 begin');
      const index: number = 47;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0048 end');
    });

    it('testRecoverReplace0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0049 begin');
      const index: number = 48;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0049 end');
    });

    it('testRecoverReplace0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0050 begin');
      const index: number = 49;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0050 end');
    });

    it('testRecoverReplace0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0051 begin');
      const index: number = 50;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0051 end');
    });

    it('testRecoverReplace0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0052 begin');
      const index: number = 51;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0052 end');
    });

    it('testRecoverReplace0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0053 begin');
      const index: number = 52;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0053 end');
    });

    it('testRecoverReplace0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0054 begin');
      const index: number = 53;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0054 end');
    });

    it('testRecoverReplace0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0055 begin');
      const index: number = 54;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0055 end');
    });

    it('testRecoverReplace0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0056 begin');
      const index: number = 55;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0056 end');
    });

    it('testRecoverReplace0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0057 begin');
      const index: number = 56;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0057 end');
    });

    it('testRecoverReplace0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0058 begin');
      const index: number = 57;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0058 end');
    });

    it('testRecoverReplace0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0059 begin');
      const index: number = 58;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0059 end');
    });

    it('testRecoverReplace0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0060 begin');
      const index: number = 59;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0060 end');
    });

    it('testRecoverReplace0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0061 begin');
      const index: number = 60;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0061 end');
    });

    it('testRecoverReplace0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0062 begin');
      const index: number = 61;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0062 end');
    });

    it('testRecoverReplace0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0063 begin');
      const index: number = 62;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0063 end');
    });

    it('testRecoverReplace0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0064 begin');
      const index: number = 63;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let oldCount: number = 0;
      let newCount: number = 0;
      controller.registerResetCallback(() => {
        oldCount++;
      });
      controller.registerResetCallback(() => {
        newCount++;
      });
      controller.reset();
      expect(oldCount).assertEqual(0);
      expect(newCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverReplace0064 end');
    });

  });
}