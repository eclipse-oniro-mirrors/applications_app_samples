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
    expect(doc.version).assertEqual(22);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(1);
    expect(doc.nested.label).assertEqual('label-22');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0023
   * @tc.name      testJsonDoc0023
   * @tc.desc      Json doc 23 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0023', 'json doc 23');
    const text: string = '{"name":"doc-23","version":23' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":2,"label":"label-23","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-23');
    expect(doc.version).assertEqual(23);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(2);
    expect(doc.nested.label).assertEqual('label-23');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0024
   * @tc.name      testJsonDoc0024
   * @tc.desc      Json doc 24 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0024', 'json doc 24');
    const text: string = '{"name":"doc-24","version":24' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":3,"label":"label-24","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-24');
    expect(doc.version).assertEqual(24);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(3);
    expect(doc.nested.label).assertEqual('label-24');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0025
   * @tc.name      testJsonDoc0025
   * @tc.desc      Json doc 25 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0025', 'json doc 25');
    const text: string = '{"name":"doc-25","version":25' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":4,"label":"label-25","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-25');
    expect(doc.version).assertEqual(25);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(4);
    expect(doc.nested.label).assertEqual('label-25');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0026
   * @tc.name      testJsonDoc0026
   * @tc.desc      Json doc 26 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0026', 'json doc 26');
    const text: string = '{"name":"doc-26","version":26' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":5,"label":"label-26","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-26');
    expect(doc.version).assertEqual(26);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(5);
    expect(doc.nested.label).assertEqual('label-26');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0027
   * @tc.name      testJsonDoc0027
   * @tc.desc      Json doc 27 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0027', 'json doc 27');
    const text: string = '{"name":"doc-27","version":27' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":6,"label":"label-27","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-27');
    expect(doc.version).assertEqual(27);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(6);
    expect(doc.nested.label).assertEqual('label-27');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0028
   * @tc.name      testJsonDoc0028
   * @tc.desc      Json doc 28 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0028', 'json doc 28');
    const text: string = '{"name":"doc-28","version":28' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":0,"label":"label-28","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-28');
    expect(doc.version).assertEqual(28);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(0);
    expect(doc.nested.label).assertEqual('label-28');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0029
   * @tc.name      testJsonDoc0029
   * @tc.desc      Json doc 29 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0029', 'json doc 29');
    const text: string = '{"name":"doc-29","version":29' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":1,"label":"label-29","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-29');
    expect(doc.version).assertEqual(29);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(1);
    expect(doc.nested.label).assertEqual('label-29');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0030
   * @tc.name      testJsonDoc0030
   * @tc.desc      Json doc 30 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0030', 'json doc 30');
    const text: string = '{"name":"doc-30","version":30' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":2,"label":"label-30","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-30');
    expect(doc.version).assertEqual(30);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(2);
    expect(doc.nested.label).assertEqual('label-30');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0031
   * @tc.name      testJsonDoc0031
   * @tc.desc      Json doc 31 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0031', 'json doc 31');
    const text: string = '{"name":"doc-31","version":31' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":3,"label":"label-31","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-31');
    expect(doc.version).assertEqual(31);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(3);
    expect(doc.nested.label).assertEqual('label-31');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0032
   * @tc.name      testJsonDoc0032
   * @tc.desc      Json doc 32 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0032', 'json doc 32');
    const text: string = '{"name":"doc-32","version":32' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":4,"label":"label-32","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-32');
    expect(doc.version).assertEqual(32);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(4);
    expect(doc.nested.label).assertEqual('label-32');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0033
   * @tc.name      testJsonDoc0033
   * @tc.desc      Json doc 33 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0033', 'json doc 33');
    const text: string = '{"name":"doc-33","version":33' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":5,"label":"label-33","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-33');
    expect(doc.version).assertEqual(33);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(5);
    expect(doc.nested.label).assertEqual('label-33');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0034
   * @tc.name      testJsonDoc0034
   * @tc.desc      Json doc 34 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0034', 'json doc 34');
    const text: string = '{"name":"doc-34","version":34' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":6,"label":"label-34","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-34');
    expect(doc.version).assertEqual(34);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(6);
    expect(doc.nested.label).assertEqual('label-34');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0035
   * @tc.name      testJsonDoc0035
   * @tc.desc      Json doc 35 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0035', 'json doc 35');
    const text: string = '{"name":"doc-35","version":35' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":0,"label":"label-35","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-35');
    expect(doc.version).assertEqual(35);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(0);
    expect(doc.nested.label).assertEqual('label-35');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0036
   * @tc.name      testJsonDoc0036
   * @tc.desc      Json doc 36 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0036', 'json doc 36');
    const text: string = '{"name":"doc-36","version":36' +
      ',"tags":["tag-1","tag-2"]' +
      ',"nested":{"depth":1,"label":"label-36","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-36');
    expect(doc.version).assertEqual(36);
    expect(doc.tags.length).assertEqual(2);
    expect(doc.nested.depth).assertEqual(1);
    expect(doc.nested.label).assertEqual('label-36');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0037
   * @tc.name      testJsonDoc0037
   * @tc.desc      Json doc 37 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0037', 'json doc 37');
    const text: string = '{"name":"doc-37","version":37' +
      ',"tags":["tag-1","tag-2","tag-3"]' +
      ',"nested":{"depth":2,"label":"label-37","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-37');
    expect(doc.version).assertEqual(37);
    expect(doc.tags.length).assertEqual(3);
    expect(doc.nested.depth).assertEqual(2);
    expect(doc.nested.label).assertEqual('label-37');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0038
   * @tc.name      testJsonDoc0038
   * @tc.desc      Json doc 38 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0038', 'json doc 38');
    const text: string = '{"name":"doc-38","version":38' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4"]' +
      ',"nested":{"depth":3,"label":"label-38","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-38');
    expect(doc.version).assertEqual(38);
    expect(doc.tags.length).assertEqual(4);
    expect(doc.nested.depth).assertEqual(3);
    expect(doc.nested.label).assertEqual('label-38');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0039
   * @tc.name      testJsonDoc0039
   * @tc.desc      Json doc 39 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0039', 'json doc 39');
    const text: string = '{"name":"doc-39","version":39' +
      ',"tags":["tag-1","tag-2","tag-3","tag-4","tag-5"]' +
      ',"nested":{"depth":4,"label":"label-39","enabled":false}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-39');
    expect(doc.version).assertEqual(39);
    expect(doc.tags.length).assertEqual(5);
    expect(doc.nested.depth).assertEqual(4);
    expect(doc.nested.label).assertEqual('label-39');
    expect(doc.nested.enabled).assertEqual(false);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0040
   * @tc.name      testJsonDoc0040
   * @tc.desc      Json doc 40 keeps nested fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0040', 'json doc 40');
    const text: string = '{"name":"doc-40","version":40' +
      ',"tags":["tag-1"]' +
      ',"nested":{"depth":5,"label":"label-40","enabled":true}}';
    const doc: ConfigDoc = JSON.parse(text) as ConfigDoc;
    expect(doc.name).assertEqual('doc-40');
    expect(doc.version).assertEqual(40);
    expect(doc.tags.length).assertEqual(1);
    expect(doc.nested.depth).assertEqual(5);
    expect(doc.nested.label).assertEqual('label-40');
    expect(doc.nested.enabled).assertEqual(true);
    const again: string = JSON.stringify(doc);
    const second: ConfigDoc = JSON.parse(again) as ConfigDoc;
    expect(second.name).assertEqual(doc.name);
    expect(second.tags.length).assertEqual(doc.tags.length);
  });




  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0078
   * @tc.name      testJsonDoc0078
   * @tc.desc      Json orders 1 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0078', 'json orders 1');
    const text: string = '{"orders":[' +
      '{"id":"order-1-1","price":6,"count":1},' +
      '{"id":"order-1-2","price":11,"count":2}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(2);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(17);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-1-2');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0079
   * @tc.name      testJsonDoc0079
   * @tc.desc      Json orders 2 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0079', 'json orders 2');
    const text: string = '{"orders":[' +
      '{"id":"order-2-1","price":7,"count":1},' +
      '{"id":"order-2-2","price":12,"count":2},' +
      '{"id":"order-2-3","price":17,"count":3}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(3);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(36);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-2-3');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0080
   * @tc.name      testJsonDoc0080
   * @tc.desc      Json orders 3 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0080', 'json orders 3');
    const text: string = '{"orders":[' +
      '{"id":"order-3-1","price":8,"count":1},' +
      '{"id":"order-3-2","price":13,"count":2},' +
      '{"id":"order-3-3","price":18,"count":3},' +
      '{"id":"order-3-4","price":23,"count":4}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(4);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(62);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-3-4');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0081
   * @tc.name      testJsonDoc0081
   * @tc.desc      Json orders 4 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0081', 'json orders 4');
    const text: string = '{"orders":[' +
      '{"id":"order-4-1","price":9,"count":1},' +
      '{"id":"order-4-2","price":14,"count":2},' +
      '{"id":"order-4-3","price":19,"count":3},' +
      '{"id":"order-4-4","price":24,"count":4},' +
      '{"id":"order-4-5","price":29,"count":5}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(5);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(95);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-4-5');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0082
   * @tc.name      testJsonDoc0082
   * @tc.desc      Json orders 5 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0082', 'json orders 5');
    const text: string = '{"orders":[' +
      '{"id":"order-5-1","price":10,"count":1}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(1);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(10);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-5-1');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0083
   * @tc.name      testJsonDoc0083
   * @tc.desc      Json orders 6 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0083', 'json orders 6');
    const text: string = '{"orders":[' +
      '{"id":"order-6-1","price":11,"count":1},' +
      '{"id":"order-6-2","price":16,"count":2}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(2);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(27);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-6-2');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0084
   * @tc.name      testJsonDoc0084
   * @tc.desc      Json orders 7 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0084', 'json orders 7');
    const text: string = '{"orders":[' +
      '{"id":"order-7-1","price":12,"count":1},' +
      '{"id":"order-7-2","price":17,"count":2},' +
      '{"id":"order-7-3","price":22,"count":3}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(3);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(51);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-7-3');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0085
   * @tc.name      testJsonDoc0085
   * @tc.desc      Json orders 8 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0085', 'json orders 8');
    const text: string = '{"orders":[' +
      '{"id":"order-8-1","price":13,"count":1},' +
      '{"id":"order-8-2","price":18,"count":2},' +
      '{"id":"order-8-3","price":23,"count":3},' +
      '{"id":"order-8-4","price":28,"count":4}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(4);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(82);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-8-4');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0086
   * @tc.name      testJsonDoc0086
   * @tc.desc      Json orders 9 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0086', 'json orders 9');
    const text: string = '{"orders":[' +
      '{"id":"order-9-1","price":14,"count":1},' +
      '{"id":"order-9-2","price":19,"count":2},' +
      '{"id":"order-9-3","price":24,"count":3},' +
      '{"id":"order-9-4","price":29,"count":4},' +
      '{"id":"order-9-5","price":34,"count":5}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(5);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(120);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-9-5');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0087
   * @tc.name      testJsonDoc0087
   * @tc.desc      Json orders 10 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0087', 'json orders 10');
    const text: string = '{"orders":[' +
      '{"id":"order-10-1","price":15,"count":1}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(1);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(15);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-10-1');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0088
   * @tc.name      testJsonDoc0088
   * @tc.desc      Json orders 11 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0088', 'json orders 11');
    const text: string = '{"orders":[' +
      '{"id":"order-11-1","price":16,"count":1},' +
      '{"id":"order-11-2","price":21,"count":2}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(2);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(37);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-11-2');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0089
   * @tc.name      testJsonDoc0089
   * @tc.desc      Json orders 12 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0089', 'json orders 12');
    const text: string = '{"orders":[' +
      '{"id":"order-12-1","price":17,"count":1},' +
      '{"id":"order-12-2","price":22,"count":2},' +
      '{"id":"order-12-3","price":27,"count":3}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(3);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(66);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-12-3');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0090
   * @tc.name      testJsonDoc0090
   * @tc.desc      Json orders 13 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0090', 'json orders 13');
    const text: string = '{"orders":[' +
      '{"id":"order-13-1","price":18,"count":1},' +
      '{"id":"order-13-2","price":23,"count":2},' +
      '{"id":"order-13-3","price":28,"count":3},' +
      '{"id":"order-13-4","price":33,"count":4}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(4);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(102);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-13-4');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0091
   * @tc.name      testJsonDoc0091
   * @tc.desc      Json orders 14 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0091', 'json orders 14');
    const text: string = '{"orders":[' +
      '{"id":"order-14-1","price":19,"count":1},' +
      '{"id":"order-14-2","price":24,"count":2},' +
      '{"id":"order-14-3","price":29,"count":3},' +
      '{"id":"order-14-4","price":34,"count":4},' +
      '{"id":"order-14-5","price":39,"count":5}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(5);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(145);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-14-5');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0092
   * @tc.name      testJsonDoc0092
   * @tc.desc      Json orders 15 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0092', 'json orders 15');
    const text: string = '{"orders":[' +
      '{"id":"order-15-1","price":20,"count":1}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(1);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(20);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-15-1');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0093
   * @tc.name      testJsonDoc0093
   * @tc.desc      Json orders 16 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0093', 'json orders 16');
    const text: string = '{"orders":[' +
      '{"id":"order-16-1","price":21,"count":1},' +
      '{"id":"order-16-2","price":26,"count":2}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(2);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(47);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-16-2');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0094
   * @tc.name      testJsonDoc0094
   * @tc.desc      Json orders 17 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0094', 'json orders 17');
    const text: string = '{"orders":[' +
      '{"id":"order-17-1","price":22,"count":1},' +
      '{"id":"order-17-2","price":27,"count":2},' +
      '{"id":"order-17-3","price":32,"count":3}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(3);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(81);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-17-3');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0095
   * @tc.name      testJsonDoc0095
   * @tc.desc      Json orders 18 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0095', 'json orders 18');
    const text: string = '{"orders":[' +
      '{"id":"order-18-1","price":23,"count":1},' +
      '{"id":"order-18-2","price":28,"count":2},' +
      '{"id":"order-18-3","price":33,"count":3},' +
      '{"id":"order-18-4","price":38,"count":4}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(4);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(122);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-18-4');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0096
   * @tc.name      testJsonDoc0096
   * @tc.desc      Json orders 19 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0096', 'json orders 19');
    const text: string = '{"orders":[' +
      '{"id":"order-19-1","price":24,"count":1},' +
      '{"id":"order-19-2","price":29,"count":2},' +
      '{"id":"order-19-3","price":34,"count":3},' +
      '{"id":"order-19-4","price":39,"count":4},' +
      '{"id":"order-19-5","price":44,"count":5}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(5);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(170);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-19-5');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0097
   * @tc.name      testJsonDoc0097
   * @tc.desc      Json orders 20 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0097', 'json orders 20');
    const text: string = '{"orders":[' +
      '{"id":"order-20-1","price":25,"count":1}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(1);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(25);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-20-1');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0098
   * @tc.name      testJsonDoc0098
   * @tc.desc      Json orders 21 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0098', 'json orders 21');
    const text: string = '{"orders":[' +
      '{"id":"order-21-1","price":26,"count":1},' +
      '{"id":"order-21-2","price":31,"count":2}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(2);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(57);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-21-2');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0099
   * @tc.name      testJsonDoc0099
   * @tc.desc      Json orders 22 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0099', 'json orders 22');
    const text: string = '{"orders":[' +
      '{"id":"order-22-1","price":27,"count":1},' +
      '{"id":"order-22-2","price":32,"count":2},' +
      '{"id":"order-22-3","price":37,"count":3}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(3);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(96);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-22-3');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0100
   * @tc.name      testJsonDoc0100
   * @tc.desc      Json orders 23 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0100', 'json orders 23');
    const text: string = '{"orders":[' +
      '{"id":"order-23-1","price":28,"count":1},' +
      '{"id":"order-23-2","price":33,"count":2},' +
      '{"id":"order-23-3","price":38,"count":3},' +
      '{"id":"order-23-4","price":43,"count":4}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(4);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(142);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-23-4');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0101
   * @tc.name      testJsonDoc0101
   * @tc.desc      Json orders 24 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0101', 'json orders 24');
    const text: string = '{"orders":[' +
      '{"id":"order-24-1","price":29,"count":1},' +
      '{"id":"order-24-2","price":34,"count":2},' +
      '{"id":"order-24-3","price":39,"count":3},' +
      '{"id":"order-24-4","price":44,"count":4},' +
      '{"id":"order-24-5","price":49,"count":5}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(5);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(195);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-24-5');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0102
   * @tc.name      testJsonDoc0102
   * @tc.desc      Json orders 25 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0102', 'json orders 25');
    const text: string = '{"orders":[' +
      '{"id":"order-25-1","price":30,"count":1}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(1);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(30);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-25-1');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0103
   * @tc.name      testJsonDoc0103
   * @tc.desc      Json orders 26 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0103', 'json orders 26');
    const text: string = '{"orders":[' +
      '{"id":"order-26-1","price":31,"count":1},' +
      '{"id":"order-26-2","price":36,"count":2}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(2);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(67);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-26-2');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0104
   * @tc.name      testJsonDoc0104
   * @tc.desc      Json orders 27 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0104', 'json orders 27');
    const text: string = '{"orders":[' +
      '{"id":"order-27-1","price":32,"count":1},' +
      '{"id":"order-27-2","price":37,"count":2},' +
      '{"id":"order-27-3","price":42,"count":3}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(3);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(111);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-27-3');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0105
   * @tc.name      testJsonDoc0105
   * @tc.desc      Json orders 28 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0105', 'json orders 28');
    const text: string = '{"orders":[' +
      '{"id":"order-28-1","price":33,"count":1},' +
      '{"id":"order-28-2","price":38,"count":2},' +
      '{"id":"order-28-3","price":43,"count":3},' +
      '{"id":"order-28-4","price":48,"count":4}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(4);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(162);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-28-4');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0106
   * @tc.name      testJsonDoc0106
   * @tc.desc      Json orders 29 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0106', 'json orders 29');
    const text: string = '{"orders":[' +
      '{"id":"order-29-1","price":34,"count":1},' +
      '{"id":"order-29-2","price":39,"count":2},' +
      '{"id":"order-29-3","price":44,"count":3},' +
      '{"id":"order-29-4","price":49,"count":4},' +
      '{"id":"order-29-5","price":54,"count":5}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(5);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(220);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-29-5');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0107
   * @tc.name      testJsonDoc0107
   * @tc.desc      Json orders 30 keep totals
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0107', 'json orders 30');
    const text: string = '{"orders":[' +
      '{"id":"order-30-1","price":35,"count":1}]}';
    const bundle: OrderDoc = JSON.parse(text) as OrderDoc;
    expect(bundle.orders.length).assertEqual(1);
    expect(bundle.orders.reduce((a: number, o: OrderItem) => a + o.price, 0)).assertEqual(35);
    expect(bundle.orders[0].count).assertEqual(1);
    expect(bundle.orders[bundle.orders.length - 1].id).assertEqual('order-30-1');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0108
   * @tc.name      testJsonDoc0108
   * @tc.desc      Json invalid document 1 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0108', 'json invalid 1');
    let failed: boolean = false;
    try {
      JSON.parse('{');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0109
   * @tc.name      testJsonDoc0109
   * @tc.desc      Json invalid document 2 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0109', 'json invalid 2');
    let failed: boolean = false;
    try {
      JSON.parse('[1,');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0110
   * @tc.name      testJsonDoc0110
   * @tc.desc      Json invalid document 3 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0110', 'json invalid 3');
    let failed: boolean = false;
    try {
      JSON.parse('nope');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0111
   * @tc.name      testJsonDoc0111
   * @tc.desc      Json invalid document 4 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0111', 'json invalid 4');
    let failed: boolean = false;
    try {
      JSON.parse('');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0112
   * @tc.name      testJsonDoc0112
   * @tc.desc      Json invalid document 5 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0112', 'json invalid 5');
    let failed: boolean = false;
    try {
      JSON.parse('{"a":}');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0113
   * @tc.name      testJsonDoc0113
   * @tc.desc      Json invalid document 6 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0113', 'json invalid 6');
    let failed: boolean = false;
    try {
      JSON.parse('{a:1}');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0114
   * @tc.name      testJsonDoc0114
   * @tc.desc      Json invalid document 7 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0114', 'json invalid 7');
    let failed: boolean = false;
    try {
      JSON.parse('[1,,2]');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0115
   * @tc.name      testJsonDoc0115
   * @tc.desc      Json invalid document 8 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0115', 'json invalid 8');
    let failed: boolean = false;
    try {
      JSON.parse('{"a" 1}');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0116
   * @tc.name      testJsonDoc0116
   * @tc.desc      Json invalid document 9 is rejected
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0116', 'json invalid 9');
    let failed: boolean = false;
    try {
      JSON.parse('"unterminated');
    } catch (error) {
      failed = true;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0117
   * @tc.name      testJsonDoc0117
   * @tc.desc      Json value type string survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0117', 'json type string');
    const parsed: Object | null = JSON.parse('"value"') as Object | null;
    expect(typeof parsed).assertEqual('string');
    expect(JSON.parse('"value"') !== undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0118
   * @tc.name      testJsonDoc0118
   * @tc.desc      Json value type number survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0118', 'json type number');
    const parsed: Object | null = JSON.parse('42') as Object | null;
    expect(typeof parsed).assertEqual('number');
    expect(JSON.parse('42') !== undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0119
   * @tc.name      testJsonDoc0119
   * @tc.desc      Json value type boolean survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0119', 'json type boolean');
    const parsed: Object | null = JSON.parse('true') as Object | null;
    expect(typeof parsed).assertEqual('boolean');
    expect(JSON.parse('true') !== undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0120
   * @tc.name      testJsonDoc0120
   * @tc.desc      Json value type array survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testJsonDoc0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testJsonDoc0120', 'json type array');
    const parsed: Object | null = JSON.parse('[1,2,3]') as Object | null;
    expect(Array.isArray(parsed)).assertTrue();
    expect(JSON.parse('[1,2,3]') !== undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0121
   * @tc.name      testJsonDoc0121
   * @tc.desc      Json value type object survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testJsonDoc0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testJsonDoc0121', 'json type object');
    const parsed: Object | null = JSON.parse('{"k":1}') as Object | null;
    expect(typeof parsed).assertEqual('object');
    expect(JSON.parse('{"k":1}') !== undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_JSON_0122
   * @tc.name      testJsonDoc0122
   * @tc.desc      Json value type null survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testJsonDoc0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testJsonDoc0122', 'json type null');
    const parsed: Object | null = JSON.parse('null') as Object | null;
    expect(parsed === null).assertTrue();
    expect(JSON.parse('null') !== undefined).assertTrue();
  });
  });
}
