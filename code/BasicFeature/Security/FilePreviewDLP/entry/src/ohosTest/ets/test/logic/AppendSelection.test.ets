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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { appendSelection } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for appendSelection (64 cases). */
export default function appendSelectionTest(): void {
  describe('AppendSelectionTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0001
     * @tc.name      FilePreviewDLP_AppendSelection_0001
     * @tc.desc      appendSelection(current=[], selected=[]) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_AppendSelection_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppendSelection_0001 begin`);
      const actual: string[] = appendSelection([], []);
      logInfo(`appendSelection(current=[], selected=[]): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}AppendSelection_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0002
     * @tc.name      FilePreviewDLP_AppendSelection_0002
     * @tc.desc      appendSelection(current=[], selected=[""]) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_AppendSelection_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AppendSelection_0002 begin`);
      const actual: string[] = appendSelection([], ['']);
      logInfo(`appendSelection(current=[], selected=[""]): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`appendSelection(current=[], selected=[""]): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}AppendSelection_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0003
     * @tc.name      FilePreviewDLP_AppendSelection_0003
     * @tc.desc      appendSelection(current=[], selected=["", "a"]) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0003 begin`);
      const actual: string[] = appendSelection([], ['', 'a']);
      logInfo(`appendSelection(current=[], selected=["",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`appendSelection(current=[], selected=["",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AppendSelection_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0004
     * @tc.name      FilePreviewDLP_AppendSelection_0004
     * @tc.desc      appendSelection(current=[], selected=["a", "", "abc"]) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0004 begin`);
      const actual: string[] = appendSelection([], ['a', '', 'abc']);
      logInfo(`appendSelection(current=[], selected=["a"...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`appendSelection(current=[], selected=["a"...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0005
     * @tc.name      FilePreviewDLP_AppendSelection_0005
     * @tc.desc      appendSelection(current=[], selected=["abc", "abc"]) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0005 begin`);
      const actual: string[] = appendSelection([], ['abc', 'abc']);
      logInfo(`appendSelection(current=[], selected=["ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`appendSelection(current=[], selected=["ab...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0006
     * @tc.name      FilePreviewDLP_AppendSelection_0006
     * @tc.desc      appendSelection(current=[], selected=["", "a", "abc", "Hello World", " "]) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0006 begin`);
      const actual: string[] = appendSelection([], ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`appendSelection(current=[], selected=["",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=[], selected=["",...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0007
     * @tc.name      FilePreviewDLP_AppendSelection_0007
     * @tc.desc      appendSelection(current=[], selected=["Hello World", "a", " ", "a", "123"]) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0007 begin`);
      const actual: string[] = appendSelection([], ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`appendSelection(current=[], selected=["He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=[], selected=["He...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0008
     * @tc.name      FilePreviewDLP_AppendSelection_0008
     * @tc.desc      appendSelection(current=[], selected=["123", " ", "Hello World", "abc", "a", ""]) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0008 begin`);
      const actual: string[] = appendSelection([], ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`appendSelection(current=[], selected=["12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=[], selected=["12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0009
     * @tc.name      FilePreviewDLP_AppendSelection_0009
     * @tc.desc      appendSelection(current=[""], selected=[""]) returns ["",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0009 begin`);
      const actual: string[] = appendSelection([''], ['']);
      logInfo(`appendSelection(current=[""], selected=[""]): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`appendSelection(current=[""], selected=[""]): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["",""]');
      logInfo(`${BUNDLE}AppendSelection_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0010
     * @tc.name      FilePreviewDLP_AppendSelection_0010
     * @tc.desc      appendSelection(current=[""], selected=["", "a"]) returns ["","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0010 begin`);
      const actual: string[] = appendSelection([''], ['', 'a']);
      logInfo(`appendSelection(current=[""], selected=["...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`appendSelection(current=[""], selected=["...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0011
     * @tc.name      FilePreviewDLP_AppendSelection_0011
     * @tc.desc      appendSelection(current=[""], selected=["a", "", "abc"]) returns ["","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0011 begin`);
      const actual: string[] = appendSelection([''], ['a', '', 'abc']);
      logInfo(`appendSelection(current=[""], selected=["...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`appendSelection(current=[""], selected=["...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0012
     * @tc.name      FilePreviewDLP_AppendSelection_0012
     * @tc.desc      appendSelection(current=[""], selected=["abc", "abc"]) returns ["","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0012 begin`);
      const actual: string[] = appendSelection([''], ['abc', 'abc']);
      logInfo(`appendSelection(current=[""], selected=["...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`appendSelection(current=[""], selected=["...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0013
     * @tc.name      FilePreviewDLP_AppendSelection_0013
     * @tc.desc      appendSelection(current=[""], selected=["", "a", "abc", "Hello World", " "]) returns ["","","a",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0013 begin`);
      const actual: string[] = appendSelection([''], ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`appendSelection(current=[""], selected=["...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=[""], selected=["...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0014
     * @tc.name      FilePreviewDLP_AppendSelection_0014
     * @tc.desc      appendSelection(current=[""], selected=["Hello World", "a", " ", "a", "123"]) returns ["","Hello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0014 begin`);
      const actual: string[] = appendSelection([''], ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`appendSelection(current=[""], selected=["...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=[""], selected=["...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0015
     * @tc.name      FilePreviewDLP_AppendSelection_0015
     * @tc.desc      appendSelection(current=[""], selected=["123", " ", "Hello World", "abc", "a", ""]) returns ["",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0015 begin`);
      const actual: string[] = appendSelection([''], ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`appendSelection(current=[""], selected=["...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=[""], selected=["...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0016
     * @tc.name      FilePreviewDLP_AppendSelection_0016
     * @tc.desc      appendSelection(current=["", "a"], selected=[""]) returns ["","a",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0016 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0017
     * @tc.name      FilePreviewDLP_AppendSelection_0017
     * @tc.desc      appendSelection(current=["", "a"], selected=["", "a"]) returns ["","a","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0017 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['', 'a']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0018
     * @tc.name      FilePreviewDLP_AppendSelection_0018
     * @tc.desc      appendSelection(current=["", "a"], selected=["a", "", "abc"]) returns ["","a","a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0018 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['a', '', 'abc']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0019
     * @tc.name      FilePreviewDLP_AppendSelection_0019
     * @tc.desc      appendSelection(current=["", "a"], selected=["abc", "abc"]) returns ["","a","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0019 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['abc', 'abc']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0020
     * @tc.name      FilePreviewDLP_AppendSelection_0020
     * @tc.desc      appendSelection(current=["", "a"], selected=["", "a", "abc", "Hello World", " "]) returns ["","a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0020 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0021
     * @tc.name      FilePreviewDLP_AppendSelection_0021
     * @tc.desc      appendSelection(current=["", "a"], selected=["Hello World", "a", " ", "a", "123"]) returns ["","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0021 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0022
     * @tc.name      FilePreviewDLP_AppendSelection_0022
     * @tc.desc      appendSelection(current=["", "a"], selected=["123", " ", "Hello World", "abc", "a", ""]) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0022 begin`);
      const actual: string[] = appendSelection(['', 'a'], ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0023
     * @tc.name      FilePreviewDLP_AppendSelection_0023
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=[""]) returns ["a","","abc",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0023 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc",""]');
      logInfo(`${BUNDLE}AppendSelection_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0024
     * @tc.name      FilePreviewDLP_AppendSelection_0024
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=["", "a"]) returns ["a","","abc","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0024 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['', 'a']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0025
     * @tc.name      FilePreviewDLP_AppendSelection_0025
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=["a", "", "abc"]) returns ["a","","abc","a","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0025 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['a', '', 'abc']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0026
     * @tc.name      FilePreviewDLP_AppendSelection_0026
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=["abc", "abc"]) returns ["a","","abc","abc","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0026 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['abc', 'abc']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0027
     * @tc.name      FilePreviewDLP_AppendSelection_0027
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=["", "a", "abc", "Hello World", " "]) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0027 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0028
     * @tc.name      FilePreviewDLP_AppendSelection_0028
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=["Hello World", "a", " ", "a", "123"]) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0028 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0029
     * @tc.name      FilePreviewDLP_AppendSelection_0029
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=["123", " ", "Hello World", "abc", "a", ""]) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0029 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0030
     * @tc.name      FilePreviewDLP_AppendSelection_0030
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=[""]) returns ["abc","abc",""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0030 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc",""]');
      logInfo(`${BUNDLE}AppendSelection_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0031
     * @tc.name      FilePreviewDLP_AppendSelection_0031
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=["", "a"]) returns ["abc","abc","","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0031 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['', 'a']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0032
     * @tc.name      FilePreviewDLP_AppendSelection_0032
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=["a", "", "abc"]) returns ["abc","abc","a","","...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0032 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['a', '', 'abc']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0033
     * @tc.name      FilePreviewDLP_AppendSelection_0033
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=["abc", "abc"]) returns ["abc","abc","abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0033 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['abc', 'abc']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0034
     * @tc.name      FilePreviewDLP_AppendSelection_0034
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=["", "a", "abc", "Hello World", " "]) returns [...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0034 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0035
     * @tc.name      FilePreviewDLP_AppendSelection_0035
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=["Hello World", "a", " ", "a", "123"]) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0035 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0036
     * @tc.name      FilePreviewDLP_AppendSelection_0036
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=["123", " ", "Hello World", "abc", "a", ""]) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0036 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0037
     * @tc.name      FilePreviewDLP_AppendSelection_0037
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=[""]) returns ["","a","ab...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0037 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," ",""]');
      logInfo(`${BUNDLE}AppendSelection_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0038
     * @tc.name      FilePreviewDLP_AppendSelection_0038
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=["", "a"]) returns ["","a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0038 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['', 'a']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," ","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0039
     * @tc.name      FilePreviewDLP_AppendSelection_0039
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=["a", "", "abc"]) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0039 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['a', '', 'abc']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," ","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0040
     * @tc.name      FilePreviewDLP_AppendSelection_0040
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=["abc", "abc"]) returns [...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0040 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['abc', 'abc']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," ","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0041
     * @tc.name      FilePreviewDLP_AppendSelection_0041
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=["", "a", "abc", "Hello W...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0041 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['', 'a', 'abc', 'Hello World',
        ' ']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," ","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0042
     * @tc.name      FilePreviewDLP_AppendSelection_0042
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=["Hello World", "a", " ",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0042 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['Hello World', 'a', ' ', 'a',
        '123']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," ","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0043
     * @tc.name      FilePreviewDLP_AppendSelection_0043
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=["123", " ", "Hello World...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0043 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], ['123', ' ', 'Hello World', 'abc',
        'a', '']);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual))
        .assertEqual('["","a","abc","Hello World"," ","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0044
     * @tc.name      FilePreviewDLP_AppendSelection_0044
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=[""]) returns ["Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0044 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123",""]');
      logInfo(`${BUNDLE}AppendSelection_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0045
     * @tc.name      FilePreviewDLP_AppendSelection_0045
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=["", "a"]) returns ["Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0045 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['', 'a']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0046
     * @tc.name      FilePreviewDLP_AppendSelection_0046
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=["a", "", "abc"]) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0046 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['a', '', 'abc']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0047
     * @tc.name      FilePreviewDLP_AppendSelection_0047
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=["abc", "abc"]) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0047 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['abc', 'abc']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0048
     * @tc.name      FilePreviewDLP_AppendSelection_0048
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=["", "a", "abc", "Hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0048 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['', 'a', 'abc', 'Hello World',
        ' ']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0049
     * @tc.name      FilePreviewDLP_AppendSelection_0049
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=["Hello World", "a", " "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0049 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['Hello World', 'a', ' ', 'a',
        '123']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0050
     * @tc.name      FilePreviewDLP_AppendSelection_0050
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=["123", " ", "Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0050 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], ['123', ' ', 'Hello World', 'abc',
        'a', '']);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual))
        .assertEqual('["Hello World","a"," ","a","123","123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0051
     * @tc.name      FilePreviewDLP_AppendSelection_0051
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=[""]) returns ["12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0051 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a","",""]');
      logInfo(`${BUNDLE}AppendSelection_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0052
     * @tc.name      FilePreviewDLP_AppendSelection_0052
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=["", "a"]) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0052 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['', 'a']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a","","","a"]');
      logInfo(`${BUNDLE}AppendSelection_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0053
     * @tc.name      FilePreviewDLP_AppendSelection_0053
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=["a", "", "abc"]) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0053 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['a', '', 'abc']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a","","a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0054
     * @tc.name      FilePreviewDLP_AppendSelection_0054
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=["abc", "abc"]) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0054 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['abc', 'abc']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a","","abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0055
     * @tc.name      FilePreviewDLP_AppendSelection_0055
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=["", "a", "abc", "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0055 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['', 'a', 'abc',
        'Hello World', ' ']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual))
        .assertEqual('["123"," ","Hello World","abc","a","","","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0056
     * @tc.name      FilePreviewDLP_AppendSelection_0056
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=["Hello World", "a...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0056 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['Hello World', 'a', ' ',
        'a', '123']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual))
        .assertEqual('["123"," ","Hello World","abc","a","","Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0057
     * @tc.name      FilePreviewDLP_AppendSelection_0057
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=["123", " ", "Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_AppendSelection_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AppendSelection_0057 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], ['123', ' ', 'Hello World',
        'abc', 'a', '']);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 8))}`);
      expect(JSON.stringify(actual.slice(0, 8))).assertEqual('["123"," ","Hello World","abc","a","","123"," "]');
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(...${JSON.stringify(actual.slice(8, 12))}`);
      expect(JSON.stringify(actual.slice(8, 12))).assertEqual('["Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0058
     * @tc.name      FilePreviewDLP_AppendSelection_0058
     * @tc.desc      appendSelection(current=[""], selected=[]) returns [""]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0058 begin`);
      const actual: string[] = appendSelection([''], []);
      logInfo(`appendSelection(current=[""], selected=[]): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`appendSelection(current=[""], selected=[]): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[""]');
      logInfo(`${BUNDLE}AppendSelection_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0059
     * @tc.name      FilePreviewDLP_AppendSelection_0059
     * @tc.desc      appendSelection(current=["", "a"], selected=[]) returns ["","a"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0059 begin`);
      const actual: string[] = appendSelection(['', 'a'], []);
      logInfo(`appendSelection(current=["", "a"], select...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`appendSelection(current=["", "a"], select...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AppendSelection_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0060
     * @tc.name      FilePreviewDLP_AppendSelection_0060
     * @tc.desc      appendSelection(current=["a", "", "abc"], selected=[]) returns ["a","","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0060 begin`);
      const actual: string[] = appendSelection(['a', '', 'abc'], []);
      logInfo(`appendSelection(current=["a", "", "abc"],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`appendSelection(current=["a", "", "abc"],...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0061
     * @tc.name      FilePreviewDLP_AppendSelection_0061
     * @tc.desc      appendSelection(current=["abc", "abc"], selected=[]) returns ["abc","abc"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0061 begin`);
      const actual: string[] = appendSelection(['abc', 'abc'], []);
      logInfo(`appendSelection(current=["abc", "abc"], s...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`appendSelection(current=["abc", "abc"], s...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AppendSelection_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0062
     * @tc.name      FilePreviewDLP_AppendSelection_0062
     * @tc.desc      appendSelection(current=["", "a", "abc", "Hello World", " "], selected=[]) returns ["","a","abc"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0062 begin`);
      const actual: string[] = appendSelection(['', 'a', 'abc', 'Hello World', ' '], []);
      logInfo(`appendSelection(current=["", "a", "abc", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=["", "a", "abc", ...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AppendSelection_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0063
     * @tc.name      FilePreviewDLP_AppendSelection_0063
     * @tc.desc      appendSelection(current=["Hello World", "a", " ", "a", "123"], selected=[]) returns ["Hello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0063 begin`);
      const actual: string[] = appendSelection(['Hello World', 'a', ' ', 'a', '123'], []);
      logInfo(`appendSelection(current=["Hello World", "...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`appendSelection(current=["Hello World", "...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AppendSelection_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_APPEND_SELECTION_0064
     * @tc.name      FilePreviewDLP_AppendSelection_0064
     * @tc.desc      appendSelection(current=["123", " ", "Hello World", "abc", "a", ""], selected=[]) returns ["123"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_AppendSelection_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}AppendSelection_0064 begin`);
      const actual: string[] = appendSelection(['123', ' ', 'Hello World', 'abc', 'a', ''], []);
      logInfo(`appendSelection(current=["123", " ", "Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`appendSelection(current=["123", " ", "Hel...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AppendSelection_0064 end`);
    });
  });
}
