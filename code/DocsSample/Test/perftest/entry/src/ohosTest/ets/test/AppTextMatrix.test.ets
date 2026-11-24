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

export default function appTextMatrixTest() {
  describe('appTextMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0001
   * @tc.name      testAppText0001
   * @tc.desc      App text 1 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0001', 'text 1');
    const text: string = 'perftest guide';
    expect(text.length).assertEqual(14);
    expect(text.split(' ').length).assertEqual(2);
    expect(text.split('_').length).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('PERFTEST GUIDE');
    expect(text.toLowerCase()).assertEqual('perftest guide');
    expect(text.replace(' ', '-')).assertEqual('perftest-guide');
    expect(text.padStart(18, '.')).assertEqual('....perftest guide');
    expect(text.trim()).assertEqual(text);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0002
   * @tc.name      testAppText0002
   * @tc.desc      App text 2 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0002', 'text 2');
    const text: string = 'perftest';
    expect(text.length).assertEqual(8);
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split('_').length).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('PERFTEST');
    expect(text.toLowerCase()).assertEqual('perftest');
    expect(text.replace(' ', '-')).assertEqual('perftest');
    expect(text.padStart(12, '.')).assertEqual('....perftest');
    expect(text.trim()).assertEqual(text);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0003
   * @tc.name      testAppText0003
   * @tc.desc      App text 3 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0003', 'text 3');
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
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0004
   * @tc.name      testAppText0004
   * @tc.desc      App text slice 1 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0004', 'slice 1');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 1);
    const tail: string = text.substring(1);
    expect(head.length).assertEqual(1);
    expect(tail.length).assertEqual(13);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(1);
    expect(text.slice(1)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('p');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0005
   * @tc.name      testAppText0005
   * @tc.desc      App text slice 2 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0005', 'slice 2');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 2);
    const tail: string = text.substring(2);
    expect(head.length).assertEqual(2);
    expect(tail.length).assertEqual(12);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(2);
    expect(text.slice(2)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('e');
    expect(tail.charAt(0)).assertEqual('r');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0006
   * @tc.name      testAppText0006
   * @tc.desc      App text slice 3 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0006', 'slice 3');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 3);
    const tail: string = text.substring(3);
    expect(head.length).assertEqual(3);
    expect(tail.length).assertEqual(11);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(3);
    expect(text.slice(3)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('r');
    expect(tail.charAt(0)).assertEqual('f');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0007
   * @tc.name      testAppText0007
   * @tc.desc      App text slice 4 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0007', 'slice 4');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 4);
    const tail: string = text.substring(4);
    expect(head.length).assertEqual(4);
    expect(tail.length).assertEqual(10);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(4);
    expect(text.slice(4)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('f');
    expect(tail.charAt(0)).assertEqual('t');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0008
   * @tc.name      testAppText0008
   * @tc.desc      App text slice 5 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0008', 'slice 5');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 5);
    const tail: string = text.substring(5);
    expect(head.length).assertEqual(5);
    expect(tail.length).assertEqual(9);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(5);
    expect(text.slice(5)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('t');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0009
   * @tc.name      testAppText0009
   * @tc.desc      App text slice 6 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0009', 'slice 6');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 6);
    const tail: string = text.substring(6);
    expect(head.length).assertEqual(6);
    expect(tail.length).assertEqual(8);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(6);
    expect(text.slice(6)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('e');
    expect(tail.charAt(0)).assertEqual('s');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0010
   * @tc.name      testAppText0010
   * @tc.desc      App text slice 7 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0010', 'slice 7');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 7);
    const tail: string = text.substring(7);
    expect(head.length).assertEqual(7);
    expect(tail.length).assertEqual(7);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(7);
    expect(text.slice(7)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('s');
    expect(tail.charAt(0)).assertEqual('t');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0011
   * @tc.name      testAppText0011
   * @tc.desc      App text slice 8 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0011', 'slice 8');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 8);
    const tail: string = text.substring(8);
    expect(head.length).assertEqual(8);
    expect(tail.length).assertEqual(6);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(8);
    expect(text.slice(8)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('t');
    expect(tail.charAt(0)).assertEqual(' ');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0012
   * @tc.name      testAppText0012
   * @tc.desc      App text slice 9 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0012', 'slice 9');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 9);
    const tail: string = text.substring(9);
    expect(head.length).assertEqual(9);
    expect(tail.length).assertEqual(5);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(9);
    expect(text.slice(9)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual(' ');
    expect(tail.charAt(0)).assertEqual('g');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0013
   * @tc.name      testAppText0013
   * @tc.desc      App text slice 10 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0013', 'slice 10');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 10);
    const tail: string = text.substring(10);
    expect(head.length).assertEqual(10);
    expect(tail.length).assertEqual(4);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(10);
    expect(text.slice(10)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('g');
    expect(tail.charAt(0)).assertEqual('u');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0014
   * @tc.name      testAppText0014
   * @tc.desc      App text slice 11 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0014', 'slice 11');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 11);
    const tail: string = text.substring(11);
    expect(head.length).assertEqual(11);
    expect(tail.length).assertEqual(3);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(11);
    expect(text.slice(11)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('u');
    expect(tail.charAt(0)).assertEqual('i');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0015
   * @tc.name      testAppText0015
   * @tc.desc      App text slice 12 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0015', 'slice 12');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 12);
    const tail: string = text.substring(12);
    expect(head.length).assertEqual(12);
    expect(tail.length).assertEqual(2);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(12);
    expect(text.slice(12)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('i');
    expect(tail.charAt(0)).assertEqual('d');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0016
   * @tc.name      testAppText0016
   * @tc.desc      App text slice 13 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0016', 'slice 13');
    const text: string = 'perftest guide';
    const head: string = text.substring(0, 13);
    const tail: string = text.substring(13);
    expect(head.length).assertEqual(13);
    expect(tail.length).assertEqual(1);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(13);
    expect(text.slice(13)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('d');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0017
   * @tc.name      testAppText0017
   * @tc.desc      App name repeat 1 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0017', 'app name repeat 1');
    const text: string = 'perftest';
    const repeated: string = text.repeat(1);
    expect(repeated.length).assertEqual(8);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(2);
    expect(repeated.indexOf(text, 1)).assertEqual(8);
    expect(repeated.lastIndexOf(text)).assertEqual(0);
    expect(text.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0018
   * @tc.name      testAppText0018
   * @tc.desc      App name repeat 2 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0018', 'app name repeat 2');
    const text: string = 'perftest';
    const repeated: string = text.repeat(2);
    expect(repeated.length).assertEqual(16);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(3);
    expect(repeated.indexOf(text, 1)).assertEqual(8);
    expect(repeated.lastIndexOf(text)).assertEqual(8);
    expect(text.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0019
   * @tc.name      testAppText0019
   * @tc.desc      App name repeat 3 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0019', 'app name repeat 3');
    const text: string = 'perftest';
    const repeated: string = text.repeat(3);
    expect(repeated.length).assertEqual(24);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(4);
    expect(repeated.indexOf(text, 1)).assertEqual(8);
    expect(repeated.lastIndexOf(text)).assertEqual(16);
    expect(text.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0020
   * @tc.name      testAppText0020
   * @tc.desc      App name repeat 4 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0020', 'app name repeat 4');
    const text: string = 'perftest';
    const repeated: string = text.repeat(4);
    expect(repeated.length).assertEqual(32);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(5);
    expect(repeated.indexOf(text, 1)).assertEqual(8);
    expect(repeated.lastIndexOf(text)).assertEqual(24);
    expect(text.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0021
   * @tc.name      testAppText0021
   * @tc.desc      App name repeat 5 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0021', 'app name repeat 5');
    const text: string = 'perftest';
    const repeated: string = text.repeat(5);
    expect(repeated.length).assertEqual(40);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(6);
    expect(repeated.indexOf(text, 1)).assertEqual(8);
    expect(repeated.lastIndexOf(text)).assertEqual(32);
    expect(text.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0022
   * @tc.name      testAppText0022
   * @tc.desc      App name char 0 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0022', 'app name char 0');
    const text: string = 'perftest';
    const ch: string = text.charAt(0);
    expect(ch).assertEqual('p');
    expect(text.charCodeAt(0)).assertEqual(112);
    expect(text.indexOf(ch)).assertEqual(0);
    expect(text.substring(0, 3)).assertEqual('per');
    expect(text.slice(0).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0023
   * @tc.name      testAppText0023
   * @tc.desc      App name char 1 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0023', 'app name char 1');
    const text: string = 'perftest';
    const ch: string = text.charAt(1);
    expect(ch).assertEqual('e');
    expect(text.charCodeAt(1)).assertEqual(101);
    expect(text.indexOf(ch)).assertEqual(1);
    expect(text.substring(1, 4)).assertEqual('erf');
    expect(text.slice(1).length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0024
   * @tc.name      testAppText0024
   * @tc.desc      App name char 2 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0024', 'app name char 2');
    const text: string = 'perftest';
    const ch: string = text.charAt(2);
    expect(ch).assertEqual('r');
    expect(text.charCodeAt(2)).assertEqual(114);
    expect(text.indexOf(ch)).assertEqual(2);
    expect(text.substring(2, 5)).assertEqual('rft');
    expect(text.slice(2).length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0025
   * @tc.name      testAppText0025
   * @tc.desc      App name char 3 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0025', 'app name char 3');
    const text: string = 'perftest';
    const ch: string = text.charAt(3);
    expect(ch).assertEqual('f');
    expect(text.charCodeAt(3)).assertEqual(102);
    expect(text.indexOf(ch)).assertEqual(3);
    expect(text.substring(3, 6)).assertEqual('fte');
    expect(text.slice(3).length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0026
   * @tc.name      testAppText0026
   * @tc.desc      App name char 4 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0026', 'app name char 4');
    const text: string = 'perftest';
    const ch: string = text.charAt(4);
    expect(ch).assertEqual('t');
    expect(text.charCodeAt(4)).assertEqual(116);
    expect(text.indexOf(ch)).assertEqual(4);
    expect(text.substring(4, 7)).assertEqual('tes');
    expect(text.slice(4).length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0027
   * @tc.name      testAppText0027
   * @tc.desc      App name char 5 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppText0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppText0027', 'app name char 5');
    const text: string = 'perftest';
    const ch: string = text.charAt(5);
    expect(ch).assertEqual('e');
    expect(text.charCodeAt(5)).assertEqual(101);
    expect(text.indexOf(ch)).assertEqual(1);
    expect(text.substring(5, 8)).assertEqual('est');
    expect(text.slice(5).length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0028
   * @tc.name      testAppText0028
   * @tc.desc      App name char 6 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppText0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppText0028', 'app name char 6');
    const text: string = 'perftest';
    const ch: string = text.charAt(6);
    expect(ch).assertEqual('s');
    expect(text.charCodeAt(6)).assertEqual(115);
    expect(text.indexOf(ch)).assertEqual(6);
    expect(text.substring(6, 9)).assertEqual('st');
    expect(text.slice(6).length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ATXT_0029
   * @tc.name      testAppText0029
   * @tc.desc      App name char 7 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppText0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppText0029', 'app name char 7');
    const text: string = 'perftest';
    const ch: string = text.charAt(7);
    expect(ch).assertEqual('t');
    expect(text.charCodeAt(7)).assertEqual(116);
    expect(text.indexOf(ch)).assertEqual(4);
    expect(text.substring(7, 10)).assertEqual('t');
    expect(text.slice(7).length).assertEqual(1);
  });
  });
}
