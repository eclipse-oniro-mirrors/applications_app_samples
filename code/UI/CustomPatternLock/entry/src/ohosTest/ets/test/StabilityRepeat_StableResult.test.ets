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

export default function StabilityRepeatStableResultTest() {
  describe('StabilityRepeat_stableResult', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testStableResult0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0001 begin');
      const index: number = 0;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0001 end');
    });

    it('testStableResult0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0002 begin');
      const index: number = 1;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0002 end');
    });

    it('testStableResult0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0003 begin');
      const index: number = 2;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0003 end');
    });

    it('testStableResult0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0004 begin');
      const index: number = 3;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0004 end');
    });

    it('testStableResult0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0005 begin');
      const index: number = 4;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0005 end');
    });

    it('testStableResult0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0006 begin');
      const index: number = 5;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0006 end');
    });

    it('testStableResult0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0007 begin');
      const index: number = 6;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0007 end');
    });

    it('testStableResult0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0008 begin');
      const index: number = 7;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0008 end');
    });

    it('testStableResult0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0009 begin');
      const index: number = 8;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0009 end');
    });

    it('testStableResult0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0010 begin');
      const index: number = 9;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0010 end');
    });

    it('testStableResult0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0011 begin');
      const index: number = 10;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0011 end');
    });

    it('testStableResult0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0012 begin');
      const index: number = 11;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0012 end');
    });

    it('testStableResult0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0013 begin');
      const index: number = 12;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0013 end');
    });

    it('testStableResult0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0014 begin');
      const index: number = 13;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0014 end');
    });

    it('testStableResult0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0015 begin');
      const index: number = 14;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0015 end');
    });

    it('testStableResult0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0016 begin');
      const index: number = 15;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0016 end');
    });

    it('testStableResult0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0017 begin');
      const index: number = 16;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0017 end');
    });

    it('testStableResult0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0018 begin');
      const index: number = 17;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0018 end');
    });

    it('testStableResult0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0019 begin');
      const index: number = 18;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0019 end');
    });

    it('testStableResult0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0020 begin');
      const index: number = 19;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0020 end');
    });

    it('testStableResult0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0021 begin');
      const index: number = 20;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0021 end');
    });

    it('testStableResult0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0022 begin');
      const index: number = 21;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0022 end');
    });

    it('testStableResult0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0023 begin');
      const index: number = 22;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0023 end');
    });

    it('testStableResult0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0024 begin');
      const index: number = 23;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0024 end');
    });

    it('testStableResult0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0025 begin');
      const index: number = 24;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0025 end');
    });

    it('testStableResult0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0026 begin');
      const index: number = 25;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0026 end');
    });

    it('testStableResult0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0027 begin');
      const index: number = 26;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0027 end');
    });

    it('testStableResult0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0028 begin');
      const index: number = 27;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0028 end');
    });

    it('testStableResult0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0029 begin');
      const index: number = 28;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0029 end');
    });

    it('testStableResult0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0030 begin');
      const index: number = 29;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0030 end');
    });

    it('testStableResult0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0031 begin');
      const index: number = 30;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0031 end');
    });

    it('testStableResult0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0032 begin');
      const index: number = 31;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0032 end');
    });

    it('testStableResult0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0033 begin');
      const index: number = 32;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0033 end');
    });

    it('testStableResult0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0034 begin');
      const index: number = 33;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0034 end');
    });

    it('testStableResult0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0035 begin');
      const index: number = 34;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0035 end');
    });

    it('testStableResult0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0036 begin');
      const index: number = 35;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0036 end');
    });

    it('testStableResult0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0037 begin');
      const index: number = 36;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0037 end');
    });

    it('testStableResult0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0038 begin');
      const index: number = 37;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0038 end');
    });

    it('testStableResult0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0039 begin');
      const index: number = 38;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0039 end');
    });

    it('testStableResult0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0040 begin');
      const index: number = 39;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0040 end');
    });

    it('testStableResult0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0041 begin');
      const index: number = 40;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0041 end');
    });

    it('testStableResult0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0042 begin');
      const index: number = 41;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0042 end');
    });

    it('testStableResult0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0043 begin');
      const index: number = 42;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0043 end');
    });

    it('testStableResult0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0044 begin');
      const index: number = 43;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0044 end');
    });

    it('testStableResult0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0045 begin');
      const index: number = 44;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0045 end');
    });

    it('testStableResult0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0046 begin');
      const index: number = 45;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0046 end');
    });

    it('testStableResult0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0047 begin');
      const index: number = 46;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0047 end');
    });

    it('testStableResult0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0048 begin');
      const index: number = 47;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0048 end');
    });

    it('testStableResult0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0049 begin');
      const index: number = 48;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0049 end');
    });

    it('testStableResult0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0050 begin');
      const index: number = 49;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0050 end');
    });

    it('testStableResult0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0051 begin');
      const index: number = 50;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0051 end');
    });

    it('testStableResult0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0052 begin');
      const index: number = 51;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0052 end');
    });

    it('testStableResult0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0053 begin');
      const index: number = 52;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0053 end');
    });

    it('testStableResult0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0054 begin');
      const index: number = 53;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0054 end');
    });

    it('testStableResult0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0055 begin');
      const index: number = 54;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0055 end');
    });

    it('testStableResult0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0056 begin');
      const index: number = 55;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0056 end');
    });

    it('testStableResult0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0057 begin');
      const index: number = 56;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0057 end');
    });

    it('testStableResult0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0058 begin');
      const index: number = 57;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0058 end');
    });

    it('testStableResult0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0059 begin');
      const index: number = 58;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0059 end');
    });

    it('testStableResult0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0060 begin');
      const index: number = 59;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0060 end');
    });

    it('testStableResult0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0061 begin');
      const index: number = 60;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0061 end');
    });

    it('testStableResult0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0062 begin');
      const index: number = 61;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0062 end');
    });

    it('testStableResult0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0063 begin');
      const index: number = 62;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0063 end');
    });

    it('testStableResult0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0064 begin');
      const index: number = 63;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      let last: number = 0;
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count++;
        last = result;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      }
      expect(count).assertEqual(repeat);
      expect(last).assertEqual(CustomPatternLockChallengeResult.CORRECT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableResult0064 end');
    });

  });
}