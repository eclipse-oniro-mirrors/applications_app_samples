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

export default function navPushSequence(): void {
  describe('NavPushSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0001
     * @tc.name testNavPushSequence0001
     * @tc.desc SDK dependency: NavPathStack; info/name pushes after named rollback and indexed promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0001', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:by-name:2';
        stack.pushPathByName('pageTwo', parameter2, false);
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0001', 'stack step 2 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 2 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPushSequence0001', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.popToName('pageTwo', false);
        logCase('testNavPushSequence0001', 'stack step 4 popToName returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0001', 'stack step 4 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 4 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageFour:initial:4';
        const path5: NavPathInfo = new NavPathInfo('pageFour', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFour"]');
        logCase('testNavPushSequence0001', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:4"');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:4"]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:reentry:5';
        stack.pushPathByName('pageOne', parameter6, false);
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFour","pageOne"]');
        logCase('testNavPushSequence0001', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:4"');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageOne:reentry:5"');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:reentry:5"]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,3]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:4"]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageOne","pageOne"]');
        logCase('testNavPushSequence0001', 'stack step 7 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:4"');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:reentry:5"');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:reentry:5","pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2,3]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:4"]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 7 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const parameter8: string = 'pageTwo:tail:6';
        const path8: NavPathInfo = new NavPathInfo('pageTwo', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual(
          '["pageTwo","pageFour","pageOne","pageOne","pageTwo"]');
        logCase('testNavPushSequence0001', 'stack step 8 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(5);
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:4"');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:reentry:5"');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameter[4]=' + JSON.stringify(stack.getParamByIndex(4)));
        expect(JSON.stringify(stack.getParamByIndex(4))).assertEqual('"pageTwo:tail:6"');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:reentry:5","pageOne:initial:1"]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2,3]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2","pageTwo:tail:6"]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0,4]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:4"]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0001',
          'stack step 8 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(5) === undefined));
        expect(stack.getParamByIndex(5) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0002
     * @tc.name testNavPushSequence0002
     * @tc.desc SDK dependency: NavPathStack; duplicate removal then mixed-API reentry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:by-name:1';
        stack.pushPathByName('pageOne', parameter1, false);
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0002', 'stack step 1 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 1 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0002', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:duplicate:3';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavPushSequence0002', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:duplicate:3"');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:by-name:1","pageOne:duplicate:3"]');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.removeByName('pageOne');
        logCase('testNavPushSequence0002', 'stack step 4 removeByName returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(2);
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavPushSequence0002', 'stack step 4 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 4 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter5: string = 'pageThree:by-name:4';
        stack.pushPathByName('pageThree', parameter5, false);
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavPushSequence0002', 'stack step 5 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 5 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:reentry:5';
        const path6: NavPathInfo = new NavPathInfo('pageOne', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavPushSequence0002', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:reentry:5"');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:reentry:5"]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result7: number = stack.popToName('pageThree', false);
        logCase('testNavPushSequence0002', 'stack step 7 popToName returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(1);
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavPushSequence0002', 'stack step 7 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 7 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageFour:initial:6';
        const path8: NavPathInfo = new NavPathInfo('pageFour', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageFour"]');
        logCase('testNavPushSequence0002', 'stack step 8 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:4"');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:6"');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:4"]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:6"]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0002',
          'stack step 8 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0003
     * @tc.name testNavPushSequence0003
     * @tc.desc SDK dependency: NavPathStack; middle deletion followed by same-name append and promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0003', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0003', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:by-name:3';
        stack.pushPathByName('pageThree', parameter3, false);
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPushSequence0003', 'stack step 3 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 3 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.removeByIndexes([1]);
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPushSequence0003', 'stack step 4 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 4 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:reentry:4';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavPushSequence0003', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:duplicate:5';
        stack.pushPathByName('pageOne', parameter6, false);
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo","pageOne"]');
        logCase('testNavPushSequence0003', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageOne:duplicate:5"');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:duplicate:5"]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,3]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const result7: number = stack.moveToTop('pageTwo', false);
        logCase('testNavPushSequence0003', 'stack step 7 moveToTop returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(2);
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageOne","pageTwo"]');
        logCase('testNavPushSequence0003', 'stack step 7 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:duplicate:5"');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:duplicate:5"]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[3]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 7 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const parameter8: string = 'pageFour:by-name:6';
        stack.pushPathByName('pageFour', parameter8, false);
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual(
          '["pageOne","pageThree","pageOne","pageTwo","pageFour"]');
        logCase('testNavPushSequence0003', 'stack step 8 pushPathByName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(5);
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:3"');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:duplicate:5"');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameter[4]=' + JSON.stringify(stack.getParamByIndex(4)));
        expect(JSON.stringify(stack.getParamByIndex(4))).assertEqual('"pageFour:by-name:6"');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:duplicate:5"]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[3]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:3"]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:by-name:6"]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[4]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0003',
          'stack step 8 pushPathByName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(5) === undefined));
        expect(stack.getParamByIndex(5) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0004
     * @tc.name testNavPushSequence0004
     * @tc.desc SDK dependency: NavPathStack; popped page restored after a different intervening page
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:by-name:1';
        stack.pushPathByName('pageOne', parameter1, false);
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0004', 'stack step 1 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 1 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0004', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped3: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPushSequence0004',
          'stack step 3 pop returned undefined=' + JSON.stringify(popped3 === undefined));
        expect(popped3 === undefined).assertEqual(false);
        if (popped3 !== undefined) {
          logCase('testNavPushSequence0004', 'stack step 3 pop returned name=' + JSON.stringify(popped3.name));
          expect(popped3.name).assertEqual('pageTwo');
          logCase('testNavPushSequence0004', 'stack step 3 pop returned parameter=' + JSON.stringify(popped3.param));
          expect(JSON.stringify(popped3.param)).assertEqual('"pageTwo:initial:2"');
        }
        logCase('testNavPushSequence0004', 'stack step 3 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0004', 'stack step 3 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0004',
          'stack step 3 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 3 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter4: string = 'pageThree:initial:3';
        const path4: NavPathInfo = new NavPathInfo('pageThree', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPushSequence0004', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:restored:4';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavPushSequence0004', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.popToIndex(1, false);
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPushSequence0004', 'stack step 6 popToIndex state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 6 popToIndex state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:by-name:5';
        stack.pushPathByName('pageFour', parameter7, false);
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageFour"]');
        logCase('testNavPushSequence0004', 'stack step 7 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:by-name:5"');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:by-name:5"]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 7 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageOne:duplicate:6';
        const path8: NavPathInfo = new NavPathInfo('pageOne', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageFour","pageOne"]');
        logCase('testNavPushSequence0004', 'stack step 8 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:by-name:5"');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageOne:duplicate:6"');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:by-name:1","pageOne:duplicate:6"]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,3]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:by-name:5"]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0004',
          'stack step 8 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0005
     * @tc.name testNavPushSequence0005
     * @tc.desc SDK dependency: NavPathStack; replacement and bottom removal before new append
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0005', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0005', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:replacement:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.replacePath(path3, false);
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPushSequence0005', 'stack step 3 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 3 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:reentry:4';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavPushSequence0005', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result5: number = stack.removeByIndexes([0]);
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes returned count/index=' + JSON.stringify(result5));
        expect(result5).assertEqual(1);
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo"]');
        logCase('testNavPushSequence0005', 'stack step 5 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 5 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:by-name:5';
        stack.pushPathByName('pageOne', parameter6, false);
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo","pageOne"]');
        logCase('testNavPushSequence0005', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:by-name:5"');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:5"]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:initial:6';
        const path7: NavPathInfo = new NavPathInfo('pageFour', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo","pageOne","pageFour"]');
        logCase('testNavPushSequence0005', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:by-name:5"');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:initial:6"');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:5"]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:6"]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPushSequence0005',
          'stack step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavPushSequence0005', 'stack step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageFour');
          logCase('testNavPushSequence0005', 'stack step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageFour:initial:6"');
        }
        logCase('testNavPushSequence0005', 'stack step 8 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo","pageOne"]');
        logCase('testNavPushSequence0005', 'stack step 8 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:by-name:5"');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:5"]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 8 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter9: string = 'pageFive:initial:7';
        const path9: NavPathInfo = new NavPathInfo('pageFive', parameter9);
        stack.pushPath(path9, false);
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo","pageOne","pageFive"]');
        logCase('testNavPushSequence0005', 'stack step 9 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:replacement:3"');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:reentry:4"');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:by-name:5"');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFive:initial:7"');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:5"]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:reentry:4"]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:3"]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:initial:7"]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[3]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0005',
          'stack step 9 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0006
     * @tc.name testNavPushSequence0006
     * @tc.desc SDK dependency: NavPathStack; clear and rebuild with indexed promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:by-name:1';
        stack.pushPathByName('pageOne', parameter1, false);
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0006', 'stack step 1 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 1 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0006', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        stack.clear(false);
        logCase('testNavPushSequence0006', 'stack step 3 clear state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPushSequence0006', 'stack step 3 clear state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPushSequence0006',
          'stack step 3 clear state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 3 clear state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 3 clear state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 3 clear state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 3 clear state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 3 clear state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 3 clear state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter4: string = 'pageThree:initial:3';
        const path4: NavPathInfo = new NavPathInfo('pageThree', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree"]');
        logCase('testNavPushSequence0006', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter5: string = 'pageOne:rebuilt:4';
        stack.pushPathByName('pageOne', parameter5, false);
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageOne"]');
        logCase('testNavPushSequence0006', 'stack step 5 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:rebuilt:4"');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:4"]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 5 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPushSequence0006', 'stack step 6 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:4"');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:4"]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 6 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:initial:5';
        const path7: NavPathInfo = new NavPathInfo('pageFour', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageFour"]');
        logCase('testNavPushSequence0006', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:4"');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:4"]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageTwo:restored:6';
        const path8: NavPathInfo = new NavPathInfo('pageTwo', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageFour","pageTwo"]');
        logCase('testNavPushSequence0006', 'stack step 8 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:4"');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageTwo:restored:6"');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:4"]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:6"]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[3]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0006',
          'stack step 8 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0007
     * @tc.name testNavPushSequence0007
     * @tc.desc SDK dependency: NavPathStack; drained stack restored and then replaced
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0007', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped2: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPushSequence0007',
          'stack step 2 pop returned undefined=' + JSON.stringify(popped2 === undefined));
        expect(popped2 === undefined).assertEqual(false);
        if (popped2 !== undefined) {
          logCase('testNavPushSequence0007', 'stack step 2 pop returned name=' + JSON.stringify(popped2.name));
          expect(popped2.name).assertEqual('pageOne');
          logCase('testNavPushSequence0007', 'stack step 2 pop returned parameter=' + JSON.stringify(popped2.param));
          expect(JSON.stringify(popped2.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavPushSequence0007', 'stack step 2 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPushSequence0007', 'stack step 2 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPushSequence0007',
          'stack step 2 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 2 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 2 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 2 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 2 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:restored:2';
        stack.pushPathByName('pageOne', parameter3, false);
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0007', 'stack step 3 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:restored:2"');
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:2"]');
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 3 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:initial:3';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0007', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:restored:2"');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:2"]');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPushSequence0007',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavPushSequence0007', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageTwo');
          logCase('testNavPushSequence0007', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageTwo:initial:3"');
        }
        logCase('testNavPushSequence0007', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0007', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0007',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:restored:2"');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:2"]');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter6: string = 'pageThree:initial:4';
        const path6: NavPathInfo = new NavPathInfo('pageThree', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavPushSequence0007', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:restored:2"');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:4"');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:2"]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:4"]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageTwo:replacement:5';
        const path7: NavPathInfo = new NavPathInfo('pageTwo', parameter7);
        stack.replacePath(path7, false);
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0007', 'stack step 7 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:restored:2"');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:replacement:5"');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:2"]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:5"]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 7 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageFour:by-name:6';
        stack.pushPathByName('pageFour', parameter8, false);
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFour"]');
        logCase('testNavPushSequence0007', 'stack step 8 pushPathByName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:restored:2"');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:replacement:5"');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:by-name:6"');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:2"]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:5"]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:by-name:6"]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0007',
          'stack step 8 pushPathByName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0008
     * @tc.name testNavPushSequence0008
     * @tc.desc SDK dependency: NavPathStack; replace into existing name and remove both before restoring
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0008', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:by-name:2';
        stack.pushPathByName('pageTwo', parameter2, false);
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0008', 'stack step 2 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 2 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPushSequence0008', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter4: string = 'pageOne:replacement:4';
        const path4: NavPathInfo = new NavPathInfo('pageOne', parameter4);
        stack.replacePath(path4, false);
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavPushSequence0008', 'stack step 4 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:replacement:4"');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:replacement:4"]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 4 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter5: string = 'pageFour:initial:5';
        const path5: NavPathInfo = new NavPathInfo('pageFour', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne","pageFour"]');
        logCase('testNavPushSequence0008', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:replacement:4"');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:replacement:4"]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const result6: number = stack.removeByName('pageOne');
        logCase('testNavPushSequence0008', 'stack step 6 removeByName returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(2);
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour"]');
        logCase('testNavPushSequence0008', 'stack step 6 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 6 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageOne:restored:6';
        const path7: NavPathInfo = new NavPathInfo('pageOne', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageOne"]');
        logCase('testNavPushSequence0008', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:6"');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:6"]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageFive:by-name:7';
        stack.pushPathByName('pageFive', parameter8, false);
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageOne","pageFive"]');
        logCase('testNavPushSequence0008', 'stack step 8 pushPathByName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:by-name:2"');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:6"');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFive:by-name:7"');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:6"]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:by-name:2"]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:by-name:7"]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[3]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0008',
          'stack step 8 pushPathByName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0009
     * @tc.name testNavPushSequence0009
     * @tc.desc SDK dependency: NavPathStack; indexed rollback rebuild and subsequent top replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0009', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0009', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPushSequence0009', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.popToIndex(0, false);
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0009', 'stack step 4 popToIndex state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 4 popToIndex state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:restored:4';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0009', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageThree:by-name:5';
        stack.pushPathByName('pageThree', parameter6, false);
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPushSequence0009', 'stack step 6 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:by-name:5"');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:5"]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 6 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.moveIndexToTop(1, false);
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo"]');
        logCase('testNavPushSequence0009', 'stack step 7 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:5"');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:5"]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 7 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageFour:initial:6';
        const path8: NavPathInfo = new NavPathInfo('pageFour', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo","pageFour"]');
        logCase('testNavPushSequence0009', 'stack step 8 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:5"');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:initial:6"');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:5"]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:6"]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const parameter9: string = 'pageFive:replacement:7';
        const path9: NavPathInfo = new NavPathInfo('pageFive', parameter9);
        stack.replacePath(path9, false);
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree","pageTwo","pageFive"]');
        logCase('testNavPushSequence0009', 'stack step 9 replacePath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:by-name:5"');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:4"');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFive:replacement:7"');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:4"]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:by-name:5"]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:7"]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[3]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0009',
          'stack step 9 replacePath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVPUSHSEQUENCE_0010
     * @tc.name testNavPushSequence0010
     * @tc.desc SDK dependency: NavPathStack; empty pop after clear before missing removal and new promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavPushSequence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:by-name:1';
        stack.pushPathByName('pageOne', parameter1, false);
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0010', 'stack step 1 pushPathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:by-name:1"');
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:by-name:1"]');
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 1 pushPathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        stack.clear(false);
        logCase('testNavPushSequence0010', 'stack step 2 clear state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPushSequence0010', 'stack step 2 clear state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPushSequence0010',
          'stack step 2 clear state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 2 clear state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 2 clear state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 2 clear state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 2 clear state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const popped3: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavPushSequence0010',
          'stack step 3 pop returned undefined=' + JSON.stringify(popped3 === undefined));
        expect(popped3 === undefined).assertEqual(true);
        logCase('testNavPushSequence0010', 'stack step 3 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavPushSequence0010', 'stack step 3 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavPushSequence0010',
          'stack step 3 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 3 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 3 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 3 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 3 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter4: string = 'pageOne:rebuilt:2';
        const path4: NavPathInfo = new NavPathInfo('pageOne', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavPushSequence0010', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:2"');
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:2"]');
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:initial:3';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0010', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:2"');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:2"]');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const result6: number = stack.removeByName('missingPage');
        logCase('testNavPushSequence0010', 'stack step 6 removeByName returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(0);
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavPushSequence0010', 'stack step 6 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:2"');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:2"]');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 6 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageThree:initial:4';
        const path7: NavPathInfo = new NavPathInfo('pageThree', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavPushSequence0010', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:rebuilt:2"');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:4"');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:2"]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:4"]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavPushSequence0010',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result8: number = stack.moveToTop('pageOne', false);
        logCase('testNavPushSequence0010', 'stack step 8 moveToTop returned count/index=' + JSON.stringify(result8));
        expect(result8).assertEqual(0);
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavPushSequence0010', 'stack step 8 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:4"');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:rebuilt:2"');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:2"]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:4"]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0010',
          'stack step 8 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter9: string = 'pageFour:initial:5';
        const path9: NavPathInfo = new NavPathInfo('pageFour', parameter9);
        stack.pushPath(path9, false);
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne","pageFour"]');
        logCase('testNavPushSequence0010', 'stack step 9 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:4"');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:rebuilt:2"');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFour:initial:5"');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:rebuilt:2"]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:4"]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[3]');
        logCase('testNavPushSequence0010',
          'stack step 9 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

  });
}
