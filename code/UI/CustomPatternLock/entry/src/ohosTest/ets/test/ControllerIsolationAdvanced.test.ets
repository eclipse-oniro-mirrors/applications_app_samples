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
import { paceTurn } from './shared/TestPace';
import {
  CustomCircleStyleOptions,
  CustomPatternLockChallengeResult,
  CustomPatternLockController
} from '../../../main/ets/pages/CustomPatternLock';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_ControllerIsolationAdvanced]';


export default function controllerIsolationAdvancedTest() {
  describe('controllerIsolationAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0129
     * @tc.name      testControllerIsolation0129
     * @tc.desc      Verify controllerIsolation behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0129 begin');
      const index: number = 128;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0129 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0130
     * @tc.name      testControllerIsolation0130
     * @tc.desc      Verify controllerIsolation behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0130 begin');
      const index: number = 129;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0130 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0131
     * @tc.name      testControllerIsolation0131
     * @tc.desc      Verify controllerIsolation behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0131 begin');
      const index: number = 130;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0131 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0132
     * @tc.name      testControllerIsolation0132
     * @tc.desc      Verify controllerIsolation behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0132 begin');
      const index: number = 131;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0132 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0133
     * @tc.name      testControllerIsolation0133
     * @tc.desc      Verify controllerIsolation behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0133 begin');
      const index: number = 132;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0133 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0134
     * @tc.name      testControllerIsolation0134
     * @tc.desc      Verify controllerIsolation behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0134 begin');
      const index: number = 133;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0134 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0135
     * @tc.name      testControllerIsolation0135
     * @tc.desc      Verify controllerIsolation behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0135 begin');
      const index: number = 134;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0135 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0136
     * @tc.name      testControllerIsolation0136
     * @tc.desc      Verify controllerIsolation behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0136 begin');
      const index: number = 135;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0136 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0137
     * @tc.name      testControllerIsolation0137
     * @tc.desc      Verify controllerIsolation behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0137 begin');
      const index: number = 136;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0137 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0138
     * @tc.name      testControllerIsolation0138
     * @tc.desc      Verify controllerIsolation behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0138 begin');
      const index: number = 137;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0138 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0139
     * @tc.name      testControllerIsolation0139
     * @tc.desc      Verify controllerIsolation behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0139 begin');
      const index: number = 138;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0139 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0140
     * @tc.name      testControllerIsolation0140
     * @tc.desc      Verify controllerIsolation behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0140 begin');
      const index: number = 139;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0140 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0141
     * @tc.name      testControllerIsolation0141
     * @tc.desc      Verify controllerIsolation behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0141 begin');
      const index: number = 140;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0141 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0142
     * @tc.name      testControllerIsolation0142
     * @tc.desc      Verify controllerIsolation behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0142 begin');
      const index: number = 141;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0142 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0143
     * @tc.name      testControllerIsolation0143
     * @tc.desc      Verify controllerIsolation behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0143 begin');
      const index: number = 142;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0143 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0144
     * @tc.name      testControllerIsolation0144
     * @tc.desc      Verify controllerIsolation behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0144 begin');
      const index: number = 143;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0144 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0145
     * @tc.name      testControllerIsolation0145
     * @tc.desc      Verify controllerIsolation behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0145 begin');
      const index: number = 144;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0145 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0146
     * @tc.name      testControllerIsolation0146
     * @tc.desc      Verify controllerIsolation behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0146 begin');
      const index: number = 145;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0146 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0147
     * @tc.name      testControllerIsolation0147
     * @tc.desc      Verify controllerIsolation behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0147 begin');
      const index: number = 146;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0147 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0148
     * @tc.name      testControllerIsolation0148
     * @tc.desc      Verify controllerIsolation behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0148 begin');
      const index: number = 147;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0148 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0149
     * @tc.name      testControllerIsolation0149
     * @tc.desc      Verify controllerIsolation behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0149 begin');
      const index: number = 148;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0149 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0150
     * @tc.name      testControllerIsolation0150
     * @tc.desc      Verify controllerIsolation behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0150 begin');
      const index: number = 149;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0150 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0151
     * @tc.name      testControllerIsolation0151
     * @tc.desc      Verify controllerIsolation behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0151 begin');
      const index: number = 150;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0151 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0152
     * @tc.name      testControllerIsolation0152
     * @tc.desc      Verify controllerIsolation behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0152 begin');
      const index: number = 151;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0152 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0153
     * @tc.name      testControllerIsolation0153
     * @tc.desc      Verify controllerIsolation behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0153 begin');
      const index: number = 152;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0153 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0154
     * @tc.name      testControllerIsolation0154
     * @tc.desc      Verify controllerIsolation behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0154 begin');
      const index: number = 153;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0154 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_ISOLATION_0155
     * @tc.name      testControllerIsolation0155
     * @tc.desc      Verify controllerIsolation behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerIsolation0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0155 begin');
      const index: number = 154;
      const first: CustomPatternLockController = new CustomPatternLockController();
      const second: CustomPatternLockController = new CustomPatternLockController();
      let firstReset: number = 0;
      let secondReset: number = 0;
      let firstResult: number = 0;
      let secondResult: number = 0;
      first.registerResetCallback(() => {
        firstReset++;
      });
      second.registerResetCallback(() => {
        secondReset++;
      });
      first.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        firstResult = result;
      });
      second.registerSetChallengeResultCallback((result: CustomPatternLockChallengeResult) => {
        secondResult = result;
      });
      const op: number = index % 6;
      let expFirstReset: number = 0;
      let expSecondReset: number = 0;
      let expFirstResult: number = 0;
      let expSecondResult: number = 0;
      if (op === 0) {
        first.reset();
        expFirstReset = 1;
      } else if (op === 1) {
        second.reset();
        expSecondReset = 1;
      } else if (op === 2) {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
      } else if (op === 3) {
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      } else if (op === 4) {
        first.reset();
        second.reset();
        expFirstReset = 1;
        expSecondReset = 1;
      } else {
        first.setChallengeResult(CustomPatternLockChallengeResult.CORRECT);
        second.setChallengeResult(CustomPatternLockChallengeResult.WRONG);
        expFirstResult = CustomPatternLockChallengeResult.CORRECT;
        expSecondResult = CustomPatternLockChallengeResult.WRONG;
      }
      expect(firstReset).assertEqual(expFirstReset);
      expect(secondReset).assertEqual(expSecondReset);
      expect(firstResult).assertEqual(expFirstResult);
      expect(secondResult).assertEqual(expSecondResult);
      let replacementReset: number = 0;
      first.registerResetCallback(() => {
        replacementReset++;
      });
      first.reset();
      expect(replacementReset).assertEqual(1);
      expect(firstReset).assertEqual(expFirstReset);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerIsolation0155 end');
    })


  })
}
