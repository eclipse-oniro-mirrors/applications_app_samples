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
const TAG: string = '[Sample_PatternLock_StabilityRepeat]';

export default function StabilityRepeatStableReplaceResultTest() {
  describe('StabilityRepeatStableReplaceResult', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testStableReplaceResult0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0001 begin');
      const index: number = 0;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0001 end');
    });

    it('testStableReplaceResult0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0002 begin');
      const index: number = 1;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0002 end');
    });

    it('testStableReplaceResult0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0003 begin');
      const index: number = 2;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0003 end');
    });

    it('testStableReplaceResult0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0004 begin');
      const index: number = 3;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0004 end');
    });

    it('testStableReplaceResult0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0005 begin');
      const index: number = 4;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0005 end');
    });

    it('testStableReplaceResult0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0006 begin');
      const index: number = 5;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0006 end');
    });

    it('testStableReplaceResult0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0007 begin');
      const index: number = 6;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0007 end');
    });

    it('testStableReplaceResult0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0008 begin');
      const index: number = 7;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0008 end');
    });

    it('testStableReplaceResult0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0009 begin');
      const index: number = 8;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0009 end');
    });

    it('testStableReplaceResult0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0010 begin');
      const index: number = 9;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0010 end');
    });

    it('testStableReplaceResult0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0011 begin');
      const index: number = 10;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0011 end');
    });

    it('testStableReplaceResult0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0012 begin');
      const index: number = 11;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0012 end');
    });

    it('testStableReplaceResult0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0013 begin');
      const index: number = 12;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0013 end');
    });

    it('testStableReplaceResult0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0014 begin');
      const index: number = 13;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0014 end');
    });

    it('testStableReplaceResult0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0015 begin');
      const index: number = 14;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0015 end');
    });

    it('testStableReplaceResult0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0016 begin');
      const index: number = 15;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0016 end');
    });

    it('testStableReplaceResult0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0017 begin');
      const index: number = 16;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0017 end');
    });

    it('testStableReplaceResult0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0018 begin');
      const index: number = 17;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0018 end');
    });

    it('testStableReplaceResult0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0019 begin');
      const index: number = 18;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0019 end');
    });

    it('testStableReplaceResult0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0020 begin');
      const index: number = 19;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0020 end');
    });

    it('testStableReplaceResult0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0021 begin');
      const index: number = 20;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0021 end');
    });

    it('testStableReplaceResult0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0022 begin');
      const index: number = 21;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0022 end');
    });

    it('testStableReplaceResult0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0023 begin');
      const index: number = 22;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0023 end');
    });

    it('testStableReplaceResult0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0024 begin');
      const index: number = 23;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0024 end');
    });

    it('testStableReplaceResult0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0025 begin');
      const index: number = 24;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0025 end');
    });

    it('testStableReplaceResult0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0026 begin');
      const index: number = 25;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0026 end');
    });

    it('testStableReplaceResult0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0027 begin');
      const index: number = 26;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0027 end');
    });

    it('testStableReplaceResult0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0028 begin');
      const index: number = 27;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0028 end');
    });

    it('testStableReplaceResult0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0029 begin');
      const index: number = 28;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0029 end');
    });

    it('testStableReplaceResult0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0030 begin');
      const index: number = 29;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0030 end');
    });

    it('testStableReplaceResult0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0031 begin');
      const index: number = 30;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0031 end');
    });

    it('testStableReplaceResult0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0032 begin');
      const index: number = 31;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0032 end');
    });

    it('testStableReplaceResult0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0033 begin');
      const index: number = 32;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0033 end');
    });

    it('testStableReplaceResult0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0034 begin');
      const index: number = 33;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0034 end');
    });

    it('testStableReplaceResult0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0035 begin');
      const index: number = 34;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0035 end');
    });

    it('testStableReplaceResult0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0036 begin');
      const index: number = 35;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0036 end');
    });

    it('testStableReplaceResult0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0037 begin');
      const index: number = 36;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0037 end');
    });

    it('testStableReplaceResult0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0038 begin');
      const index: number = 37;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0038 end');
    });

    it('testStableReplaceResult0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0039 begin');
      const index: number = 38;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0039 end');
    });

    it('testStableReplaceResult0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0040 begin');
      const index: number = 39;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0040 end');
    });

    it('testStableReplaceResult0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0041 begin');
      const index: number = 40;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0041 end');
    });

    it('testStableReplaceResult0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0042 begin');
      const index: number = 41;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0042 end');
    });

    it('testStableReplaceResult0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0043 begin');
      const index: number = 42;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0043 end');
    });

    it('testStableReplaceResult0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0044 begin');
      const index: number = 43;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0044 end');
    });

    it('testStableReplaceResult0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0045 begin');
      const index: number = 44;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0045 end');
    });

    it('testStableReplaceResult0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0046 begin');
      const index: number = 45;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0046 end');
    });

    it('testStableReplaceResult0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0047 begin');
      const index: number = 46;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0047 end');
    });

    it('testStableReplaceResult0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0048 begin');
      const index: number = 47;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0048 end');
    });

    it('testStableReplaceResult0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0049 begin');
      const index: number = 48;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0049 end');
    });

    it('testStableReplaceResult0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0050 begin');
      const index: number = 49;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0050 end');
    });

    it('testStableReplaceResult0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0051 begin');
      const index: number = 50;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0051 end');
    });

    it('testStableReplaceResult0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0052 begin');
      const index: number = 51;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0052 end');
    });

    it('testStableReplaceResult0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0053 begin');
      const index: number = 52;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0053 end');
    });

    it('testStableReplaceResult0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0054 begin');
      const index: number = 53;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0054 end');
    });

    it('testStableReplaceResult0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0055 begin');
      const index: number = 54;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0055 end');
    });

    it('testStableReplaceResult0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0056 begin');
      const index: number = 55;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0056 end');
    });

    it('testStableReplaceResult0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0057 begin');
      const index: number = 56;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0057 end');
    });

    it('testStableReplaceResult0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0058 begin');
      const index: number = 57;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0058 end');
    });

    it('testStableReplaceResult0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0059 begin');
      const index: number = 58;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0059 end');
    });

    it('testStableReplaceResult0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0060 begin');
      const index: number = 59;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0060 end');
    });

    it('testStableReplaceResult0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0061 begin');
      const index: number = 60;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0061 end');
    });

    it('testStableReplaceResult0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0062 begin');
      const index: number = 61;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0062 end');
    });

    it('testStableReplaceResult0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0063 begin');
      const index: number = 62;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0063 end');
    });

    it('testStableReplaceResult0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0064 begin');
      const index: number = 63;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      let last: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
          replacedCount++;
          last = result;
        });
      }
      controller.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
      expect(replacedCount).assertEqual(1);
      expect(last).assertEqual(CustomPatternLockChallengeResult.WRONG);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceResult0064 end');
    });

  });
}