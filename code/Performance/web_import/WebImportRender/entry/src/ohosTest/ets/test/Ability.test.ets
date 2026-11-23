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
import { getNWeb, MyNodeController } from '../../../main/ets/pages/common';
import { logCase } from './shared/TestLog';
import { paceTurn } from './shared/TestPace';

export default function ability(): void {
  describe('Ability', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_ABILITY_0001
     * @tc.name testAbility0001
     * @tc.desc Fresh test process returns no controller for unregistered URL keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const queries: string[] = [
          '',
          'about://blank',
          'about:blank',
          'https://www.example.com',
          'https://www.example.com/',
          'https://www.example.com#section',
          'https://www.example.com?value=1',
          'HTTPS://www.example.com',
          'pages/Index',
          'pageOne',
          ' pageOne ',
          'PAGEONE',
        ];
        const first: boolean[] = queries.map((url: string): boolean => getNWeb(url) === undefined);
        logCase('testAbility0001', 'missing keys before initialization=' + JSON.stringify(first));
        expect(JSON.stringify(first)).assertEqual('[true,true,true,true,true,true,true,true,true,true,true,true]');
        const blank: MyNodeController | undefined = getNWeb('about://blank');
        logCase('testAbility0001', 'no blank node registered by lookup=' + JSON.stringify(blank));
        expect(blank).assertUndefined();
        const repeated: boolean[] = queries.map((url: string): boolean => getNWeb(url) === undefined);
        logCase('testAbility0001', 'no nodes registered by repeated lookups=' + JSON.stringify(repeated));
        expect(JSON.stringify(repeated)).assertEqual('[true,true,true,true,true,true,true,true,true,true,true,true]');
      });

  });
}
