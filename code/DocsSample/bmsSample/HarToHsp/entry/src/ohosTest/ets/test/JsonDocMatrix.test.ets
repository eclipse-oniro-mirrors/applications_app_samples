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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

interface InnerDoc {
  depth: number;
  label: string;
  enabled: boolean;
}

interface ConfigDoc {
  name: string;
  version: number;
  tags: string[];
  nested: InnerDoc;
}

interface OrderItem {
  id: string;
  price: number;
  count: number;
}

interface OrderDoc {
  orders: OrderItem[];
}

export default function jsonDocMatrixTest() {
  describe('jsonDocMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0001
   * @tc.name      testJsonDoc0001
   * @tc.desc      Json doc 1 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0001', 'json doc 1');
    const text: string = '{"name":"doc-1","version":1' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":1,"label":"label-1","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-1');
    expect(doc.version).assertEqual(1);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(1);
    expect(doc.nested.label).assertEqual('label-1');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0002
   * @tc.name      testJsonDoc0002
   * @tc.desc      Json doc 2 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0002', 'json doc 2');
    const text: string = '{"name":"doc-2","version":2' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":2,"label":"label-2","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-2');
    expect(doc.version).assertEqual(2);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(2);
    expect(doc.nested.label).assertEqual('label-2');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0003
   * @tc.name      testJsonDoc0003
   * @tc.desc      Json doc 3 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0003', 'json doc 3');
    const text: string = '{"name":"doc-3","version":3' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":3,"label":"label-3","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-3');
    expect(doc.version).assertEqual(3);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(3);
    expect(doc.nested.label).assertEqual('label-3');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0004
   * @tc.name      testJsonDoc0004
   * @tc.desc      Json doc 4 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0004', 'json doc 4');
    const text: string = '{"name":"doc-4","version":4' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":4,"label":"label-4","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-4');
    expect(doc.version).assertEqual(4);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(4);
    expect(doc.nested.label).assertEqual('label-4');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0005
   * @tc.name      testJsonDoc0005
   * @tc.desc      Json doc 5 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0005', 'json doc 5');
    const text: string = '{"name":"doc-5","version":5' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":5,"label":"label-5","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-5');
    expect(doc.version).assertEqual(5);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(5);
    expect(doc.nested.label).assertEqual('label-5');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0006
   * @tc.name      testJsonDoc0006
   * @tc.desc      Json doc 6 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0006', 'json doc 6');
    const text: string = '{"name":"doc-6","version":6' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":6,"label":"label-6","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-6');
    expect(doc.version).assertEqual(6);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(6);
    expect(doc.nested.label).assertEqual('label-6');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0007
   * @tc.name      testJsonDoc0007
   * @tc.desc      Json doc 7 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0007', 'json doc 7');
    const text: string = '{"name":"doc-7","version":7' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":0,"label":"label-7","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-7');
    expect(doc.version).assertEqual(7);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(0);
    expect(doc.nested.label).assertEqual('label-7');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0008
   * @tc.name      testJsonDoc0008
   * @tc.desc      Json doc 8 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0008', 'json doc 8');
    const text: string = '{"name":"doc-8","version":8' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":1,"label":"label-8","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-8');
    expect(doc.version).assertEqual(8);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(1);
    expect(doc.nested.label).assertEqual('label-8');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0009
   * @tc.name      testJsonDoc0009
   * @tc.desc      Json doc 9 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0009', 'json doc 9');
    const text: string = '{"name":"doc-9","version":9' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":2,"label":"label-9","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-9');
    expect(doc.version).assertEqual(9);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(2);
    expect(doc.nested.label).assertEqual('label-9');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0010
   * @tc.name      testJsonDoc0010
   * @tc.desc      Json doc 10 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0010', 'json doc 10');
    const text: string = '{"name":"doc-10","version":10' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":3,"label":"label-10","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-10');
    expect(doc.version).assertEqual(10);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(3);
    expect(doc.nested.label).assertEqual('label-10');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0011
   * @tc.name      testJsonDoc0011
   * @tc.desc      Json doc 11 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0011', 'json doc 11');
    const text: string = '{"name":"doc-11","version":11' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":4,"label":"label-11","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-11');
    expect(doc.version).assertEqual(11);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(4);
    expect(doc.nested.label).assertEqual('label-11');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0012
   * @tc.name      testJsonDoc0012
   * @tc.desc      Json doc 12 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0012', 'json doc 12');
    const text: string = '{"name":"doc-12","version":12' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":5,"label":"label-12","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-12');
    expect(doc.version).assertEqual(12);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(5);
    expect(doc.nested.label).assertEqual('label-12');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0013
   * @tc.name      testJsonDoc0013
   * @tc.desc      Json doc 13 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0013', 'json doc 13');
    const text: string = '{"name":"doc-13","version":13' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":6,"label":"label-13","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-13');
    expect(doc.version).assertEqual(13);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(6);
    expect(doc.nested.label).assertEqual('label-13');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0014
   * @tc.name      testJsonDoc0014
   * @tc.desc      Json doc 14 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0014', 'json doc 14');
    const text: string = '{"name":"doc-14","version":14' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":0,"label":"label-14","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-14');
    expect(doc.version).assertEqual(14);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(0);
    expect(doc.nested.label).assertEqual('label-14');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0015
   * @tc.name      testJsonDoc0015
   * @tc.desc      Json doc 15 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0015', 'json doc 15');
    const text: string = '{"name":"doc-15","version":15' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":1,"label":"label-15","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-15');
    expect(doc.version).assertEqual(15);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(1);
    expect(doc.nested.label).assertEqual('label-15');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0016
   * @tc.name      testJsonDoc0016
   * @tc.desc      Json doc 16 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0016', 'json doc 16');
    const text: string = '{"name":"doc-16","version":16' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":2,"label":"label-16","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-16');
    expect(doc.version).assertEqual(16);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(2);
    expect(doc.nested.label).assertEqual('label-16');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0017
   * @tc.name      testJsonDoc0017
   * @tc.desc      Json doc 17 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0017', 'json doc 17');
    const text: string = '{"name":"doc-17","version":17' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":3,"label":"label-17","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-17');
    expect(doc.version).assertEqual(17);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(3);
    expect(doc.nested.label).assertEqual('label-17');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0018
   * @tc.name      testJsonDoc0018
   * @tc.desc      Json doc 18 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0018', 'json doc 18');
    const text: string = '{"name":"doc-18","version":18' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":4,"label":"label-18","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-18');
    expect(doc.version).assertEqual(18);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(4);
    expect(doc.nested.label).assertEqual('label-18');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0019
   * @tc.name      testJsonDoc0019
   * @tc.desc      Json doc 19 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0019', 'json doc 19');
    const text: string = '{"name":"doc-19","version":19' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":5,"label":"label-19","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-19');
    expect(doc.version).assertEqual(19);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(5);
    expect(doc.nested.label).assertEqual('label-19');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0020
   * @tc.name      testJsonDoc0020
   * @tc.desc      Json doc 20 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0020', 'json doc 20');
    const text: string = '{"name":"doc-20","version":20' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":6,"label":"label-20","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-20');
    expect(doc.version).assertEqual(20);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(6);
    expect(doc.nested.label).assertEqual('label-20');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0021
   * @tc.name      testJsonDoc0021
   * @tc.desc      Json doc 21 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0021', 'json doc 21');
    const text: string = '{"name":"doc-21","version":21' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":0,"label":"label-21","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-21');
    expect(doc.version).assertEqual(21);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(0);
    expect(doc.nested.label).assertEqual('label-21');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0022
   * @tc.name      testJsonDoc0022
   * @tc.desc      Json doc 22 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0022', 'json doc 22');
    const text: string = '{"name":"doc-22","version":22' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":1,"label":"label-22","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-22');
