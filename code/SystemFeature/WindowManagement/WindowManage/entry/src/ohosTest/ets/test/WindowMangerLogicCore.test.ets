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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { WindowManger } from '../../../main/ets/utils/WindowManageBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'WindowMangerLogicCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function runSafely(action: () => void): boolean {
  let thrown: boolean = false;
  try {
    action();
  } catch (err) {
    thrown = true;
  }
  return thrown;
}

export default function windowMangerLogicCoreTest(): void {
  describe('WindowMangerLogicCoreTest', () => {
    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0401
     * @tc.name      testWindowMangerLogicCore0401
     * @tc.desc      Check the exported WindowManger singleton is an object instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof WindowManger=${typeof WindowManger}`);
      expect(typeof WindowManger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${WindowManger !== undefined && WindowManger !== null}`);
      expect(WindowManger !== undefined && WindowManger !== null).assertTrue();
      log('testWindowMangerLogicCore0401 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0402
     * @tc.name      testWindowMangerLogicCore0402
     * @tc.desc      Verify updateDisplay reads display metrics without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0402 begin');
      const thrown: boolean = runSafely(() => {
        WindowManger.updateDisplay();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testWindowMangerLogicCore0402 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0403
     * @tc.name      testWindowMangerLogicCore0403
     * @tc.desc      Verify repeated updateDisplay calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0403 begin');
      const thrown: boolean = runSafely(() => {
        WindowManger.updateDisplay();
        WindowManger.updateDisplay();
        WindowManger.updateDisplay();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testWindowMangerLogicCore0403 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0404
     * @tc.name      testWindowMangerLogicCore0404
     * @tc.desc      Verify destorySubWindowCallback resets drag state without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0404 begin');
      const thrown: boolean = runSafely(() => {
        WindowManger.destorySubWindowCallback();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testWindowMangerLogicCore0404 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0405
     * @tc.name      testWindowMangerLogicCore0405
     * @tc.desc      Verify repeated destorySubWindowCallback calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0405 begin');
      const thrown: boolean = runSafely(() => {
        WindowManger.destorySubWindowCallback();
        WindowManger.destorySubWindowCallback();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testWindowMangerLogicCore0405 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0406
     * @tc.name      testWindowMangerLogicCore0406
     * @tc.desc      Verify updateDisplay followed by destorySubWindowCallback stays stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0406 begin');
      const thrown: boolean = runSafely(() => {
        WindowManger.updateDisplay();
        WindowManger.destorySubWindowCallback();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse thrown=${thrown}`);
      expect(thrown).assertFalse();
      log('testWindowMangerLogicCore0406 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0407
     * @tc.name      testWindowMangerLogicCore0407
     * @tc.desc      Check initMainWindow is exposed as a method.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0407 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowManger.initMainWindow}`);
      expect(typeof WindowManger.initMainWindow).assertEqual('function');
      log('testWindowMangerLogicCore0407 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0408
     * @tc.name      testWindowMangerLogicCore0408
     * @tc.desc      Check initSubWindow is exposed as a method.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0408 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowManger.initSubWindow}`);
      expect(typeof WindowManger.initSubWindow).assertEqual('function');
      log('testWindowMangerLogicCore0408 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0409
     * @tc.name      testWindowMangerLogicCore0409
     * @tc.desc      Check setSubWindowAttribute is exposed as a method.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0409 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowManger.setSubWindowAttribute}`);
      expect(typeof WindowManger.setSubWindowAttribute).assertEqual('function');
      log('testWindowMangerLogicCore0409 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWMANGER_0410
     * @tc.name      testWindowMangerLogicCore0410
     * @tc.desc      Check changeWindowDirection is exposed as a method.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowMangerLogicCore0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowMangerLogicCore0410 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowManger.changeWindowDirection}`);
      expect(typeof WindowManger.changeWindowDirection).assertEqual('function');
      log('testWindowMangerLogicCore0410 end');
    })
  })
}
