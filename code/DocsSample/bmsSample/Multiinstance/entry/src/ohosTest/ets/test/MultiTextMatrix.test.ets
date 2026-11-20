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
   * @tc.desc      Instance text slice 14 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0017', 'slice 14');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 14);
    const tail: string = text.substring(14);
    expect(head.length).assertEqual(14);
    expect(tail.length).assertEqual(6);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(14);
    expect(text.slice(14)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('e');
    expect(tail.charAt(0)).assertEqual(' ');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0018
   * @tc.name      testMultiText0018
   * @tc.desc      Instance text slice 15 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0018', 'slice 15');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 15);
    const tail: string = text.substring(15);
    expect(head.length).assertEqual(15);
    expect(tail.length).assertEqual(5);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(15);
    expect(text.slice(15)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual(' ');
    expect(tail.charAt(0)).assertEqual('g');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0019
   * @tc.name      testMultiText0019
   * @tc.desc      Instance text slice 16 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0019', 'slice 16');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 16);
    const tail: string = text.substring(16);
    expect(head.length).assertEqual(16);
    expect(tail.length).assertEqual(4);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(16);
    expect(text.slice(16)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('g');
    expect(tail.charAt(0)).assertEqual('u');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0020
   * @tc.name      testMultiText0020
   * @tc.desc      Instance text slice 17 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0020', 'slice 17');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 17);
    const tail: string = text.substring(17);
    expect(head.length).assertEqual(17);
    expect(tail.length).assertEqual(3);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(17);
    expect(text.slice(17)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('u');
    expect(tail.charAt(0)).assertEqual('i');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0021
   * @tc.name      testMultiText0021
   * @tc.desc      Instance text slice 18 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0021', 'slice 18');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 18);
    const tail: string = text.substring(18);
    expect(head.length).assertEqual(18);
    expect(tail.length).assertEqual(2);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(18);
    expect(text.slice(18)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('i');
    expect(tail.charAt(0)).assertEqual('d');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0022
   * @tc.name      testMultiText0022
   * @tc.desc      Instance text slice 19 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0022', 'slice 19');
    const text: string = 'multi instance guide';
    const head: string = text.substring(0, 19);
    const tail: string = text.substring(19);
    expect(head.length).assertEqual(19);
    expect(tail.length).assertEqual(1);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(19);
    expect(text.slice(19)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('d');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0023
   * @tc.name      testMultiText0023
   * @tc.desc      App name repeat 1 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0023', 'app name repeat 1');
    const text: string = 'simple004_multiinstance';
    const repeated: string = text.repeat(1);
    expect(repeated.length).assertEqual(23);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(2);
    expect(repeated.indexOf(text, 1)).assertEqual(23);
    expect(repeated.lastIndexOf(text)).assertEqual(0);
    expect(text.length).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0024
   * @tc.name      testMultiText0024
   * @tc.desc      App name repeat 2 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0024', 'app name repeat 2');
    const text: string = 'simple004_multiinstance';
    const repeated: string = text.repeat(2);
    expect(repeated.length).assertEqual(46);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(3);
    expect(repeated.indexOf(text, 1)).assertEqual(23);
    expect(repeated.lastIndexOf(text)).assertEqual(23);
    expect(text.length).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0025
   * @tc.name      testMultiText0025
   * @tc.desc      App name repeat 3 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0025', 'app name repeat 3');
    const text: string = 'simple004_multiinstance';
    const repeated: string = text.repeat(3);
    expect(repeated.length).assertEqual(69);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(4);
    expect(repeated.indexOf(text, 1)).assertEqual(23);
    expect(repeated.lastIndexOf(text)).assertEqual(46);
    expect(text.length).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0026
   * @tc.name      testMultiText0026
   * @tc.desc      App name repeat 4 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0026', 'app name repeat 4');
    const text: string = 'simple004_multiinstance';
    const repeated: string = text.repeat(4);
    expect(repeated.length).assertEqual(92);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(5);
    expect(repeated.indexOf(text, 1)).assertEqual(23);
    expect(repeated.lastIndexOf(text)).assertEqual(69);
    expect(text.length).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0027
   * @tc.name      testMultiText0027
   * @tc.desc      App name repeat 5 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0027', 'app name repeat 5');
    const text: string = 'simple004_multiinstance';
    const repeated: string = text.repeat(5);
    expect(repeated.length).assertEqual(115);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(6);
    expect(repeated.indexOf(text, 1)).assertEqual(23);
    expect(repeated.lastIndexOf(text)).assertEqual(92);
    expect(text.length).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0028
   * @tc.name      testMultiText0028
   * @tc.desc      App name char 0 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0028', 'app name char 0');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(0);
    expect(ch).assertEqual('s');
    expect(text.charCodeAt(0)).assertEqual(115);
    expect(text.indexOf(ch)).assertEqual(0);
    expect(text.substring(0, 3)).assertEqual('sim');
    expect(text.slice(0).length).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0029
   * @tc.name      testMultiText0029
   * @tc.desc      App name char 1 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0029', 'app name char 1');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(1);
    expect(ch).assertEqual('i');
    expect(text.charCodeAt(1)).assertEqual(105);
    expect(text.indexOf(ch)).assertEqual(1);
    expect(text.substring(1, 4)).assertEqual('imp');
    expect(text.slice(1).length).assertEqual(22);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0030
   * @tc.name      testMultiText0030
   * @tc.desc      App name char 2 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0030', 'app name char 2');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(2);
    expect(ch).assertEqual('m');
    expect(text.charCodeAt(2)).assertEqual(109);
    expect(text.indexOf(ch)).assertEqual(2);
    expect(text.substring(2, 5)).assertEqual('mpl');
    expect(text.slice(2).length).assertEqual(21);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0031
   * @tc.name      testMultiText0031
   * @tc.desc      App name char 3 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0031', 'app name char 3');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(3);
    expect(ch).assertEqual('p');
    expect(text.charCodeAt(3)).assertEqual(112);
    expect(text.indexOf(ch)).assertEqual(3);
    expect(text.substring(3, 6)).assertEqual('ple');
    expect(text.slice(3).length).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0032
   * @tc.name      testMultiText0032
   * @tc.desc      App name char 4 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiText0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiText0032', 'app name char 4');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(4);
    expect(ch).assertEqual('l');
    expect(text.charCodeAt(4)).assertEqual(108);
    expect(text.indexOf(ch)).assertEqual(4);
    expect(text.substring(4, 7)).assertEqual('le0');
    expect(text.slice(4).length).assertEqual(19);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0033
   * @tc.name      testMultiText0033
   * @tc.desc      App name char 5 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiText0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiText0033', 'app name char 5');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(5);
    expect(ch).assertEqual('e');
    expect(text.charCodeAt(5)).assertEqual(101);
    expect(text.indexOf(ch)).assertEqual(5);
    expect(text.substring(5, 8)).assertEqual('e00');
    expect(text.slice(5).length).assertEqual(18);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MITXT_0034
   * @tc.name      testMultiText0034
   * @tc.desc      App name char 6 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiText0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiText0034', 'app name char 6');
    const text: string = 'simple004_multiinstance';
    const ch: string = text.charAt(6);
    expect(ch).assertEqual('0');
    expect(text.charCodeAt(6)).assertEqual(48);
    expect(text.indexOf(ch)).assertEqual(6);
    expect(text.substring(6, 9)).assertEqual('004');
    expect(text.slice(6).length).assertEqual(17);
  });
  });
}
