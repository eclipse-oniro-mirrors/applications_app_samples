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

export default function hspTextMatrixTest() {
  describe('hspTextMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0002
   * @tc.name      testHspText0002
   * @tc.desc      Hsp text 2 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0002', 'text 2');
    const text: string = 'simple009_har_to_hsp';
    expect(text.length).assertEqual(20);
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split('_').length).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('SIMPLE009_HAR_TO_HSP');
    expect(text.toLowerCase()).assertEqual('simple009_har_to_hsp');
    expect(text.replace(' ', '-')).assertEqual('simple009_har_to_hsp');
    expect(text.padStart(24, '.')).assertEqual('....simple009_har_to_hsp');
    expect(text.trim()).assertEqual(text);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0003
   * @tc.name      testHspText0003
   * @tc.desc      Hsp text 3 keeps literal shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0003', 'text 3');
    const text: string = 'page_text_font_size';
    expect(text.length).assertEqual(19);
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split('_').length).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('PAGE_TEXT_FONT_SIZE');
    expect(text.toLowerCase()).assertEqual('page_text_font_size');
    expect(text.replace(' ', '-')).assertEqual('page_text_font_size');
    expect(text.padStart(23, '.')).assertEqual('....page_text_font_size');
    expect(text.trim()).assertEqual(text);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0004
   * @tc.name      testHspText0004
   * @tc.desc      Page text slice 1 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0004', 'slice 1');
    const text: string = 'page from package';
    const head: string = text.substring(0, 1);
    const tail: string = text.substring(1);
    expect(head.length).assertEqual(1);
    expect(tail.length).assertEqual(16);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(1);
    expect(text.slice(1)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('p');
    expect(tail.charAt(0)).assertEqual('a');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0005
   * @tc.name      testHspText0005
   * @tc.desc      Page text slice 2 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0005', 'slice 2');
    const text: string = 'page from package';
    const head: string = text.substring(0, 2);
    const tail: string = text.substring(2);
    expect(head.length).assertEqual(2);
    expect(tail.length).assertEqual(15);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(2);
    expect(text.slice(2)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('a');
    expect(tail.charAt(0)).assertEqual('g');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0006
   * @tc.name      testHspText0006
   * @tc.desc      Page text slice 3 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0006', 'slice 3');
    const text: string = 'page from package';
    const head: string = text.substring(0, 3);
    const tail: string = text.substring(3);
    expect(head.length).assertEqual(3);
    expect(tail.length).assertEqual(14);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(3);
    expect(text.slice(3)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('g');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0007
   * @tc.name      testHspText0007
   * @tc.desc      Page text slice 4 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0007', 'slice 4');
    const text: string = 'page from package';
    const head: string = text.substring(0, 4);
    const tail: string = text.substring(4);
    expect(head.length).assertEqual(4);
    expect(tail.length).assertEqual(13);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(4);
    expect(text.slice(4)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('e');
    expect(tail.charAt(0)).assertEqual(' ');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0008
   * @tc.name      testHspText0008
   * @tc.desc      Page text slice 5 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0008', 'slice 5');
    const text: string = 'page from package';
    const head: string = text.substring(0, 5);
    const tail: string = text.substring(5);
    expect(head.length).assertEqual(5);
    expect(tail.length).assertEqual(12);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(5);
    expect(text.slice(5)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual(' ');
    expect(tail.charAt(0)).assertEqual('f');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0009
   * @tc.name      testHspText0009
   * @tc.desc      Page text slice 6 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0009', 'slice 6');
    const text: string = 'page from package';
    const head: string = text.substring(0, 6);
    const tail: string = text.substring(6);
    expect(head.length).assertEqual(6);
    expect(tail.length).assertEqual(11);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(6);
    expect(text.slice(6)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('f');
    expect(tail.charAt(0)).assertEqual('r');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0010
   * @tc.name      testHspText0010
   * @tc.desc      Page text slice 7 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0010', 'slice 7');
    const text: string = 'page from package';
    const head: string = text.substring(0, 7);
    const tail: string = text.substring(7);
    expect(head.length).assertEqual(7);
    expect(tail.length).assertEqual(10);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(7);
    expect(text.slice(7)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('r');
    expect(tail.charAt(0)).assertEqual('o');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0011
   * @tc.name      testHspText0011
   * @tc.desc      Page text slice 8 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0011', 'slice 8');
    const text: string = 'page from package';
    const head: string = text.substring(0, 8);
    const tail: string = text.substring(8);
    expect(head.length).assertEqual(8);
    expect(tail.length).assertEqual(9);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(8);
    expect(text.slice(8)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('o');
    expect(tail.charAt(0)).assertEqual('m');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0012
   * @tc.name      testHspText0012
   * @tc.desc      Page text slice 9 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0012', 'slice 9');
    const text: string = 'page from package';
    const head: string = text.substring(0, 9);
    const tail: string = text.substring(9);
    expect(head.length).assertEqual(9);
    expect(tail.length).assertEqual(8);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(9);
    expect(text.slice(9)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('m');
    expect(tail.charAt(0)).assertEqual(' ');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0013
   * @tc.name      testHspText0013
   * @tc.desc      Page text slice 10 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0013', 'slice 10');
    const text: string = 'page from package';
    const head: string = text.substring(0, 10);
    const tail: string = text.substring(10);
    expect(head.length).assertEqual(10);
    expect(tail.length).assertEqual(7);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(10);
    expect(text.slice(10)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual(' ');
    expect(tail.charAt(0)).assertEqual('p');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0014
   * @tc.name      testHspText0014
   * @tc.desc      Page text slice 11 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0014', 'slice 11');
    const text: string = 'page from package';
    const head: string = text.substring(0, 11);
    const tail: string = text.substring(11);
    expect(head.length).assertEqual(11);
    expect(tail.length).assertEqual(6);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(11);
    expect(text.slice(11)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('p');
    expect(tail.charAt(0)).assertEqual('a');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0015
   * @tc.name      testHspText0015
   * @tc.desc      Page text slice 12 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0015', 'slice 12');
    const text: string = 'page from package';
    const head: string = text.substring(0, 12);
    const tail: string = text.substring(12);
    expect(head.length).assertEqual(12);
    expect(tail.length).assertEqual(5);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(12);
    expect(text.slice(12)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('a');
    expect(tail.charAt(0)).assertEqual('c');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0016
   * @tc.name      testHspText0016
   * @tc.desc      Page text slice 13 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0016', 'slice 13');
    const text: string = 'page from package';
    const head: string = text.substring(0, 13);
    const tail: string = text.substring(13);
    expect(head.length).assertEqual(13);
    expect(tail.length).assertEqual(4);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(13);
    expect(text.slice(13)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('c');
    expect(tail.charAt(0)).assertEqual('k');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0017
   * @tc.name      testHspText0017
   * @tc.desc      Page text slice 14 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0017', 'slice 14');
    const text: string = 'page from package';
    const head: string = text.substring(0, 14);
    const tail: string = text.substring(14);
    expect(head.length).assertEqual(14);
    expect(tail.length).assertEqual(3);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(14);
    expect(text.slice(14)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('k');
    expect(tail.charAt(0)).assertEqual('a');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0018
   * @tc.name      testHspText0018
   * @tc.desc      Page text slice 15 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0018', 'slice 15');
    const text: string = 'page from package';
    const head: string = text.substring(0, 15);
    const tail: string = text.substring(15);
    expect(head.length).assertEqual(15);
    expect(tail.length).assertEqual(2);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(15);
    expect(text.slice(15)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('a');
    expect(tail.charAt(0)).assertEqual('g');
    expect(tail.length + head.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0019
   * @tc.name      testHspText0019
   * @tc.desc      Page text slice 16 rejoins
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0019', 'slice 16');
    const text: string = 'page from package';
    const head: string = text.substring(0, 16);
    const tail: string = text.substring(16);
    expect(head.length).assertEqual(16);
    expect(tail.length).assertEqual(1);
    expect(head + tail).assertEqual(text);
    expect(text.indexOf(head)).assertEqual(0);
    expect(text.lastIndexOf(tail)).assertEqual(16);
    expect(text.slice(16)).assertEqual(tail);
    expect(head.charAt(head.length - 1)).assertEqual('g');
    expect(tail.charAt(0)).assertEqual('e');
    expect(tail.length + head.length).assertEqual(17);
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0021
   * @tc.name      testHspText0021
   * @tc.desc      App name repeat 2 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0021', 'app name repeat 2');
    const text: string = 'simple009_har_to_hsp';
    const repeated: string = text.repeat(2);
    expect(repeated.length).assertEqual(40);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(3);
    expect(repeated.indexOf(text, 1)).assertEqual(20);
    expect(repeated.lastIndexOf(text)).assertEqual(20);
    expect(text.length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0022
   * @tc.name      testHspText0022
   * @tc.desc      App name repeat 3 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0022', 'app name repeat 3');
    const text: string = 'simple009_har_to_hsp';
    const repeated: string = text.repeat(3);
    expect(repeated.length).assertEqual(60);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(4);
    expect(repeated.indexOf(text, 1)).assertEqual(20);
    expect(repeated.lastIndexOf(text)).assertEqual(40);
    expect(text.length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0023
   * @tc.name      testHspText0023
   * @tc.desc      App name repeat 4 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0023', 'app name repeat 4');
    const text: string = 'simple009_har_to_hsp';
    const repeated: string = text.repeat(4);
    expect(repeated.length).assertEqual(80);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(5);
    expect(repeated.indexOf(text, 1)).assertEqual(20);
    expect(repeated.lastIndexOf(text)).assertEqual(60);
    expect(text.length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0024
   * @tc.name      testHspText0024
   * @tc.desc      App name repeat 5 stays aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0024', 'app name repeat 5');
    const text: string = 'simple009_har_to_hsp';
    const repeated: string = text.repeat(5);
    expect(repeated.length).assertEqual(100);
    expect(repeated.startsWith(text)).assertTrue();
    expect(repeated.endsWith(text)).assertTrue();
    expect(repeated.split(text).length).assertEqual(6);
    expect(repeated.indexOf(text, 1)).assertEqual(20);
    expect(repeated.lastIndexOf(text)).assertEqual(80);
    expect(text.length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0025
   * @tc.name      testHspText0025
   * @tc.desc      App name char 0 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0025', 'app name char 0');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(0);
    expect(ch).assertEqual('s');
    expect(text.charCodeAt(0)).assertEqual(115);
    expect(text.indexOf(ch)).assertEqual(0);
    expect(text.substring(0, 3)).assertEqual('sim');
    expect(text.slice(0).length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0026
   * @tc.name      testHspText0026
   * @tc.desc      App name char 1 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0026', 'app name char 1');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(1);
    expect(ch).assertEqual('i');
    expect(text.charCodeAt(1)).assertEqual(105);
    expect(text.indexOf(ch)).assertEqual(1);
    expect(text.substring(1, 4)).assertEqual('imp');
    expect(text.slice(1).length).assertEqual(19);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0027
   * @tc.name      testHspText0027
   * @tc.desc      App name char 2 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0027', 'app name char 2');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(2);
    expect(ch).assertEqual('m');
    expect(text.charCodeAt(2)).assertEqual(109);
    expect(text.indexOf(ch)).assertEqual(2);
    expect(text.substring(2, 5)).assertEqual('mpl');
    expect(text.slice(2).length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0028
   * @tc.name      testHspText0028
   * @tc.desc      App name char 3 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0028', 'app name char 3');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(3);
    expect(ch).assertEqual('p');
    expect(text.charCodeAt(3)).assertEqual(112);
    expect(text.indexOf(ch)).assertEqual(3);
    expect(text.substring(3, 6)).assertEqual('ple');
    expect(text.slice(3).length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0029
   * @tc.name      testHspText0029
   * @tc.desc      App name char 4 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0029', 'app name char 4');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(4);
    expect(ch).assertEqual('l');
    expect(text.charCodeAt(4)).assertEqual(108);
    expect(text.indexOf(ch)).assertEqual(4);
    expect(text.substring(4, 7)).assertEqual('le0');
    expect(text.slice(4).length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0030
   * @tc.name      testHspText0030
   * @tc.desc      App name char 5 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0030', 'app name char 5');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(5);
    expect(ch).assertEqual('e');
    expect(text.charCodeAt(5)).assertEqual(101);
    expect(text.indexOf(ch)).assertEqual(5);
    expect(text.substring(5, 8)).assertEqual('e00');
    expect(text.slice(5).length).assertEqual(15);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0031
   * @tc.name      testHspText0031
   * @tc.desc      App name char 6 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0031', 'app name char 6');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(6);
    expect(ch).assertEqual('0');
    expect(text.charCodeAt(6)).assertEqual(48);
    expect(text.indexOf(ch)).assertEqual(6);
    expect(text.substring(6, 9)).assertEqual('009');
    expect(text.slice(6).length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0032
   * @tc.name      testHspText0032
   * @tc.desc      App name char 7 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0032', 'app name char 7');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(7);
    expect(ch).assertEqual('0');
    expect(text.charCodeAt(7)).assertEqual(48);
    expect(text.indexOf(ch)).assertEqual(6);
    expect(text.substring(7, 10)).assertEqual('09_');
    expect(text.slice(7).length).assertEqual(13);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0033
   * @tc.name      testHspText0033
   * @tc.desc      App name char 8 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0033', 'app name char 8');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(8);
    expect(ch).assertEqual('9');
    expect(text.charCodeAt(8)).assertEqual(57);
    expect(text.indexOf(ch)).assertEqual(8);
    expect(text.substring(8, 11)).assertEqual('9_h');
    expect(text.slice(8).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0034
   * @tc.name      testHspText0034
   * @tc.desc      App name char 9 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0034', 'app name char 9');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(9);
    expect(ch).assertEqual('_');
    expect(text.charCodeAt(9)).assertEqual(95);
    expect(text.indexOf(ch)).assertEqual(9);
    expect(text.substring(9, 12)).assertEqual('_ha');
    expect(text.slice(9).length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0035
   * @tc.name      testHspText0035
   * @tc.desc      App name char 10 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0035', 'app name char 10');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(10);
    expect(ch).assertEqual('h');
    expect(text.charCodeAt(10)).assertEqual(104);
    expect(text.indexOf(ch)).assertEqual(10);
    expect(text.substring(10, 13)).assertEqual('har');
    expect(text.slice(10).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0036
   * @tc.name      testHspText0036
   * @tc.desc      App name char 11 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0036', 'app name char 11');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(11);
    expect(ch).assertEqual('a');
    expect(text.charCodeAt(11)).assertEqual(97);
    expect(text.indexOf(ch)).assertEqual(11);
    expect(text.substring(11, 14)).assertEqual('ar_');
    expect(text.slice(11).length).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0037
   * @tc.name      testHspText0037
   * @tc.desc      App name char 12 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0037', 'app name char 12');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(12);
    expect(ch).assertEqual('r');
    expect(text.charCodeAt(12)).assertEqual(114);
    expect(text.indexOf(ch)).assertEqual(12);
    expect(text.substring(12, 15)).assertEqual('r_t');
    expect(text.slice(12).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0038
   * @tc.name      testHspText0038
   * @tc.desc      App name char 13 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0038', 'app name char 13');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(13);
    expect(ch).assertEqual('_');
    expect(text.charCodeAt(13)).assertEqual(95);
    expect(text.indexOf(ch)).assertEqual(9);
    expect(text.substring(13, 16)).assertEqual('_to');
    expect(text.slice(13).length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0039
   * @tc.name      testHspText0039
   * @tc.desc      App name char 14 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0039', 'app name char 14');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(14);
    expect(ch).assertEqual('t');
    expect(text.charCodeAt(14)).assertEqual(116);
    expect(text.indexOf(ch)).assertEqual(14);
    expect(text.substring(14, 17)).assertEqual('to_');
    expect(text.slice(14).length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0040
   * @tc.name      testHspText0040
   * @tc.desc      App name char 15 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0040', 'app name char 15');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(15);
    expect(ch).assertEqual('o');
    expect(text.charCodeAt(15)).assertEqual(111);
    expect(text.indexOf(ch)).assertEqual(15);
    expect(text.substring(15, 18)).assertEqual('o_h');
    expect(text.slice(15).length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0041
   * @tc.name      testHspText0041
   * @tc.desc      App name char 16 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0041', 'app name char 16');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(16);
    expect(ch).assertEqual('_');
    expect(text.charCodeAt(16)).assertEqual(95);
    expect(text.indexOf(ch)).assertEqual(9);
    expect(text.substring(16, 19)).assertEqual('_hs');
    expect(text.slice(16).length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0042
   * @tc.name      testHspText0042
   * @tc.desc      App name char 17 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHspText0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHspText0042', 'app name char 17');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(17);
    expect(ch).assertEqual('h');
    expect(text.charCodeAt(17)).assertEqual(104);
    expect(text.indexOf(ch)).assertEqual(10);
    expect(text.substring(17, 20)).assertEqual('hsp');
    expect(text.slice(17).length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0043
   * @tc.name      testHspText0043
   * @tc.desc      App name char 18 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHspText0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHspText0043', 'app name char 18');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(18);
    expect(ch).assertEqual('s');
    expect(text.charCodeAt(18)).assertEqual(115);
    expect(text.indexOf(ch)).assertEqual(0);
    expect(text.substring(18, 21)).assertEqual('sp');
    expect(text.slice(18).length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_HSPTXT_0044
   * @tc.name      testHspText0044
   * @tc.desc      App name char 19 looks up
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHspText0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHspText0044', 'app name char 19');
    const text: string = 'simple009_har_to_hsp';
    const ch: string = text.charAt(19);
    expect(ch).assertEqual('p');
    expect(text.charCodeAt(19)).assertEqual(112);
    expect(text.indexOf(ch)).assertEqual(3);
    expect(text.substring(19, 22)).assertEqual('p');
    expect(text.slice(19).length).assertEqual(1);
  });
  });
}
