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

export default function multiTextMatrixTest() {
  describe('multiTextMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0001
   * @tc.name      testMultiText0001
   * @tc.desc      Multi text 1 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0001', 'text 1');
    const text: string = 'multi instance guide';
    expect(text.length).assertEqual(20);
    expect(text.split(' ').length).assertEqual(3);
    expect(text.split('_').length).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('MULTI INSTANCE GUIDE');
    expect(text.toLowerCase()).assertEqual('multi instance guide');
    expect(text.replace(' ', '-')).assertEqual('multi-instance-guide');
    expect(text.padStart(24, '.')).assertEqual('....multi instance guide');
    expect(text.trim()).assertEqual(text);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0002
   * @tc.name      testMultiText0002
   * @tc.desc      Multi text 2 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0002', 'text 2');
    const text: string = 'simple004_multiinstance';
    expect(text.length).assertEqual(23);
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split('_').length).assertEqual(2);
    expect(text.toUpperCase()).assertEqual('SIMPLE004_MULTIINSTANCE');
    expect(text.toLowerCase()).assertEqual('simple004_multiinstance');
    expect(text.replace(' ', '-')).assertEqual('simple004_multiinstance');
    expect(text.padStart(27, '.')).assertEqual('....simple004_multiinstance');
    expect(text.trim()).assertEqual(text);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0003
   * @tc.name      testMultiText0003
   * @tc.desc      Multi text 3 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0003', 'text 3');
    const text: string = 'module description';
    expect(text.length).assertEqual(18);
    expect(text.split(' ').length).assertEqual(2);
    expect(text.split('_').length).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('MODULE DESCRIPTION');
    expect(text.toLowerCase()).assertEqual('module description');
    expect(text.replace(' ', '-')).assertEqual('module-description');
    expect(text.padStart(22, '.')).assertEqual('....module description');
    expect(text.trim()).assertEqual(text);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0004
   * @tc.name      testMultiText0004
   * @tc.desc      Instance text slice 1 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0004', 'slice 1');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 1);
    const tail: string = text.substring(1);
    expect(head.length).assertEqual(1);
    expect(tail.length).assertEqual(19);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(1);
    expect(text.slice(1)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('m');
    expect(tail.charAt(0)).assertEqual('u');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0005
   * @tc.name      testMultiText0005
   * @tc.desc      Instance text slice 2 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0005', 'slice 2');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 2);
    const tail: string = text.substring(2);
    expect(head.length).assertEqual(2);
    expect(tail.length).assertEqual(18);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(2);
    expect(text.slice(2)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('u');
    expect(tail.charAt(0)).assertEqual('l');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0006
   * @tc.name      testMultiText0006
   * @tc.desc      Instance text slice 3 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0006', 'slice 3');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 3);
    const tail: string = text.substring(3);
    expect(head.length).assertEqual(3);
    expect(tail.length).assertEqual(17);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(3);
    expect(text.slice(3)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('l');
    expect(tail.charAt(0)).assertEqual('t');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0007
   * @tc.name      testMultiText0007
   * @tc.desc      Instance text slice 4 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0007', 'slice 4');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 4);
    const tail: string = text.substring(4);
    expect(head.length).assertEqual(4);
    expect(tail.length).assertEqual(16);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(4);
    expect(text.slice(4)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('t');
    expect(tail.charAt(0)).assertEqual('i');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0008
   * @tc.name      testMultiText0008
   * @tc.desc      Instance text slice 5 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0008', 'slice 5');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 5);
    const tail: string = text.substring(5);
    expect(head.length).assertEqual(5);
    expect(tail.length).assertEqual(15);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(5);
    expect(text.slice(5)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('i');
    expect(tail.charAt(0)).assertEqual(' ');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0009
   * @tc.name      testMultiText0009
   * @tc.desc      Instance text slice 6 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0009', 'slice 6');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 6);
    const tail: string = text.substring(6);
    expect(head.length).assertEqual(6);
    expect(tail.length).assertEqual(14);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(6);
    expect(text.slice(6)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual(' ');
    expect(tail.charAt(0)).assertEqual('i');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0010
   * @tc.name      testMultiText0010
   * @tc.desc      Instance text slice 7 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0010', 'slice 7');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 7);
    const tail: string = text.substring(7);
    expect(head.length).assertEqual(7);
    expect(tail.length).assertEqual(13);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(7);
    expect(text.slice(7)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('i');
    expect(tail.charAt(0)).assertEqual('n');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0011
   * @tc.name      testMultiText0011
   * @tc.desc      Instance text slice 8 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0011', 'slice 8');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 8);
    const tail: string = text.substring(8);
    expect(head.length).assertEqual(8);
    expect(tail.length).assertEqual(12);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(8);
    expect(text.slice(8)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('n');
    expect(tail.charAt(0)).assertEqual('s');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0012
   * @tc.name      testMultiText0012
   * @tc.desc      Instance text slice 9 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0012', 'slice 9');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 9);
    const tail: string = text.substring(9);
    expect(head.length).assertEqual(9);
    expect(tail.length).assertEqual(11);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(9);
    expect(text.slice(9)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('s');
    expect(tail.charAt(0)).assertEqual('t');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0013
   * @tc.name      testMultiText0013
   * @tc.desc      Instance text slice 10 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0013', 'slice 10');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 10);
    const tail: string = text.substring(10);
    expect(head.length).assertEqual(10);
    expect(tail.length).assertEqual(10);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(10);
    expect(text.slice(10)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('t');
    expect(tail.charAt(0)).assertEqual('a');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0014
   * @tc.name      testMultiText0014
   * @tc.desc      Instance text slice 11 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0014', 'slice 11');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 11);
    const tail: string = text.substring(11);
    expect(head.length).assertEqual(11);
    expect(tail.length).assertEqual(9);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(11);
    expect(text.slice(11)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('a');
    expect(tail.charAt(0)).assertEqual('n');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0015
   * @tc.name      testMultiText0015
   * @tc.desc      Instance text slice 12 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0015', 'slice 12');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 12);
    const tail: string = text.substring(12);
    expect(head.length).assertEqual(12);
    expect(tail.length).assertEqual(8);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(12);
    expect(text.slice(12)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('n');
    expect(tail.charAt(0)).assertEqual('c');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0016
   * @tc.name      testMultiText0016
   * @tc.desc      Instance text slice 13 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0016', 'slice 13');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 13);
    const tail: string = text.substring(13);
    expect(head.length).assertEqual(13);
    expect(tail.length).assertEqual(7);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(13);
    expect(text.slice(13)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('c');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0017
   * @tc.name      testMultiText0017
