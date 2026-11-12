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
const TAG: string = '[Sample_PatternLock_ControllerResetAdvanced]';


export default function controllerResetAdvancedTest() {
  describe('controllerResetAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0129
     * @tc.name      testControllerReset0129
     * @tc.desc      Verify controllerReset behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0129 begin');
      const index: number = 128;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0129 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0130
     * @tc.name      testControllerReset0130
     * @tc.desc      Verify controllerReset behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0130 begin');
      const index: number = 129;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0130 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0131
     * @tc.name      testControllerReset0131
     * @tc.desc      Verify controllerReset behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0131 begin');
      const index: number = 130;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0131 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0132
     * @tc.name      testControllerReset0132
     * @tc.desc      Verify controllerReset behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0132 begin');
      const index: number = 131;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0132 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0133
     * @tc.name      testControllerReset0133
     * @tc.desc      Verify controllerReset behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0133 begin');
      const index: number = 132;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0133 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0134
     * @tc.name      testControllerReset0134
     * @tc.desc      Verify controllerReset behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0134 begin');
      const index: number = 133;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0134 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0135
     * @tc.name      testControllerReset0135
     * @tc.desc      Verify controllerReset behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0135 begin');
      const index: number = 134;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0135 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0136
     * @tc.name      testControllerReset0136
     * @tc.desc      Verify controllerReset behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0136 begin');
      const index: number = 135;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0136 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0137
     * @tc.name      testControllerReset0137
     * @tc.desc      Verify controllerReset behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0137 begin');
      const index: number = 136;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0137 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0138
     * @tc.name      testControllerReset0138
     * @tc.desc      Verify controllerReset behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0138 begin');
      const index: number = 137;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0138 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0139
     * @tc.name      testControllerReset0139
     * @tc.desc      Verify controllerReset behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0139 begin');
      const index: number = 138;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0139 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0140
     * @tc.name      testControllerReset0140
     * @tc.desc      Verify controllerReset behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0140 begin');
      const index: number = 139;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0140 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0141
     * @tc.name      testControllerReset0141
     * @tc.desc      Verify controllerReset behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0141 begin');
      const index: number = 140;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0141 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0142
     * @tc.name      testControllerReset0142
     * @tc.desc      Verify controllerReset behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0142 begin');
      const index: number = 141;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0142 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0143
     * @tc.name      testControllerReset0143
     * @tc.desc      Verify controllerReset behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0143 begin');
      const index: number = 142;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0143 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0144
     * @tc.name      testControllerReset0144
     * @tc.desc      Verify controllerReset behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0144 begin');
      const index: number = 143;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0144 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0145
     * @tc.name      testControllerReset0145
     * @tc.desc      Verify controllerReset behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0145 begin');
      const index: number = 144;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0145 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0146
     * @tc.name      testControllerReset0146
     * @tc.desc      Verify controllerReset behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0146 begin');
      const index: number = 145;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0146 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0147
     * @tc.name      testControllerReset0147
     * @tc.desc      Verify controllerReset behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0147 begin');
      const index: number = 146;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0147 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0148
     * @tc.name      testControllerReset0148
     * @tc.desc      Verify controllerReset behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0148 begin');
      const index: number = 147;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0148 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0149
     * @tc.name      testControllerReset0149
     * @tc.desc      Verify controllerReset behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0149 begin');
      const index: number = 148;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0149 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0150
     * @tc.name      testControllerReset0150
     * @tc.desc      Verify controllerReset behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0150 begin');
      const index: number = 149;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0150 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0151
     * @tc.name      testControllerReset0151
     * @tc.desc      Verify controllerReset behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0151 begin');
      const index: number = 150;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0151 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0152
     * @tc.name      testControllerReset0152
     * @tc.desc      Verify controllerReset behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0152 begin');
      const index: number = 151;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0152 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0153
     * @tc.name      testControllerReset0153
     * @tc.desc      Verify controllerReset behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0153 begin');
      const index: number = 152;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0153 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0154
     * @tc.name      testControllerReset0154
     * @tc.desc      Verify controllerReset behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0154 begin');
      const index: number = 153;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0154 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0155
     * @tc.name      testControllerReset0155
     * @tc.desc      Verify controllerReset behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0155 begin');
      const index: number = 154;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0155 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0156
     * @tc.name      testControllerReset0156
     * @tc.desc      Verify controllerReset behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0156 begin');
      const index: number = 155;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0156 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0157
     * @tc.name      testControllerReset0157
     * @tc.desc      Verify controllerReset behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0157 begin');
      const index: number = 156;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0157 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0158
     * @tc.name      testControllerReset0158
     * @tc.desc      Verify controllerReset behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0158 begin');
      const index: number = 157;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0158 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0159
     * @tc.name      testControllerReset0159
     * @tc.desc      Verify controllerReset behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0159 begin');
      const index: number = 158;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0159 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0160
     * @tc.name      testControllerReset0160
     * @tc.desc      Verify controllerReset behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0160 begin');
      const index: number = 159;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0160 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0161
     * @tc.name      testControllerReset0161
     * @tc.desc      Verify controllerReset behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0161 begin');
      const index: number = 160;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0161 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0162
     * @tc.name      testControllerReset0162
     * @tc.desc      Verify controllerReset behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0162 begin');
      const index: number = 161;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0162 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0163
     * @tc.name      testControllerReset0163
     * @tc.desc      Verify controllerReset behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0163 begin');
      const index: number = 162;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0163 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0164
     * @tc.name      testControllerReset0164
     * @tc.desc      Verify controllerReset behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0164 begin');
      const index: number = 163;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0164 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0165
     * @tc.name      testControllerReset0165
     * @tc.desc      Verify controllerReset behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0165 begin');
      const index: number = 164;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0165 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0166
     * @tc.name      testControllerReset0166
     * @tc.desc      Verify controllerReset behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0166 begin');
      const index: number = 165;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0166 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0167
     * @tc.name      testControllerReset0167
     * @tc.desc      Verify controllerReset behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0167 begin');
      const index: number = 166;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0167 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0168
     * @tc.name      testControllerReset0168
     * @tc.desc      Verify controllerReset behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0168 begin');
      const index: number = 167;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0168 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0169
     * @tc.name      testControllerReset0169
     * @tc.desc      Verify controllerReset behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0169 begin');
      const index: number = 168;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0169 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0170
     * @tc.name      testControllerReset0170
     * @tc.desc      Verify controllerReset behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0170 begin');
      const index: number = 169;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0170 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0171
     * @tc.name      testControllerReset0171
     * @tc.desc      Verify controllerReset behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0171 begin');
      const index: number = 170;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0171 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0172
     * @tc.name      testControllerReset0172
     * @tc.desc      Verify controllerReset behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0172 begin');
      const index: number = 171;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0172 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0173
     * @tc.name      testControllerReset0173
     * @tc.desc      Verify controllerReset behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0173 begin');
      const index: number = 172;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0173 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0174
     * @tc.name      testControllerReset0174
     * @tc.desc      Verify controllerReset behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0174 begin');
      const index: number = 173;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0174 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0175
     * @tc.name      testControllerReset0175
     * @tc.desc      Verify controllerReset behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0175 begin');
      const index: number = 174;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0175 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0176
     * @tc.name      testControllerReset0176
     * @tc.desc      Verify controllerReset behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0176 begin');
      const index: number = 175;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0176 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0177
     * @tc.name      testControllerReset0177
     * @tc.desc      Verify controllerReset behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0177 begin');
      const index: number = 176;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0177 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0178
     * @tc.name      testControllerReset0178
     * @tc.desc      Verify controllerReset behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0178 begin');
      const index: number = 177;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0178 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0179
     * @tc.name      testControllerReset0179
     * @tc.desc      Verify controllerReset behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0179 begin');
      const index: number = 178;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0179 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0180
     * @tc.name      testControllerReset0180
     * @tc.desc      Verify controllerReset behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0180 begin');
      const index: number = 179;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0180 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0181
     * @tc.name      testControllerReset0181
     * @tc.desc      Verify controllerReset behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0181 begin');
      const index: number = 180;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0181 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0182
     * @tc.name      testControllerReset0182
     * @tc.desc      Verify controllerReset behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0182 begin');
      const index: number = 181;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0182 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0183
     * @tc.name      testControllerReset0183
     * @tc.desc      Verify controllerReset behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0183 begin');
      const index: number = 182;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0183 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0184
     * @tc.name      testControllerReset0184
     * @tc.desc      Verify controllerReset behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0184 begin');
      const index: number = 183;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0184 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0185
     * @tc.name      testControllerReset0185
     * @tc.desc      Verify controllerReset behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0185 begin');
      const index: number = 184;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0185 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0186
     * @tc.name      testControllerReset0186
     * @tc.desc      Verify controllerReset behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0186 begin');
      const index: number = 185;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0186 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0187
     * @tc.name      testControllerReset0187
     * @tc.desc      Verify controllerReset behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0187 begin');
      const index: number = 186;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0187 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0188
     * @tc.name      testControllerReset0188
     * @tc.desc      Verify controllerReset behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0188 begin');
      const index: number = 187;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0188 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0189
     * @tc.name      testControllerReset0189
     * @tc.desc      Verify controllerReset behavior for matrix index 188.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0189 begin');
      const index: number = 188;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0189 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0190
     * @tc.name      testControllerReset0190
     * @tc.desc      Verify controllerReset behavior for matrix index 189.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0190 begin');
      const index: number = 189;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0190 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0191
     * @tc.name      testControllerReset0191
     * @tc.desc      Verify controllerReset behavior for matrix index 190.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0191 begin');
      const index: number = 190;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0191 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0192
     * @tc.name      testControllerReset0192
     * @tc.desc      Verify controllerReset behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0192 begin');
      const index: number = 191;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0192 end');
    })

  })
}
