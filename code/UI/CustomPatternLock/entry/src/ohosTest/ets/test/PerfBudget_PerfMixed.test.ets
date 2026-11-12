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

export default function PerfBudgetPerfMixedTest() {
  describe('PerfBudget_perfMixed', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testPerfMixed0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0001 end');
    });

    it('testPerfMixed0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0002 begin');
      const index: number = 1;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0002 end');
    });

    it('testPerfMixed0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0003 begin');
      const index: number = 2;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0003 end');
    });

    it('testPerfMixed0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0004 begin');
      const index: number = 3;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0004 end');
    });

    it('testPerfMixed0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0005 begin');
      const index: number = 4;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0005 end');
    });

    it('testPerfMixed0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0006 begin');
      const index: number = 5;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0006 end');
    });

    it('testPerfMixed0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0007 begin');
      const index: number = 6;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0007 end');
    });

    it('testPerfMixed0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0008 begin');
      const index: number = 7;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0008 end');
    });

    it('testPerfMixed0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0009 begin');
      const index: number = 8;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0009 end');
    });

    it('testPerfMixed0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0010 begin');
      const index: number = 9;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0010 end');
    });

    it('testPerfMixed0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0011 begin');
      const index: number = 10;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0011 end');
    });

    it('testPerfMixed0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0012 begin');
      const index: number = 11;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0012 end');
    });

    it('testPerfMixed0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0013 begin');
      const index: number = 12;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0013 end');
    });

    it('testPerfMixed0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0014 begin');
      const index: number = 13;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0014 end');
    });

    it('testPerfMixed0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0015 begin');
      const index: number = 14;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0015 end');
    });

    it('testPerfMixed0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0016 begin');
      const index: number = 15;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0016 end');
    });

    it('testPerfMixed0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0017 begin');
      const index: number = 16;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0017 end');
    });

    it('testPerfMixed0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0018 begin');
      const index: number = 17;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0018 end');
    });

    it('testPerfMixed0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0019 begin');
      const index: number = 18;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0019 end');
    });

    it('testPerfMixed0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0020 begin');
      const index: number = 19;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0020 end');
    });

    it('testPerfMixed0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0021 begin');
      const index: number = 20;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0021 end');
    });

    it('testPerfMixed0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0022 begin');
      const index: number = 21;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0022 end');
    });

    it('testPerfMixed0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0023 begin');
      const index: number = 22;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0023 end');
    });

    it('testPerfMixed0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0024 begin');
      const index: number = 23;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0024 end');
    });

    it('testPerfMixed0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0025 begin');
      const index: number = 24;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0025 end');
    });

    it('testPerfMixed0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0026 begin');
      const index: number = 25;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0026 end');
    });

    it('testPerfMixed0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0027 begin');
      const index: number = 26;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0027 end');
    });

    it('testPerfMixed0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0028 begin');
      const index: number = 27;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0028 end');
    });

    it('testPerfMixed0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0029 begin');
      const index: number = 28;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0029 end');
    });

    it('testPerfMixed0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0030 begin');
      const index: number = 29;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0030 end');
    });

    it('testPerfMixed0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0031 begin');
      const index: number = 30;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0031 end');
    });

    it('testPerfMixed0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0032 begin');
      const index: number = 31;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0032 end');
    });

    it('testPerfMixed0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0033 begin');
      const index: number = 32;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0033 end');
    });

    it('testPerfMixed0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0034 begin');
      const index: number = 33;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0034 end');
    });

    it('testPerfMixed0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0035 begin');
      const index: number = 34;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0035 end');
    });

    it('testPerfMixed0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0036 begin');
      const index: number = 35;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0036 end');
    });

    it('testPerfMixed0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0037 begin');
      const index: number = 36;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0037 end');
    });

    it('testPerfMixed0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0038 begin');
      const index: number = 37;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0038 end');
    });

    it('testPerfMixed0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0039 begin');
      const index: number = 38;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0039 end');
    });

    it('testPerfMixed0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0040 begin');
      const index: number = 39;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0040 end');
    });

    it('testPerfMixed0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0041 begin');
      const index: number = 40;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0041 end');
    });

    it('testPerfMixed0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0042 begin');
      const index: number = 41;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0042 end');
    });

    it('testPerfMixed0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0043 begin');
      const index: number = 42;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0043 end');
    });

    it('testPerfMixed0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0044 begin');
      const index: number = 43;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0044 end');
    });

    it('testPerfMixed0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0045 begin');
      const index: number = 44;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0045 end');
    });

    it('testPerfMixed0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0046 begin');
      const index: number = 45;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0046 end');
    });

    it('testPerfMixed0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0047 begin');
      const index: number = 46;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0047 end');
    });

    it('testPerfMixed0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0048 begin');
      const index: number = 47;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0048 end');
    });

    it('testPerfMixed0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0049 begin');
      const index: number = 48;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0049 end');
    });

    it('testPerfMixed0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0050 begin');
      const index: number = 49;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0050 end');
    });

    it('testPerfMixed0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0051 begin');
      const index: number = 50;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0051 end');
    });

    it('testPerfMixed0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0052 begin');
      const index: number = 51;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0052 end');
    });

    it('testPerfMixed0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0053 begin');
      const index: number = 52;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0053 end');
    });

    it('testPerfMixed0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0054 begin');
      const index: number = 53;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0054 end');
    });

    it('testPerfMixed0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0055 begin');
      const index: number = 54;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0055 end');
    });

    it('testPerfMixed0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0056 begin');
      const index: number = 55;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0056 end');
    });

    it('testPerfMixed0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0057 begin');
      const index: number = 56;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0057 end');
    });

    it('testPerfMixed0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0058 begin');
      const index: number = 57;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0058 end');
    });

    it('testPerfMixed0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0059 begin');
      const index: number = 58;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0059 end');
    });

    it('testPerfMixed0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0060 begin');
      const index: number = 59;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0060 end');
    });

    it('testPerfMixed0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0061 begin');
      const index: number = 60;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0061 end');
    });

    it('testPerfMixed0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0062 begin');
      const index: number = 61;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0062 end');
    });

    it('testPerfMixed0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0063 begin');
      const index: number = 62;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0063 end');
    });

    it('testPerfMixed0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resets: number = 0;
      let results: number = 0;
      controller.registerResetCallback(() => {
        resets++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        results++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
        controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(resets).assertEqual(repeat);
      expect(results).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMixed0064 end');
    });

  });
}