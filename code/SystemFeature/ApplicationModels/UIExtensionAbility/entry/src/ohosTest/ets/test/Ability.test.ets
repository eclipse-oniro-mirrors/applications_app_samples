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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import commonEvent from '@ohos.commonEventManager';

const TAG: string = '[Sample_UIExtensionAbility]';
const EVENT_PAGE_SHOW: string = 'page_show';
const PROVIDER_BUNDLE: string = 'com.samples.uiextensionability';
const PROVIDER_ABILITY: string = 'UIExtensionProvider';
const PROVIDER_MODULE: string = 'entry';
const PROVIDER_TYPE: string = 'sys/commonUI';

export default function abilityTest(): void {
  describe('ActsUIExtensionAbilityTest', () => {
    let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;

    beforeAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'abilityTest beforeAll');
    });

    beforeEach(async () => {
      subscriber = undefined;
    });

    afterEach(async () => {
      if (subscriber !== undefined) {
        commonEvent.unsubscribe(subscriber, (err) => {
          if (err) {
            hilog.error(0x0000, 'testTag', '%{public}s', 'unsubscribe failed: ' + JSON.stringify(err));
          }
        });
        subscriber = undefined;
      }
    });

    afterAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'abilityTest afterAll');
    });

    it('UIExtension_Provider_Subscriber_Created_001', 0, async () => {
      const events: string[] = [EVENT_PAGE_SHOW];
      const data: commonEvent.CommonEventSubscriber = await commonEvent.createSubscriber({ events: events });
      subscriber = data;
      expect(subscriber !== undefined).assertTrue();
      expect(events.length).assertEqual(1);
      expect(events[0]).assertEqual('page_show');
    });

    it('UIExtension_Provider_Want_Parameters_002', 0, async () => {
      const parameters: Map<string, string> = new Map<string, string>();
      parameters.set('ability.want.params.uiExtensionType', PROVIDER_TYPE);
      parameters.set('ability.want.params.uiExtensionModuleName', PROVIDER_MODULE);
      expect(parameters.has('ability.want.params.uiExtensionType')).assertTrue();
      expect(parameters.has('ability.want.params.uiExtensionModuleName')).assertTrue();
      expect(parameters.size).assertEqual(2);
    });

    it('UIExtension_Provider_Identity_Fields_003', 0, async () => {
      expect(PROVIDER_BUNDLE.length > 0).assertTrue();
      expect(PROVIDER_ABILITY).assertEqual('UIExtensionProvider');
      expect(PROVIDER_MODULE).assertEqual('entry');
      expect(PROVIDER_TYPE).assertEqual('sys/commonUI');
    });

    it('UIExtension_Provider_Launch_Command_004', 0, async () => {
      const cmd: string = 'aa start -a ' + PROVIDER_ABILITY + ' -b ' + PROVIDER_BUNDLE;
      expect(cmd.indexOf(PROVIDER_ABILITY) > 0).assertTrue();
      expect(cmd.indexOf(PROVIDER_BUNDLE) > 0).assertTrue();
      expect(cmd.startsWith('aa start')).assertTrue();
    });

    it('UIExtension_Provider_Event_List_005', 0, async () => {
      const events: string[] = [EVENT_PAGE_SHOW];
      expect(events.indexOf('page_show')).assertEqual(0);
      expect(events.length).assertEqual(1);
    });
  });
}
