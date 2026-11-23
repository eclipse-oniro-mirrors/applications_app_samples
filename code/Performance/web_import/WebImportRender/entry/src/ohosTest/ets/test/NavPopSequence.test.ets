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

export default function navPopSequence(): void {
  describe('NavPopSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0001
     * @tc.name testNavPopSequence0001
     * @tc.desc SDK dependency: NavPathStack; empty pop and two independent drain/rebuild cycles
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const popped1: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0001',
          'stack step 1 pop returned undefined=' + JSON.stringify(popped1 === undefined));
        expect(popped1 === undefined).assertEqual(true);
        logCase('testNavPopSequence0001', 'stack step 1 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0001', 'stack step 1 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0001',
          'stack step 1 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 1 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 1 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:initial:1';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0001', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped3: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0001',
          'stack step 3 pop returned undefined=' + JSON.stringify(popped3 === undefined));
        expect(popped3 === undefined).assertEqual(false);
        if (popped3 !== undefined) {
          logCase('testNavPopSequence0001', 'stack step 3 pop returned name=' + JSON.stringify(popped3.name));
          expect(popped3.name).assertEqual('pageOne');
          logCase('testNavPopSequence0001', 'stack step 3 pop returned parameter=' + JSON.stringify(popped3.param));
          expect(JSON.stringify(popped3.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavPopSequence0001', 'stack step 3 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0001', 'stack step 3 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0001',
          'stack step 3 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 3 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 3 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 3 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 3 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:initial:2';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0001', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter5: string = 'pageThree:initial:3';
        const path5: NavPathInfo = new NavPathInfo('pageThree', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavPopSequence0001', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped6: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0001',
          'stack step 6 pop returned undefined=' + JSON.stringify(popped6 === undefined));
        expect(popped6 === undefined).assertEqual(false);
        if (popped6 !== undefined) {
          logCase('testNavPopSequence0001', 'stack step 6 pop returned name=' + JSON.stringify(popped6.name));
          expect(popped6.name).assertEqual('pageThree');
          logCase('testNavPopSequence0001', 'stack step 6 pop returned parameter=' + JSON.stringify(popped6.param));
          expect(JSON.stringify(popped6.param)).assertEqual('"pageThree:initial:3"');
        }
        logCase('testNavPopSequence0001', 'stack step 6 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0001', 'stack step 6 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0001',
          'stack step 6 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 6 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter7: string = 'pageOne:restored:4';
        const path7: NavPathInfo = new NavPathInfo('pageOne', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavPopSequence0001', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:restored:4"');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:4"]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0001',
          'stack step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavPopSequence0001', 'stack step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageOne');
          logCase('testNavPopSequence0001', 'stack step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageOne:restored:4"');
        }
        logCase('testNavPopSequence0001', 'stack step 8 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0001', 'stack step 8 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0001',
          'stack step 8 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 8 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0001',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavPopSequence0001', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0001', 'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPopSequence0001', 'stack step 9 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0001', 'stack step 9 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0001',
          'stack step 9 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 9 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter10: string = 'pageFour:initial:5';
        const path10: NavPathInfo = new NavPathInfo('pageFour', parameter10);
        stack.pushPath(path10, false);
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageFour"]');
        logCase('testNavPopSequence0001', 'stack step 10 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[0]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0001',
          'stack step 10 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0002
     * @tc.name testNavPopSequence0002
     * @tc.desc SDK dependency: NavPathStack; successive pops with restoration and promoted-bottom return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0002', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0002', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0002', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped4: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0002',
          'stack step 4 pop returned undefined=' + JSON.stringify(popped4 === undefined));
        expect(popped4 === undefined).assertEqual(false);
        if (popped4 !== undefined) {
          logCase('testNavPopSequence0002', 'stack step 4 pop returned name=' + JSON.stringify(popped4.name));
          expect(popped4.name).assertEqual('pageThree');
          logCase('testNavPopSequence0002', 'stack step 4 pop returned parameter=' + JSON.stringify(popped4.param));
          expect(JSON.stringify(popped4.param)).assertEqual('"pageThree:initial:3"');
        }
        logCase('testNavPopSequence0002', 'stack step 4 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0002', 'stack step 4 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0002',
          'stack step 4 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 4 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0002',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0002', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0002', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPopSequence0002', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0002', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0002',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter6: string = 'pageThree:by-name:4';
        stack.pushPathByName('pageThree', parameter6, false);
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPopSequence0002', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:initial:5';
        const path7: NavPathInfo = new NavPathInfo('pageFour', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageFour"]');
        logCase('testNavPopSequence0002', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0002',
          'stack step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavPopSequence0002', 'stack step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageFour');
          logCase('testNavPopSequence0002', 'stack step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageFour:initial:5"');
        }
        logCase('testNavPopSequence0002', 'stack step 8 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPopSequence0002', 'stack step 8 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 8 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageOne"]');
        logCase('testNavPopSequence0002', 'stack step 9 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 9 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped10: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0002',
          'stack step 10 pop returned undefined=' + JSON.stringify(popped10 === undefined));
        expect(popped10 === undefined).assertEqual(false);
        if (popped10 !== undefined) {
          logCase('testNavPopSequence0002', 'stack step 10 pop returned name=' + JSON.stringify(popped10.name));
          expect(popped10.name).assertEqual('pageOne');
          logCase('testNavPopSequence0002', 'stack step 10 pop returned parameter=' + JSON.stringify(popped10.param));
          expect(JSON.stringify(popped10.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavPopSequence0002', 'stack step 10 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree"]');
        logCase('testNavPopSequence0002', 'stack step 10 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0002',
          'stack step 10 pop final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0002',
          'stack step 10 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0003
     * @tc.name testNavPopSequence0003
     * @tc.desc SDK dependency: NavPathStack; pop a promoted bottom page then rollback and restore
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:by-name:1';
        stack.pushPathByName('pageOne', parameter1, false);
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0003', 'stack step 1 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 1 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0003', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0003', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavPopSequence0003', 'stack step 4 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 4 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0003',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0003', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageOne');
          logCase('testNavPopSequence0003', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageOne:by-name:1"');
        }
        logCase('testNavPopSequence0003', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavPopSequence0003', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0003',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:restored:4';
        const path6: NavPathInfo = new NavPathInfo('pageOne', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavPopSequence0003', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:4"');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:4"]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result7: number = stack.popToName('pageTwo', false);
        logCase('testNavPopSequence0003', 'stack step 7 popToName returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(0);
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0003', 'stack step 7 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 7 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0003',
          'stack step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavPopSequence0003', 'stack step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0003', 'stack step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPopSequence0003', 'stack step 8 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0003', 'stack step 8 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0003',
          'stack step 8 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 8 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter9: string = 'pageThree:by-name:5';
        stack.pushPathByName('pageThree', parameter9, false);
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree"]');
        logCase('testNavPopSequence0003', 'stack step 9 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:by-name:5"');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:5"]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 9 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped10: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0003',
          'stack step 10 pop returned undefined=' + JSON.stringify(popped10 === undefined));
        expect(popped10 === undefined).assertEqual(false);
        if (popped10 !== undefined) {
          logCase('testNavPopSequence0003', 'stack step 10 pop returned name=' + JSON.stringify(popped10.name));
          expect(popped10.name).assertEqual('pageThree');
          logCase('testNavPopSequence0003', 'stack step 10 pop returned parameter=' + JSON.stringify(popped10.param));
          expect(JSON.stringify(popped10.param)).assertEqual('"pageThree:by-name:5"');
        }
        logCase('testNavPopSequence0003', 'stack step 10 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0003', 'stack step 10 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0003',
          'stack step 10 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0003',
          'stack step 10 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0004
     * @tc.name testNavPopSequence0004
     * @tc.desc SDK dependency: NavPathStack; pop replacement then delete surviving middle before another pop
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0004', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0004', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:second:3';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavPopSequence0004', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:second:3"');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1","pageOne:second:3"]');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter4: string = 'pageThree:replacement:4';
        const path4: NavPathInfo = new NavPathInfo('pageThree', parameter4);
        stack.replacePath(path4, false);
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0004', 'stack step 4 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:replacement:4"');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:4"]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 4 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0004',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0004', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageThree');
          logCase('testNavPopSequence0004', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageThree:replacement:4"');
        }
        logCase('testNavPopSequence0004', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0004', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0004',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:restored:5';
        const path6: NavPathInfo = new NavPathInfo('pageOne', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavPopSequence0004', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:5"');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:restored:5"]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result7: number = stack.removeByName('pageTwo');
        logCase('testNavPopSequence0004', 'stack step 7 removeByName returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(1);
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavPopSequence0004', 'stack step 7 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:restored:5"');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:restored:5"]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 7 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0004',
          'stack step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavPopSequence0004', 'stack step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageOne');
          logCase('testNavPopSequence0004', 'stack step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageOne:restored:5"');
        }
        logCase('testNavPopSequence0004', 'stack step 8 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0004', 'stack step 8 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0004',
          'stack step 8 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 8 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter9: string = 'pageFour:initial:6';
        const path9: NavPathInfo = new NavPathInfo('pageFour', parameter9);
        stack.pushPath(path9, false);
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFour"]');
        logCase('testNavPopSequence0004', 'stack step 9 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:6"');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:6"]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0004',
          'stack step 9 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0005
     * @tc.name testNavPopSequence0005
     * @tc.desc SDK dependency: NavPathStack; pop after middle deletion and again after indexed rollback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0005', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0005', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0005', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.removeByIndexes([1]);
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPopSequence0005', 'stack step 4 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 4 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0005',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0005', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageThree');
          logCase('testNavPopSequence0005', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageThree:initial:3"');
        }
        logCase('testNavPopSequence0005', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0005', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0005',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:restored:4';
        const path6: NavPathInfo = new NavPathInfo('pageTwo', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0005', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:initial:5';
        const path7: NavPathInfo = new NavPathInfo('pageFour', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFour"]');
        logCase('testNavPopSequence0005', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.popToIndex(0, false);
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0005', 'stack step 8 popToIndex state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 8 popToIndex state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0005',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavPopSequence0005', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageOne');
          logCase('testNavPopSequence0005', 'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavPopSequence0005', 'stack step 9 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0005', 'stack step 9 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0005',
          'stack step 9 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 9 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter10: string = 'pageFive:initial:6';
        const path10: NavPathInfo = new NavPathInfo('pageFive', parameter10);
        stack.pushPath(path10, false);
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageFive"]');
        logCase('testNavPopSequence0005', 'stack step 10 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageFive:initial:6"');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:initial:6"]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[0]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0005',
          'stack step 10 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0006
     * @tc.name testNavPopSequence0006
     * @tc.desc SDK dependency: NavPathStack; successive promoted duplicate pops preserve oldest payload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:first:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:first:1"');
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:first:1"]');
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0006', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:first:1"');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:first:1"]');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:second:3';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:first:1"');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:second:3"');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:first:1","pageOne:second:3"]');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.moveToTop('pageOne', false);
        logCase('testNavPopSequence0006', 'stack step 4 moveToTop returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(0);
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne","pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 4 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:second:3"');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:first:1"');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:second:3","pageOne:first:1"]');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1,2]');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 4 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0006',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0006', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageOne');
          logCase('testNavPopSequence0006', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageOne:first:1"');
        }
        logCase('testNavPopSequence0006', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0006',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:second:3"');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:second:3"]');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped6: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0006',
          'stack step 6 pop returned undefined=' + JSON.stringify(popped6 === undefined));
        expect(popped6 === undefined).assertEqual(false);
        if (popped6 !== undefined) {
          logCase('testNavPopSequence0006', 'stack step 6 pop returned name=' + JSON.stringify(popped6.name));
          expect(popped6.name).assertEqual('pageOne');
          logCase('testNavPopSequence0006', 'stack step 6 pop returned parameter=' + JSON.stringify(popped6.param));
          expect(JSON.stringify(popped6.param)).assertEqual('"pageOne:second:3"');
        }
        logCase('testNavPopSequence0006', 'stack step 6 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0006', 'stack step 6 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0006',
          'stack step 6 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 6 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter7: string = 'pageOne:third:4';
        const path7: NavPathInfo = new NavPathInfo('pageOne', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:third:4"');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:third:4"]');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageThree:initial:5';
        const path8: NavPathInfo = new NavPathInfo('pageThree', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne","pageThree"]');
        logCase('testNavPopSequence0006', 'stack step 8 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:third:4"');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:5"');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:third:4"]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:5"]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0006',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavPopSequence0006', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageThree');
          logCase('testNavPopSequence0006', 'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageThree:initial:5"');
        }
        logCase('testNavPopSequence0006', 'stack step 9 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 9 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0006',
          'stack step 9 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:third:4"');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:third:4"]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 9 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const result10: number = stack.popToName('pageOne', false);
        logCase('testNavPopSequence0006', 'stack step 10 popToName returned count/index=' + JSON.stringify(result10));
        expect(result10).assertEqual(1);
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavPopSequence0006', 'stack step 10 popToName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:third:4"');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:third:4"]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0006',
          'stack step 10 popToName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0007
     * @tc.name testNavPopSequence0007
     * @tc.desc SDK dependency: NavPathStack; named rollback then full drain including empty pop
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0007', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:by-name:2';
        stack.pushPathByName('pageTwo', parameter2, false);
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0007', 'stack step 2 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 2 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0007', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.popToName('pageOne', false);
        logCase('testNavPopSequence0007', 'stack step 4 popToName returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(0);
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0007', 'stack step 4 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 4 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0007',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0007', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageOne');
          logCase('testNavPopSequence0007', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavPopSequence0007', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0007', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0007',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:restored:4';
        stack.pushPathByName('pageTwo', parameter6, false);
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0007', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter7: string = 'pageThree:restored:5';
        const path7: NavPathInfo = new NavPathInfo('pageThree', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavPopSequence0007', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:restored:5"');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0007',
          'stack step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavPopSequence0007', 'stack step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageThree');
          logCase('testNavPopSequence0007', 'stack step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageThree:restored:5"');
        }
        logCase('testNavPopSequence0007', 'stack step 8 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0007', 'stack step 8 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0007',
          'stack step 8 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 8 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0007',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavPopSequence0007', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0007', 'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageTwo:restored:4"');
        }
        logCase('testNavPopSequence0007', 'stack step 9 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0007', 'stack step 9 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0007',
          'stack step 9 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 9 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const popped10: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0007',
          'stack step 10 pop returned undefined=' + JSON.stringify(popped10 === undefined));
        expect(popped10 === undefined).assertEqual(true);
        logCase('testNavPopSequence0007', 'stack step 10 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0007', 'stack step 10 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0007',
          'stack step 10 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0007',
          'stack step 10 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0008
     * @tc.name testNavPopSequence0008
     * @tc.desc SDK dependency: NavPathStack; indexed rollback pop and fresh tail restoration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0008', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0008', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0008', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.popToIndex(1, false);
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0008', 'stack step 4 popToIndex state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 4 popToIndex state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0008',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0008', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0008', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPopSequence0008', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0008', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0008',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:restored:4';
        const path6: NavPathInfo = new NavPathInfo('pageTwo', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0008', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped7: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0008',
          'stack step 7 pop returned undefined=' + JSON.stringify(popped7 === undefined));
        expect(popped7 === undefined).assertEqual(false);
        if (popped7 !== undefined) {
          logCase('testNavPopSequence0008', 'stack step 7 pop returned name=' + JSON.stringify(popped7.name));
          expect(popped7.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0008', 'stack step 7 pop returned parameter=' + JSON.stringify(popped7.param));
          expect(JSON.stringify(popped7.param)).assertEqual('"pageTwo:restored:4"');
        }
        logCase('testNavPopSequence0008', 'stack step 7 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0008', 'stack step 7 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0008',
          'stack step 7 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 7 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter8: string = 'pageThree:restored:5';
        const path8: NavPathInfo = new NavPathInfo('pageThree', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPopSequence0008', 'stack step 8 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:restored:5"');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter9: string = 'pageFour:initial:6';
        const path9: NavPathInfo = new NavPathInfo('pageFour', parameter9);
        stack.pushPath(path9, false);
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageFour"]');
        logCase('testNavPopSequence0008', 'stack step 9 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:restored:5"');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:6"');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:6"]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 9 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped10: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0008',
          'stack step 10 pop returned undefined=' + JSON.stringify(popped10 === undefined));
        expect(popped10 === undefined).assertEqual(false);
        if (popped10 !== undefined) {
          logCase('testNavPopSequence0008', 'stack step 10 pop returned name=' + JSON.stringify(popped10.name));
          expect(popped10.name).assertEqual('pageFour');
          logCase('testNavPopSequence0008', 'stack step 10 pop returned parameter=' + JSON.stringify(popped10.param));
          expect(JSON.stringify(popped10.param)).assertEqual('"pageFour:initial:6"');
        }
        logCase('testNavPopSequence0008', 'stack step 10 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPopSequence0008', 'stack step 10 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:restored:5"');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0008',
          'stack step 10 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0009
     * @tc.name testNavPopSequence0009
     * @tc.desc SDK dependency: NavPathStack; endpoint removal drain and top-name promotion before pop
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0009', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0009', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:by-name:3';
        stack.pushPathByName('pageThree', parameter3, false);
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0009', 'stack step 3 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 3 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.removeByIndexes([0,2]);
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(2);
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopSequence0009', 'stack step 4 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 4 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0009',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0009', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0009', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPopSequence0009', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopSequence0009', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopSequence0009',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:by-name:4';
        stack.pushPathByName('pageOne', parameter6, false);
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0009', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:4"');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:4"]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter7: string = 'pageTwo:restored:5';
        const path7: NavPathInfo = new NavPathInfo('pageTwo', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0009', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:4"');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:5"');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:4"]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:5"]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const result8: number = stack.moveToTop('pageTwo', false);
        logCase('testNavPopSequence0009', 'stack step 8 moveToTop returned count/index=' + JSON.stringify(result8));
        expect(result8).assertEqual(1);
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0009', 'stack step 8 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:4"');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:5"');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:4"]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:5"]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 8 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0009',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavPopSequence0009', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0009', 'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageTwo:restored:5"');
        }
        logCase('testNavPopSequence0009', 'stack step 9 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0009', 'stack step 9 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0009',
          'stack step 9 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:4"');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:4"]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 9 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter10: string = 'pageFive:initial:6';
        const path10: NavPathInfo = new NavPathInfo('pageFive', parameter10);
        stack.pushPath(path10, false);
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFive"]');
        logCase('testNavPopSequence0009', 'stack step 10 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:4"');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFive:initial:6"');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:4"]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:initial:6"]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[1]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0009',
          'stack step 10 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPSEQUENCE_0010
     * @tc.name testNavPopSequence0010
     * @tc.desc SDK dependency: NavPathStack; name promotion, replacement and index promotion determine returned pages
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopSequence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopSequence0010', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopSequence0010', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopSequence0010', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.moveToTop('pageTwo', false);
        logCase('testNavPopSequence0010', 'stack step 4 moveToTop returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavPopSequence0010', 'stack step 4 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 4 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0010',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPopSequence0010', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageTwo');
          logCase('testNavPopSequence0010', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPopSequence0010', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPopSequence0010', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0010',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:restored:4';
        const path6: NavPathInfo = new NavPathInfo('pageTwo', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavPopSequence0010', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter7: string = 'pageThree:replacement:5';
        const path7: NavPathInfo = new NavPathInfo('pageThree', parameter7);
        stack.replacePath(path7, false);
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageThree"]');
        logCase('testNavPopSequence0010', 'stack step 7 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:replacement:5"');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual(
          '["pageThree:initial:3","pageThree:replacement:5"]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1,2]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 7 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageThree","pageOne"]');
        logCase('testNavPopSequence0010', 'stack step 8 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:5"');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual(
          '["pageThree:initial:3","pageThree:replacement:5"]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0,1]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 8 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0010',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavPopSequence0010', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageOne');
          logCase('testNavPopSequence0010', 'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavPopSequence0010', 'stack step 9 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageThree"]');
        logCase('testNavPopSequence0010', 'stack step 9 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0010',
          'stack step 9 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:5"');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual(
          '["pageThree:initial:3","pageThree:replacement:5"]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0,1]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 9 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter10: string = 'pageFour:name-replacement:6';
        stack.replacePathByName('pageFour', parameter10, false);
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageFour"]');
        logCase('testNavPopSequence0010', 'stack step 10 replacePathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:name-replacement:6"');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameters(pageFour)=' +
          JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:6"]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state indexes(pageFour)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 10 replacePathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped11: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopSequence0010',
          'stack step 11 pop returned undefined=' + JSON.stringify(popped11 === undefined));
        expect(popped11 === undefined).assertEqual(false);
        if (popped11 !== undefined) {
          logCase('testNavPopSequence0010', 'stack step 11 pop returned name=' + JSON.stringify(popped11.name));
          expect(popped11.name).assertEqual('pageFour');
          logCase('testNavPopSequence0010', 'stack step 11 pop returned parameter=' + JSON.stringify(popped11.param));
          expect(JSON.stringify(popped11.param)).assertEqual('"pageFour:name-replacement:6"');
        }
        logCase('testNavPopSequence0010', 'stack step 11 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree"]');
        logCase('testNavPopSequence0010', 'stack step 11 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopSequence0010',
          'stack step 11 pop final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopSequence0010',
          'stack step 11 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
      });

  });
}
