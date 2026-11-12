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

export default function PerfBudgetPerfResetTest() {
  describe('PerfBudget_perfReset', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testPerfReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0001 end');
    });

    it('testPerfReset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0002 begin');
      const index: number = 1;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0002 end');
    });

    it('testPerfReset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0003 begin');
      const index: number = 2;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0003 end');
    });

    it('testPerfReset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0004 begin');
      const index: number = 3;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0004 end');
    });

    it('testPerfReset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0005 begin');
      const index: number = 4;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0005 end');
    });

    it('testPerfReset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0006 begin');
      const index: number = 5;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0006 end');
    });

    it('testPerfReset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0007 begin');
      const index: number = 6;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0007 end');
    });

    it('testPerfReset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0008 begin');
      const index: number = 7;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0008 end');
    });

    it('testPerfReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0009 begin');
      const index: number = 8;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0009 end');
    });

    it('testPerfReset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0010 begin');
      const index: number = 9;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0010 end');
    });

    it('testPerfReset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0011 begin');
      const index: number = 10;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0011 end');
    });

    it('testPerfReset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0012 begin');
      const index: number = 11;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0012 end');
    });

    it('testPerfReset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0013 begin');
      const index: number = 12;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0013 end');
    });

    it('testPerfReset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0014 begin');
      const index: number = 13;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0014 end');
    });

    it('testPerfReset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0015 begin');
      const index: number = 14;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0015 end');
    });

    it('testPerfReset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0016 begin');
      const index: number = 15;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0016 end');
    });

    it('testPerfReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0017 begin');
      const index: number = 16;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0017 end');
    });

    it('testPerfReset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0018 begin');
      const index: number = 17;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0018 end');
    });

    it('testPerfReset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0019 begin');
      const index: number = 18;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0019 end');
    });

    it('testPerfReset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0020 begin');
      const index: number = 19;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0020 end');
    });

    it('testPerfReset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0021 begin');
      const index: number = 20;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0021 end');
    });

    it('testPerfReset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0022 begin');
      const index: number = 21;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0022 end');
    });

    it('testPerfReset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0023 begin');
      const index: number = 22;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0023 end');
    });

    it('testPerfReset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0024 begin');
      const index: number = 23;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0024 end');
    });

    it('testPerfReset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0025 begin');
      const index: number = 24;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0025 end');
    });

    it('testPerfReset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0026 begin');
      const index: number = 25;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0026 end');
    });

    it('testPerfReset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0027 begin');
      const index: number = 26;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0027 end');
    });

    it('testPerfReset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0028 begin');
      const index: number = 27;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0028 end');
    });

    it('testPerfReset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0029 begin');
      const index: number = 28;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0029 end');
    });

    it('testPerfReset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0030 begin');
      const index: number = 29;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0030 end');
    });

    it('testPerfReset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0031 begin');
      const index: number = 30;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0031 end');
    });

    it('testPerfReset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0032 begin');
      const index: number = 31;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0032 end');
    });

    it('testPerfReset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0033 begin');
      const index: number = 32;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0033 end');
    });

    it('testPerfReset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0034 begin');
      const index: number = 33;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0034 end');
    });

    it('testPerfReset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0035 begin');
      const index: number = 34;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0035 end');
    });

    it('testPerfReset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0036 begin');
      const index: number = 35;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0036 end');
    });

    it('testPerfReset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0037 begin');
      const index: number = 36;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0037 end');
    });

    it('testPerfReset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0038 begin');
      const index: number = 37;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0038 end');
    });

    it('testPerfReset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0039 begin');
      const index: number = 38;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0039 end');
    });

    it('testPerfReset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0040 begin');
      const index: number = 39;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0040 end');
    });

    it('testPerfReset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0041 begin');
      const index: number = 40;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0041 end');
    });

    it('testPerfReset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0042 begin');
      const index: number = 41;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0042 end');
    });

    it('testPerfReset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0043 begin');
      const index: number = 42;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0043 end');
    });

    it('testPerfReset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0044 begin');
      const index: number = 43;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0044 end');
    });

    it('testPerfReset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0045 begin');
      const index: number = 44;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0045 end');
    });

    it('testPerfReset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0046 begin');
      const index: number = 45;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0046 end');
    });

    it('testPerfReset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0047 begin');
      const index: number = 46;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0047 end');
    });

    it('testPerfReset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0048 begin');
      const index: number = 47;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0048 end');
    });

    it('testPerfReset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0049 begin');
      const index: number = 48;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0049 end');
    });

    it('testPerfReset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0050 begin');
      const index: number = 49;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0050 end');
    });

    it('testPerfReset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0051 begin');
      const index: number = 50;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0051 end');
    });

    it('testPerfReset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0052 begin');
      const index: number = 51;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0052 end');
    });

    it('testPerfReset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0053 begin');
      const index: number = 52;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0053 end');
    });

    it('testPerfReset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0054 begin');
      const index: number = 53;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0054 end');
    });

    it('testPerfReset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0055 begin');
      const index: number = 54;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0055 end');
    });

    it('testPerfReset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0056 begin');
      const index: number = 55;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0056 end');
    });

    it('testPerfReset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0057 begin');
      const index: number = 56;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0057 end');
    });

    it('testPerfReset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0058 begin');
      const index: number = 57;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0058 end');
    });

    it('testPerfReset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0059 begin');
      const index: number = 58;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0059 end');
    });

    it('testPerfReset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0060 begin');
      const index: number = 59;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0060 end');
    });

    it('testPerfReset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0061 begin');
      const index: number = 60;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0061 end');
    });

    it('testPerfReset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0062 begin');
      const index: number = 61;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0062 end');
    });

    it('testPerfReset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0063 begin');
      const index: number = 62;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0063 end');
    });

    it('testPerfReset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(count).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfReset0064 end');
    });

  });
}