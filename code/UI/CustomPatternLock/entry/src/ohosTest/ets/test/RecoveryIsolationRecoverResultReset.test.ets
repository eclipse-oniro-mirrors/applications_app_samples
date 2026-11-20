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

export default function RecoveryIsolationRecoverResultResetTest() {
  describe('RecoveryIsolationRecoverResultReset', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testRecoverResultReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0001 begin');
      const index: number = 0;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0001 end');
    });

    it('testRecoverResultReset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0002 begin');
      const index: number = 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0002 end');
    });

    it('testRecoverResultReset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0003 begin');
      const index: number = 2;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0003 end');
    });

    it('testRecoverResultReset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0004 begin');
      const index: number = 3;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0004 end');
    });

    it('testRecoverResultReset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0005 begin');
      const index: number = 4;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0005 end');
    });

    it('testRecoverResultReset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0006 begin');
      const index: number = 5;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0006 end');
    });

    it('testRecoverResultReset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0007 begin');
      const index: number = 6;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0007 end');
    });

    it('testRecoverResultReset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0008 begin');
      const index: number = 7;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0008 end');
    });

    it('testRecoverResultReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0009 begin');
      const index: number = 8;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0009 end');
    });

    it('testRecoverResultReset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0010 begin');
      const index: number = 9;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0010 end');
    });

    it('testRecoverResultReset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0011 begin');
      const index: number = 10;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0011 end');
    });

    it('testRecoverResultReset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0012 begin');
      const index: number = 11;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0012 end');
    });

    it('testRecoverResultReset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0013 begin');
      const index: number = 12;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0013 end');
    });

    it('testRecoverResultReset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0014 begin');
      const index: number = 13;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0014 end');
    });

    it('testRecoverResultReset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0015 begin');
      const index: number = 14;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0015 end');
    });

    it('testRecoverResultReset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0016 begin');
      const index: number = 15;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0016 end');
    });

    it('testRecoverResultReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0017 begin');
      const index: number = 16;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0017 end');
    });

    it('testRecoverResultReset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0018 begin');
      const index: number = 17;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0018 end');
    });

    it('testRecoverResultReset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0019 begin');
      const index: number = 18;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0019 end');
    });

    it('testRecoverResultReset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0020 begin');
      const index: number = 19;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0020 end');
    });

    it('testRecoverResultReset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0021 begin');
      const index: number = 20;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0021 end');
    });

    it('testRecoverResultReset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0022 begin');
      const index: number = 21;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0022 end');
    });

    it('testRecoverResultReset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0023 begin');
      const index: number = 22;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0023 end');
    });

    it('testRecoverResultReset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0024 begin');
      const index: number = 23;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0024 end');
    });

    it('testRecoverResultReset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0025 begin');
      const index: number = 24;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0025 end');
    });

    it('testRecoverResultReset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0026 begin');
      const index: number = 25;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0026 end');
    });

    it('testRecoverResultReset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0027 begin');
      const index: number = 26;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0027 end');
    });

    it('testRecoverResultReset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0028 begin');
      const index: number = 27;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0028 end');
    });

    it('testRecoverResultReset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0029 begin');
      const index: number = 28;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0029 end');
    });

    it('testRecoverResultReset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0030 begin');
      const index: number = 29;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0030 end');
    });

    it('testRecoverResultReset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0031 begin');
      const index: number = 30;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0031 end');
    });

    it('testRecoverResultReset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0032 begin');
      const index: number = 31;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0032 end');
    });

    it('testRecoverResultReset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0033 begin');
      const index: number = 32;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0033 end');
    });

    it('testRecoverResultReset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0034 begin');
      const index: number = 33;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0034 end');
    });

    it('testRecoverResultReset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0035 begin');
      const index: number = 34;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0035 end');
    });

    it('testRecoverResultReset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0036 begin');
      const index: number = 35;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0036 end');
    });

    it('testRecoverResultReset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0037 begin');
      const index: number = 36;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0037 end');
    });

    it('testRecoverResultReset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0038 begin');
      const index: number = 37;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0038 end');
    });

    it('testRecoverResultReset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0039 begin');
      const index: number = 38;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0039 end');
    });

    it('testRecoverResultReset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0040 begin');
      const index: number = 39;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0040 end');
    });

    it('testRecoverResultReset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0041 begin');
      const index: number = 40;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0041 end');
    });

    it('testRecoverResultReset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0042 begin');
      const index: number = 41;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0042 end');
    });

    it('testRecoverResultReset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0043 begin');
      const index: number = 42;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0043 end');
    });

    it('testRecoverResultReset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0044 begin');
      const index: number = 43;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0044 end');
    });

    it('testRecoverResultReset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0045 begin');
      const index: number = 44;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0045 end');
    });

    it('testRecoverResultReset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0046 begin');
      const index: number = 45;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0046 end');
    });

    it('testRecoverResultReset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0047 begin');
      const index: number = 46;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0047 end');
    });

    it('testRecoverResultReset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0048 begin');
      const index: number = 47;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0048 end');
    });

    it('testRecoverResultReset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0049 begin');
      const index: number = 48;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0049 end');
    });

    it('testRecoverResultReset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0050 begin');
      const index: number = 49;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0050 end');
    });

    it('testRecoverResultReset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0051 begin');
      const index: number = 50;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0051 end');
    });

    it('testRecoverResultReset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0052 begin');
      const index: number = 51;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0052 end');
    });

    it('testRecoverResultReset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0053 begin');
      const index: number = 52;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0053 end');
    });

    it('testRecoverResultReset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0054 begin');
      const index: number = 53;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0054 end');
    });

    it('testRecoverResultReset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0055 begin');
      const index: number = 54;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0055 end');
    });

    it('testRecoverResultReset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0056 begin');
      const index: number = 55;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0056 end');
    });

    it('testRecoverResultReset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0057 begin');
      const index: number = 56;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0057 end');
    });

    it('testRecoverResultReset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0058 begin');
      const index: number = 57;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0058 end');
    });

    it('testRecoverResultReset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0059 begin');
      const index: number = 58;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0059 end');
    });

    it('testRecoverResultReset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0060 begin');
      const index: number = 59;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0060 end');
    });

    it('testRecoverResultReset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0061 begin');
      const index: number = 60;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0061 end');
    });

    it('testRecoverResultReset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0062 begin');
      const index: number = 61;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0062 end');
    });

    it('testRecoverResultReset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0063 begin');
      const index: number = 62;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0063 end');
    });

    it('testRecoverResultReset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0064 begin');
      const index: number = 63;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      let resultCount: number = 0;
      let last: number = 0;
      controller.registerResetCallback(() => {
        resetCount++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        resultCount++;
        last = result;
      });
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      controller.reset();
      expect(resultCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      expect(resetCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverResultReset0064 end');
    });

  });
}