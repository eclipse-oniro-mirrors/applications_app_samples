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

export default function navReplaceSequence(): void {
  describe('NavReplaceSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0001
     * @tc.name testNavReplaceSequence0001
     * @tc.desc SDK dependency: NavPathStack; singleton replace, append and replace before returning popped info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0001', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:replacement:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.replacePath(path2, false);
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavReplaceSequence0001', 'stack step 2 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:replacement:2"');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:2"]');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 2 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0001', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:replacement:2"');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:2"]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageFour:replacement:4';
        const path4: NavPathInfo = new NavPathInfo('pageFour', parameter4);
        stack.replacePath(path4, false);
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour"]');
        logCase('testNavReplaceSequence0001', 'stack step 4 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:replacement:2"');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:2"]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 4 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavReplaceSequence0001', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageFour');
          logCase('testNavReplaceSequence0001', 'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageFour:replacement:4"');
        }
        logCase('testNavReplaceSequence0001', 'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavReplaceSequence0001', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:replacement:2"');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:2"]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter6: string = 'pageThree:restored:5';
        const path6: NavPathInfo = new NavPathInfo('pageThree', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0001', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:replacement:2"');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:restored:5"');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:2"]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const result7: number = stack.moveToTop('pageTwo', false);
        logCase('testNavReplaceSequence0001', 'stack step 7 moveToTop returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(0);
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageTwo"]');
        logCase('testNavReplaceSequence0001', 'stack step 7 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:restored:5"');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:replacement:2"');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:replacement:2"]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 7 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageFive:replacement:6';
        const path8: NavPathInfo = new NavPathInfo('pageFive', parameter8);
        stack.replacePath(path8, false);
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageThree","pageFive"]');
        logCase('testNavReplaceSequence0001', 'stack step 8 replacePath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageThree:restored:5"');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0001',
          'stack step 8 replacePath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0002
     * @tc.name testNavReplaceSequence0002
     * @tc.desc SDK dependency: NavPathStack; replacement after bottom promotion then shifted-index removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0002', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0002', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0002', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavReplaceSequence0002', 'stack step 4 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 4 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter5: string = 'pageFour:replacement:4';
        const path5: NavPathInfo = new NavPathInfo('pageFour', parameter5);
        stack.replacePath(path5, false);
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageFour"]');
        logCase('testNavReplaceSequence0002', 'stack step 5 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 5 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = stack.removeByIndexes([1]);
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(1);
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour"]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameters(pageFour)=' +
          JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state indexes(pageFour)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 6 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageOne:restored:5';
        const path7: NavPathInfo = new NavPathInfo('pageOne', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageOne"]');
        logCase('testNavReplaceSequence0002', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:5"');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:5"]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageThree:replacement:6';
        const path8: NavPathInfo = new NavPathInfo('pageThree', parameter8);
        stack.replacePath(path8, false);
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageThree"]');
        logCase('testNavReplaceSequence0002', 'stack step 8 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:replacement:6"');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:6"]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 8 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result9: number = stack.popToName('pageTwo', false);
        logCase('testNavReplaceSequence0002', 'stack step 9 popToName returned count/index=' + JSON.stringify(result9));
        expect(result9).assertEqual(0);
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavReplaceSequence0002', 'stack step 9 popToName final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0002',
          'stack step 9 popToName final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0003
     * @tc.name testNavReplaceSequence0003
     * @tc.desc SDK dependency: NavPathStack; named promotion selects replaced duplicate before two replacements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:first:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0003', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:first:1"');
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:first:1"]');
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0003', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:first:1"');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:first:1"]');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:second:3';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavReplaceSequence0003', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:first:1"');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:second:3"');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:first:1","pageOne:second:3"]');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.moveToTop('pageOne', false);
        logCase('testNavReplaceSequence0003', 'stack step 4 moveToTop returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(0);
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne","pageOne"]');
        logCase('testNavReplaceSequence0003', 'stack step 4 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:second:3"');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:first:1"');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:second:3","pageOne:first:1"]');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1,2]');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 4 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter5: string = 'pageThree:replacement:4';
        const path5: NavPathInfo = new NavPathInfo('pageThree', parameter5);
        stack.replacePath(path5, false);
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne","pageThree"]');
        logCase('testNavReplaceSequence0003', 'stack step 5 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:second:3"');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:replacement:4"');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:second:3"]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:4"]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 5 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = stack.moveToTop('pageOne', false);
        logCase('testNavReplaceSequence0003', 'stack step 6 moveToTop returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(1);
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageOne"]');
        logCase('testNavReplaceSequence0003', 'stack step 6 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:4"');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:second:3"');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:second:3"]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:4"]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 6 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter7: string = 'pageFour:name-replacement:5';
        stack.replacePathByName('pageFour', parameter7, false);
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageFour"]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:4"');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:name-replacement:5"');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:4"]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameters(pageFour)=' +
          JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:5"]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state indexes(pageFour)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 7 replacePathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageOne:third:6';
        const path8: NavPathInfo = new NavPathInfo('pageOne', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageFour","pageOne"]');
        logCase('testNavReplaceSequence0003', 'stack step 8 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:4"');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:name-replacement:5"');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageOne:third:6"');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:third:6"]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[3]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:4"]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:5"]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
        const parameter9: string = 'pageFive:replacement:7';
        const path9: NavPathInfo = new NavPathInfo('pageFive', parameter9);
        stack.replacePath(path9, false);
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageThree","pageFour","pageFive"]');
        logCase('testNavReplaceSequence0003', 'stack step 9 replacePath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(4);
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:4"');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:name-replacement:5"');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameter[3]=' + JSON.stringify(stack.getParamByIndex(3)));
        expect(JSON.stringify(stack.getParamByIndex(3))).assertEqual('"pageFive:replacement:7"');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:4"]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:5"]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:7"]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[3]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0003',
          'stack step 9 replacePath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(4) === undefined));
        expect(stack.getParamByIndex(4) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0004
     * @tc.name testNavReplaceSequence0004
     * @tc.desc SDK dependency: NavPathStack; pop restores prior top for replacement before index rollback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0004', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0004', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0004', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const popped4: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop returned undefined=' + JSON.stringify(popped4 === undefined));
        expect(popped4 === undefined).assertEqual(false);
        if (popped4 !== undefined) {
          logCase('testNavReplaceSequence0004', 'stack step 4 pop returned name=' + JSON.stringify(popped4.name));
          expect(popped4.name).assertEqual('pageThree');
          logCase('testNavReplaceSequence0004', 'stack step 4 pop returned parameter=' + JSON.stringify(popped4.param));
          expect(JSON.stringify(popped4.param)).assertEqual('"pageThree:initial:3"');
        }
        logCase('testNavReplaceSequence0004', 'stack step 4 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0004', 'stack step 4 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 4 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageFour:replacement:4';
        const path5: NavPathInfo = new NavPathInfo('pageFour', parameter5);
        stack.replacePath(path5, false);
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFour"]');
        logCase('testNavReplaceSequence0004', 'stack step 5 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 5 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageThree:restored:5';
        const path6: NavPathInfo = new NavPathInfo('pageThree', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFour","pageThree"]');
        logCase('testNavReplaceSequence0004', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:restored:5"');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:restored:5"]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.popToIndex(1, false);
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFour"]');
        logCase('testNavReplaceSequence0004', 'stack step 7 popToIndex state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:replacement:4"');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:replacement:4"]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 7 popToIndex state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageFive:replacement:6';
        const path8: NavPathInfo = new NavPathInfo('pageFive', parameter8);
        stack.replacePath(path8, false);
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFive"]');
        logCase('testNavReplaceSequence0004', 'stack step 8 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 8 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter9: string = 'pageTwo:restored:7';
        const path9: NavPathInfo = new NavPathInfo('pageTwo', parameter9);
        stack.pushPath(path9, false);
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFive","pageTwo"]');
        logCase('testNavReplaceSequence0004', 'stack step 9 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFive:replacement:6"');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:restored:7"');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:restored:7"]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:replacement:6"]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0004',
          'stack step 9 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0005
     * @tc.name testNavReplaceSequence0005
     * @tc.desc SDK dependency: NavPathStack; interior deletion then replacement creates surviving bottom duplicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0005', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0005', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0005', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.removeByIndexes([1]);
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 4 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageOne:replacement:4';
        const path5: NavPathInfo = new NavPathInfo('pageOne', parameter5);
        stack.replacePath(path5, false);
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavReplaceSequence0005', 'stack step 5 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:replacement:4"');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:replacement:4"]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 5 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageFour:initial:5';
        const path6: NavPathInfo = new NavPathInfo('pageFour', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne","pageFour"]');
        logCase('testNavReplaceSequence0005', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:replacement:4"');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:initial:5"');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:replacement:4"]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result7: number = stack.moveToTop('pageOne', false);
        logCase('testNavReplaceSequence0005', 'stack step 7 moveToTop returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(0);
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFour","pageOne"]');
        logCase('testNavReplaceSequence0005', 'stack step 7 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:replacement:4"');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:replacement:4","pageOne:initial:1"]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 7 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageThree:replacement:6';
        const path8: NavPathInfo = new NavPathInfo('pageThree', parameter8);
        stack.replacePath(path8, false);
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageFour","pageThree"]');
        logCase('testNavReplaceSequence0005', 'stack step 8 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:replacement:4"');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:initial:5"');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:replacement:6"');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:replacement:4"]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:6"]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 8 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result9: number = stack.removeByName('pageOne');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName returned count/index=' + JSON.stringify(result9));
        expect(result9).assertEqual(1);
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageFour","pageThree"]');
        logCase('testNavReplaceSequence0005', 'stack step 9 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageFour:initial:5"');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:6"');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:6"]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 9 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter10: string = 'pageFive:initial:7';
        const path10: NavPathInfo = new NavPathInfo('pageFive', parameter10);
        stack.pushPath(path10, false);
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageFour","pageThree","pageFive"]');
        logCase('testNavReplaceSequence0005', 'stack step 10 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageFour:initial:5"');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:replacement:6"');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFive:initial:7"');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:replacement:6"]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:initial:5"]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameters(pageFive)=' + JSON.stringify(stack.getParamByName('pageFive')));
        expect(JSON.stringify(stack.getParamByName('pageFive'))).assertEqual('["pageFive:initial:7"]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final indexes(pageFive)=' + JSON.stringify(getSortedIndexes(stack, 'pageFive')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFive'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0005',
          'stack step 10 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0006
     * @tc.name testNavReplaceSequence0006
     * @tc.desc SDK dependency: NavPathStack; named rollback then same-name replacement and duplicate-index selection
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0006', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0006', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0006', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result4: number = stack.popToName('pageTwo', false);
        logCase('testNavReplaceSequence0006', 'stack step 4 popToName returned count/index=' + JSON.stringify(result4));
        expect(result4).assertEqual(1);
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0006', 'stack step 4 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 4 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:updated:4';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        stack.replacePath(path5, false);
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0006', 'stack step 5 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:updated:4"');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:updated:4"]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 5 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageTwo:duplicate:5';
        const path6: NavPathInfo = new NavPathInfo('pageTwo', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageTwo"]');
        logCase('testNavReplaceSequence0006', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:updated:4"');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:duplicate:5"');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual(
          '["pageTwo:updated:4","pageTwo:duplicate:5"]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1,2]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        stack.popToIndex(2, false);
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageTwo"]');
        logCase('testNavReplaceSequence0006', 'stack step 7 popToIndex state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:updated:4"');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:duplicate:5"');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual(
          '["pageTwo:updated:4","pageTwo:duplicate:5"]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1,2]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 7 popToIndex state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageOne:name-replacement:6';
        stack.replacePathByName('pageOne', parameter8, false);
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:updated:4"');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:name-replacement:6"');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:initial:1","pageOne:name-replacement:6"]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:updated:4"]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 8 replacePathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result9: number = stack.moveToTop('pageOne', false);
        logCase('testNavReplaceSequence0006', 'stack step 9 moveToTop returned count/index=' + JSON.stringify(result9));
        expect(result9).assertEqual(0);
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne","pageOne"]');
        logCase('testNavReplaceSequence0006', 'stack step 9 moveToTop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:updated:4"');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:name-replacement:6"');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:name-replacement:6","pageOne:initial:1"]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1,2]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:updated:4"]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0006',
          'stack step 9 moveToTop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVREPLACESEQUENCE_0007
     * @tc.name testNavReplaceSequence0007
     * @tc.desc SDK dependency: NavPathStack; name replacement then bottom deletion and info replacement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavReplaceSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavReplaceSequence0007', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavReplaceSequence0007', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter3: string = 'pageThree:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageThree', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavReplaceSequence0007', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageThree:initial:3"');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:initial:3"]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter4: string = 'pageFour:name-replacement:4';
        stack.replacePathByName('pageFour', parameter4, false);
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo","pageFour"]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageFour:name-replacement:4"');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameters(pageFour)=' +
          JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:4"]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state indexes(pageFour)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 4 replacePathByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result5: number = stack.removeByIndexes([0]);
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes returned count/index=' + JSON.stringify(result5));
        expect(result5).assertEqual(1);
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour"]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:name-replacement:4"');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameters(pageFour)=' +
          JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:4"]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state indexes(pageFour)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 5 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter6: string = 'pageOne:restored:5';
        const path6: NavPathInfo = new NavPathInfo('pageOne', parameter6);
        stack.pushPath(path6, false);
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageOne"]');
        logCase('testNavReplaceSequence0007', 'stack step 6 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:name-replacement:4"');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageOne:restored:5"');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:restored:5"]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[2]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:4"]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 6 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter7: string = 'pageTwo:replacement:6';
        const path7: NavPathInfo = new NavPathInfo('pageTwo', parameter7);
        stack.replacePath(path7, false);
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageFour","pageTwo"]');
        logCase('testNavReplaceSequence0007', 'stack step 7 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageFour:name-replacement:4"');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:replacement:6"');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual(
          '["pageTwo:initial:2","pageTwo:replacement:6"]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0,2]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:4"]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[1]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 7 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(3) === undefined));
        expect(stack.getParamByIndex(3) === undefined).assertEqual(true);
        const result8: number = stack.moveToTop('pageTwo', false);
        logCase('testNavReplaceSequence0007', 'stack step 8 moveToTop returned count/index=' + JSON.stringify(result8));
        expect(result8).assertEqual(0);
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageFour","pageTwo","pageTwo"]');
        logCase('testNavReplaceSequence0007', 'stack step 8 moveToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(3);
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageFour:name-replacement:4"');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:replacement:6"');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameter[2]=' + JSON.stringify(stack.getParamByIndex(2)));
        expect(JSON.stringify(stack.getParamByIndex(2))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual(
          '["pageTwo:replacement:6","pageTwo:initial:2"]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1,2]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameters(pageFour)=' + JSON.stringify(stack.getParamByName('pageFour')));
        expect(JSON.stringify(stack.getParamByName('pageFour'))).assertEqual('["pageFour:name-replacement:4"]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state indexes(pageFour)=' + JSON.stringify(getSortedIndexes(stack, 'pageFour')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageFour'))).assertEqual('[0]');
        logCase('testNavReplaceSequence0007',
          'stack step 8 moveToTop state parameters(missingPage)=' +
