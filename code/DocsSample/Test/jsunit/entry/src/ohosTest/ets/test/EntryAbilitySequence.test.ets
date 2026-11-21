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
import { ArgumentMatchers, beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import EntryAbility from '../../../main/ets/entryability/EntryAbility';
import Logger from '../../../main/ets/util/Logger';
import { paceTurn } from './TestPace';

export default function entryAbilitySequence(): void {
  describe('EntryAbilitySequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitEntrySequence0001
     * @tc.name testJsunitEntrySequence0001
     * @tc.desc Capture real main Logger arguments across context-free create, foreground, background and destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitEntrySequence0001', 0, (): void => {
      const ability: EntryAbility = new EntryAbility();
      const mocker: MockKit = new MockKit();
      const calls: string[][] = [];
      const want: Want = { bundleName: 'com.samples.test.jsunit', abilityName: 'EntryAbility' };
      const launch: AbilityConstant.LaunchParam = {
        launchReason: AbilityConstant.LaunchReason.START_ABILITY,
        lastExitReason: AbilityConstant.LastExitReason.UNKNOWN,
        lastExitMessage: ''
      };
      try {
        const mocked: Function = mocker.mockFunc(Logger, Logger.info);
        // Hypium matches argument count too: Logger.info has three actual arguments.
        when(mocked)(ArgumentMatchers.any, ArgumentMatchers.any, ArgumentMatchers.any)
          .afterAction((...args: string[]): void => {
            calls.push(args);
          });
        ability.onCreate(want, launch);
        hilog.info(0x0000, 'EntrySequence', 'create args=%{public}s', JSON.stringify(calls));
        expect(calls).assertDeepEquals([['testTag', '%{public}s', 'Ability onCreate']]);
        ability.onForeground();
        ability.onBackground();
        hilog.info(0x0000, 'EntrySequence', 'foreground/background args=%{public}s', JSON.stringify(calls.slice(1)));
        expect(calls.slice(1)).assertDeepEquals([
          ['testTag', '%{public}s', 'Ability onForeground'],
          ['testTag', '%{public}s', 'Ability onBackground']
        ]);
        ability.onDestroy();
        hilog.info(0x0000, 'EntrySequence', 'destroy args=%{public}s', JSON.stringify(calls[3]));
        expect(calls[3]).assertDeepEquals(['testTag', '%{public}s', 'Ability onDestroy']);
        hilog.info(0x0000, 'EntrySequence', 'complete lifecycle call count=%{public}d', calls.length);
        expect(calls.length).assertEqual(4);
      } finally {
        mocker.clear(Logger);
      }
    });
  });
}
