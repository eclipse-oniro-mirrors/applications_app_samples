/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Utils } from '../../../main/ets/bridge/TabContentTouchHotZoneBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabOverflowUtilsCore';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function tabOverflowUtilsCoreTest(): void {
  describe('TabOverflowUtilsCoreTest', () => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0301
     * @tc.name      testTabOverflowUtils0301
     * @tc.desc      Checks a new Utils instance is instanceof the Utils class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0301 begin');
      const utils: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue utils instanceof Utils=${utils instanceof Utils}`);
      expect(utils instanceof Utils).assertTrue();
      log('testTabOverflowUtils0301 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0302
     * @tc.name      testTabOverflowUtils0302
     * @tc.desc      Checks three instantiations yield distinct functional instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0302 begin');
      const first: Utils = new Utils();
      const second: Utils = new Utils();
      const third: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse second === third=${second === third}`);
      expect(second === third).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === third=${first === third}`);
      expect(first === third).assertFalse();
      log('testTabOverflowUtils0302 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0303
     * @tc.name      testTabOverflowUtils0303
     * @tc.desc      Checks showPromptAction is defined as a function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0303 begin');
      const utils: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${utils.showPromptAction !== undefined}`);
      expect(utils.showPromptAction !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof utils.showPromptAction}, expected='function'`);
      expect(typeof utils.showPromptAction).assertEqual('function');
      log('testTabOverflowUtils0303 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0304
     * @tc.name      testTabOverflowUtils0304
     * @tc.desc      Checks two Utils instances are distinct object references.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0304 begin');
      const first: Utils = new Utils();
      const second: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first instanceof Utils=${first instanceof Utils}`);
      expect(first instanceof Utils).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second instanceof Utils=${second instanceof Utils}`);
      expect(second instanceof Utils).assertTrue();
      log('testTabOverflowUtils0304 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0305
     * @tc.name      testTabOverflowUtils0305
     * @tc.desc      Checks repeated instantiation keeps showPromptAction available.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0305 begin');
      for (let i: number = 0; i < 3; i++) {
        const utils: Utils = new Utils();
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof utils.showPromptAction}`);
        expect(typeof utils.showPromptAction).assertEqual('function');
      }
      log('testTabOverflowUtils0305 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0306
     * @tc.name      testTabOverflowUtils0306
     * @tc.desc      Checks the method reference of showPromptAction is stable per instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0306 begin');
      const utils: Utils = new Utils();
      const method: Function = utils.showPromptAction;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof method=${typeof method}, expected='function'`);
      expect(typeof method).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${utils.showPromptAction === method}`);
      expect(utils.showPromptAction === method).assertTrue();
      log('testTabOverflowUtils0306 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0307
     * @tc.name      testTabOverflowUtils0307
     * @tc.desc      Checks showPromptAction stays functional across interleaved instantiations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0307 begin');
      const first: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof first.showPromptAction}, expected='function'`);
      expect(typeof first.showPromptAction).assertEqual('function');
      const second: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof second.showPromptAction}`);
      expect(typeof second.showPromptAction).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${first.showPromptAction === second.showPromptAction}`);
      expect(first.showPromptAction === second.showPromptAction).assertTrue();
      log('testTabOverflowUtils0307 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_UTILS_0308
     * @tc.name      testTabOverflowUtils0308
     * @tc.desc      Checks typeof a Utils instance stays object without type degradation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowUtils0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowUtils0308 begin');
      const utils: Utils = new Utils();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof utils=${typeof utils}, expected='object'`);
      expect(typeof utils).assertEqual('object');
      log('testTabOverflowUtils0308 end');
    })
  })
}
