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
const TAG: string = '[Sample_PatternLock_ControllerResetCore]';


export default function controllerResetCoreTest() {
  describe('controllerResetCoreTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0001
     * @tc.name      testControllerReset0001
     * @tc.desc      Verify controllerReset behavior for matrix index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0001 begin');
      const index: number = 0;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0001 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0002
     * @tc.name      testControllerReset0002
     * @tc.desc      Verify controllerReset behavior for matrix index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0002 begin');
      const index: number = 1;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0002 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0003
     * @tc.name      testControllerReset0003
     * @tc.desc      Verify controllerReset behavior for matrix index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0003 begin');
      const index: number = 2;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0003 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0004
     * @tc.name      testControllerReset0004
     * @tc.desc      Verify controllerReset behavior for matrix index 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0004 begin');
      const index: number = 3;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0004 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0005
     * @tc.name      testControllerReset0005
     * @tc.desc      Verify controllerReset behavior for matrix index 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0005 begin');
      const index: number = 4;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0005 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0006
     * @tc.name      testControllerReset0006
     * @tc.desc      Verify controllerReset behavior for matrix index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0006 begin');
      const index: number = 5;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0006 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0007
     * @tc.name      testControllerReset0007
     * @tc.desc      Verify controllerReset behavior for matrix index 6.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0007 begin');
      const index: number = 6;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0007 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0008
     * @tc.name      testControllerReset0008
     * @tc.desc      Verify controllerReset behavior for matrix index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0008 begin');
      const index: number = 7;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0008 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0009
     * @tc.name      testControllerReset0009
     * @tc.desc      Verify controllerReset behavior for matrix index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0009 begin');
      const index: number = 8;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0009 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0010
     * @tc.name      testControllerReset0010
     * @tc.desc      Verify controllerReset behavior for matrix index 9.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0010 begin');
      const index: number = 9;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0010 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0011
     * @tc.name      testControllerReset0011
     * @tc.desc      Verify controllerReset behavior for matrix index 10.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0011 begin');
      const index: number = 10;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0011 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0012
     * @tc.name      testControllerReset0012
     * @tc.desc      Verify controllerReset behavior for matrix index 11.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0012 begin');
      const index: number = 11;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0012 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0013
     * @tc.name      testControllerReset0013
     * @tc.desc      Verify controllerReset behavior for matrix index 12.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0013 begin');
      const index: number = 12;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0013 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0014
     * @tc.name      testControllerReset0014
     * @tc.desc      Verify controllerReset behavior for matrix index 13.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0014 begin');
      const index: number = 13;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0014 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0015
     * @tc.name      testControllerReset0015
     * @tc.desc      Verify controllerReset behavior for matrix index 14.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0015 begin');
      const index: number = 14;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0015 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0016
     * @tc.name      testControllerReset0016
     * @tc.desc      Verify controllerReset behavior for matrix index 15.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0016 begin');
      const index: number = 15;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0016 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0017
     * @tc.name      testControllerReset0017
     * @tc.desc      Verify controllerReset behavior for matrix index 16.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0017 begin');
      const index: number = 16;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0017 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0018
     * @tc.name      testControllerReset0018
     * @tc.desc      Verify controllerReset behavior for matrix index 17.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0018 begin');
      const index: number = 17;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0018 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0019
     * @tc.name      testControllerReset0019
     * @tc.desc      Verify controllerReset behavior for matrix index 18.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0019 begin');
      const index: number = 18;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0019 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0020
     * @tc.name      testControllerReset0020
     * @tc.desc      Verify controllerReset behavior for matrix index 19.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0020 begin');
      const index: number = 19;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0020 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0021
     * @tc.name      testControllerReset0021
     * @tc.desc      Verify controllerReset behavior for matrix index 20.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0021 begin');
      const index: number = 20;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0021 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0022
     * @tc.name      testControllerReset0022
     * @tc.desc      Verify controllerReset behavior for matrix index 21.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0022 begin');
      const index: number = 21;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0022 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0023
     * @tc.name      testControllerReset0023
     * @tc.desc      Verify controllerReset behavior for matrix index 22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0023 begin');
      const index: number = 22;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0023 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0024
     * @tc.name      testControllerReset0024
     * @tc.desc      Verify controllerReset behavior for matrix index 23.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0024 begin');
      const index: number = 23;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0024 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0025
     * @tc.name      testControllerReset0025
     * @tc.desc      Verify controllerReset behavior for matrix index 24.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0025 begin');
      const index: number = 24;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0025 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0026
     * @tc.name      testControllerReset0026
     * @tc.desc      Verify controllerReset behavior for matrix index 25.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0026 begin');
      const index: number = 25;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0026 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0027
     * @tc.name      testControllerReset0027
     * @tc.desc      Verify controllerReset behavior for matrix index 26.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0027 begin');
      const index: number = 26;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0027 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0028
     * @tc.name      testControllerReset0028
     * @tc.desc      Verify controllerReset behavior for matrix index 27.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0028 begin');
      const index: number = 27;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0028 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0029
     * @tc.name      testControllerReset0029
     * @tc.desc      Verify controllerReset behavior for matrix index 28.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0029 begin');
      const index: number = 28;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0029 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0030
     * @tc.name      testControllerReset0030
     * @tc.desc      Verify controllerReset behavior for matrix index 29.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0030 begin');
      const index: number = 29;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0030 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0031
     * @tc.name      testControllerReset0031
     * @tc.desc      Verify controllerReset behavior for matrix index 30.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0031 begin');
      const index: number = 30;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0031 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0032
     * @tc.name      testControllerReset0032
     * @tc.desc      Verify controllerReset behavior for matrix index 31.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0032 begin');
      const index: number = 31;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0032 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0033
     * @tc.name      testControllerReset0033
     * @tc.desc      Verify controllerReset behavior for matrix index 32.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0033 begin');
      const index: number = 32;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0033 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0034
     * @tc.name      testControllerReset0034
     * @tc.desc      Verify controllerReset behavior for matrix index 33.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0034 begin');
      const index: number = 33;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0034 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0035
     * @tc.name      testControllerReset0035
     * @tc.desc      Verify controllerReset behavior for matrix index 34.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0035 begin');
      const index: number = 34;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0035 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0036
     * @tc.name      testControllerReset0036
     * @tc.desc      Verify controllerReset behavior for matrix index 35.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0036 begin');
      const index: number = 35;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0036 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0037
     * @tc.name      testControllerReset0037
     * @tc.desc      Verify controllerReset behavior for matrix index 36.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0037 begin');
      const index: number = 36;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0037 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0038
     * @tc.name      testControllerReset0038
     * @tc.desc      Verify controllerReset behavior for matrix index 37.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0038 begin');
      const index: number = 37;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0038 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0039
     * @tc.name      testControllerReset0039
     * @tc.desc      Verify controllerReset behavior for matrix index 38.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0039 begin');
      const index: number = 38;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0039 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0040
     * @tc.name      testControllerReset0040
     * @tc.desc      Verify controllerReset behavior for matrix index 39.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0040 begin');
      const index: number = 39;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0040 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0041
     * @tc.name      testControllerReset0041
     * @tc.desc      Verify controllerReset behavior for matrix index 40.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0041 begin');
      const index: number = 40;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0041 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0042
     * @tc.name      testControllerReset0042
     * @tc.desc      Verify controllerReset behavior for matrix index 41.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0042 begin');
      const index: number = 41;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0042 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0043
     * @tc.name      testControllerReset0043
     * @tc.desc      Verify controllerReset behavior for matrix index 42.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0043 begin');
      const index: number = 42;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0043 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0044
     * @tc.name      testControllerReset0044
     * @tc.desc      Verify controllerReset behavior for matrix index 43.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0044 begin');
      const index: number = 43;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0044 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0045
     * @tc.name      testControllerReset0045
     * @tc.desc      Verify controllerReset behavior for matrix index 44.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0045 begin');
      const index: number = 44;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0045 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0046
     * @tc.name      testControllerReset0046
     * @tc.desc      Verify controllerReset behavior for matrix index 45.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0046 begin');
      const index: number = 45;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0046 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0047
     * @tc.name      testControllerReset0047
     * @tc.desc      Verify controllerReset behavior for matrix index 46.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0047 begin');
      const index: number = 46;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0047 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0048
     * @tc.name      testControllerReset0048
     * @tc.desc      Verify controllerReset behavior for matrix index 47.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0048 begin');
      const index: number = 47;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0048 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0049
     * @tc.name      testControllerReset0049
     * @tc.desc      Verify controllerReset behavior for matrix index 48.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0049 begin');
      const index: number = 48;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0049 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0050
     * @tc.name      testControllerReset0050
     * @tc.desc      Verify controllerReset behavior for matrix index 49.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0050 begin');
      const index: number = 49;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0050 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0051
     * @tc.name      testControllerReset0051
     * @tc.desc      Verify controllerReset behavior for matrix index 50.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0051 begin');
      const index: number = 50;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0051 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0052
     * @tc.name      testControllerReset0052
     * @tc.desc      Verify controllerReset behavior for matrix index 51.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0052 begin');
      const index: number = 51;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0052 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0053
     * @tc.name      testControllerReset0053
     * @tc.desc      Verify controllerReset behavior for matrix index 52.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0053 begin');
      const index: number = 52;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0053 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0054
     * @tc.name      testControllerReset0054
     * @tc.desc      Verify controllerReset behavior for matrix index 53.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0054 begin');
      const index: number = 53;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0054 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0055
     * @tc.name      testControllerReset0055
     * @tc.desc      Verify controllerReset behavior for matrix index 54.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0055 begin');
      const index: number = 54;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0055 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0056
     * @tc.name      testControllerReset0056
     * @tc.desc      Verify controllerReset behavior for matrix index 55.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0056 begin');
      const index: number = 55;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0056 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0057
     * @tc.name      testControllerReset0057
     * @tc.desc      Verify controllerReset behavior for matrix index 56.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0057 begin');
      const index: number = 56;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0057 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0058
     * @tc.name      testControllerReset0058
     * @tc.desc      Verify controllerReset behavior for matrix index 57.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0058 begin');
      const index: number = 57;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0058 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0059
     * @tc.name      testControllerReset0059
     * @tc.desc      Verify controllerReset behavior for matrix index 58.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0059 begin');
      const index: number = 58;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0059 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0060
     * @tc.name      testControllerReset0060
     * @tc.desc      Verify controllerReset behavior for matrix index 59.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0060 begin');
      const index: number = 59;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0060 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0061
     * @tc.name      testControllerReset0061
     * @tc.desc      Verify controllerReset behavior for matrix index 60.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0061 begin');
      const index: number = 60;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0061 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0062
     * @tc.name      testControllerReset0062
     * @tc.desc      Verify controllerReset behavior for matrix index 61.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0062 begin');
      const index: number = 61;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0062 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0063
     * @tc.name      testControllerReset0063
     * @tc.desc      Verify controllerReset behavior for matrix index 62.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0063 begin');
      const index: number = 62;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0063 end');
    })

    /**
     * @tc.number    SUB_PATTERN_CONTROLLER_RESET_0064
     * @tc.name      testControllerReset0064
     * @tc.desc      Verify controllerReset behavior for matrix index 63.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testControllerReset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0064 begin');
      const index: number = 63;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testControllerReset0064 end');
    })

  })
}
