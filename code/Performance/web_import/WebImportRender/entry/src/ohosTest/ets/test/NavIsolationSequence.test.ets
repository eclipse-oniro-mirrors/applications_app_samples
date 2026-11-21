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
