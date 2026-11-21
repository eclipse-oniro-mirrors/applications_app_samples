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
import { getSortedIndexes } from './shared/NavIndexProbe';
import { logCase } from './shared/TestLog';
import { paceTurn } from './shared/TestPace';

export default function navRemoveNameMatrix(): void {
  describe('NavRemoveNameMatrix', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREMOVENAMEMATRIX_0001
     * @tc.name testNavRemoveNameMatrix0001
     * @tc.desc SDK dependency: NavPathStack; empty removal then interior deletion and reentry promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavRemoveNameMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const result1: number = stack.removeByName('pageOne');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName returned count/index=' + JSON.stringify(result1));
        expect(result1).assertEqual(0);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 1 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 1 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:initial:1';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageTwo:initial:2';
        const path3: NavPathInfo = new NavPathInfo('pageTwo', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageThree:initial:3';
        const path4: NavPathInfo = new NavPathInfo('pageThree', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result5: number = stack.removeByName('pageTwo');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName returned count/index=' + JSON.stringify(result5));
        expect(result5).assertEqual(1);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 5 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 5 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:restored:4';
        const path6: NavPathInfo = new NavPathInfo('pageTwo', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result7: number = stack.moveToTop('pageTwo', false);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(2);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 7 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 7 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageFour:initial:5';
        const path8: NavPathInfo = new NavPathInfo('pageFour', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo","pageFour"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 8 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:initial:5"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const result9: number = stack.removeByName('pageOne');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName returned count/index=' + JSON.stringify(result9));
        expect(result9).assertEqual(1);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo","pageFour"]');
        logCase('testNavRemoveNameMatrix0001', 'stack step 9 removeByName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0001',
          'stack step 9 removeByName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREMOVENAMEMATRIX_0002
     * @tc.name testNavRemoveNameMatrix0002
     * @tc.desc SDK dependency: NavPathStack; bottom deletion, restoration and named rollback before top deletion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavRemoveNameMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.removeByName('pageOne');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 4 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 4 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageOne:restored:4';
        const path5: NavPathInfo = new NavPathInfo('pageOne', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:4"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:4"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = stack.popToName('pageTwo', false);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(0);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 6 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 6 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:initial:5';
        const path7: NavPathInfo = new NavPathInfo('pageFour', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour"]');
        logCase('testNavRemoveNameMatrix0002', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavRemoveNameMatrix0002',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavRemoveNameMatrix0002',
