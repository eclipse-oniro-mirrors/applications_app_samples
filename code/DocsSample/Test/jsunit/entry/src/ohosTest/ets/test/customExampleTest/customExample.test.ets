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
import { beforeEach, describe, expect, it, TestType } from '@ohos/hypium';
import { UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import EntryAbility from '../../../../main/ets/entryability/EntryAbility';
import { getMainAbility, EXPECTED_BUNDLE, recoverMain, terminateMain } from '../JsUiSession';

export default function customExampleTest(): void {
  describe('customExampleTest', (): void => {
    beforeEach(async (): Promise<void> => {
      try {
        await recoverMain();
      } catch (error) {
        await terminateMain();
        throw error instanceof Error ? error as Error : new Error(String(error));
      }
    });

    /**
     * @tc.number testJsunitRunningCustom0001
     * @tc.name testJsunitRunningCustom0001
     * @tc.desc Invoke customFun on the real foreground ability and check the main identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitRunningCustom0001', TestType.FUNCTION, async (): Promise<void> => {
      try {
        const ability: UIAbility = getMainAbility();
        hilog.info(0x0000, 'RunningCustom', 'top ability=%{public}s', ability.context.abilityInfo.name);
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        const running: EntryAbility = ability as EntryAbility;
        const result: string = running.customFun();
        hilog.info(0x0000, 'RunningCustom', 'real foreground custom result=%{public}s', result);
        expect(result).assertEqual('custom');
        hilog.info(0x0000, 'RunningCustom', 'top bundle=%{public}s', ability.context.abilityInfo.bundleName);
        expect(ability.context.abilityInfo.bundleName).assertEqual(EXPECTED_BUNDLE);
      } finally {
        await terminateMain();
      }
    });
  });
}
