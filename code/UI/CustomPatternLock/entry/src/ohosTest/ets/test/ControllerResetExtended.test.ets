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
const TAG: string = '[Sample_PatternLock_ControllerResetExtended]';


export default function controllerResetExtendedTest() {
  describe('controllerResetExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0065
     * @tc.name      testControllerReset0065
     * @tc.desc      Verify controllerReset behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0065 begin');
      const index: number = 64;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0065 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0066
     * @tc.name      testControllerReset0066
     * @tc.desc      Verify controllerReset behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0066 begin');
      const index: number = 65;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0066 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0067
     * @tc.name      testControllerReset0067
     * @tc.desc      Verify controllerReset behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0067 begin');
      const index: number = 66;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0067 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0068
     * @tc.name      testControllerReset0068
     * @tc.desc      Verify controllerReset behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0068 begin');
      const index: number = 67;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0068 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0069
     * @tc.name      testControllerReset0069
     * @tc.desc      Verify controllerReset behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0069 begin');
      const index: number = 68;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0069 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0070
     * @tc.name      testControllerReset0070
     * @tc.desc      Verify controllerReset behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0070 begin');
      const index: number = 69;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0070 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0071
     * @tc.name      testControllerReset0071
     * @tc.desc      Verify controllerReset behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0071 begin');
      const index: number = 70;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0071 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0072
     * @tc.name      testControllerReset0072
     * @tc.desc      Verify controllerReset behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0072 begin');
      const index: number = 71;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0072 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0073
     * @tc.name      testControllerReset0073
     * @tc.desc      Verify controllerReset behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0073 begin');
      const index: number = 72;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0073 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0074
     * @tc.name      testControllerReset0074
     * @tc.desc      Verify controllerReset behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0074 begin');
      const index: number = 73;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0074 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0075
     * @tc.name      testControllerReset0075
     * @tc.desc      Verify controllerReset behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0075 begin');
      const index: number = 74;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0075 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0076
     * @tc.name      testControllerReset0076
     * @tc.desc      Verify controllerReset behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0076 begin');
      const index: number = 75;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0076 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0077
     * @tc.name      testControllerReset0077
     * @tc.desc      Verify controllerReset behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0077 begin');
      const index: number = 76;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0077 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0078
     * @tc.name      testControllerReset0078
     * @tc.desc      Verify controllerReset behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0078 begin');
      const index: number = 77;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0078 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0079
     * @tc.name      testControllerReset0079
     * @tc.desc      Verify controllerReset behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0079 begin');
      const index: number = 78;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0079 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0080
     * @tc.name      testControllerReset0080
     * @tc.desc      Verify controllerReset behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0080 begin');
      const index: number = 79;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0080 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0081
     * @tc.name      testControllerReset0081
     * @tc.desc      Verify controllerReset behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0081 begin');
      const index: number = 80;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0081 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0082
     * @tc.name      testControllerReset0082
     * @tc.desc      Verify controllerReset behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0082 begin');
      const index: number = 81;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0082 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0083
     * @tc.name      testControllerReset0083
     * @tc.desc      Verify controllerReset behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0083 begin');
      const index: number = 82;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0083 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0084
     * @tc.name      testControllerReset0084
     * @tc.desc      Verify controllerReset behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0084 begin');
      const index: number = 83;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0084 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0085
     * @tc.name      testControllerReset0085
     * @tc.desc      Verify controllerReset behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0085 begin');
      const index: number = 84;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0085 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0086
     * @tc.name      testControllerReset0086
     * @tc.desc      Verify controllerReset behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0086 begin');
      const index: number = 85;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0086 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0087
     * @tc.name      testControllerReset0087
     * @tc.desc      Verify controllerReset behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0087 begin');
      const index: number = 86;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0087 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0088
     * @tc.name      testControllerReset0088
     * @tc.desc      Verify controllerReset behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0088 begin');
      const index: number = 87;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0088 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0089
     * @tc.name      testControllerReset0089
     * @tc.desc      Verify controllerReset behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0089 begin');
      const index: number = 88;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0089 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0090
     * @tc.name      testControllerReset0090
     * @tc.desc      Verify controllerReset behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0090 begin');
      const index: number = 89;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0090 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0091
     * @tc.name      testControllerReset0091
     * @tc.desc      Verify controllerReset behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0091 begin');
      const index: number = 90;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0091 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0092
     * @tc.name      testControllerReset0092
     * @tc.desc      Verify controllerReset behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0092 begin');
      const index: number = 91;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0092 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0093
     * @tc.name      testControllerReset0093
     * @tc.desc      Verify controllerReset behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0093 begin');
      const index: number = 92;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0093 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0094
     * @tc.name      testControllerReset0094
     * @tc.desc      Verify controllerReset behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0094 begin');
      const index: number = 93;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0094 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0095
     * @tc.name      testControllerReset0095
     * @tc.desc      Verify controllerReset behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0095 begin');
      const index: number = 94;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0095 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0096
     * @tc.name      testControllerReset0096
     * @tc.desc      Verify controllerReset behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0096 begin');
      const index: number = 95;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0096 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0097
     * @tc.name      testControllerReset0097
     * @tc.desc      Verify controllerReset behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0097 begin');
      const index: number = 96;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0097 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0098
     * @tc.name      testControllerReset0098
     * @tc.desc      Verify controllerReset behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0098 begin');
      const index: number = 97;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0098 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0099
     * @tc.name      testControllerReset0099
     * @tc.desc      Verify controllerReset behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0099 begin');
      const index: number = 98;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0099 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0100
     * @tc.name      testControllerReset0100
     * @tc.desc      Verify controllerReset behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0100 begin');
      const index: number = 99;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0100 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0101
     * @tc.name      testControllerReset0101
     * @tc.desc      Verify controllerReset behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0101 begin');
      const index: number = 100;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0101 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0102
     * @tc.name      testControllerReset0102
     * @tc.desc      Verify controllerReset behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0102 begin');
      const index: number = 101;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0102 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0103
     * @tc.name      testControllerReset0103
     * @tc.desc      Verify controllerReset behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0103 begin');
      const index: number = 102;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0103 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0104
     * @tc.name      testControllerReset0104
     * @tc.desc      Verify controllerReset behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0104 begin');
      const index: number = 103;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0104 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0105
     * @tc.name      testControllerReset0105
     * @tc.desc      Verify controllerReset behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0105 begin');
      const index: number = 104;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0105 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0106
     * @tc.name      testControllerReset0106
     * @tc.desc      Verify controllerReset behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0106 begin');
      const index: number = 105;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0106 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0107
     * @tc.name      testControllerReset0107
     * @tc.desc      Verify controllerReset behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0107 begin');
      const index: number = 106;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0107 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0108
     * @tc.name      testControllerReset0108
     * @tc.desc      Verify controllerReset behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0108 begin');
      const index: number = 107;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0108 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0109
     * @tc.name      testControllerReset0109
     * @tc.desc      Verify controllerReset behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0109 begin');
      const index: number = 108;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0109 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0110
     * @tc.name      testControllerReset0110
     * @tc.desc      Verify controllerReset behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0110 begin');
      const index: number = 109;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0110 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0111
     * @tc.name      testControllerReset0111
     * @tc.desc      Verify controllerReset behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0111 begin');
      const index: number = 110;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0111 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0112
     * @tc.name      testControllerReset0112
     * @tc.desc      Verify controllerReset behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0112 begin');
      const index: number = 111;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0112 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0113
     * @tc.name      testControllerReset0113
     * @tc.desc      Verify controllerReset behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0113 begin');
      const index: number = 112;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0113 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0114
     * @tc.name      testControllerReset0114
     * @tc.desc      Verify controllerReset behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0114 begin');
      const index: number = 113;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0114 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0115
     * @tc.name      testControllerReset0115
     * @tc.desc      Verify controllerReset behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0115 begin');
      const index: number = 114;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0115 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0116
     * @tc.name      testControllerReset0116
     * @tc.desc      Verify controllerReset behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0116 begin');
      const index: number = 115;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0116 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0117
     * @tc.name      testControllerReset0117
     * @tc.desc      Verify controllerReset behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0117 begin');
      const index: number = 116;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0117 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0118
     * @tc.name      testControllerReset0118
     * @tc.desc      Verify controllerReset behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0118 begin');
      const index: number = 117;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0118 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0119
     * @tc.name      testControllerReset0119
     * @tc.desc      Verify controllerReset behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0119 begin');
      const index: number = 118;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0119 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0120
     * @tc.name      testControllerReset0120
     * @tc.desc      Verify controllerReset behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0120 begin');
      const index: number = 119;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0120 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0121
     * @tc.name      testControllerReset0121
     * @tc.desc      Verify controllerReset behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0121 begin');
      const index: number = 120;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0121 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0122
     * @tc.name      testControllerReset0122
     * @tc.desc      Verify controllerReset behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0122 begin');
      const index: number = 121;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0122 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0123
     * @tc.name      testControllerReset0123
     * @tc.desc      Verify controllerReset behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0123 begin');
      const index: number = 122;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0123 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0124
     * @tc.name      testControllerReset0124
     * @tc.desc      Verify controllerReset behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0124 begin');
      const index: number = 123;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0124 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0125
     * @tc.name      testControllerReset0125
     * @tc.desc      Verify controllerReset behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0125 begin');
      const index: number = 124;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0125 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0126
     * @tc.name      testControllerReset0126
     * @tc.desc      Verify controllerReset behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0126 begin');
      const index: number = 125;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0126 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0127
     * @tc.name      testControllerReset0127
     * @tc.desc      Verify controllerReset behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0127 begin');
      const index: number = 126;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0127 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0128
     * @tc.name      testControllerReset0128
     * @tc.desc      Verify controllerReset behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0128 begin');
      const index: number = 127;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let resetCount: number = 0;
      const resetCalls: number = index % 5;
      const registered: boolean = (index % 3) !== 0;
      if (registered) {
        controller.registerResetCallback(() => {
          resetCount++;
        });
      }
      for (let n: number = 0; n < resetCalls; n++) {
        controller.reset();
      }
      expect(resetCount).assertEqual(registered ? resetCalls : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0128 end');
    })

  })
}
