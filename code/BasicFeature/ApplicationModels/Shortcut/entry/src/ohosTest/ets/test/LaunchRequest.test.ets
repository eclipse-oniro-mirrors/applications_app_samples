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

import { Want } from '@kit.AbilityKit';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { PageKey } from '../../../main/ets/model/ShortcutScenes';
import { LaunchRequest, parseLaunchRequest } from '../../../main/ets/navigation/LaunchRequest';
import { runCase } from '../support/CaseScope';

function wantFor(action: string, filter: string, version: string = '1'): Want {
  return { parameters: { 'sc.version': version, 'sc.action': action, 'sc.filter': filter } };
}

export default function launchRequestTests(): void {
  describe('LaunchRequest', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHREQUEST_0100
     * @tc.name      testLaunchRequest0001
     * @tc.desc      Verify launch parameters select pages and reject invalid values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchRequest', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('LaunchRequest', '0001'), async (): Promise<void> => {
        const actions: string[] = ['note.new', 'todo.list', 'collection.list'];
        const filters: string[] = ['', 'todayOpen', 'saved'];
        const pages: PageKey[] = [PageKey.NOTE, PageKey.TODO, PageKey.COLLECTION];
        for (const cold of [true, false]) {
          for (let index = 0; index < actions.length; index++) {
            const request: LaunchRequest = parseLaunchRequest(wantFor(actions[index], filters[index]), cold);
            expect(request.page, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0001').assertEqual(pages[index]);
            expect(request.source, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0002').assertEqual(cold ? '冷启动' : '热启动');
            expect(request.error, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0003').assertEqual('');
          }
        }
        const home: Want = {};
        expect(parseLaunchRequest(home, true).page, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0004').assertEqual(PageKey.HOME);
        expect(parseLaunchRequest(home, false).error, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0005').assertEqual('');
        const note: Want = { parameters: { 'sc.version': '1', 'sc.action': 'note.new' } };
        expect(parseLaunchRequest(note, true).page, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0006').assertEqual(PageKey.NOTE);
        const invalid: Want[] = [
          wantFor('note.new', '', '2'),
          wantFor('note.new', '', ''),
          wantFor('unknown', ''),
          wantFor('todo.list', 'saved'),
          wantFor('collection.list', 'todayOpen'),
          wantFor('note.new', 'todayOpen'),
          { parameters: { 'sc.version': 1, 'sc.action': 'note.new' } }
        ];
        for (const want of invalid) {
          const request: LaunchRequest = parseLaunchRequest(want, true);
          expect(request.error.length > 0, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0007').assertTrue();
          expect(request.page, caseName('LaunchRequest', '0001'), 'LaunchRequest.test.ets:A0008').assertEqual(PageKey.HOME);
        }
      });
    });
  });
}
