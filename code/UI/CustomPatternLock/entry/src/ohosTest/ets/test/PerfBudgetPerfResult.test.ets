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

export default function PerfBudgetPerfResultTest() {
  describe('PerfBudgetPerfResult', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testPerfResult0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0001 end');
    });

    it('testPerfResult0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0002 begin');
      const index: number = 1;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0002 end');
    });

    it('testPerfResult0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0003 begin');
      const index: number = 2;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0003 end');
    });

    it('testPerfResult0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0004 begin');
      const index: number = 3;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0004 end');
    });

    it('testPerfResult0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0005 begin');
      const index: number = 4;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0005 end');
    });

    it('testPerfResult0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0006 begin');
      const index: number = 5;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0006 end');
    });

    it('testPerfResult0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0007 begin');
      const index: number = 6;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0007 end');
    });

    it('testPerfResult0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0008 begin');
      const index: number = 7;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0008 end');
    });

    it('testPerfResult0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0009 begin');
      const index: number = 8;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0009 end');
    });

    it('testPerfResult0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0010 begin');
      const index: number = 9;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0010 end');
    });

    it('testPerfResult0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0011 begin');
      const index: number = 10;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0011 end');
    });

    it('testPerfResult0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0012 begin');
      const index: number = 11;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0012 end');
    });

    it('testPerfResult0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0013 begin');
      const index: number = 12;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0013 end');
    });

    it('testPerfResult0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0014 begin');
      const index: number = 13;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0014 end');
    });

    it('testPerfResult0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0015 begin');
      const index: number = 14;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0015 end');
    });

    it('testPerfResult0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0016 begin');
      const index: number = 15;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0016 end');
    });

    it('testPerfResult0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0017 begin');
      const index: number = 16;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0017 end');
    });

    it('testPerfResult0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0018 begin');
      const index: number = 17;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0018 end');
    });

    it('testPerfResult0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0019 begin');
      const index: number = 18;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0019 end');
    });

    it('testPerfResult0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0020 begin');
      const index: number = 19;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0020 end');
    });

    it('testPerfResult0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0021 begin');
      const index: number = 20;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0021 end');
    });

    it('testPerfResult0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0022 begin');
      const index: number = 21;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0022 end');
    });

    it('testPerfResult0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0023 begin');
      const index: number = 22;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0023 end');
    });

    it('testPerfResult0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0024 begin');
      const index: number = 23;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0024 end');
    });

    it('testPerfResult0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0025 begin');
      const index: number = 24;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0025 end');
    });

    it('testPerfResult0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0026 begin');
      const index: number = 25;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0026 end');
    });

    it('testPerfResult0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0027 begin');
      const index: number = 26;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0027 end');
    });

    it('testPerfResult0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0028 begin');
      const index: number = 27;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0028 end');
    });

    it('testPerfResult0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0029 begin');
      const index: number = 28;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0029 end');
    });

    it('testPerfResult0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0030 begin');
      const index: number = 29;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0030 end');
    });

    it('testPerfResult0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0031 begin');
      const index: number = 30;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0031 end');
    });

    it('testPerfResult0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0032 begin');
      const index: number = 31;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0032 end');
    });

    it('testPerfResult0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0033 begin');
      const index: number = 32;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0033 end');
    });

    it('testPerfResult0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0034 begin');
      const index: number = 33;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0034 end');
    });

    it('testPerfResult0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0035 begin');
      const index: number = 34;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0035 end');
    });

    it('testPerfResult0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0036 begin');
      const index: number = 35;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0036 end');
    });

    it('testPerfResult0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0037 begin');
      const index: number = 36;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0037 end');
    });

    it('testPerfResult0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0038 begin');
      const index: number = 37;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0038 end');
    });

    it('testPerfResult0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0039 begin');
      const index: number = 38;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0039 end');
    });

    it('testPerfResult0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0040 begin');
      const index: number = 39;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0040 end');
    });

    it('testPerfResult0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0041 begin');
      const index: number = 40;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0041 end');
    });

    it('testPerfResult0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0042 begin');
      const index: number = 41;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0042 end');
    });

    it('testPerfResult0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0043 begin');
      const index: number = 42;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0043 end');
    });

    it('testPerfResult0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0044 begin');
      const index: number = 43;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0044 end');
    });

    it('testPerfResult0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0045 begin');
      const index: number = 44;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0045 end');
    });

    it('testPerfResult0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0046 begin');
      const index: number = 45;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0046 end');
    });

    it('testPerfResult0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0047 begin');
      const index: number = 46;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0047 end');
    });

    it('testPerfResult0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0048 begin');
      const index: number = 47;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0048 end');
    });

    it('testPerfResult0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0049 begin');
      const index: number = 48;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0049 end');
    });

    it('testPerfResult0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0050 begin');
      const index: number = 49;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0050 end');
    });

    it('testPerfResult0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0051 begin');
      const index: number = 50;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0051 end');
    });

    it('testPerfResult0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0052 begin');
      const index: number = 51;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0052 end');
    });

    it('testPerfResult0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0053 begin');
      const index: number = 52;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0053 end');
    });

    it('testPerfResult0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0054 begin');
      const index: number = 53;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0054 end');
    });

    it('testPerfResult0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0055 begin');
      const index: number = 54;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0055 end');
    });

    it('testPerfResult0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0056 begin');
      const index: number = 55;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0056 end');
    });

    it('testPerfResult0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0057 begin');
      const index: number = 56;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0057 end');
    });

    it('testPerfResult0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0058 begin');
      const index: number = 57;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0058 end');
    });

    it('testPerfResult0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0059 begin');
      const index: number = 58;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0059 end');
    });

    it('testPerfResult0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0060 begin');
      const index: number = 59;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0060 end');
    });

    it('testPerfResult0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0061 begin');
      const index: number = 60;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0061 end');
    });

    it('testPerfResult0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0062 begin');
      const index: number = 61;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0062 end');
    });

    it('testPerfResult0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0063 begin');
      const index: number = 62;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0063 end');
    });

    it('testPerfResult0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfResult0064 end');
    });

  });
}