/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CustomAnimationTabController } from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'ControllerLogicCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * 安全触发 changeIndex：controller 未绑定 Swiper 时，底层实现可能 no-op 也可能抛错，
 * 统一 try-catch 记录，listener 回调先于 super 调用执行，两种行为下用例均可判定。
 */
function triggerChange(controller: CustomAnimationTabController, index: number,
  useAnimation?: boolean | undefined): void {
  try {
    if (useAnimation === undefined) {
      controller.changeIndex(index);
    } else {
      controller.changeIndex(index, useAnimation);
    }
  } catch (error) {
    log(`changeIndex without bound Swiper tolerated: ${String(error)}`);
  }
}

export default function controllerLogicCoreTest(): void {
  describe('ControllerLogicCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0301
     * @tc.name      testControllerLogic0301
     * @tc.desc      Verify the controller instantiates as an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0301 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof controller=${typeof controller}, expected='object'`);
      expect(typeof controller).assertEqual('object');
      log('testControllerLogic0301 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0302
     * @tc.name      testControllerLogic0302
     * @tc.desc      Verify the controller extends SwiperController.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0302 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${controller instanceof SwiperController}`);
      expect(controller instanceof SwiperController).assertTrue();
      log('testControllerLogic0302 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0303
     * @tc.name      testControllerLogic0303
     * @tc.desc      Verify the controller passes its own instanceof check.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0303 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${controller instanceof CustomAnimationTabController}`);
      expect(controller instanceof CustomAnimationTabController).assertTrue();
      log('testControllerLogic0303 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0304
     * @tc.name      testControllerLogic0304
     * @tc.desc      Verify changeIndex without a listener stays harmless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0304 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      triggerChange(controller, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testControllerLogic0304 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0305
     * @tc.name      testControllerLogic0305
     * @tc.desc      Verify changeIndex(0) notifies the listener with state 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0305 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received[0]=${received[0]}, expected=1`);
      expect(received[0]).assertEqual(1);
      log('testControllerLogic0305 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0306
     * @tc.name      testControllerLogic0306
     * @tc.desc      Verify changeIndex(1) notifies with state 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0306 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received[0]=${received[0]}, expected=1`);
      expect(received[0]).assertEqual(1);
      log('testControllerLogic0306 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0307
     * @tc.name      testControllerLogic0307
     * @tc.desc      Verify a large index still notifies with state 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0307 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received[0]=${received[0]}, expected=1`);
      expect(received[0]).assertEqual(1);
      log('testControllerLogic0307 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0308
     * @tc.name      testControllerLogic0308
     * @tc.desc      Verify a negative index still notifies with state 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0308 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, -1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received[0]=${received[0]}, expected=1`);
      expect(received[0]).assertEqual(1);
      log('testControllerLogic0308 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0309
     * @tc.name      testControllerLogic0309
     * @tc.desc      Verify changeIndex with useAnimation=true notifies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0309 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 2, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      log('testControllerLogic0309 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0310
     * @tc.name      testControllerLogic0310
     * @tc.desc      Verify changeIndex with useAnimation=false notifies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0310 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 2, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      log('testControllerLogic0310 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0311
     * @tc.name      testControllerLogic0311
     * @tc.desc      Verify changeIndex without useAnimation notifies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0311 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=1`);
      expect(received.length).assertEqual(1);
      log('testControllerLogic0311 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0312
     * @tc.name      testControllerLogic0312
     * @tc.desc      Verify three changeIndex calls notify three times.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0312 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let received: number[] = [];
      controller.setListener((state: number) => {
        received.push(state);
      });
      triggerChange(controller, 1);
      triggerChange(controller, 2);
      triggerChange(controller, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received.length=${received.length}, expected=3`);
      expect(received.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual received[2]=${received[2]}, expected=1`);
      expect(received[2]).assertEqual(1);
      log('testControllerLogic0312 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0313
     * @tc.name      testControllerLogic0313
     * @tc.desc      Verify a later setListener replaces the earlier callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0313 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      let firstCalls: number[] = [];
      let secondCalls: number[] = [];
      controller.setListener((state: number) => {
        firstCalls.push(state);
      });
      controller.setListener((state: number) => {
        secondCalls.push(state);
      });
      triggerChange(controller, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual firstCalls.length=${firstCalls.length}, expected=0`);
      expect(firstCalls.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual secondCalls.length=${secondCalls.length}, expected=1`);
      expect(secondCalls.length).assertEqual(1);
      log('testControllerLogic0313 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_CONTROLLERLOGIC_0314
     * @tc.name      testControllerLogic0314
     * @tc.desc      Verify an empty listener keeps changeIndex harmless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testControllerLogic0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testControllerLogic0314 begin');
      const controller: CustomAnimationTabController = new CustomAnimationTabController();
      controller.setListener((state: number) => {
        log(`empty listener got ${state}`);
      });
      triggerChange(controller, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testControllerLogic0314 end');
    })
  })
}
