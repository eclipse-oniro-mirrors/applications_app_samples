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

export default function navPopNameSequence(): void {
  describe('NavPopNameSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPNAMESEQUENCE_0001
     * @tc.name testNavPopNameSequence0001
     * @tc.desc SDK dependency: NavPathStack; empty missing rollback then bottom restore and middle rollback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopNameSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const result1: number = stack.popToName('pageOne', false);
        logCase('testNavPopNameSequence0001', 'stack step 1 popToName returned count/index=' + JSON.stringify(result1));
        expect(result1).assertEqual(-1);
        logCase('testNavPopNameSequence0001',
          'stack step 1 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPopNameSequence0001', 'stack step 1 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPopNameSequence0001',
          'stack step 1 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 1 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 1 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 1 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 1 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:initial:1';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopNameSequence0001', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageTwo:initial:2';
        const path3: NavPathInfo = new NavPathInfo('pageTwo', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopNameSequence0001', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageThree:initial:3';
        const path4: NavPathInfo = new NavPathInfo('pageThree', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopNameSequence0001', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result5: number = stack.popToName('pageOne', false);
        logCase('testNavPopNameSequence0001', 'stack step 5 popToName returned count/index=' + JSON.stringify(result5));
        expect(result5).assertEqual(0);
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopNameSequence0001', 'stack step 5 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 5 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:restored:4';
        const path6: NavPathInfo = new NavPathInfo('pageTwo', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopNameSequence0001', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:initial:5';
        const path7: NavPathInfo = new NavPathInfo('pageFour', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFour"]');
        logCase('testNavPopNameSequence0001', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result8: number = stack.moveToTop('pageOne', false);
        logCase('testNavPopNameSequence0001', 'stack step 8 moveToTop returned count/index=' + JSON.stringify(result8));
        expect(result8).assertEqual(0);
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageOne"]');
        logCase('testNavPopNameSequence0001', 'stack step 8 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 8 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result9: number = stack.popToName('pageTwo', false);
        logCase('testNavPopNameSequence0001', 'stack step 9 popToName returned count/index=' + JSON.stringify(result9));
        expect(result9).assertEqual(0);
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPopNameSequence0001', 'stack step 9 popToName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0001',
          'stack step 9 popToName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPNAMESEQUENCE_0002
     * @tc.name testNavPopNameSequence0002
     * @tc.desc SDK dependency: NavPathStack; interior rollback and replacement before restored-name rollback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopNameSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopNameSequence0002', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopNameSequence0002', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopNameSequence0002', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter4: string = 'pageFour:initial:4';
        const path4: NavPathInfo = new NavPathInfo('pageFour', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree","pageFour"]');
        logCase('testNavPopNameSequence0002', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:initial:4"');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:4"]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const result5: number = stack.popToName('pageTwo', false);
        logCase('testNavPopNameSequence0002', 'stack step 5 popToName returned count/index=' + JSON.stringify(result5));
        expect(result5).assertEqual(1);
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopNameSequence0002', 'stack step 5 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 5 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageThree:restored:5';
        const path6: NavPathInfo = new NavPathInfo('pageThree', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopNameSequence0002', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:restored:5"');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter7: string = 'pageFive:replacement:6';
        const path7: NavPathInfo = new NavPathInfo('pageFive', parameter7);
        stack.replacePath(path7, false);
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFive"]');
        logCase('testNavPopNameSequence0002', 'stack step 7 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 7 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result8: number = stack.popToName('pageThree', false);
        logCase('testNavPopNameSequence0002', 'stack step 8 popToName returned count/index=' + JSON.stringify(result8));
        expect(result8).assertEqual(-1);
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFive"]');
        logCase('testNavPopNameSequence0002', 'stack step 8 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 8 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter9: string = 'pageFour:restored:7';
        const path9: NavPathInfo = new NavPathInfo('pageFour', parameter9);
        stack.pushPath(path9, false);
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFive","pageFour"]');
        logCase('testNavPopNameSequence0002', 'stack step 9 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:restored:7"');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:restored:7"]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 9 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const popped10: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop returned undefined=' + JSON.stringify(popped10 === undefined));
        expect(popped10 === undefined).assertEqual(false);
        if (popped10 !== undefined) {
          logCase('testNavPopNameSequence0002', 'stack step 10 pop returned name=' + JSON.stringify(popped10.name));
          expect(popped10.name).assertEqual('pageFour');
          logCase('testNavPopNameSequence0002',
            'stack step 10 pop returned parameter=' + JSON.stringify(popped10.param));
          expect(JSON.stringify(popped10.param)).assertEqual('"pageFour:restored:7"');
        }
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFive"]');
        logCase('testNavPopNameSequence0002', 'stack step 10 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0002',
          'stack step 10 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPOPNAMESEQUENCE_0003
     * @tc.name testNavPopNameSequence0003
     * @tc.desc SDK dependency: NavPathStack; top rollback no-op then promotion changes later rollback target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPopNameSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPopNameSequence0003', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPopNameSequence0003', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopNameSequence0003', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.popToName('pageThree', false);
        logCase('testNavPopNameSequence0003', 'stack step 4 popToName returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(2);
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPopNameSequence0003', 'stack step 4 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 4 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavPopNameSequence0003', 'stack step 5 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 5 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = stack.popToName('pageThree', false);
        logCase('testNavPopNameSequence0003', 'stack step 6 popToName returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(1);
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavPopNameSequence0003', 'stack step 6 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPopNameSequence0003',
          'stack step 6 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageOne:restored:4';
        const path7: NavPathInfo = new NavPathInfo('pageOne', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavPopNameSequence0003', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:4"');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:4"]');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPopNameSequence0003',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
