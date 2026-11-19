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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ModalWant, modalWantOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for modalWantOf (2 cases). */
export default function modalWantOfTest(): void {
  describe('ModalWantOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_WANT_OF_0001
     * @tc.name      UIExtensionSamples_ModalWantOf_0001
     * @tc.desc      modalWantOf(useSession=true) returns "sys/commonUI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ModalWantOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModalWantOf_0001 begin`);
      const actual: ModalWant = modalWantOf(true);
      logInfo(`modalWantOf(useSession=true): actual.bundleName=${actual.bundleName}`);
      expect(actual.bundleName).assertEqual('com.samples.uiextension');
      logInfo(`modalWantOf(useSession=true): actual.abilityName=${actual.abilityName}`);
      expect(actual.abilityName).assertEqual('SessionUIExtensionAbility');
      logInfo(`modalWantOf(useSession=true): actual.paramBundleName=${actual.paramBundleName}`);
      expect(actual.paramBundleName).assertEqual('com.samples.uiextension');
      logInfo(`modalWantOf(useSession=true): actual.uiExtensionType=${actual.uiExtensionType}`);
      expect(actual.uiExtensionType).assertEqual('sys/commonUI');
      logInfo(`${BUNDLE}ModalWantOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_WANT_OF_0002
     * @tc.name      UIExtensionSamples_ModalWantOf_0002
     * @tc.desc      modalWantOf(useSession=false) returns "sys/commonUI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ModalWantOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ModalWantOf_0002 begin`);
      const actual: ModalWant = modalWantOf(false);
      logInfo(`modalWantOf(useSession=false): actual.bundleName=${actual.bundleName}`);
      expect(actual.bundleName).assertEqual('com.samples.uiextension');
      logInfo(`modalWantOf(useSession=false): actual.abilityName=${actual.abilityName}`);
      expect(actual.abilityName).assertEqual('ContextUIExtensionAbility');
      logInfo(`modalWantOf(useSession=false): actual.paramBundleName=${actual.paramBundleName}`);
      expect(actual.paramBundleName).assertEqual('com.samples.uiextension');
      logInfo(`modalWantOf(useSession=false): actual.uiExtensionType=${actual.uiExtensionType}`);
      expect(actual.uiExtensionType).assertEqual('sys/commonUI');
      logInfo(`${BUNDLE}ModalWantOf_0002 end`);
    });
  });
}
