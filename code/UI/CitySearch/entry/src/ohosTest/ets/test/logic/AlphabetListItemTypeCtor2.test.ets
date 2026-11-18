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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AlphabetListItemType } from '../../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new AlphabetListItemType (36 cases). */
export default function alphabetListItemTypeCtor2Test(): void {
  describe('AlphabetListItemTypeCtor2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0082
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0082
     * @tc.desc      new AlphabetListItemType("AA", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0082 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('AA', ['']);
      logInfo(`new AlphabetListItemType("AA", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('AA');
      logInfo(`new AlphabetListItemType("AA", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType("AA", [""]): JSON.stringify(subject.dat...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0083
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0083
     * @tc.desc      new AlphabetListItemType("HelloHello", ["Hello World", "a", " ", "a", "123"]) initialises 3 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0083 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('HelloHello', ['Hello World', 'a', ' ', 'a',
        '123']);
      logInfo(`new AlphabetListItemType("HelloHello", ["...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('HelloHello');
      logInfo(`new AlphabetListItemType("HelloHello", ["...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("HelloHello", ["...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0084
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0084
     * @tc.desc      new AlphabetListItemType("Sample Title 123", ["", "a", "abc", "Hello World", " "]) initialises 3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0084 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Sample Title 123', ['', 'a', 'abc', 'Hello World',
        ' ']);
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Sample Title 12...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0085
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0085
     * @tc.desc      new AlphabetListItemType("HelloHello", ["123", " ", "Hello World", "abc", "a", ""]) initialises ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0085 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('HelloHello', ['123', ' ', 'Hello World', 'abc',
        'a', '']);
      logInfo(`new AlphabetListItemType("HelloHello", ["...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('HelloHello');
      logInfo(`new AlphabetListItemType("HelloHello", ["...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("HelloHello", ["...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0086
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0086
     * @tc.desc      new AlphabetListItemType("Hello_1", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0086 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello_1', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("Hello_1", ["abc...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello_1');
      logInfo(`new AlphabetListItemType("Hello_1", ["abc...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("Hello_1", ["abc...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0087
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0087
     * @tc.desc      new AlphabetListItemType(" Hello ", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0087 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Hello ', ['']);
      logInfo(`new AlphabetListItemType(" Hello ", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Hello ');
      logInfo(`new AlphabetListItemType(" Hello ", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType(" Hello ", [""]): JSON.stringify(subjec...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0088
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0088
     * @tc.desc      new AlphabetListItemType("Hello World_1", ["123", " ", "Hello World", "abc", "a", ""]) initialis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0088 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello World_1', ['123', ' ', 'Hello World', 'abc',
        'a', '']);
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello World_1');
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("Hello World_1",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0089
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0089
     * @tc.desc      new AlphabetListItemType(" a ", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0089 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' a ', ['123', ' ', 'Hello World', 'abc', 'a',
        '']);
      logInfo(`new AlphabetListItemType(" a ", ["123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' a ');
      logInfo(`new AlphabetListItemType(" a ", ["123", "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType(" a ", ["123", "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0090
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0090
     * @tc.desc      new AlphabetListItemType("hello worldhello world", ["123", " ", "Hello World", "abc", "a", ""]) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0090 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('hello worldhello world', ['123', ' ',
        'Hello World', 'abc', 'a', '']);
      logInfo(`new AlphabetListItemType("hello worldhell...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello worldhello world');
      logInfo(`new AlphabetListItemType("hello worldhell...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("hello worldhell...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0091
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0091
     * @tc.desc      new AlphabetListItemType("xHello", ["Hello World", "a", " ", "a", "123"]) initialises 3 public m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0091 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xHello', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("xHello", ["Hell...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xHello');
      logInfo(`new AlphabetListItemType("xHello", ["Hell...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("xHello", ["Hell...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0092
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0092
     * @tc.desc      new AlphabetListItemType("A_1", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0092 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A_1', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("A_1", ["a", "",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A_1');
      logInfo(`new AlphabetListItemType("A_1", ["a", "",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("A_1", ["a", "",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0093
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0093
     * @tc.desc      new AlphabetListItemType("xhello world", ["123", " ", "Hello World", "abc", "a", ""]) initialise...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0093 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xhello world', ['123', ' ', 'Hello World', 'abc',
        'a', '']);
      logInfo(`new AlphabetListItemType("xhello world", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xhello world');
      logInfo(`new AlphabetListItemType("xhello world", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("xhello world", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0094
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0094
     * @tc.desc      new AlphabetListItemType("abc_1", ["", "a", "abc", "Hello World", " "]) initialises 3 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0094 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('abc_1', ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`new AlphabetListItemType("abc_1", ["", "a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('abc_1');
      logInfo(`new AlphabetListItemType("abc_1", ["", "a...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("abc_1", ["", "a...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0095
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0095
     * @tc.desc      new AlphabetListItemType(" _1", ["Hello World", "a", " ", "a", "123"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0095 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' _1', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType(" _1", ["Hello W...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' _1');
      logInfo(`new AlphabetListItemType(" _1", ["Hello W...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType(" _1", ["Hello W...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0096
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0096
     * @tc.desc      new AlphabetListItemType("??_1", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 publ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0096 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587_1', ['123', ' ', 'Hello World',
        'abc', 'a', '']);
      logInfo(`new AlphabetListItemType("??_1", ["123", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587_1');
      logInfo(`new AlphabetListItemType("??_1", ["123", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("??_1", ["123", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0097
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0097
     * @tc.desc      new AlphabetListItemType("Hello_1", ["Hello World", "a", " ", "a", "123"]) initialises 3 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0097 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello_1', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("Hello_1", ["Hel...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello_1');
      logInfo(`new AlphabetListItemType("Hello_1", ["Hel...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Hello_1", ["Hel...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0098
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0098
     * @tc.desc      new AlphabetListItemType("xhello world", ["", "a", "abc", "Hello World", " "]) initialises 3 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0098 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xhello world', ['', 'a', 'abc', 'Hello World',
        ' ']);
      logInfo(`new AlphabetListItemType("xhello world", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xhello world');
      logInfo(`new AlphabetListItemType("xhello world", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("xhello world", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0099
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0099
     * @tc.desc      new AlphabetListItemType(" Hello ", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0099 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Hello ', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType(" Hello ", ["a",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Hello ');
      logInfo(`new AlphabetListItemType(" Hello ", ["a",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType(" Hello ", ["a",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0100
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0100
     * @tc.desc      new AlphabetListItemType("a_1", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0100 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('a_1', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("a_1", ["abc", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('a_1');
      logInfo(`new AlphabetListItemType("a_1", ["abc", "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("a_1", ["abc", "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0101
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0101
     * @tc.desc      new AlphabetListItemType(" _1", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0101 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' _1', ['']);
      logInfo(`new AlphabetListItemType(" _1", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' _1');
      logInfo(`new AlphabetListItemType(" _1", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType(" _1", [""]): JSON.stringify(subject.da...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0102
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0102
     * @tc.desc      new AlphabetListItemType("x??", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0102 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('x\u4e2d\u6587', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("x??", ["a", "",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('x\u4e2d\u6587');
      logInfo(`new AlphabetListItemType("x??", ["a", "",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("x??", ["a", "",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0103
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0103
     * @tc.desc      new AlphabetListItemType("xhello world", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0103 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xhello world', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("xhello world", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xhello world');
      logInfo(`new AlphabetListItemType("xhello world", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("xhello world", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0104
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0104
     * @tc.desc      new AlphabetListItemType("????", ["Hello World", "a", " ", "a", "123"]) initialises 3 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0104 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587\u4e2d\u6587', ['Hello World', 'a',
        ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("????", ["Hello ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new AlphabetListItemType("????", ["Hello ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("????", ["Hello ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0105
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0105
     * @tc.desc      new AlphabetListItemType("Hello WorldHello World", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0105 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello WorldHello World', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("Hello WorldHell...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello WorldHello World');
      logInfo(`new AlphabetListItemType("Hello WorldHell...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("Hello WorldHell...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0106
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0106
     * @tc.desc      new AlphabetListItemType("x??", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0106 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('x\u4e2d\u6587', ['']);
      logInfo(`new AlphabetListItemType("x??", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('x\u4e2d\u6587');
      logInfo(`new AlphabetListItemType("x??", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType("x??", [""]): JSON.stringify(subject.da...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0107
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0107
     * @tc.desc      new AlphabetListItemType("xHello World", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0107 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xHello World', ['']);
      logInfo(`new AlphabetListItemType("xHello World", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xHello World');
      logInfo(`new AlphabetListItemType("xHello World", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType("xHello World", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0108
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0108
     * @tc.desc      new AlphabetListItemType(" A ", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 publi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0108 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' A ', ['123', ' ', 'Hello World', 'abc', 'a',
        '']);
      logInfo(`new AlphabetListItemType(" A ", ["123", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' A ');
      logInfo(`new AlphabetListItemType(" A ", ["123", "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType(" A ", ["123", "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0109
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0109
     * @tc.desc      new AlphabetListItemType("AA", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0109 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('AA', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("AA", ["a", "", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('AA');
      logInfo(`new AlphabetListItemType("AA", ["a", "", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("AA", ["a", "", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0110
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0110
     * @tc.desc      new AlphabetListItemType("A_1", ["", "a", "abc", "Hello World", " "]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0110 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A_1', ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`new AlphabetListItemType("A_1", ["", "a",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A_1');
      logInfo(`new AlphabetListItemType("A_1", ["", "a",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("A_1", ["", "a",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0111
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0111
     * @tc.desc      new AlphabetListItemType("xA", ["Hello World", "a", " ", "a", "123"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0111 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xA', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("xA", ["Hello Wo...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xA');
      logInfo(`new AlphabetListItemType("xA", ["Hello Wo...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("xA", ["Hello Wo...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0112
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0112
     * @tc.desc      new AlphabetListItemType("A", ["", "a"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0112 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A', ['', 'a']);
      logInfo(`new AlphabetListItemType("A", ["", "a"]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new AlphabetListItemType("A", ["", "a"]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("A", ["", "a"]): JSON.stringify(subject...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0113
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0113
     * @tc.desc      new AlphabetListItemType(" Hello World ", ["", "a"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0113 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Hello World ', ['', 'a']);
      logInfo(`new AlphabetListItemType(" Hello World ",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Hello World ');
      logInfo(`new AlphabetListItemType(" Hello World ",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType(" Hello World ",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0114
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0114
     * @tc.desc      new AlphabetListItemType("123", ["Hello World", "a", " ", "a", "123"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0114 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('123', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("123", ["Hello W...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('123');
      logInfo(`new AlphabetListItemType("123", ["Hello W...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("123", ["Hello W...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0115
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0115
     * @tc.desc      new AlphabetListItemType("Hello World", ["Hello World", "a", " ", "a", "123"]) initialises 3 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0115 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello World', ['Hello World', 'a', ' ', 'a',
        '123']);
      logInfo(`new AlphabetListItemType("Hello World", [...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello World');
      logInfo(`new AlphabetListItemType("Hello World", [...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Hello World", [...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0116
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0116
     * @tc.desc      new AlphabetListItemType("xA", ["", "a", "abc", "Hello World", " "]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0116 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xA', ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`new AlphabetListItemType("xA", ["", "a", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xA');
      logInfo(`new AlphabetListItemType("xA", ["", "a", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("xA", ["", "a", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0117
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0117
     * @tc.desc      new AlphabetListItemType("AA", ["", "a"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0117 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('AA', ['', 'a']);
      logInfo(`new AlphabetListItemType("AA", ["", "a"]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('AA');
      logInfo(`new AlphabetListItemType("AA", ["", "a"]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("AA", ["", "a"]): JSON.stringify(subjec...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0117 end`);
    });
  });
}
