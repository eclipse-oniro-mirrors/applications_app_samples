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
const TAG: string = '[Sample_PatternLock_InputBoundary]';

export default function InputBoundaryBoundaryNoCallbackTest() {
  describe('InputBoundaryBoundaryNoCallback', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testBoundaryNoCallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0001 begin');
      const index: number = 0;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0001 end');
    });

    it('testBoundaryNoCallback0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0002 begin');
      const index: number = 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0002 end');
    });

    it('testBoundaryNoCallback0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0003 begin');
      const index: number = 2;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0003 end');
    });

    it('testBoundaryNoCallback0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0004 begin');
      const index: number = 3;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0004 end');
    });

    it('testBoundaryNoCallback0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0005 begin');
      const index: number = 4;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0005 end');
    });

    it('testBoundaryNoCallback0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0006 begin');
      const index: number = 5;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0006 end');
    });

    it('testBoundaryNoCallback0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0007 begin');
      const index: number = 6;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0007 end');
    });

    it('testBoundaryNoCallback0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0008 begin');
      const index: number = 7;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0008 end');
    });

    it('testBoundaryNoCallback0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0009 begin');
      const index: number = 8;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0009 end');
    });

    it('testBoundaryNoCallback0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0010 begin');
      const index: number = 9;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0010 end');
    });

    it('testBoundaryNoCallback0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0011 begin');
      const index: number = 10;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0011 end');
    });

    it('testBoundaryNoCallback0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0012 begin');
      const index: number = 11;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0012 end');
    });

    it('testBoundaryNoCallback0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0013 begin');
      const index: number = 12;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0013 end');
    });

    it('testBoundaryNoCallback0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0014 begin');
      const index: number = 13;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0014 end');
    });

    it('testBoundaryNoCallback0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0015 begin');
      const index: number = 14;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0015 end');
    });

    it('testBoundaryNoCallback0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0016 begin');
      const index: number = 15;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0016 end');
    });

    it('testBoundaryNoCallback0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0017 begin');
      const index: number = 16;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0017 end');
    });

    it('testBoundaryNoCallback0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0018 begin');
      const index: number = 17;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0018 end');
    });

    it('testBoundaryNoCallback0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0019 begin');
      const index: number = 18;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0019 end');
    });

    it('testBoundaryNoCallback0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0020 begin');
      const index: number = 19;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0020 end');
    });

    it('testBoundaryNoCallback0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0021 begin');
      const index: number = 20;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0021 end');
    });

    it('testBoundaryNoCallback0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0022 begin');
      const index: number = 21;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0022 end');
    });

    it('testBoundaryNoCallback0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0023 begin');
      const index: number = 22;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0023 end');
    });

    it('testBoundaryNoCallback0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0024 begin');
      const index: number = 23;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0024 end');
    });

    it('testBoundaryNoCallback0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0025 begin');
      const index: number = 24;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0025 end');
    });

    it('testBoundaryNoCallback0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0026 begin');
      const index: number = 25;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0026 end');
    });

    it('testBoundaryNoCallback0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0027 begin');
      const index: number = 26;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0027 end');
    });

    it('testBoundaryNoCallback0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0028 begin');
      const index: number = 27;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0028 end');
    });

    it('testBoundaryNoCallback0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0029 begin');
      const index: number = 28;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0029 end');
    });

    it('testBoundaryNoCallback0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0030 begin');
      const index: number = 29;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0030 end');
    });

    it('testBoundaryNoCallback0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0031 begin');
      const index: number = 30;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0031 end');
    });

    it('testBoundaryNoCallback0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0032 begin');
      const index: number = 31;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0032 end');
    });

    it('testBoundaryNoCallback0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0033 begin');
      const index: number = 32;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0033 end');
    });

    it('testBoundaryNoCallback0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0034 begin');
      const index: number = 33;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0034 end');
    });

    it('testBoundaryNoCallback0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0035 begin');
      const index: number = 34;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0035 end');
    });

    it('testBoundaryNoCallback0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0036 begin');
      const index: number = 35;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0036 end');
    });

    it('testBoundaryNoCallback0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0037 begin');
      const index: number = 36;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0037 end');
    });

    it('testBoundaryNoCallback0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0038 begin');
      const index: number = 37;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0038 end');
    });

    it('testBoundaryNoCallback0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0039 begin');
      const index: number = 38;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0039 end');
    });

    it('testBoundaryNoCallback0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0040 begin');
      const index: number = 39;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0040 end');
    });

    it('testBoundaryNoCallback0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0041 begin');
      const index: number = 40;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0041 end');
    });

    it('testBoundaryNoCallback0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0042 begin');
      const index: number = 41;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0042 end');
    });

    it('testBoundaryNoCallback0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0043 begin');
      const index: number = 42;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0043 end');
    });

    it('testBoundaryNoCallback0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0044 begin');
      const index: number = 43;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0044 end');
    });

    it('testBoundaryNoCallback0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0045 begin');
      const index: number = 44;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0045 end');
    });

    it('testBoundaryNoCallback0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0046 begin');
      const index: number = 45;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0046 end');
    });

    it('testBoundaryNoCallback0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0047 begin');
      const index: number = 46;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0047 end');
    });

    it('testBoundaryNoCallback0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0048 begin');
      const index: number = 47;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0048 end');
    });

    it('testBoundaryNoCallback0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0049 begin');
      const index: number = 48;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0049 end');
    });

    it('testBoundaryNoCallback0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0050 begin');
      const index: number = 49;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0050 end');
    });

    it('testBoundaryNoCallback0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0051 begin');
      const index: number = 50;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0051 end');
    });

    it('testBoundaryNoCallback0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0052 begin');
      const index: number = 51;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0052 end');
    });

    it('testBoundaryNoCallback0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0053 begin');
      const index: number = 52;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0053 end');
    });

    it('testBoundaryNoCallback0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0054 begin');
      const index: number = 53;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0054 end');
    });

    it('testBoundaryNoCallback0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0055 begin');
      const index: number = 54;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0055 end');
    });

    it('testBoundaryNoCallback0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0056 begin');
      const index: number = 55;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0056 end');
    });

    it('testBoundaryNoCallback0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0057 begin');
      const index: number = 56;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0057 end');
    });

    it('testBoundaryNoCallback0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0058 begin');
      const index: number = 57;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0058 end');
    });

    it('testBoundaryNoCallback0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0059 begin');
      const index: number = 58;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0059 end');
    });

    it('testBoundaryNoCallback0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0060 begin');
      const index: number = 59;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0060 end');
    });

    it('testBoundaryNoCallback0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0061 begin');
      const index: number = 60;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0061 end');
    });

    it('testBoundaryNoCallback0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0062 begin');
      const index: number = 61;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0062 end');
    });

    it('testBoundaryNoCallback0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0063 begin');
      const index: number = 62;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0063 end');
    });

    it('testBoundaryNoCallback0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0064 begin');
      const index: number = 63;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      controller.reset();
      controller.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      controller.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        count += 10;
      });
      expect(count).assertEqual(0);
      controller.reset();
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNoCallback0064 end');
    });

  });
}