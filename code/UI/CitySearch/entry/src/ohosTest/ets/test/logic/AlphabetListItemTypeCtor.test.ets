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

/** Logic checks for new AlphabetListItemType (81 cases). */
export default function alphabetListItemTypeCtorTest(): void {
  describe('AlphabetListItemTypeCtorTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0001
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0001
     * @tc.desc      new AlphabetListItemType("Hello", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_AlphabetListItemTypeCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0001 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', []);
      logInfo(`new AlphabetListItemType("Hello", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0002
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0002
     * @tc.desc      new AlphabetListItemType("hello world", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_AlphabetListItemTypeCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0002 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('hello world', []);
      logInfo(`new AlphabetListItemType("hello world", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new AlphabetListItemType("hello world", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0003
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0003
     * @tc.desc      new AlphabetListItemType("", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0003 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('', []);
      logInfo(`new AlphabetListItemType("", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('');
      logInfo(`new AlphabetListItemType("", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0004
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0004
     * @tc.desc      new AlphabetListItemType(" ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0004 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' ', []);
      logInfo(`new AlphabetListItemType(" ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new AlphabetListItemType(" ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0005
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0005
     * @tc.desc      new AlphabetListItemType("A", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0005 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A', []);
      logInfo(`new AlphabetListItemType("A", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new AlphabetListItemType("A", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0006
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0006
     * @tc.desc      new AlphabetListItemType("Sample Title 123", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0006 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Sample Title 123', []);
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123');
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0007
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0007
     * @tc.desc      new AlphabetListItemType("??", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0007 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587', []);
      logInfo(`new AlphabetListItemType("??", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587');
      logInfo(`new AlphabetListItemType("??", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0008
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0008
     * @tc.desc      new AlphabetListItemType("a", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0008 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('a', []);
      logInfo(`new AlphabetListItemType("a", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('a');
      logInfo(`new AlphabetListItemType("a", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0009
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0009
     * @tc.desc      new AlphabetListItemType("abc", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0009 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('abc', []);
      logInfo(`new AlphabetListItemType("abc", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('abc');
      logInfo(`new AlphabetListItemType("abc", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0010
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0010
     * @tc.desc      new AlphabetListItemType("Hello World", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0010 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello World', []);
      logInfo(`new AlphabetListItemType("Hello World", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello World');
      logInfo(`new AlphabetListItemType("Hello World", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0011
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0011
     * @tc.desc      new AlphabetListItemType("123", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0011 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('123', []);
      logInfo(`new AlphabetListItemType("123", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('123');
      logInfo(`new AlphabetListItemType("123", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0012
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0012
     * @tc.desc      new AlphabetListItemType(" Hello ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0012 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Hello ', []);
      logInfo(`new AlphabetListItemType(" Hello ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Hello ');
      logInfo(`new AlphabetListItemType(" Hello ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0013
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0013
     * @tc.desc      new AlphabetListItemType("HelloHello", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0013 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('HelloHello', []);
      logInfo(`new AlphabetListItemType("HelloHello", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('HelloHello');
      logInfo(`new AlphabetListItemType("HelloHello", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0014
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0014
     * @tc.desc      new AlphabetListItemType("Hello_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0014 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello_1', []);
      logInfo(`new AlphabetListItemType("Hello_1", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello_1');
      logInfo(`new AlphabetListItemType("Hello_1", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0015
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0015
     * @tc.desc      new AlphabetListItemType("xHello", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0015 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xHello', []);
      logInfo(`new AlphabetListItemType("xHello", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xHello');
      logInfo(`new AlphabetListItemType("xHello", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0016
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0016
     * @tc.desc      new AlphabetListItemType(" hello world ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0016 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' hello world ', []);
      logInfo(`new AlphabetListItemType(" hello world ",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' hello world ');
      logInfo(`new AlphabetListItemType(" hello world ",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0017
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0017
     * @tc.desc      new AlphabetListItemType("hello worldhello world", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0017 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('hello worldhello world', []);
      logInfo(`new AlphabetListItemType("hello worldhell...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello worldhello world');
      logInfo(`new AlphabetListItemType("hello worldhell...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0018
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0018
     * @tc.desc      new AlphabetListItemType("hello world_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0018 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('hello world_1', []);
      logInfo(`new AlphabetListItemType("hello world_1",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world_1');
      logInfo(`new AlphabetListItemType("hello world_1",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0019
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0019
     * @tc.desc      new AlphabetListItemType("xhello world", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0019 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xhello world', []);
      logInfo(`new AlphabetListItemType("xhello world", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xhello world');
      logInfo(`new AlphabetListItemType("xhello world", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0020
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0020
     * @tc.desc      new AlphabetListItemType("   ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0020 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('   ', []);
      logInfo(`new AlphabetListItemType("   ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('   ');
      logInfo(`new AlphabetListItemType("   ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0021
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0021
     * @tc.desc      new AlphabetListItemType("  ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0021 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('  ', []);
      logInfo(`new AlphabetListItemType("  ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('  ');
      logInfo(`new AlphabetListItemType("  ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0022
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0022
     * @tc.desc      new AlphabetListItemType(" _1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0022 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' _1', []);
      logInfo(`new AlphabetListItemType(" _1", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' _1');
      logInfo(`new AlphabetListItemType(" _1", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0023
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0023
     * @tc.desc      new AlphabetListItemType("x ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0023 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('x ', []);
      logInfo(`new AlphabetListItemType("x ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('x ');
      logInfo(`new AlphabetListItemType("x ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0024
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0024
     * @tc.desc      new AlphabetListItemType(" A ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0024 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' A ', []);
      logInfo(`new AlphabetListItemType(" A ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' A ');
      logInfo(`new AlphabetListItemType(" A ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0025
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0025
     * @tc.desc      new AlphabetListItemType("AA", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0025 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('AA', []);
      logInfo(`new AlphabetListItemType("AA", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('AA');
      logInfo(`new AlphabetListItemType("AA", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0026
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0026
     * @tc.desc      new AlphabetListItemType("A_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0026 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A_1', []);
      logInfo(`new AlphabetListItemType("A_1", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A_1');
      logInfo(`new AlphabetListItemType("A_1", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0027
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0027
     * @tc.desc      new AlphabetListItemType("xA", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0027 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xA', []);
      logInfo(`new AlphabetListItemType("xA", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xA');
      logInfo(`new AlphabetListItemType("xA", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0028
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0028
     * @tc.desc      new AlphabetListItemType(" Sample Title 123 ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0028 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Sample Title 123 ', []);
      logInfo(`new AlphabetListItemType(" Sample Title 1...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Sample Title 123 ');
      logInfo(`new AlphabetListItemType(" Sample Title 1...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0029
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0029
     * @tc.desc      new AlphabetListItemType("Sample Title 123Sample Title 123", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0029 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Sample Title 123Sample Title 123', []);
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0030
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0030
     * @tc.desc      new AlphabetListItemType("Sample Title 123_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0030 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Sample Title 123_1', []);
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Sample Title 123_1');
      logInfo(`new AlphabetListItemType("Sample Title 12...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0031
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0031
     * @tc.desc      new AlphabetListItemType("xSample Title 123", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0031 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xSample Title 123', []);
      logInfo(`new AlphabetListItemType("xSample Title 1...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xSample Title 123');
      logInfo(`new AlphabetListItemType("xSample Title 1...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0032
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0032
     * @tc.desc      new AlphabetListItemType(" ?? ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0032 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' \u4e2d\u6587 ', []);
      logInfo(`new AlphabetListItemType(" ?? ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' \u4e2d\u6587 ');
      logInfo(`new AlphabetListItemType(" ?? ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0033
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0033
     * @tc.desc      new AlphabetListItemType("????", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0033 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587\u4e2d\u6587', []);
      logInfo(`new AlphabetListItemType("????", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new AlphabetListItemType("????", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0034
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0034
     * @tc.desc      new AlphabetListItemType("??_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0034 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587_1', []);
      logInfo(`new AlphabetListItemType("??_1", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587_1');
      logInfo(`new AlphabetListItemType("??_1", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0035
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0035
     * @tc.desc      new AlphabetListItemType("x??", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0035 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('x\u4e2d\u6587', []);
      logInfo(`new AlphabetListItemType("x??", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('x\u4e2d\u6587');
      logInfo(`new AlphabetListItemType("x??", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0036
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0036
     * @tc.desc      new AlphabetListItemType(" a ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0036 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' a ', []);
      logInfo(`new AlphabetListItemType(" a ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' a ');
      logInfo(`new AlphabetListItemType(" a ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0037
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0037
     * @tc.desc      new AlphabetListItemType("aa", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0037 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('aa', []);
      logInfo(`new AlphabetListItemType("aa", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('aa');
      logInfo(`new AlphabetListItemType("aa", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0038
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0038
     * @tc.desc      new AlphabetListItemType("a_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0038 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('a_1', []);
      logInfo(`new AlphabetListItemType("a_1", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('a_1');
      logInfo(`new AlphabetListItemType("a_1", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0039
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0039
     * @tc.desc      new AlphabetListItemType("xa", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0039 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xa', []);
      logInfo(`new AlphabetListItemType("xa", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xa');
      logInfo(`new AlphabetListItemType("xa", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0040
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0040
     * @tc.desc      new AlphabetListItemType(" abc ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0040 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' abc ', []);
      logInfo(`new AlphabetListItemType(" abc ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' abc ');
      logInfo(`new AlphabetListItemType(" abc ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0041
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0041
     * @tc.desc      new AlphabetListItemType("abcabc", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0041 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('abcabc', []);
      logInfo(`new AlphabetListItemType("abcabc", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('abcabc');
      logInfo(`new AlphabetListItemType("abcabc", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0042
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0042
     * @tc.desc      new AlphabetListItemType("abc_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0042 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('abc_1', []);
      logInfo(`new AlphabetListItemType("abc_1", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('abc_1');
      logInfo(`new AlphabetListItemType("abc_1", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0043
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0043
     * @tc.desc      new AlphabetListItemType("xabc", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0043 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xabc', []);
      logInfo(`new AlphabetListItemType("xabc", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xabc');
      logInfo(`new AlphabetListItemType("xabc", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0044
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0044
     * @tc.desc      new AlphabetListItemType(" Hello World ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0044 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Hello World ', []);
      logInfo(`new AlphabetListItemType(" Hello World ",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Hello World ');
      logInfo(`new AlphabetListItemType(" Hello World ",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0045
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0045
     * @tc.desc      new AlphabetListItemType("Hello WorldHello World", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0045 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello WorldHello World', []);
      logInfo(`new AlphabetListItemType("Hello WorldHell...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello WorldHello World');
      logInfo(`new AlphabetListItemType("Hello WorldHell...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0046
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0046
     * @tc.desc      new AlphabetListItemType("Hello World_1", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0046 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello World_1', []);
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello World_1');
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0047
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0047
     * @tc.desc      new AlphabetListItemType("xHello World", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0047 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xHello World', []);
      logInfo(`new AlphabetListItemType("xHello World", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xHello World');
      logInfo(`new AlphabetListItemType("xHello World", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0048
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0048
     * @tc.desc      new AlphabetListItemType(" 123 ", []) initialises 2 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0048 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' 123 ', []);
      logInfo(`new AlphabetListItemType(" 123 ", []): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' 123 ');
      logInfo(`new AlphabetListItemType(" 123 ", []): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(0);
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0049
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0049
     * @tc.desc      new AlphabetListItemType("Hello", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0049 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['']);
      logInfo(`new AlphabetListItemType("Hello", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType("Hello", [""]): JSON.stringify(subject....${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0050
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0050
     * @tc.desc      new AlphabetListItemType("Hello", ["", "a"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0050 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['', 'a']);
      logInfo(`new AlphabetListItemType("Hello", ["", "a"]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", ["", "a"]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("Hello", ["", "a"]): JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0051
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0051
     * @tc.desc      new AlphabetListItemType("Hello", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0051 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("Hello", ["a", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", ["a", "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("Hello", ["a", "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0052
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0052
     * @tc.desc      new AlphabetListItemType("Hello", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0052 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("Hello", ["abc",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", ["abc",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("Hello", ["abc",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0053
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0053
     * @tc.desc      new AlphabetListItemType("Hello", ["", "a", "abc", "Hello World", " "]) initialises 3 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0053 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`new AlphabetListItemType("Hello", ["", "a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", ["", "a...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Hello", ["", "a...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0054
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0054
     * @tc.desc      new AlphabetListItemType("Hello", ["Hello World", "a", " ", "a", "123"]) initialises 3 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0054 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("Hello", ["Hello...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", ["Hello...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Hello", ["Hello...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0055
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0055
     * @tc.desc      new AlphabetListItemType("Hello", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 pub...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0055 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello', ['123', ' ', 'Hello World', 'abc', 'a',
        '']);
      logInfo(`new AlphabetListItemType("Hello", ["123",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello');
      logInfo(`new AlphabetListItemType("Hello", ["123",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("Hello", ["123",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0056
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0056
     * @tc.desc      new AlphabetListItemType("Hello World_1", ["Hello World", "a", " ", "a", "123"]) initialises 3 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0056 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello World_1', ['Hello World', 'a', ' ', 'a',
        '123']);
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello World_1');
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Hello World_1",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0057
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0057
     * @tc.desc      new AlphabetListItemType("hello world", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0057 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('hello world', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("hello world", [...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world');
      logInfo(`new AlphabetListItemType("hello world", [...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("hello world", [...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0058
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0058
     * @tc.desc      new AlphabetListItemType("abc_1", ["Hello World", "a", " ", "a", "123"]) initialises 3 public me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0058 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('abc_1', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("abc_1", ["Hello...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('abc_1');
      logInfo(`new AlphabetListItemType("abc_1", ["Hello...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("abc_1", ["Hello...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0059
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0059
     * @tc.desc      new AlphabetListItemType("Hello WorldHello World", ["Hello World", "a", " ", "a", "123"]) initia...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0059 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello WorldHello World', ['Hello World', 'a', ' ',
        'a', '123']);
      logInfo(`new AlphabetListItemType("Hello WorldHell...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello WorldHello World');
      logInfo(`new AlphabetListItemType("Hello WorldHell...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("Hello WorldHell...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0060
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0060
     * @tc.desc      new AlphabetListItemType("hello world_1", ["", "a", "abc", "Hello World", " "]) initialises 3 pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0060 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('hello world_1', ['', 'a', 'abc', 'Hello World',
        ' ']);
      logInfo(`new AlphabetListItemType("hello world_1",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('hello world_1');
      logInfo(`new AlphabetListItemType("hello world_1",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("hello world_1",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0061
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0061
     * @tc.desc      new AlphabetListItemType("  ", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0061 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('  ', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("  ", ["abc", "a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('  ');
      logInfo(`new AlphabetListItemType("  ", ["abc", "a...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("  ", ["abc", "a...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0062
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0062
     * @tc.desc      new AlphabetListItemType("   ", ["", "a", "abc", "Hello World", " "]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0062 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('   ', ['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`new AlphabetListItemType("   ", ["", "a",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('   ');
      logInfo(`new AlphabetListItemType("   ", ["", "a",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("   ", ["", "a",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0063
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0063
     * @tc.desc      new AlphabetListItemType(" A ", ["Hello World", "a", " ", "a", "123"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0063 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' A ', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType(" A ", ["Hello W...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' A ');
      logInfo(`new AlphabetListItemType(" A ", ["Hello W...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType(" A ", ["Hello W...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0064
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0064
     * @tc.desc      new AlphabetListItemType("Hello_1", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 p...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0064 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello_1', ['123', ' ', 'Hello World', 'abc', 'a',
        '']);
      logInfo(`new AlphabetListItemType("Hello_1", ["123...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello_1');
      logInfo(`new AlphabetListItemType("Hello_1", ["123...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("Hello_1", ["123...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0065
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0065
     * @tc.desc      new AlphabetListItemType(" Hello World ", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0065 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Hello World ', ['']);
      logInfo(`new AlphabetListItemType(" Hello World ",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Hello World ');
      logInfo(`new AlphabetListItemType(" Hello World ",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType(" Hello World ",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0066
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0066
     * @tc.desc      new AlphabetListItemType("??_1", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0066 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587_1', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("??_1", ["abc", ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587_1');
      logInfo(`new AlphabetListItemType("??_1", ["abc", ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("??_1", ["abc", ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0067
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0067
     * @tc.desc      new AlphabetListItemType("  ", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 public...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0067 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('  ', ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`new AlphabetListItemType("  ", ["123", " ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('  ');
      logInfo(`new AlphabetListItemType("  ", ["123", " ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("  ", ["123", " ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0068
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0068
     * @tc.desc      new AlphabetListItemType("xabc", ["Hello World", "a", " ", "a", "123"]) initialises 3 public mem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0068 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xabc', ['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`new AlphabetListItemType("xabc", ["Hello ...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xabc');
      logInfo(`new AlphabetListItemType("xabc", ["Hello ...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(5);
      logInfo(`new AlphabetListItemType("xabc", ["Hello ...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0069
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0069
     * @tc.desc      new AlphabetListItemType("Hello World_1", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0069 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello World_1', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello World_1');
      logInfo(`new AlphabetListItemType("Hello World_1",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("Hello World_1",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0070
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0070
     * @tc.desc      new AlphabetListItemType("HelloHello", ["", "a"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0070 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('HelloHello', ['', 'a']);
      logInfo(`new AlphabetListItemType("HelloHello", ["...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('HelloHello');
      logInfo(`new AlphabetListItemType("HelloHello", ["...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("HelloHello", ["...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0071
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0071
     * @tc.desc      new AlphabetListItemType("A", ["123", " ", "Hello World", "abc", "a", ""]) initialises 3 public ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0071 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A', ['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`new AlphabetListItemType("A", ["123", " "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A');
      logInfo(`new AlphabetListItemType("A", ["123", " "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(6);
      logInfo(`new AlphabetListItemType("A", ["123", " "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0072
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0072
     * @tc.desc      new AlphabetListItemType("Hello_1", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0072 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('Hello_1', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType("Hello_1", ["a",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('Hello_1');
      logInfo(`new AlphabetListItemType("Hello_1", ["a",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType("Hello_1", ["a",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0073
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0073
     * @tc.desc      new AlphabetListItemType("xa", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0073 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xa', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("xa", ["abc", "a...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xa');
      logInfo(`new AlphabetListItemType("xa", ["abc", "a...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("xa", ["abc", "a...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0074
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0074
     * @tc.desc      new AlphabetListItemType(" ", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0074 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' ', ['']);
      logInfo(`new AlphabetListItemType(" ", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' ');
      logInfo(`new AlphabetListItemType(" ", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType(" ", [""]): JSON.stringify(subject.data...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0075
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0075
     * @tc.desc      new AlphabetListItemType(" Sample Title 123 ", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0075 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' Sample Title 123 ', ['']);
      logInfo(`new AlphabetListItemType(" Sample Title 1...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' Sample Title 123 ');
      logInfo(`new AlphabetListItemType(" Sample Title 1...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType(" Sample Title 1...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0076
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0076
     * @tc.desc      new AlphabetListItemType("A_1", ["abc", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0076 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('A_1', ['abc', 'abc']);
      logInfo(`new AlphabetListItemType("A_1", ["abc", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual('A_1');
      logInfo(`new AlphabetListItemType("A_1", ["abc", "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType("A_1", ["abc", "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["abc","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0077
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0077
     * @tc.desc      new AlphabetListItemType(" _1", ["", "a"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0077 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' _1', ['', 'a']);
      logInfo(`new AlphabetListItemType(" _1", ["", "a"]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' _1');
      logInfo(`new AlphabetListItemType(" _1", ["", "a"]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(2);
      logInfo(`new AlphabetListItemType(" _1", ["", "a"]): JSON.stringify(subje...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["","a"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0078
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0078
     * @tc.desc      new AlphabetListItemType("??_1", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0078 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('\u4e2d\u6587_1', ['']);
      logInfo(`new AlphabetListItemType("??_1", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('\u4e2d\u6587_1');
      logInfo(`new AlphabetListItemType("??_1", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType("??_1", [""]): JSON.stringify(subject.d...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0079
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0079
     * @tc.desc      new AlphabetListItemType(" abc ", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0079 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' abc ', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType(" abc ", ["a", "...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' abc ');
      logInfo(`new AlphabetListItemType(" abc ", ["a", "...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType(" abc ", ["a", "...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0080
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0080
     * @tc.desc      new AlphabetListItemType(" hello world ", ["a", "", "abc"]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0080 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType(' hello world ', ['a', '', 'abc']);
      logInfo(`new AlphabetListItemType(" hello world ",...: subject.name=${subject.name}`);
      expect(subject.name).assertEqual(' hello world ');
      logInfo(`new AlphabetListItemType(" hello world ",...: subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(3);
      logInfo(`new AlphabetListItemType(" hello world ",...: JSON.stringify(sub...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('["a","","abc"]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_LIST_ITEM_TYPE_CTOR_0081
     * @tc.name      CitySearch_AlphabetListItemTypeCtor_0081
     * @tc.desc      new AlphabetListItemType("xHello", [""]) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_AlphabetListItemTypeCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0081 begin`);
      const subject: AlphabetListItemType = new AlphabetListItemType('xHello', ['']);
      logInfo(`new AlphabetListItemType("xHello", [""]): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('xHello');
      logInfo(`new AlphabetListItemType("xHello", [""]): subject.dataList.length=${subject.dataList.length}`);
      expect(subject.dataList.length).assertEqual(1);
      logInfo(`new AlphabetListItemType("xHello", [""]): JSON.stringify(subject...${JSON.stringify(subject.dataList)}`);
      expect(JSON.stringify(subject.dataList)).assertEqual('[""]');
      logInfo(`${BUNDLE}AlphabetListItemTypeCtor_0081 end`);
    });
  });
}
