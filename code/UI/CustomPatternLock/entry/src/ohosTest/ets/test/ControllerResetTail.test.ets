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
const TAG: string = '[Sample_PatternLock_ControllerResetTail]';


export default function controllerResetTailTest() {
  describe('controllerResetTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0193
     * @tc.name      testControllerReset0193
     * @tc.desc      Verify controllerReset behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0193 begin');
      const index: number = 192;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0193 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0194
     * @tc.name      testControllerReset0194
     * @tc.desc      Verify controllerReset behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0194 begin');
      const index: number = 193;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0194 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0195
     * @tc.name      testControllerReset0195
     * @tc.desc      Verify controllerReset behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0195 begin');
      const index: number = 194;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0195 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0196
     * @tc.name      testControllerReset0196
     * @tc.desc      Verify controllerReset behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0196 begin');
      const index: number = 195;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0196 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0197
     * @tc.name      testControllerReset0197
     * @tc.desc      Verify controllerReset behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0197 begin');
      const index: number = 196;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0197 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0198
     * @tc.name      testControllerReset0198
     * @tc.desc      Verify controllerReset behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0198 begin');
      const index: number = 197;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0198 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0199
     * @tc.name      testControllerReset0199
     * @tc.desc      Verify controllerReset behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0199 begin');
      const index: number = 198;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0199 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0200
     * @tc.name      testControllerReset0200
     * @tc.desc      Verify controllerReset behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0200 begin');
      const index: number = 199;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0200 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0201
     * @tc.name      testControllerReset0201
     * @tc.desc      Verify controllerReset behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0201 begin');
      const index: number = 200;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0201 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0202
     * @tc.name      testControllerReset0202
     * @tc.desc      Verify controllerReset behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0202 begin');
      const index: number = 201;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0202 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0203
     * @tc.name      testControllerReset0203
     * @tc.desc      Verify controllerReset behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0203 begin');
      const index: number = 202;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0203 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0204
     * @tc.name      testControllerReset0204
     * @tc.desc      Verify controllerReset behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0204 begin');
      const index: number = 203;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0204 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0205
     * @tc.name      testControllerReset0205
     * @tc.desc      Verify controllerReset behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0205 begin');
      const index: number = 204;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0205 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0206
     * @tc.name      testControllerReset0206
     * @tc.desc      Verify controllerReset behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0206 begin');
      const index: number = 205;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0206 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0207
     * @tc.name      testControllerReset0207
     * @tc.desc      Verify controllerReset behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0207 begin');
      const index: number = 206;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0207 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0208
     * @tc.name      testControllerReset0208
     * @tc.desc      Verify controllerReset behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0208 begin');
      const index: number = 207;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0208 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0209
     * @tc.name      testControllerReset0209
     * @tc.desc      Verify controllerReset behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0209 begin');
      const index: number = 208;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0209 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0210
     * @tc.name      testControllerReset0210
     * @tc.desc      Verify controllerReset behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0210 begin');
      const index: number = 209;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0210 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0211
     * @tc.name      testControllerReset0211
     * @tc.desc      Verify controllerReset behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0211 begin');
      const index: number = 210;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0211 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0212
     * @tc.name      testControllerReset0212
     * @tc.desc      Verify controllerReset behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0212 begin');
      const index: number = 211;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0212 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0213
     * @tc.name      testControllerReset0213
     * @tc.desc      Verify controllerReset behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0213 begin');
      const index: number = 212;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0213 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0214
     * @tc.name      testControllerReset0214
     * @tc.desc      Verify controllerReset behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0214 begin');
      const index: number = 213;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0214 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0215
     * @tc.name      testControllerReset0215
     * @tc.desc      Verify controllerReset behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0215 begin');
      const index: number = 214;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0215 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0216
     * @tc.name      testControllerReset0216
     * @tc.desc      Verify controllerReset behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0216 begin');
      const index: number = 215;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0216 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0217
     * @tc.name      testControllerReset0217
     * @tc.desc      Verify controllerReset behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0217 begin');
      const index: number = 216;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0217 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0218
     * @tc.name      testControllerReset0218
     * @tc.desc      Verify controllerReset behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0218 begin');
      const index: number = 217;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0218 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0219
     * @tc.name      testControllerReset0219
     * @tc.desc      Verify controllerReset behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0219 begin');
      const index: number = 218;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0219 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0220
     * @tc.name      testControllerReset0220
     * @tc.desc      Verify controllerReset behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0220 begin');
      const index: number = 219;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0220 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0221
     * @tc.name      testControllerReset0221
     * @tc.desc      Verify controllerReset behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0221 begin');
      const index: number = 220;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0221 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0222
     * @tc.name      testControllerReset0222
     * @tc.desc      Verify controllerReset behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0222 begin');
      const index: number = 221;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0222 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0223
     * @tc.name      testControllerReset0223
     * @tc.desc      Verify controllerReset behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0223 begin');
      const index: number = 222;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0223 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0224
     * @tc.name      testControllerReset0224
     * @tc.desc      Verify controllerReset behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0224 begin');
      const index: number = 223;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0224 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0225
     * @tc.name      testControllerReset0225
     * @tc.desc      Verify controllerReset behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0225 begin');
      const index: number = 224;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0225 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0226
     * @tc.name      testControllerReset0226
     * @tc.desc      Verify controllerReset behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0226 begin');
      const index: number = 225;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0226 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0227
     * @tc.name      testControllerReset0227
     * @tc.desc      Verify controllerReset behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0227 begin');
      const index: number = 226;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0227 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0228
     * @tc.name      testControllerReset0228
     * @tc.desc      Verify controllerReset behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0228 begin');
      const index: number = 227;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0228 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0229
     * @tc.name      testControllerReset0229
     * @tc.desc      Verify controllerReset behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0229 begin');
      const index: number = 228;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0229 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0230
     * @tc.name      testControllerReset0230
     * @tc.desc      Verify controllerReset behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0230 begin');
      const index: number = 229;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0230 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0231
     * @tc.name      testControllerReset0231
     * @tc.desc      Verify controllerReset behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0231 begin');
      const index: number = 230;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0231 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0232
     * @tc.name      testControllerReset0232
     * @tc.desc      Verify controllerReset behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0232 begin');
      const index: number = 231;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0232 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0233
     * @tc.name      testControllerReset0233
     * @tc.desc      Verify controllerReset behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0233 begin');
      const index: number = 232;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0233 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0234
     * @tc.name      testControllerReset0234
     * @tc.desc      Verify controllerReset behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0234 begin');
      const index: number = 233;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0234 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0235
     * @tc.name      testControllerReset0235
     * @tc.desc      Verify controllerReset behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0235 begin');
      const index: number = 234;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0235 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0236
     * @tc.name      testControllerReset0236
     * @tc.desc      Verify controllerReset behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0236 begin');
      const index: number = 235;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0236 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0237
     * @tc.name      testControllerReset0237
     * @tc.desc      Verify controllerReset behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0237 begin');
      const index: number = 236;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0237 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0238
     * @tc.name      testControllerReset0238
     * @tc.desc      Verify controllerReset behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0238 begin');
      const index: number = 237;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0238 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0239
     * @tc.name      testControllerReset0239
     * @tc.desc      Verify controllerReset behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0239 begin');
      const index: number = 238;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0239 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0240
     * @tc.name      testControllerReset0240
     * @tc.desc      Verify controllerReset behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0240 begin');
      const index: number = 239;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0240 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0241
     * @tc.name      testControllerReset0241
     * @tc.desc      Verify controllerReset behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0241 begin');
      const index: number = 240;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0241 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0242
     * @tc.name      testControllerReset0242
     * @tc.desc      Verify controllerReset behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0242 begin');
      const index: number = 241;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0242 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0243
     * @tc.name      testControllerReset0243
     * @tc.desc      Verify controllerReset behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0243 begin');
      const index: number = 242;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0243 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0244
     * @tc.name      testControllerReset0244
     * @tc.desc      Verify controllerReset behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0244 begin');
      const index: number = 243;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0244 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0245
     * @tc.name      testControllerReset0245
     * @tc.desc      Verify controllerReset behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0245 begin');
      const index: number = 244;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0245 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0246
     * @tc.name      testControllerReset0246
     * @tc.desc      Verify controllerReset behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0246 begin');
      const index: number = 245;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0246 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0247
     * @tc.name      testControllerReset0247
     * @tc.desc      Verify controllerReset behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0247 begin');
      const index: number = 246;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0247 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0248
     * @tc.name      testControllerReset0248
     * @tc.desc      Verify controllerReset behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0248 begin');
      const index: number = 247;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0248 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0249
     * @tc.name      testControllerReset0249
     * @tc.desc      Verify controllerReset behavior for matrix index 248.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0249 begin');
      const index: number = 248;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0249 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0250
     * @tc.name      testControllerReset0250
     * @tc.desc      Verify controllerReset behavior for matrix index 249.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0250 begin');
      const index: number = 249;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0250 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0251
     * @tc.name      testControllerReset0251
     * @tc.desc      Verify controllerReset behavior for matrix index 250.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0251 begin');
      const index: number = 250;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0251 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0252
     * @tc.name      testControllerReset0252
     * @tc.desc      Verify controllerReset behavior for matrix index 251.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0252 begin');
      const index: number = 251;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0252 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0253
     * @tc.name      testControllerReset0253
     * @tc.desc      Verify controllerReset behavior for matrix index 252.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0253 begin');
      const index: number = 252;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0253 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0254
     * @tc.name      testControllerReset0254
     * @tc.desc      Verify controllerReset behavior for matrix index 253.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0254 begin');
      const index: number = 253;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0254 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0255
     * @tc.name      testControllerReset0255
     * @tc.desc      Verify controllerReset behavior for matrix index 254.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0255 begin');
      const index: number = 254;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0255 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0256
     * @tc.name      testControllerReset0256
     * @tc.desc      Verify controllerReset behavior for matrix index 255.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0256 begin');
      const index: number = 255;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0256 end');
    })

  })
}
