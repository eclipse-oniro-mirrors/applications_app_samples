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

export default function navIsolationSequence(): void {
  describe('NavIsolationSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVISOLATIONSEQUENCE_0001
     * @tc.name testNavIsolationSequence0001
     * @tc.desc SDK dependency: NavPathStack; left clear leaves identical right names and different payloads intact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavIsolationSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const other: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:left-root:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0001', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(0);
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 1 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(0) === undefined));
        expect(other.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:right-root:2';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        other.pushPath(path2, false);
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0001', 'other step 2 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageTwo:right-tail:3';
        const path3: NavPathInfo = new NavPathInfo('pageTwo', parameter3);
        other.pushPath(path3, false);
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0001', 'other step 3 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:right-tail:3"');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-tail:3"]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:left-tail:4';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0001', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:left-tail:4"');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:4"]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:right-tail:3"');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-tail:3"]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 4 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        stack.clear(false);
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0001', 'stack step 5 clear state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:right-tail:3"');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-tail:3"]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 5 clear state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const result6: number = other.moveToTop('pageOne', false);
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(0);
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0001', 'other step 6 moveToTop state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:right-tail:3"');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-tail:3"]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 6 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter7: string = 'pageOne:left-reentry:5';
        const path7: NavPathInfo = new NavPathInfo('pageOne', parameter7);
        stack.pushPath(path7, false);
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0001', 'stack step 7 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-reentry:5"');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-reentry:5"]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:right-tail:3"');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-tail:3"]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'stack step 7 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const popInfo: NavPathInfo | undefined = other.pop(false);
        logCase('testNavIsolationSequence0001',
          'other step 8 pop returned undefined=' + JSON.stringify(popInfo === undefined));
        expect(popInfo === undefined).assertEqual(false);
        if (popInfo !== undefined) {
          logCase('testNavIsolationSequence0001', 'other step 8 pop returned name=' + JSON.stringify(popInfo.name));
          expect(popInfo.name).assertEqual('pageOne');
          logCase('testNavIsolationSequence0001',
            'other step 8 pop returned parameter=' + JSON.stringify(popInfo.param));
          expect(JSON.stringify(popInfo.param)).assertEqual('"pageOne:right-root:2"');
        }
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-reentry:5"');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-reentry:5"]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavIsolationSequence0001', 'other step 8 pop final size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:right-tail:3"');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-tail:3"]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0001',
          'other step 8 pop final first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVISOLATIONSEQUENCE_0002
     * @tc.name testNavIsolationSequence0002
     * @tc.desc SDK dependency: NavPathStack; left duplicate removal does not change right duplicate indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavIsolationSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const other: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:left-first:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0002', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-first:1"');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-first:1"]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(0);
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 1 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(0) === undefined));
        expect(other.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:right-first:2';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        other.pushPath(path2, false);
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-first:1"');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-first:1"]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0002', 'other step 2 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-first:2"]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:left-second:3';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavIsolationSequence0002', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-first:1"');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:left-second:3"');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:left-first:1","pageOne:left-second:3"]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-first:2"]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 3 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter4: string = 'pageOne:right-second:4';
        const path4: NavPathInfo = new NavPathInfo('pageOne', parameter4);
        other.pushPath(path4, false);
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-first:1"');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:left-second:3"');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:left-first:1","pageOne:left-second:3"]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavIsolationSequence0002', 'other step 4 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-second:4"');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual(
          '["pageOne:right-first:2","pageOne:right-second:4"]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:initial:5';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        other.pushPath(path5, false);
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-first:1"');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:left-second:3"');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:left-first:1","pageOne:left-second:3"]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0002', 'other step 5 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-second:4"');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageTwo:initial:5"');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual(
          '["pageOne:right-first:2","pageOne:right-second:4"]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:5"]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = stack.removeByName('pageOne');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(2);
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0002', 'stack step 6 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-second:4"');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageTwo:initial:5"');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual(
          '["pageOne:right-first:2","pageOne:right-second:4"]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:5"]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[2]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 6 removeByName state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        other.moveIndexToTop(0, false);
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-second:4"');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:5"');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual(
          '["pageOne:right-second:4","pageOne:right-first:2"]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:5"]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'other step 7 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter8: string = 'pageTwo:left-new:6';
        const path8: NavPathInfo = new NavPathInfo('pageTwo', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavIsolationSequence0002', 'stack step 8 pushPath final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:left-new:6"');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-new:6"]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-second:4"');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:5"');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageOne:right-first:2"');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual(
          '["pageOne:right-second:4","pageOne:right-first:2"]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0,2]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:5"]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0002',
          'stack step 8 pushPath final other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVISOLATIONSEQUENCE_0003
     * @tc.name testNavIsolationSequence0003
     * @tc.desc SDK dependency: NavPathStack; left rollback and right removal maintain separate sizes and queries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavIsolationSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const other: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0003', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(0);
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 1 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(0) === undefined));
        expect(other.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageTwo:initial:2';
        const path2: NavPathInfo = new NavPathInfo('pageTwo', parameter2);
        stack.pushPath(path2, false);
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0003', 'stack step 2 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(0);
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 2 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(0) === undefined));
        expect(other.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:right-root:3';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        other.pushPath(path3, false);
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0003', 'other step 3 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:right-middle:4';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        other.pushPath(path4, false);
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0003', 'other step 4 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:right-middle:4"');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-middle:4"]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageThree:initial:5';
        const path5: NavPathInfo = new NavPathInfo('pageThree', parameter5);
        other.pushPath(path5, false);
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:initial:2"');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:2"]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavIsolationSequence0003', 'other step 5 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:right-middle:4"');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageThree:initial:5"');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-middle:4"]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameters(pageThree)=' + JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:initial:5"]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[2]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = stack.popToName('pageOne', false);
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(0);
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0003', 'stack step 6 popToName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:right-middle:4"');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageThree:initial:5"');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:right-middle:4"]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:initial:5"]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[2]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 6 popToName state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        const result7: number = other.removeByName('pageTwo');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(1);
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavIsolationSequence0003', 'other step 7 removeByName state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageThree:initial:5"');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state parameters(pageThree)=' + JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:initial:5"]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 7 removeByName state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageThree:left-new:6';
        const path8: NavPathInfo = new NavPathInfo('pageThree', parameter8);
        stack.pushPath(path8, false);
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavIsolationSequence0003', 'stack step 8 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:left-new:6"');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state parameters(pageThree)=' + JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:left-new:6"]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageThree:initial:5"');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:initial:5"]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'stack step 8 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const result9: number = other.popToName('pageOne', false);
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName returned count/index=' + JSON.stringify(result9));
        expect(result9).assertEqual(0);
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageThree"]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageThree:left-new:6"');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack parameters(pageThree)=' +
          JSON.stringify(stack.getParamByName('pageThree')));
        expect(JSON.stringify(stack.getParamByName('pageThree'))).assertEqual('["pageThree:left-new:6"]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageThree'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0003', 'other step 9 popToName final size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:3"');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:3"]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final parameters(pageThree)=' + JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final indexes(pageThree)=' + JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0003',
          'other step 9 popToName final first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVISOLATIONSEQUENCE_0004
     * @tc.name testNavIsolationSequence0004
     * @tc.desc SDK dependency: NavPathStack; right indexed deletion cannot shift left promotion target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavIsolationSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const other: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:initial:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0004', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(0);
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 1 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(0) === undefined));
        expect(other.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:right-root:2';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        other.pushPath(path2, false);
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0004', 'other step 2 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageTwo:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageTwo', parameter3);
        other.pushPath(path3, false);
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0004', 'other step 3 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageThree:initial:4';
        const path4: NavPathInfo = new NavPathInfo('pageThree', parameter4);
        other.pushPath(path4, false);
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavIsolationSequence0004', 'other step 4 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageThree:initial:4"');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameters(pageThree)=' + JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:initial:4"]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[2]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        const parameter5: string = 'pageTwo:left-tail:5';
        const path5: NavPathInfo = new NavPathInfo('pageTwo', parameter5);
        stack.pushPath(path5, false);
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0004', 'stack step 5 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:left-tail:5"');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:5"]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo","pageThree"]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(3);
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameter[2]=' + JSON.stringify(other.getParamByIndex(2)));
        expect(JSON.stringify(other.getParamByIndex(2))).assertEqual('"pageThree:initial:4"');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:initial:4"]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[2]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 5 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(3) === undefined));
        expect(other.getParamByIndex(3) === undefined).assertEqual(true);
        const result6: number = other.removeByIndexes([0,2]);
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:left-tail:5"');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:5"]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 6 removeByIndexes state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        stack.moveIndexToTop(0, false);
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:left-tail:5"');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:5"]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 7 moveIndexToTop state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter8: string = 'pageOne:right-reentry:6';
        const path8: NavPathInfo = new NavPathInfo('pageOne', parameter8);
        other.pushPath(path8, false);
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:left-tail:5"');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:initial:1"');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:initial:1"]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:5"]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0004', 'other step 8 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-reentry:6"');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-reentry:6"]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state parameters(pageThree)=' + JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state indexes(pageThree)=' + JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'other step 8 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const popped9: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop returned undefined=' + JSON.stringify(popped9 === undefined));
        expect(popped9 === undefined).assertEqual(false);
        if (popped9 !== undefined) {
          logCase('testNavIsolationSequence0004', 'stack step 9 pop returned name=' + JSON.stringify(popped9.name));
          expect(popped9.name).assertEqual('pageOne');
          logCase('testNavIsolationSequence0004',
            'stack step 9 pop returned parameter=' + JSON.stringify(popped9.param));
          expect(JSON.stringify(popped9.param)).assertEqual('"pageOne:initial:1"');
        }
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageTwo"]');
        logCase('testNavIsolationSequence0004', 'stack step 9 pop final size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageTwo:left-tail:5"');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:5"]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-reentry:6"');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-reentry:6"]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0004',
          'stack step 9 pop final other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVISOLATIONSEQUENCE_0005
     * @tc.name testNavIsolationSequence0005
     * @tc.desc SDK dependency: NavPathStack; left replacement cannot alter right same-name parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavIsolationSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const stack: NavPathStack = new NavPathStack();
        const other: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:left-root:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        stack.pushPath(path1, false);
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0005', 'stack step 1 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(0);
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 1 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(0) === undefined));
        expect(other.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter2: string = 'pageOne:right-root:2';
        const path2: NavPathInfo = new NavPathInfo('pageOne', parameter2);
        other.pushPath(path2, false);
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0005', 'other step 2 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 2 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter3: string = 'pageTwo:initial:3';
        const path3: NavPathInfo = new NavPathInfo('pageTwo', parameter3);
        other.pushPath(path3, false);
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0005', 'other step 3 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:left-tail:4';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        stack.pushPath(path4, false);
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0005', 'stack step 4 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageTwo:left-tail:4"');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:1"]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('["pageTwo:left-tail:4"]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 4 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter5: string = 'pageOne:left-replaced:5';
        const path5: NavPathInfo = new NavPathInfo('pageOne', parameter5);
        stack.replacePath(path5, false);
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavIsolationSequence0005', 'stack step 5 replacePath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:left-replaced:5"');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:left-root:1","pageOne:left-replaced:5"]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 5 replacePath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const result6: number = other.moveToTop('pageOne', false);
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop returned count/index=' + JSON.stringify(result6));
        expect(result6).assertEqual(0);
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne","pageOne"]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:1"');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack parameter[1]=' + JSON.stringify(stack.getParamByIndex(1)));
        expect(JSON.stringify(stack.getParamByIndex(1))).assertEqual('"pageOne:left-replaced:5"');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual(
          '["pageOne:left-root:1","pageOne:left-replaced:5"]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0,1]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(2) === undefined));
        expect(stack.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0005', 'other step 6 moveToTop state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 6 moveToTop state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const result7: number = stack.removeByName('pageOne');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName returned count/index=' + JSON.stringify(result7));
        expect(result7).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0005', 'stack step 7 removeByName state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state parameters(pageTwo)=' + JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageOne"]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageOne:right-root:2"');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:2"]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'stack step 7 removeByName state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        const parameter8: string = 'pageThree:name-replacement:6';
        other.replacePathByName('pageThree', parameter8, false);
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack parameters(pageTwo)=' +
          JSON.stringify(stack.getParamByName('pageTwo')));
        expect(JSON.stringify(stack.getParamByName('pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageTwo'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageTwo","pageThree"]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageThree:name-replacement:6"');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final parameters(pageTwo)=' +
          JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final indexes(pageTwo)=' +
          JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final parameters(pageThree)=' +
          JSON.stringify(other.getParamByName('pageThree')));
        expect(JSON.stringify(other.getParamByName('pageThree'))).assertEqual('["pageThree:name-replacement:6"]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final indexes(pageThree)=' +
          JSON.stringify(getSortedIndexes(other, 'pageThree')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageThree'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0005',
          'other step 8 replacePathByName final first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
      });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_NAVISOLATIONSEQUENCE_0006
     * @tc.name testNavIsolationSequence0006
     * @tc.desc SDK dependency: NavPathStack; left empty pop cannot consume right singleton before independent restore
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testNavIsolationSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const other: NavPathStack = new NavPathStack();
        const stack: NavPathStack = new NavPathStack();
        const parameter1: string = 'pageOne:right-root:1';
        const path1: NavPathInfo = new NavPathInfo('pageOne', parameter1);
        other.pushPath(path1, false);
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0006', 'other step 1 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:1"');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:1"]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 1 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const popped2: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop returned undefined=' + JSON.stringify(popped2 === undefined));
        expect(popped2 === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:1"');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:1"]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0006', 'stack step 2 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 2 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const parameter3: string = 'pageOne:left-root:2';
        const path3: NavPathInfo = new NavPathInfo('pageOne', parameter3);
        stack.pushPath(path3, false);
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:1"');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other parameters(pageOne)=' +
          JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:1"]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(1) === undefined));
        expect(other.getParamByIndex(1) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0006', 'stack step 3 pushPath state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:2"');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:2"]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 3 pushPath state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const parameter4: string = 'pageTwo:initial:3';
        const path4: NavPathInfo = new NavPathInfo('pageTwo', parameter4);
        other.pushPath(path4, false);
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0006', 'other step 4 pushPath state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:1"');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:1"]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state parameters(missingPage)=' + JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(1);
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack parameter[0]=' + JSON.stringify(stack.getParamByIndex(0)));
        expect(JSON.stringify(stack.getParamByIndex(0))).assertEqual('"pageOne:left-root:2"');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack parameters(pageOne)=' +
          JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('["pageOne:left-root:2"]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack indexes(pageOne)=' +
          JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack parameters(missingPage)=' +
          JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'other step 4 pushPath state other=stack first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(1) === undefined));
        expect(stack.getParamByIndex(1) === undefined).assertEqual(true);
        const popped5: NavPathInfo | undefined = stack.pop(false);
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop returned undefined=' + JSON.stringify(popped5 === undefined));
        expect(popped5 === undefined).assertEqual(false);
        if (popped5 !== undefined) {
          logCase('testNavIsolationSequence0006', 'stack step 5 pop returned name=' + JSON.stringify(popped5.name));
          expect(popped5.name).assertEqual('pageOne');
          logCase('testNavIsolationSequence0006',
            'stack step 5 pop returned parameter=' + JSON.stringify(popped5.param));
          expect(JSON.stringify(popped5.param)).assertEqual('"pageOne:left-root:2"');
        }
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne","pageTwo"]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(2);
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:1"');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other parameter[1]=' + JSON.stringify(other.getParamByIndex(1)));
        expect(JSON.stringify(other.getParamByIndex(1))).assertEqual('"pageTwo:initial:3"');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:1"]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other indexes(pageOne)=' + JSON.stringify(getSortedIndexes(other, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageOne'))).assertEqual('[0]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other parameters(pageTwo)=' + JSON.stringify(other.getParamByName('pageTwo')));
        expect(JSON.stringify(other.getParamByName('pageTwo'))).assertEqual('["pageTwo:initial:3"]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other indexes(pageTwo)=' + JSON.stringify(getSortedIndexes(other, 'pageTwo')));
        expect(JSON.stringify(getSortedIndexes(other, 'pageTwo'))).assertEqual('[1]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other parameters(missingPage)=' +
          JSON.stringify(other.getParamByName('missingPage')));
        expect(JSON.stringify(other.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other indexes(missingPage)=' +
          JSON.stringify(getSortedIndexes(other, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(other, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state other=other first-out-of-range undefined=' +
          JSON.stringify(other.getParamByIndex(2) === undefined));
        expect(other.getParamByIndex(2) === undefined).assertEqual(true);
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state order=' + JSON.stringify(stack.getAllPathName()));
        expect(JSON.stringify(stack.getAllPathName())).assertEqual('[]');
        logCase('testNavIsolationSequence0006', 'stack step 5 pop state size=' + JSON.stringify(stack.size()));
        expect(stack.size()).assertEqual(0);
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state parameters(pageOne)=' + JSON.stringify(stack.getParamByName('pageOne')));
        expect(JSON.stringify(stack.getParamByName('pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state indexes(pageOne)=' + JSON.stringify(getSortedIndexes(stack, 'pageOne')));
        expect(JSON.stringify(getSortedIndexes(stack, 'pageOne'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state parameters(missingPage)=' + JSON.stringify(stack.getParamByName('missingPage')));
        expect(JSON.stringify(stack.getParamByName('missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state indexes(missingPage)=' + JSON.stringify(getSortedIndexes(stack, 'missingPage')));
        expect(JSON.stringify(getSortedIndexes(stack, 'missingPage'))).assertEqual('[]');
        logCase('testNavIsolationSequence0006',
          'stack step 5 pop state first-out-of-range undefined=' +
          JSON.stringify(stack.getParamByIndex(0) === undefined));
        expect(stack.getParamByIndex(0) === undefined).assertEqual(true);
        const popped6: NavPathInfo | undefined = other.pop(false);
        logCase('testNavIsolationSequence0006',
          'other step 6 pop returned undefined=' + JSON.stringify(popped6 === undefined));
        expect(popped6 === undefined).assertEqual(false);
        if (popped6 !== undefined) {
          logCase('testNavIsolationSequence0006', 'other step 6 pop returned name=' + JSON.stringify(popped6.name));
          expect(popped6.name).assertEqual('pageTwo');
          logCase('testNavIsolationSequence0006',
            'other step 6 pop returned parameter=' + JSON.stringify(popped6.param));
          expect(JSON.stringify(popped6.param)).assertEqual('"pageTwo:initial:3"');
        }
        logCase('testNavIsolationSequence0006',
          'other step 6 pop state order=' + JSON.stringify(other.getAllPathName()));
        expect(JSON.stringify(other.getAllPathName())).assertEqual('["pageOne"]');
        logCase('testNavIsolationSequence0006', 'other step 6 pop state size=' + JSON.stringify(other.size()));
        expect(other.size()).assertEqual(1);
        logCase('testNavIsolationSequence0006',
          'other step 6 pop state parameter[0]=' + JSON.stringify(other.getParamByIndex(0)));
        expect(JSON.stringify(other.getParamByIndex(0))).assertEqual('"pageOne:right-root:1"');
        logCase('testNavIsolationSequence0006',
          'other step 6 pop state parameters(pageOne)=' + JSON.stringify(other.getParamByName('pageOne')));
        expect(JSON.stringify(other.getParamByName('pageOne'))).assertEqual('["pageOne:right-root:1"]');
        logCase('testNavIsolationSequence0006',
