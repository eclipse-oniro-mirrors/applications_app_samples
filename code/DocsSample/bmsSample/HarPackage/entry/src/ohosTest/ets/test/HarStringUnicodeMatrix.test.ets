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
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function harStringUnicodeMatrixTest() {
  describe('HarStringUnicodeMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0001
     * @tc.name      testUnicode0001
     * @tc.desc      Unicode sequence 1 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4E00\u4E10\u3041';
      logCase('testUnicode0001', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(19968);
      expect(text.codePointAt(0)).assertEqual(19968);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12353);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E10')).assertTrue();
      expect(text.indexOf('\u4E10') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4E00\u4E10');
      expect(text.slice(1, 3)).assertEqual('\u4E10\u3041');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0417\u043B\u4E01';
      logCase('testUnicode0002', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1047);
      expect(text.codePointAt(0)).assertEqual(1047);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19969);
      expect(text.toUpperCase()).assertEqual('\u0417\u041B\u4E01');
      expect(text.toLowerCase()).assertEqual('\u0437\u043B\u4E01');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u043B')).assertTrue();
      expect(text.indexOf('\u043B') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0417\u043B');
      expect(text.slice(1, 3)).assertEqual('\u043B\u4E01');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0003
     * @tc.name      testUnicode0003
     * @tc.desc      Unicode sequence 3 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u039B\u03B7\u03C9';
      logCase('testUnicode0003', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(923);
      expect(text.codePointAt(0)).assertEqual(923);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u039B\u0397\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03BB\u03B7\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B7')).assertTrue();
      expect(text.indexOf('\u03B7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039B\u03B7');
      expect(text.slice(1, 3)).assertEqual('\u03B7\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00C9\u00EF\u4E03';
      logCase('testUnicode0004', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(201);
      expect(text.codePointAt(0)).assertEqual(201);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19971);
      expect(text.toUpperCase()).assertEqual('\u00C9\u00CF\u4E03');
      expect(text.toLowerCase()).assertEqual('\u00E9\u00EF\u4E03');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EF')).assertTrue();
      expect(text.indexOf('\u00EF') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C9\u00EF');
      expect(text.slice(1, 3)).assertEqual('\u00EF\u4E03');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0005
     * @tc.name      testUnicode0005
     * @tc.desc      Unicode sequence 5 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u2234\u2260\u2211';
      logCase('testUnicode0005', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8756);
      expect(text.codePointAt(0)).assertEqual(8756);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2234\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0035\u002E\u0035\u0035';
      logCase('testUnicode0006', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(53);
      expect(text.codePointAt(0)).assertEqual(53);
      expect(text.charCodeAt(text.length - 1)).assertEqual(53);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0035')).assertTrue();
      expect(text.indexOf('\u0035') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0035\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0035');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0035\u002E\u0035\u0035\u0035\u002E\u0035\u0035');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0007
     * @tc.name      testUnicode0007
     * @tc.desc      Unicode sequence 7 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0007', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F03\u4F83\u3076';
      logCase('testUnicode0008', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(20227);
      expect(text.codePointAt(0)).assertEqual(20227);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12406);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4F83')).assertTrue();
      expect(text.indexOf('\u4F83') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F03\u4F83');
      expect(text.slice(1, 3)).assertEqual('\u4F83\u3076');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0009
     * @tc.name      testUnicode0009
     * @tc.desc      Unicode sequence 9 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0448\u0459\u4E08';
      logCase('testUnicode0009', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1096);
      expect(text.codePointAt(0)).assertEqual(1096);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19976);
      expect(text.toUpperCase()).assertEqual('\u0428\u0409\u4E08');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0459')).assertTrue();
      expect(text.indexOf('\u0459') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0448\u0459');
      expect(text.slice(1, 3)).assertEqual('\u0459\u4E08');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u03A6\u03B4\u03C9';
      logCase('testUnicode0010', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(934);
      expect(text.codePointAt(0)).assertEqual(934);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A6\u0394\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C6\u03B4\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B4')).assertTrue();
      expect(text.indexOf('\u03B4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A6\u03B4');
      expect(text.slice(1, 3)).assertEqual('\u03B4\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0011
     * @tc.name      testUnicode0011
     * @tc.desc      Unicode sequence 11 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u00C1\u00F5\uD83D\uDE00';
      logCase('testUnicode0011', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(193);
      expect(text.codePointAt(0)).assertEqual(193);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u00C1\u00D5\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u00E1\u00F5\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C1\u00F5');
      expect(text.slice(1, 3)).assertEqual('\u00F5\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u228F\u2260\u2211';
      logCase('testUnicode0012', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8847);
      expect(text.codePointAt(0)).assertEqual(8847);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u228F\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u228F\u2260\u2211\u228F\u2260\u2211');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0013
     * @tc.name      testUnicode0013
     * @tc.desc      Unicode sequence 13 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0032\u002E\u0036\u0034\u4E2D\u6587';
      logCase('testUnicode0013', `len=${text.length}`);
      expect(text.length).assertEqual(6);
      expect(text.charCodeAt(0)).assertEqual(50);
      expect(text.codePointAt(0)).assertEqual(50);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0034')).assertTrue();
      expect(text.indexOf('\u0034') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0032\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0036');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0014', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0015
     * @tc.name      testUnicode0015
     * @tc.desc      Unicode sequence 15 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u5006\u50F6\u305B';
      logCase('testUnicode0015', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(20486);
      expect(text.codePointAt(0)).assertEqual(20486);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12379);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u50F6')).assertTrue();
      expect(text.indexOf('\u50F6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5006\u50F6');
      expect(text.slice(1, 3)).assertEqual('\u50F6\u305B');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u043A\u0448\u4E0F';
      logCase('testUnicode0016', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1082);
      expect(text.codePointAt(0)).assertEqual(1082);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19983);
      expect(text.toUpperCase()).assertEqual('\u041A\u0428\u4E0F');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0448')).assertTrue();
      expect(text.indexOf('\u0448') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u043A\u0448');
      expect(text.slice(1, 3)).assertEqual('\u0448\u4E0F');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0017
     * @tc.name      testUnicode0017
     * @tc.desc      Unicode sequence 17 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0399\u03B1\u03C9';
      logCase('testUnicode0017', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(921);
      expect(text.codePointAt(0)).assertEqual(921);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0399\u0391\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B9\u03B1\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B1')).assertTrue();
      expect(text.indexOf('\u03B1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0399\u03B1');
      expect(text.slice(1, 3)).assertEqual('\u03B1\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00D6\u00FB\u4E11';
      logCase('testUnicode0018', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(214);
      expect(text.codePointAt(0)).assertEqual(214);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19985);
      expect(text.toUpperCase()).assertEqual('\u00D6\u00DB\u4E11');
      expect(text.toLowerCase()).assertEqual('\u00F6\u00FB\u4E11');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00FB')).assertTrue();
      expect(text.indexOf('\u00FB') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D6\u00FB');
      expect(text.slice(1, 3)).assertEqual('\u00FB\u4E11');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u00D6\u00FB\u4E11\u00D6\u00FB\u4E11');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0019
     * @tc.name      testUnicode0019
     * @tc.desc      Unicode sequence 19 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u22EA\u2260\u2211';
      logCase('testUnicode0019', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8938);
      expect(text.codePointAt(0)).assertEqual(8938);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22EA\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0039\u002E\u0037\u0033';
      logCase('testUnicode0020', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(57);
      expect(text.codePointAt(0)).assertEqual(57);
      expect(text.charCodeAt(text.length - 1)).assertEqual(51);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0037')).assertTrue();
      expect(text.indexOf('\u0037') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0039\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0037');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0021
     * @tc.name      testUnicode0021
     * @tc.desc      Unicode sequence 21 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0021', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u5109\u5269\u3090\uD83D\uDE00';
      logCase('testUnicode0022', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20745);
      expect(text.codePointAt(0)).assertEqual(20745);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u3090')).assertTrue();
      expect(text.indexOf('\u3090') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5109\u5269');
      expect(text.slice(1, 3)).assertEqual('\u5269\u3090');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0023
     * @tc.name      testUnicode0023
     * @tc.desc      Unicode sequence 23 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u042C\u0437\u4E16';
      logCase('testUnicode0023', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1068);
      expect(text.codePointAt(0)).assertEqual(1068);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19990);
      expect(text.toUpperCase()).assertEqual('\u042C\u0417\u4E16');
      expect(text.toLowerCase()).assertEqual('\u044C\u0437\u4E16');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0437')).assertTrue();
      expect(text.indexOf('\u0437') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u042C\u0437');
      expect(text.slice(1, 3)).assertEqual('\u0437\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u03A4\u03C6\u03C9';
      logCase('testUnicode0024', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(932);
      expect(text.codePointAt(0)).assertEqual(932);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A4\u03A6\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C4\u03C6\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C6')).assertTrue();
      expect(text.indexOf('\u03C6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A4\u03C6');
      expect(text.slice(1, 3)).assertEqual('\u03C6\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u03A4\u03C6\u03C9\u03A4\u03C6\u03C9');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0025
     * @tc.name      testUnicode0025
     * @tc.desc      Unicode sequence 25 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u00CE\u00E4\u4E18';
      logCase('testUnicode0025', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(206);
      expect(text.codePointAt(0)).assertEqual(206);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19992);
      expect(text.toUpperCase()).assertEqual('\u00CE\u00C4\u4E18');
      expect(text.toLowerCase()).assertEqual('\u00EE\u00E4\u4E18');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E4')).assertTrue();
      expect(text.indexOf('\u00E4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CE\u00E4');
      expect(text.slice(1, 3)).assertEqual('\u00E4\u4E18');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u2246\u2260\u2211\u4E2D\u6587';
      logCase('testUnicode0026', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(8774);
      expect(text.codePointAt(0)).assertEqual(8774);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2211')).assertTrue();
      expect(text.indexOf('\u2211') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2246\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0027
     * @tc.name      testUnicode0027
     * @tc.desc      Unicode sequence 27 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0036\u002E\u0038\u0032';
      logCase('testUnicode0027', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(54);
      expect(text.codePointAt(0)).assertEqual(54);
      expect(text.charCodeAt(text.length - 1)).assertEqual(50);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0038')).assertTrue();
      expect(text.indexOf('\u0038') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0036\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0038');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0028', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0029
     * @tc.name      testUnicode0029
     * @tc.desc      Unicode sequence 29 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u520C\u53DC\u3075';
      logCase('testUnicode0029', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(21004);
      expect(text.codePointAt(0)).assertEqual(21004);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12405);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u53DC')).assertTrue();
      expect(text.indexOf('\u53DC') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u520C\u53DC');
      expect(text.slice(1, 3)).assertEqual('\u53DC\u3075');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u041E\u0455\u4E1D';
      logCase('testUnicode0030', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1054);
      expect(text.codePointAt(0)).assertEqual(1054);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19997);
      expect(text.toUpperCase()).assertEqual('\u041E\u0405\u4E1D');
      expect(text.toLowerCase()).assertEqual('\u043E\u0455\u4E1D');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0455')).assertTrue();
      expect(text.indexOf('\u0455') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u041E\u0455');
      expect(text.slice(1, 3)).assertEqual('\u0455\u4E1D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u041E\u0455\u4E1D\u041E\u0455\u4E1D');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0031
     * @tc.name      testUnicode0031
     * @tc.desc      Unicode sequence 31 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0397\u03C3\u03C9';
      logCase('testUnicode0031', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(919);
      expect(text.codePointAt(0)).assertEqual(919);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0397\u03A3\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B7\u03C3\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C3')).assertTrue();
      expect(text.indexOf('\u03C3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0397\u03C3');
      expect(text.slice(1, 3)).assertEqual('\u03C3\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00C6\u00EA\u4E1F';
      logCase('testUnicode0032', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(198);
      expect(text.codePointAt(0)).assertEqual(198);
      expect(text.charCodeAt(text.length - 1)).assertEqual(19999);
      expect(text.toUpperCase()).assertEqual('\u00C6\u00CA\u4E1F');
      expect(text.toLowerCase()).assertEqual('\u00E6\u00EA\u4E1F');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EA')).assertTrue();
      expect(text.indexOf('\u00EA') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C6\u00EA');
      expect(text.slice(1, 3)).assertEqual('\u00EA\u4E1F');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0033
     * @tc.name      testUnicode0033
     * @tc.desc      Unicode sequence 33 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u22A1\u2260\u2211\uD83D\uDE00';
      logCase('testUnicode0033', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(8865);
      expect(text.codePointAt(0)).assertEqual(8865);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2211')).assertTrue();
      expect(text.indexOf('\u2211') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22A1\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0033\u002E\u0039\u0031';
      logCase('testUnicode0034', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(51);
      expect(text.codePointAt(0)).assertEqual(51);
      expect(text.charCodeAt(text.length - 1)).assertEqual(49);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0039')).assertTrue();
      expect(text.indexOf('\u0039') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0033\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0039');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0035
     * @tc.name      testUnicode0035
     * @tc.desc      Unicode sequence 35 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0035', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u530F\u554F\u305A';
      logCase('testUnicode0036', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(21263);
      expect(text.codePointAt(0)).assertEqual(21263);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12378);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u554F')).assertTrue();
      expect(text.indexOf('\u554F') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u530F\u554F');
      expect(text.slice(1, 3)).assertEqual('\u554F\u305A');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u530F\u554F\u305A\u530F\u554F\u305A');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0037
     * @tc.name      testUnicode0037
     * @tc.desc      Unicode sequence 37 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0410\u0444\u4E24';
      logCase('testUnicode0037', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1040);
      expect(text.codePointAt(0)).assertEqual(1040);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20004);
      expect(text.toUpperCase()).assertEqual('\u0410\u0424\u4E24');
      expect(text.toLowerCase()).assertEqual('\u0430\u0444\u4E24');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0444')).assertTrue();
      expect(text.indexOf('\u0444') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0410\u0444');
      expect(text.slice(1, 3)).assertEqual('\u0444\u4E24');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u03A2\u03C0\u03C9';
      logCase('testUnicode0038', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(930);
      expect(text.codePointAt(0)).assertEqual(930);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A2\u03A0\u03A9');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C0')).assertTrue();
      expect(text.indexOf('\u03C0') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A2\u03C0');
      expect(text.slice(1, 3)).assertEqual('\u03C0\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0039
     * @tc.name      testUnicode0039
     * @tc.desc      Unicode sequence 39 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u00DB\u00F0\u4E2D\u6587';
      logCase('testUnicode0039', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(219);
      expect(text.codePointAt(0)).assertEqual(219);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u00DB\u00D0\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u00FB\u00F0\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E2D')).assertTrue();
      expect(text.indexOf('\u4E2D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00DB\u00F0');
      expect(text.slice(1, 3)).assertEqual('\u00F0\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u22FC\u2260\u2211';
      logCase('testUnicode0040', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8956);
      expect(text.codePointAt(0)).assertEqual(8956);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22FC\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0041
     * @tc.name      testUnicode0041
     * @tc.desc      Unicode sequence 41 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0030\u002E\u0030\u0030';
      logCase('testUnicode0041', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(48);
      expect(text.codePointAt(0)).assertEqual(48);
      expect(text.charCodeAt(text.length - 1)).assertEqual(48);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0030')).assertTrue();
      expect(text.indexOf('\u0030') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0030\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0030');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0042', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u4F60\u597D\u4E16\u754C\uFF01\u4F60\u597D\u4E16\u754C\uFF01');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0043
     * @tc.name      testUnicode0043
     * @tc.desc      Unicode sequence 43 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u5412\u56C2\u308F';
      logCase('testUnicode0043', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(21522);
      expect(text.codePointAt(0)).assertEqual(21522);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12431);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u56C2')).assertTrue();
      expect(text.indexOf('\u56C2') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5412\u56C2');
      expect(text.slice(1, 3)).assertEqual('\u56C2\u308F');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0441\u0433\uD83D\uDE00';
      logCase('testUnicode0044', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(1089);
      expect(text.codePointAt(0)).assertEqual(1089);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u0421\u0413\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0441\u0433');
      expect(text.slice(1, 3)).assertEqual('\u0433\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0045
     * @tc.name      testUnicode0045
     * @tc.desc      Unicode sequence 45 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0395\u03BD\u03C9';
      logCase('testUnicode0045', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(917);
      expect(text.codePointAt(0)).assertEqual(917);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0395\u039D\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B5\u03BD\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03BD')).assertTrue();
      expect(text.indexOf('\u03BD') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0395\u03BD');
      expect(text.slice(1, 3)).assertEqual('\u03BD\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00D3\u00F6\u4E2D';
      logCase('testUnicode0046', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(211);
      expect(text.codePointAt(0)).assertEqual(211);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20013);
      expect(text.toUpperCase()).assertEqual('\u00D3\u00D6\u4E2D');
      expect(text.toLowerCase()).assertEqual('\u00F3\u00F6\u4E2D');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F6')).assertTrue();
      expect(text.indexOf('\u00F6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D3\u00F6');
      expect(text.slice(1, 3)).assertEqual('\u00F6\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0047
     * @tc.name      testUnicode0047
     * @tc.desc      Unicode sequence 47 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u2258\u2260\u2211';
      logCase('testUnicode0047', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8792);
      expect(text.codePointAt(0)).assertEqual(8792);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2258\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0037\u002E\u0031\u0039';
      logCase('testUnicode0048', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(55);
      expect(text.codePointAt(0)).assertEqual(55);
      expect(text.charCodeAt(text.length - 1)).assertEqual(57);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0031')).assertTrue();
      expect(text.indexOf('\u0031') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0037\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0031');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0037\u002E\u0031\u0039\u0037\u002E\u0031\u0039');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0049
     * @tc.name      testUnicode0049
     * @tc.desc      Unicode sequence 49 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0049', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u5515\u5835\u3074';
      logCase('testUnicode0050', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(21781);
      expect(text.codePointAt(0)).assertEqual(21781);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12404);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u5835')).assertTrue();
      expect(text.indexOf('\u5835') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5515\u5835');
      expect(text.slice(1, 3)).assertEqual('\u5835\u3074');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0051
     * @tc.name      testUnicode0051
     * @tc.desc      Unicode sequence 51 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0433\u0451\u4E32';
      logCase('testUnicode0051', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1075);
      expect(text.codePointAt(0)).assertEqual(1075);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20018);
      expect(text.toUpperCase()).assertEqual('\u0413\u0401\u4E32');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0451')).assertTrue();
      expect(text.indexOf('\u0451') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0433\u0451');
      expect(text.slice(1, 3)).assertEqual('\u0451\u4E32');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u03A0\u03BA\u03C9\u4E2D\u6587';
      logCase('testUnicode0052', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(928);
      expect(text.codePointAt(0)).assertEqual(928);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u03A0\u039A\u03A9\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u03C0\u03BA\u03C9\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C9')).assertTrue();
      expect(text.indexOf('\u03C9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A0\u03BA');
      expect(text.slice(1, 3)).assertEqual('\u03BA\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0053
     * @tc.name      testUnicode0053
     * @tc.desc      Unicode sequence 53 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u00CB\u00FC\u4E34';
      logCase('testUnicode0053', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(203);
      expect(text.codePointAt(0)).assertEqual(203);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20020);
      expect(text.toUpperCase()).assertEqual('\u00CB\u00DC\u4E34');
      expect(text.toLowerCase()).assertEqual('\u00EB\u00FC\u4E34');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00FC')).assertTrue();
      expect(text.indexOf('\u00FC') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CB\u00FC');
      expect(text.slice(1, 3)).assertEqual('\u00FC\u4E34');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u22B3\u2260\u2211';
      logCase('testUnicode0054', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8883);
      expect(text.codePointAt(0)).assertEqual(8883);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22B3\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u22B3\u2260\u2211\u22B3\u2260\u2211');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0055
     * @tc.name      testUnicode0055
     * @tc.desc      Unicode sequence 55 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0034\u002E\u0032\u0038\uD83D\uDE00';
      logCase('testUnicode0055', `len=${text.length}`);
      expect(text.length).assertEqual(6);
      expect(text.charCodeAt(0)).assertEqual(52);
      expect(text.codePointAt(0)).assertEqual(52);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0038')).assertTrue();
      expect(text.indexOf('\u0038') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0034\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0032');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0056', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0057
     * @tc.name      testUnicode0057
     * @tc.desc      Unicode sequence 57 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u5618\u59A8\u3059';
      logCase('testUnicode0057', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(22040);
      expect(text.codePointAt(0)).assertEqual(22040);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12377);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u59A8')).assertTrue();
      expect(text.indexOf('\u59A8') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5618\u59A8');
      expect(text.slice(1, 3)).assertEqual('\u59A8\u3059');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0425\u0440\u4E39';
      logCase('testUnicode0058', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1061);
      expect(text.codePointAt(0)).assertEqual(1061);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20025);
      expect(text.toUpperCase()).assertEqual('\u0425\u0420\u4E39');
      expect(text.toLowerCase()).assertEqual('\u0445\u0440\u4E39');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0440')).assertTrue();
      expect(text.indexOf('\u0440') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0425\u0440');
      expect(text.slice(1, 3)).assertEqual('\u0440\u4E39');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0059
     * @tc.name      testUnicode0059
     * @tc.desc      Unicode sequence 59 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0393\u03B7\u03C9';
      logCase('testUnicode0059', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(915);
      expect(text.codePointAt(0)).assertEqual(915);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0393\u0397\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B3\u03B7\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B7')).assertTrue();
      expect(text.indexOf('\u03B7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0393\u03B7');
      expect(text.slice(1, 3)).assertEqual('\u03B7\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00C3\u00E5\u4E3B';
      logCase('testUnicode0060', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(195);
      expect(text.codePointAt(0)).assertEqual(195);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20027);
      expect(text.toUpperCase()).assertEqual('\u00C3\u00C5\u4E3B');
      expect(text.toLowerCase()).assertEqual('\u00E3\u00E5\u4E3B');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E5')).assertTrue();
      expect(text.indexOf('\u00E5') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C3\u00E5');
      expect(text.slice(1, 3)).assertEqual('\u00E5\u4E3B');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u00C3\u00E5\u4E3B\u00C3\u00E5\u4E3B');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0061
     * @tc.name      testUnicode0061
     * @tc.desc      Unicode sequence 61 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u220F\u2260\u2211';
      logCase('testUnicode0061', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8719);
      expect(text.codePointAt(0)).assertEqual(8719);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u220F\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0031\u002E\u0033\u0037';
      logCase('testUnicode0062', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(49);
      expect(text.codePointAt(0)).assertEqual(49);
      expect(text.charCodeAt(text.length - 1)).assertEqual(55);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0033')).assertTrue();
      expect(text.indexOf('\u0033') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0031\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0033');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0063
     * @tc.name      testUnicode0063
     * @tc.desc      Unicode sequence 63 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0063', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u571B\u5B1B\u308E';
      logCase('testUnicode0064', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(22299);
      expect(text.codePointAt(0)).assertEqual(22299);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12430);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u5B1B')).assertTrue();
      expect(text.indexOf('\u5B1B') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u571B\u5B1B');
      expect(text.slice(1, 3)).assertEqual('\u5B1B\u308E');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0065
     * @tc.name      testUnicode0065
     * @tc.desc      Unicode sequence 65 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0417\u045E\u4E2D\u6587';
      logCase('testUnicode0065', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(1047);
      expect(text.codePointAt(0)).assertEqual(1047);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u0417\u040E\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u0437\u045E\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E2D')).assertTrue();
      expect(text.indexOf('\u4E2D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0417\u045E');
      expect(text.slice(1, 3)).assertEqual('\u045E\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u039E\u03B4\u03C9\uD83D\uDE00';
      logCase('testUnicode0066', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(926);
      expect(text.codePointAt(0)).assertEqual(926);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u039E\u0394\u03A9\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u03BE\u03B4\u03C9\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C9')).assertTrue();
      expect(text.indexOf('\u03C9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039E\u03B4');
      expect(text.slice(1, 3)).assertEqual('\u03B4\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u039E\u03B4\u03C9\uD83D\uDE00\u039E\u03B4\u03C9\uD83D\uDE00');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0067
     * @tc.name      testUnicode0067
     * @tc.desc      Unicode sequence 67 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u00D8\u00EB\u4E42';
      logCase('testUnicode0067', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(216);
      expect(text.codePointAt(0)).assertEqual(216);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20034);
      expect(text.toUpperCase()).assertEqual('\u00D8\u00CB\u4E42');
      expect(text.toLowerCase()).assertEqual('\u00F8\u00EB\u4E42');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EB')).assertTrue();
      expect(text.indexOf('\u00EB') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D8\u00EB');
      expect(text.slice(1, 3)).assertEqual('\u00EB\u4E42');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u226A\u2260\u2211';
      logCase('testUnicode0068', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8810);
      expect(text.codePointAt(0)).assertEqual(8810);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u226A\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0069
     * @tc.name      testUnicode0069
     * @tc.desc      Unicode sequence 69 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0038\u002E\u0034\u0036';
      logCase('testUnicode0069', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(56);
      expect(text.codePointAt(0)).assertEqual(56);
      expect(text.charCodeAt(text.length - 1)).assertEqual(54);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0034')).assertTrue();
      expect(text.indexOf('\u0034') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0038\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0034');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0070', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0071
     * @tc.name      testUnicode0071
     * @tc.desc      Unicode sequence 71 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u581E\u5C8E\u3073';
      logCase('testUnicode0071', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(22558);
      expect(text.codePointAt(0)).assertEqual(22558);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12403);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u5C8E')).assertTrue();
      expect(text.indexOf('\u5C8E') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u581E\u5C8E');
      expect(text.slice(1, 3)).assertEqual('\u5C8E\u3073');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0448\u044D\u4E47';
      logCase('testUnicode0072', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1096);
      expect(text.codePointAt(0)).assertEqual(1096);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20039);
      expect(text.toUpperCase()).assertEqual('\u0428\u042D\u4E47');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u044D')).assertTrue();
      expect(text.indexOf('\u044D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0448\u044D');
      expect(text.slice(1, 3)).assertEqual('\u044D\u4E47');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0448\u044D\u4E47\u0448\u044D\u4E47');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0073
     * @tc.name      testUnicode0073
     * @tc.desc      Unicode sequence 73 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0391\u03B1\u03C9';
      logCase('testUnicode0073', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(913);
      expect(text.codePointAt(0)).assertEqual(913);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0391\u0391\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B1\u03B1\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B1')).assertTrue();
      expect(text.indexOf('\u03B1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0391\u03B1');
      expect(text.slice(1, 3)).assertEqual('\u03B1\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00D0\u00F1\u4E49';
      logCase('testUnicode0074', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(208);
      expect(text.codePointAt(0)).assertEqual(208);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20041);
      expect(text.toUpperCase()).assertEqual('\u00D0\u00D1\u4E49');
      expect(text.toLowerCase()).assertEqual('\u00F0\u00F1\u4E49');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F1')).assertTrue();
      expect(text.indexOf('\u00F1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D0\u00F1');
      expect(text.slice(1, 3)).assertEqual('\u00F1\u4E49');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0075
     * @tc.name      testUnicode0075
     * @tc.desc      Unicode sequence 75 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u22C5\u2260\u2211';
      logCase('testUnicode0075', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8901);
      expect(text.codePointAt(0)).assertEqual(8901);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22C5\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0035\u002E\u0035\u0035';
      logCase('testUnicode0076', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(53);
      expect(text.codePointAt(0)).assertEqual(53);
      expect(text.charCodeAt(text.length - 1)).assertEqual(53);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0035')).assertTrue();
      expect(text.indexOf('\u0035') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0035\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0035');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0077
     * @tc.name      testUnicode0077
     * @tc.desc      Unicode sequence 77 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01\uD83D\uDE00';
      logCase('testUnicode0077', `len=${text.length}`);
      expect(text.length).assertEqual(7);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u754C')).assertTrue();
      expect(text.indexOf('\u754C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u5921\u5E01\u3058\u4E2D\u6587';
      logCase('testUnicode0078', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(22817);
      expect(text.codePointAt(0)).assertEqual(22817);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u3058')).assertTrue();
      expect(text.indexOf('\u3058') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5921\u5E01');
      expect(text.slice(1, 3)).assertEqual('\u5E01\u3058');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u5921\u5E01\u3058\u4E2D\u6587\u5921\u5E01\u3058\u4E2D\u6587');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0079
     * @tc.name      testUnicode0079
     * @tc.desc      Unicode sequence 79 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u043A\u043C\u4E4E';
      logCase('testUnicode0079', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1082);
      expect(text.codePointAt(0)).assertEqual(1082);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20046);
      expect(text.toUpperCase()).assertEqual('\u041A\u041C\u4E4E');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u043C')).assertTrue();
      expect(text.indexOf('\u043C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u043A\u043C');
      expect(text.slice(1, 3)).assertEqual('\u043C\u4E4E');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u039C\u03C6\u03C9';
      logCase('testUnicode0080', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(924);
      expect(text.codePointAt(0)).assertEqual(924);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u039C\u03A6\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03BC\u03C6\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C6')).assertTrue();
      expect(text.indexOf('\u03C6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039C\u03C6');
      expect(text.slice(1, 3)).assertEqual('\u03C6\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0081
     * @tc.name      testUnicode0081
     * @tc.desc      Unicode sequence 81 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u00C8\u00F7\u4E50';
      logCase('testUnicode0081', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(200);
      expect(text.codePointAt(0)).assertEqual(200);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20048);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual('\u00E8\u00F7\u4E50');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F7')).assertTrue();
      expect(text.indexOf('\u00F7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C8\u00F7');
      expect(text.slice(1, 3)).assertEqual('\u00F7\u4E50');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u2221\u2260\u2211';
      logCase('testUnicode0082', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8737);
      expect(text.codePointAt(0)).assertEqual(8737);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2221\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0083
     * @tc.name      testUnicode0083
     * @tc.desc      Unicode sequence 83 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0032\u002E\u0036\u0034';
      logCase('testUnicode0083', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(50);
      expect(text.codePointAt(0)).assertEqual(50);
      expect(text.charCodeAt(text.length - 1)).assertEqual(52);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0036')).assertTrue();
      expect(text.indexOf('\u0036') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0032\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0036');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0084', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u4F60\u597D\u4E16\u754C\uFF01\u4F60\u597D\u4E16\u754C\uFF01');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0085
     * @tc.name      testUnicode0085
     * @tc.desc      Unicode sequence 85 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u5A24\u5F74\u308D';
      logCase('testUnicode0085', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(23076);
      expect(text.codePointAt(0)).assertEqual(23076);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12429);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u5F74')).assertTrue();
      expect(text.indexOf('\u5F74') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5A24\u5F74');
      expect(text.slice(1, 3)).assertEqual('\u5F74\u308D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u042C\u045A\u4E55';
      logCase('testUnicode0086', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1068);
      expect(text.codePointAt(0)).assertEqual(1068);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20053);
      expect(text.toUpperCase()).assertEqual('\u042C\u040A\u4E55');
      expect(text.toLowerCase()).assertEqual('\u044C\u045A\u4E55');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u045A')).assertTrue();
      expect(text.indexOf('\u045A') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u042C\u045A');
      expect(text.slice(1, 3)).assertEqual('\u045A\u4E55');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0087
     * @tc.name      testUnicode0087
     * @tc.desc      Unicode sequence 87 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u03A7\u03C3\u03C9';
      logCase('testUnicode0087', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(935);
      expect(text.codePointAt(0)).assertEqual(935);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A7\u03A3\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C7\u03C3\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C3')).assertTrue();
      expect(text.indexOf('\u03C3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A7\u03C3');
      expect(text.slice(1, 3)).assertEqual('\u03C3\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00C0\u00E0\uD83D\uDE00';
      logCase('testUnicode0088', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(192);
      expect(text.codePointAt(0)).assertEqual(192);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u00C0\u00C0\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u00E0\u00E0\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C0\u00E0');
      expect(text.slice(1, 3)).assertEqual('\u00E0\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0089
     * @tc.name      testUnicode0089
     * @tc.desc      Unicode sequence 89 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u227C\u2260\u2211';
      logCase('testUnicode0089', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8828);
      expect(text.codePointAt(0)).assertEqual(8828);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u227C\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0039\u002E\u0037\u0033';
      logCase('testUnicode0090', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(57);
      expect(text.codePointAt(0)).assertEqual(57);
      expect(text.charCodeAt(text.length - 1)).assertEqual(51);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0037')).assertTrue();
      expect(text.indexOf('\u0037') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0039\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0037');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0039\u002E\u0037\u0033\u0039\u002E\u0037\u0033');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0091
     * @tc.name      testUnicode0091
     * @tc.desc      Unicode sequence 91 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01\u4E2D\u6587';
      logCase('testUnicode0091', `len=${text.length}`);
      expect(text.length).assertEqual(7);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u754C')).assertTrue();
      expect(text.indexOf('\u754C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u5B27\u60E7\u3072';
      logCase('testUnicode0092', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(23335);
      expect(text.codePointAt(0)).assertEqual(23335);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12402);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u60E7')).assertTrue();
      expect(text.indexOf('\u60E7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5B27\u60E7');
      expect(text.slice(1, 3)).assertEqual('\u60E7\u3072');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0093
     * @tc.name      testUnicode0093
     * @tc.desc      Unicode sequence 93 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u041E\u0449\u4E5C';
      logCase('testUnicode0093', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1054);
      expect(text.codePointAt(0)).assertEqual(1054);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20060);
      expect(text.toUpperCase()).assertEqual('\u041E\u0429\u4E5C');
      expect(text.toLowerCase()).assertEqual('\u043E\u0449\u4E5C');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0449')).assertTrue();
      expect(text.indexOf('\u0449') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u041E\u0449');
      expect(text.slice(1, 3)).assertEqual('\u0449\u4E5C');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u039A\u03C0\u03C9';
      logCase('testUnicode0094', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(922);
      expect(text.codePointAt(0)).assertEqual(922);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u039A\u03A0\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03BA\u03C0\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C0')).assertTrue();
      expect(text.indexOf('\u03C0') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039A\u03C0');
      expect(text.slice(1, 3)).assertEqual('\u03C0\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0095
     * @tc.name      testUnicode0095
     * @tc.desc      Unicode sequence 95 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u00D5\u00E6\u4E5E';
      logCase('testUnicode0095', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(213);
      expect(text.codePointAt(0)).assertEqual(213);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20062);
      expect(text.toUpperCase()).assertEqual('\u00D5\u00C6\u4E5E');
      expect(text.toLowerCase()).assertEqual('\u00F5\u00E6\u4E5E');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E6')).assertTrue();
      expect(text.indexOf('\u00E6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D5\u00E6');
      expect(text.slice(1, 3)).assertEqual('\u00E6\u4E5E');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u22D7\u2260\u2211';
      logCase('testUnicode0096', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8919);
      expect(text.codePointAt(0)).assertEqual(8919);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22D7\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u22D7\u2260\u2211\u22D7\u2260\u2211');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0097
     * @tc.name      testUnicode0097
     * @tc.desc      Unicode sequence 97 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0036\u002E\u0038\u0032';
      logCase('testUnicode0097', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(54);
      expect(text.codePointAt(0)).assertEqual(54);
      expect(text.charCodeAt(text.length - 1)).assertEqual(50);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0038')).assertTrue();
      expect(text.indexOf('\u0038') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0036\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0038');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0098', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0099
     * @tc.name      testUnicode0099
     * @tc.desc      Unicode sequence 99 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u5C2A\u625A\u3057\uD83D\uDE00';
      logCase('testUnicode0099', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(23594);
      expect(text.codePointAt(0)).assertEqual(23594);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u3057')).assertTrue();
      expect(text.indexOf('\u3057') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5C2A\u625A');
      expect(text.slice(1, 3)).assertEqual('\u625A\u3057');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0410\u0438\u4E63';
      logCase('testUnicode0100', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1040);
      expect(text.codePointAt(0)).assertEqual(1040);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20067);
      expect(text.toUpperCase()).assertEqual('\u0410\u0418\u4E63');
      expect(text.toLowerCase()).assertEqual('\u0430\u0438\u4E63');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0438')).assertTrue();
      expect(text.indexOf('\u0438') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0410\u0438');
      expect(text.slice(1, 3)).assertEqual('\u0438\u4E63');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0101
     * @tc.name      testUnicode0101
     * @tc.desc      Unicode sequence 101 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u03A5\u03BD\u03C9';
      logCase('testUnicode0101', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(933);
      expect(text.codePointAt(0)).assertEqual(933);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A5\u039D\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C5\u03BD\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03BD')).assertTrue();
      expect(text.indexOf('\u03BD') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A5\u03BD');
      expect(text.slice(1, 3)).assertEqual('\u03BD\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00CD\u00EC\u4E65';
      logCase('testUnicode0102', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(205);
      expect(text.codePointAt(0)).assertEqual(205);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20069);
      expect(text.toUpperCase()).assertEqual('\u00CD\u00CC\u4E65');
      expect(text.toLowerCase()).assertEqual('\u00ED\u00EC\u4E65');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EC')).assertTrue();
      expect(text.indexOf('\u00EC') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CD\u00EC');
      expect(text.slice(1, 3)).assertEqual('\u00EC\u4E65');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u00CD\u00EC\u4E65\u00CD\u00EC\u4E65');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0103
     * @tc.name      testUnicode0103
     * @tc.desc      Unicode sequence 103 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u2233\u2260\u2211';
      logCase('testUnicode0103', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8755);
      expect(text.codePointAt(0)).assertEqual(8755);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2233\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0033\u002E\u0039\u0031\u4E2D\u6587';
      logCase('testUnicode0104', `len=${text.length}`);
      expect(text.length).assertEqual(6);
      expect(text.charCodeAt(0)).assertEqual(51);
      expect(text.codePointAt(0)).assertEqual(51);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0031')).assertTrue();
      expect(text.indexOf('\u0031') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0033\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0039');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0105
     * @tc.name      testUnicode0105
     * @tc.desc      Unicode sequence 105 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0105', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u5D2D\u63CD\u308C';
      logCase('testUnicode0106', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(23853);
      expect(text.codePointAt(0)).assertEqual(23853);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12428);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u63CD')).assertTrue();
      expect(text.indexOf('\u63CD') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5D2D\u63CD');
      expect(text.slice(1, 3)).assertEqual('\u63CD\u308C');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0107
     * @tc.name      testUnicode0107
     * @tc.desc      Unicode sequence 107 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0441\u0456\u4E6A';
      logCase('testUnicode0107', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1089);
      expect(text.codePointAt(0)).assertEqual(1089);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20074);
      expect(text.toUpperCase()).assertEqual('\u0421\u0406\u4E6A');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0456')).assertTrue();
      expect(text.indexOf('\u0456') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0441\u0456');
      expect(text.slice(1, 3)).assertEqual('\u0456\u4E6A');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0398\u03BA\u03C9';
      logCase('testUnicode0108', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(920);
      expect(text.codePointAt(0)).assertEqual(920);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0398\u039A\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B8\u03BA\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03BA')).assertTrue();
      expect(text.indexOf('\u03BA') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0398\u03BA');
      expect(text.slice(1, 3)).assertEqual('\u03BA\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0398\u03BA\u03C9\u0398\u03BA\u03C9');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0109
     * @tc.name      testUnicode0109
     * @tc.desc      Unicode sequence 109 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u00C5\u00F2\u4E6C';
      logCase('testUnicode0109', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(197);
      expect(text.codePointAt(0)).assertEqual(197);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20076);
      expect(text.toUpperCase()).assertEqual('\u00C5\u00D2\u4E6C');
      expect(text.toLowerCase()).assertEqual('\u00E5\u00F2\u4E6C');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F2')).assertTrue();
      expect(text.indexOf('\u00F2') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C5\u00F2');
      expect(text.slice(1, 3)).assertEqual('\u00F2\u4E6C');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u228E\u2260\u2211\uD83D\uDE00';
      logCase('testUnicode0110', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(8846);
      expect(text.codePointAt(0)).assertEqual(8846);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2211')).assertTrue();
      expect(text.indexOf('\u2211') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u228E\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0111
     * @tc.name      testUnicode0111
     * @tc.desc      Unicode sequence 111 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0030\u002E\u0030\u0030';
      logCase('testUnicode0111', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(48);
      expect(text.codePointAt(0)).assertEqual(48);
      expect(text.charCodeAt(text.length - 1)).assertEqual(48);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0030')).assertTrue();
      expect(text.indexOf('\u0030') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0030\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0030');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0112', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0113
     * @tc.name      testUnicode0113
     * @tc.desc      Unicode sequence 113 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u5E30\u6540\u3071';
      logCase('testUnicode0113', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(24112);
      expect(text.codePointAt(0)).assertEqual(24112);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12401);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6540')).assertTrue();
      expect(text.indexOf('\u6540') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5E30\u6540');
      expect(text.slice(1, 3)).assertEqual('\u6540\u3071');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0433\u0445\u4E71';
      logCase('testUnicode0114', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1075);
      expect(text.codePointAt(0)).assertEqual(1075);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20081);
      expect(text.toUpperCase()).assertEqual('\u0413\u0425\u4E71');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0445')).assertTrue();
      expect(text.indexOf('\u0445') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0433\u0445');
      expect(text.slice(1, 3)).assertEqual('\u0445\u4E71');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0433\u0445\u4E71\u0433\u0445\u4E71');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0115
     * @tc.name      testUnicode0115
     * @tc.desc      Unicode sequence 115 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u03A3\u03B7\u03C9';
      logCase('testUnicode0115', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(931);
      expect(text.codePointAt(0)).assertEqual(931);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A3\u0397\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C3\u03B7\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B7')).assertTrue();
      expect(text.indexOf('\u03B7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A3\u03B7');
      expect(text.slice(1, 3)).assertEqual('\u03B7\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00DA\u00F8\u4E73';
      logCase('testUnicode0116', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(218);
      expect(text.codePointAt(0)).assertEqual(218);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20083);
      expect(text.toUpperCase()).assertEqual('\u00DA\u00D8\u4E73');
      expect(text.toLowerCase()).assertEqual('\u00FA\u00F8\u4E73');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F8')).assertTrue();
      expect(text.indexOf('\u00F8') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00DA\u00F8');
      expect(text.slice(1, 3)).assertEqual('\u00F8\u4E73');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0117
     * @tc.name      testUnicode0117
     * @tc.desc      Unicode sequence 117 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u22E9\u2260\u2211\u4E2D\u6587';
      logCase('testUnicode0117', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(8937);
      expect(text.codePointAt(0)).assertEqual(8937);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2211')).assertTrue();
      expect(text.indexOf('\u2211') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22E9\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0037\u002E\u0031\u0039';
      logCase('testUnicode0118', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(55);
      expect(text.codePointAt(0)).assertEqual(55);
      expect(text.charCodeAt(text.length - 1)).assertEqual(57);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0031')).assertTrue();
      expect(text.indexOf('\u0031') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0037\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0031');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0119
     * @tc.name      testUnicode0119
     * @tc.desc      Unicode sequence 119 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0119', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u5F33\u66B3\u3056';
      logCase('testUnicode0120', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(24371);
      expect(text.codePointAt(0)).assertEqual(24371);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12374);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u66B3')).assertTrue();
      expect(text.indexOf('\u66B3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u5F33\u66B3');
      expect(text.slice(1, 3)).assertEqual('\u66B3\u3056');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u5F33\u66B3\u3056\u5F33\u66B3\u3056');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0121
     * @tc.name      testUnicode0121
     * @tc.desc      Unicode sequence 121 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0425\u0434\uD83D\uDE00';
      logCase('testUnicode0121', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(1061);
      expect(text.codePointAt(0)).assertEqual(1061);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u0425\u0414\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u0445\u0434\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0425\u0434');
      expect(text.slice(1, 3)).assertEqual('\u0434\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0396\u03B4\u03C9';
      logCase('testUnicode0122', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(918);
      expect(text.codePointAt(0)).assertEqual(918);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0396\u0394\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B6\u03B4\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B4')).assertTrue();
      expect(text.indexOf('\u03B4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0396\u03B4');
      expect(text.slice(1, 3)).assertEqual('\u03B4\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0123
     * @tc.name      testUnicode0123
     * @tc.desc      Unicode sequence 123 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u00D2\u00E1\u4E7A';
      logCase('testUnicode0123', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(210);
      expect(text.codePointAt(0)).assertEqual(210);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20090);
      expect(text.toUpperCase()).assertEqual('\u00D2\u00C1\u4E7A');
      expect(text.toLowerCase()).assertEqual('\u00F2\u00E1\u4E7A');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E1')).assertTrue();
      expect(text.indexOf('\u00E1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D2\u00E1');
      expect(text.slice(1, 3)).assertEqual('\u00E1\u4E7A');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u2245\u2260\u2211';
      logCase('testUnicode0124', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8773);
      expect(text.codePointAt(0)).assertEqual(8773);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2245\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0125
     * @tc.name      testUnicode0125
     * @tc.desc      Unicode sequence 125 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0034\u002E\u0032\u0038';
      logCase('testUnicode0125', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(52);
      expect(text.codePointAt(0)).assertEqual(52);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0032')).assertTrue();
      expect(text.indexOf('\u0032') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0034\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0032');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0126', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u4F60\u597D\u4E16\u754C\uFF01\u4F60\u597D\u4E16\u754C\uFF01');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0127
     * @tc.name      testUnicode0127
     * @tc.desc      Unicode sequence 127 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u6036\u6826\u308B';
      logCase('testUnicode0127', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(24630);
      expect(text.codePointAt(0)).assertEqual(24630);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12427);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6826')).assertTrue();
      expect(text.indexOf('\u6826') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6036\u6826');
      expect(text.slice(1, 3)).assertEqual('\u6826\u308B');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0417\u0452\u4E7F';
      logCase('testUnicode0128', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1047);
      expect(text.codePointAt(0)).assertEqual(1047);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20095);
      expect(text.toUpperCase()).assertEqual('\u0417\u0402\u4E7F');
      expect(text.toLowerCase()).assertEqual('\u0437\u0452\u4E7F');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0452')).assertTrue();
      expect(text.indexOf('\u0452') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0417\u0452');
      expect(text.slice(1, 3)).assertEqual('\u0452\u4E7F');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0129
     * @tc.name      testUnicode0129
     * @tc.desc      Unicode sequence 129 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u03A1\u03B1\u03C9';
      logCase('testUnicode0129', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(929);
      expect(text.codePointAt(0)).assertEqual(929);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A1\u0391\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C1\u03B1\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B1')).assertTrue();
      expect(text.indexOf('\u03B1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A1\u03B1');
      expect(text.slice(1, 3)).assertEqual('\u03B1\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00CA\u00E7\u4E2D\u6587';
      logCase('testUnicode0130', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(202);
      expect(text.codePointAt(0)).assertEqual(202);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u00CA\u00C7\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u00EA\u00E7\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E2D')).assertTrue();
      expect(text.indexOf('\u4E2D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CA\u00E7');
      expect(text.slice(1, 3)).assertEqual('\u00E7\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0131
     * @tc.name      testUnicode0131
     * @tc.desc      Unicode sequence 131 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u22A0\u2260\u2211';
      logCase('testUnicode0131', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8864);
      expect(text.codePointAt(0)).assertEqual(8864);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22A0\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0031\u002E\u0033\u0037\uD83D\uDE00';
      logCase('testUnicode0132', `len=${text.length}`);
      expect(text.length).assertEqual(6);
      expect(text.charCodeAt(0)).assertEqual(49);
      expect(text.codePointAt(0)).assertEqual(49);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0037')).assertTrue();
      expect(text.indexOf('\u0037') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0031\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0033');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0031\u002E\u0033\u0037\uD83D\uDE00\u0031\u002E\u0033\u0037\uD83D\uDE00');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0133
     * @tc.name      testUnicode0133
     * @tc.desc      Unicode sequence 133 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0133', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u6139\u6999\u3070';
      logCase('testUnicode0134', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(24889);
      expect(text.codePointAt(0)).assertEqual(24889);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12400);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6999')).assertTrue();
      expect(text.indexOf('\u6999') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6139\u6999');
      expect(text.slice(1, 3)).assertEqual('\u6999\u3070');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0135
     * @tc.name      testUnicode0135
     * @tc.desc      Unicode sequence 135 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0448\u0441\u4E86';
      logCase('testUnicode0135', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1096);
      expect(text.codePointAt(0)).assertEqual(1096);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20102);
      expect(text.toUpperCase()).assertEqual('\u0428\u0421\u4E86');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0441')).assertTrue();
      expect(text.indexOf('\u0441') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0448\u0441');
      expect(text.slice(1, 3)).assertEqual('\u0441\u4E86');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0394\u03C6\u03C9';
      logCase('testUnicode0136', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(916);
      expect(text.codePointAt(0)).assertEqual(916);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0394\u03A6\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B4\u03C6\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C6')).assertTrue();
      expect(text.indexOf('\u03C6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0394\u03C6');
      expect(text.slice(1, 3)).assertEqual('\u03C6\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0137
     * @tc.name      testUnicode0137
     * @tc.desc      Unicode sequence 137 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u00C2\u00ED\u4E88';
      logCase('testUnicode0137', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(194);
      expect(text.codePointAt(0)).assertEqual(194);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20104);
      expect(text.toUpperCase()).assertEqual('\u00C2\u00CD\u4E88');
      expect(text.toLowerCase()).assertEqual('\u00E2\u00ED\u4E88');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00ED')).assertTrue();
      expect(text.indexOf('\u00ED') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C2\u00ED');
      expect(text.slice(1, 3)).assertEqual('\u00ED\u4E88');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u22FB\u2260\u2211';
      logCase('testUnicode0138', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8955);
      expect(text.codePointAt(0)).assertEqual(8955);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22FB\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u22FB\u2260\u2211\u22FB\u2260\u2211');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0139
     * @tc.name      testUnicode0139
     * @tc.desc      Unicode sequence 139 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0038\u002E\u0034\u0036';
      logCase('testUnicode0139', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(56);
      expect(text.codePointAt(0)).assertEqual(56);
      expect(text.charCodeAt(text.length - 1)).assertEqual(54);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0034')).assertTrue();
      expect(text.indexOf('\u0034') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0038\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0034');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0140', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0141
     * @tc.name      testUnicode0141
     * @tc.desc      Unicode sequence 141 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u623C\u6B0C\u3055';
      logCase('testUnicode0141', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(25148);
      expect(text.codePointAt(0)).assertEqual(25148);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12373);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6B0C')).assertTrue();
      expect(text.indexOf('\u6B0C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u623C\u6B0C');
      expect(text.slice(1, 3)).assertEqual('\u6B0C\u3055');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u043A\u0430\u4E8D';
      logCase('testUnicode0142', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1082);
      expect(text.codePointAt(0)).assertEqual(1082);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20109);
      expect(text.toUpperCase()).assertEqual('\u041A\u0410\u4E8D');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0430')).assertTrue();
      expect(text.indexOf('\u0430') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u043A\u0430');
      expect(text.slice(1, 3)).assertEqual('\u0430\u4E8D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0143
     * @tc.name      testUnicode0143
     * @tc.desc      Unicode sequence 143 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u039F\u03C3\u03C9\uD83D\uDE00\u4E2D\u6587';
      logCase('testUnicode0143', `len=${text.length}`);
      expect(text.length).assertEqual(7);
      expect(text.charCodeAt(0)).assertEqual(927);
      expect(text.codePointAt(0)).assertEqual(927);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u039F\u03A3\u03A9\uD83D\uDE00\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u03BF\u03C3\u03C9\uD83D\uDE00\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039F\u03C3');
      expect(text.slice(1, 3)).assertEqual('\u03C3\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00D7\u00F3\u4E8F';
      logCase('testUnicode0144', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(215);
      expect(text.codePointAt(0)).assertEqual(215);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20111);
      expect(text.toUpperCase()).assertEqual('\u00D7\u00D3\u4E8F');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F3')).assertTrue();
      expect(text.indexOf('\u00F3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D7\u00F3');
      expect(text.slice(1, 3)).assertEqual('\u00F3\u4E8F');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u00D7\u00F3\u4E8F\u00D7\u00F3\u4E8F');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0145
     * @tc.name      testUnicode0145
     * @tc.desc      Unicode sequence 145 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u2257\u2260\u2211';
      logCase('testUnicode0145', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8791);
      expect(text.codePointAt(0)).assertEqual(8791);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2257\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0035\u002E\u0035\u0035';
      logCase('testUnicode0146', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(53);
      expect(text.codePointAt(0)).assertEqual(53);
      expect(text.charCodeAt(text.length - 1)).assertEqual(53);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0035')).assertTrue();
      expect(text.indexOf('\u0035') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0035\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0035');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0147
     * @tc.name      testUnicode0147
     * @tc.desc      Unicode sequence 147 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0147', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u633F\u6C7F\u308A';
      logCase('testUnicode0148', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(25407);
      expect(text.codePointAt(0)).assertEqual(25407);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12426);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6C7F')).assertTrue();
      expect(text.indexOf('\u6C7F') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u633F\u6C7F');
      expect(text.slice(1, 3)).assertEqual('\u6C7F\u308A');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0149
     * @tc.name      testUnicode0149
     * @tc.desc      Unicode sequence 149 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u042C\u044E\u4E94';
      logCase('testUnicode0149', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1068);
      expect(text.codePointAt(0)).assertEqual(1068);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20116);
      expect(text.toUpperCase()).assertEqual('\u042C\u042E\u4E94');
      expect(text.toLowerCase()).assertEqual('\u044C\u044E\u4E94');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u044E')).assertTrue();
      expect(text.indexOf('\u044E') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u042C\u044E');
      expect(text.slice(1, 3)).assertEqual('\u044E\u4E94');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0392\u03C0\u03C9';
      logCase('testUnicode0150', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(914);
      expect(text.codePointAt(0)).assertEqual(914);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0392\u03A0\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B2\u03C0\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C0')).assertTrue();
      expect(text.indexOf('\u03C0') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0392\u03C0');
      expect(text.slice(1, 3)).assertEqual('\u03C0\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0392\u03C0\u03C9\u0392\u03C0\u03C9');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0151
     * @tc.name      testUnicode0151
     * @tc.desc      Unicode sequence 151 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u00CF\u00F9\u4E96';
      logCase('testUnicode0151', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(207);
      expect(text.codePointAt(0)).assertEqual(207);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20118);
      expect(text.toUpperCase()).assertEqual('\u00CF\u00D9\u4E96');
      expect(text.toLowerCase()).assertEqual('\u00EF\u00F9\u4E96');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F9')).assertTrue();
      expect(text.indexOf('\u00F9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CF\u00F9');
      expect(text.slice(1, 3)).assertEqual('\u00F9\u4E96');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u22B2\u2260\u2211';
      logCase('testUnicode0152', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8882);
      expect(text.codePointAt(0)).assertEqual(8882);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22B2\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0153
     * @tc.name      testUnicode0153
     * @tc.desc      Unicode sequence 153 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0032\u002E\u0036\u0034';
      logCase('testUnicode0153', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(50);
      expect(text.codePointAt(0)).assertEqual(50);
      expect(text.charCodeAt(text.length - 1)).assertEqual(52);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0036')).assertTrue();
      expect(text.indexOf('\u0036') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0032\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0036');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01\uD83D\uDE00';
      logCase('testUnicode0154', `len=${text.length}`);
      expect(text.length).assertEqual(7);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u754C')).assertTrue();
      expect(text.indexOf('\u754C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0155
     * @tc.name      testUnicode0155
     * @tc.desc      Unicode sequence 155 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u6442\u6DF2\u306F';
      logCase('testUnicode0155', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(25666);
      expect(text.codePointAt(0)).assertEqual(25666);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12399);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6DF2')).assertTrue();
      expect(text.indexOf('\u6DF2') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6442\u6DF2');
      expect(text.slice(1, 3)).assertEqual('\u6DF2\u306F');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u041E\u043D\u4E2D\u6587';
      logCase('testUnicode0156', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(1054);
      expect(text.codePointAt(0)).assertEqual(1054);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u041E\u041D\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u043E\u043D\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E2D')).assertTrue();
      expect(text.indexOf('\u4E2D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u041E\u043D');
      expect(text.slice(1, 3)).assertEqual('\u043D\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u041E\u043D\u4E2D\u6587\u041E\u043D\u4E2D\u6587');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0157
     * @tc.name      testUnicode0157
     * @tc.desc      Unicode sequence 157 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u039D\u03BD\u03C9';
      logCase('testUnicode0157', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(925);
      expect(text.codePointAt(0)).assertEqual(925);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u039D\u039D\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03BD\u03BD\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03BD')).assertTrue();
      expect(text.indexOf('\u03BD') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039D\u03BD');
      expect(text.slice(1, 3)).assertEqual('\u03BD\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00C7\u00E2\u4E9D';
      logCase('testUnicode0158', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(199);
      expect(text.codePointAt(0)).assertEqual(199);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20125);
      expect(text.toUpperCase()).assertEqual('\u00C7\u00C2\u4E9D');
      expect(text.toLowerCase()).assertEqual('\u00E7\u00E2\u4E9D');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E2')).assertTrue();
      expect(text.indexOf('\u00E2') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C7\u00E2');
      expect(text.slice(1, 3)).assertEqual('\u00E2\u4E9D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0159
     * @tc.name      testUnicode0159
     * @tc.desc      Unicode sequence 159 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u220E\u2260\u2211';
      logCase('testUnicode0159', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8718);
      expect(text.codePointAt(0)).assertEqual(8718);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u220E\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0039\u002E\u0037\u0033';
      logCase('testUnicode0160', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(57);
      expect(text.codePointAt(0)).assertEqual(57);
      expect(text.charCodeAt(text.length - 1)).assertEqual(51);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0037')).assertTrue();
      expect(text.indexOf('\u0037') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0039\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0037');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0161
     * @tc.name      testUnicode0161
     * @tc.desc      Unicode sequence 161 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0161', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u6545\u6F65\u3054';
      logCase('testUnicode0162', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(25925);
      expect(text.codePointAt(0)).assertEqual(25925);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12372);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u6F65')).assertTrue();
      expect(text.indexOf('\u6F65') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6545\u6F65');
      expect(text.slice(1, 3)).assertEqual('\u6F65\u3054');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u6545\u6F65\u3054\u6545\u6F65\u3054');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0163
     * @tc.name      testUnicode0163
     * @tc.desc      Unicode sequence 163 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0410\u045B\u4EA2';
      logCase('testUnicode0163', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1040);
      expect(text.codePointAt(0)).assertEqual(1040);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20130);
      expect(text.toUpperCase()).assertEqual('\u0410\u040B\u4EA2');
      expect(text.toLowerCase()).assertEqual('\u0430\u045B\u4EA2');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u045B')).assertTrue();
      expect(text.indexOf('\u045B') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0410\u045B');
      expect(text.slice(1, 3)).assertEqual('\u045B\u4EA2');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u03A8\u03BA\u03C9';
      logCase('testUnicode0164', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(936);
      expect(text.codePointAt(0)).assertEqual(936);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A8\u039A\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C8\u03BA\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03BA')).assertTrue();
      expect(text.indexOf('\u03BA') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A8\u03BA');
      expect(text.slice(1, 3)).assertEqual('\u03BA\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0165
     * @tc.name      testUnicode0165
     * @tc.desc      Unicode sequence 165 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u00DC\u00E8\uD83D\uDE00';
      logCase('testUnicode0165', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(220);
      expect(text.codePointAt(0)).assertEqual(220);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u00DC\u00C8\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u00FC\u00E8\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00DC\u00E8');
      expect(text.slice(1, 3)).assertEqual('\u00E8\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u2269\u2260\u2211';
      logCase('testUnicode0166', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8809);
      expect(text.codePointAt(0)).assertEqual(8809);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2269\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0167
     * @tc.name      testUnicode0167
     * @tc.desc      Unicode sequence 167 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0036\u002E\u0038\u0032';
      logCase('testUnicode0167', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(54);
      expect(text.codePointAt(0)).assertEqual(54);
      expect(text.charCodeAt(text.length - 1)).assertEqual(50);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0038')).assertTrue();
      expect(text.indexOf('\u0038') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0036\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0038');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0168', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u4F60\u597D\u4E16\u754C\uFF01\u4F60\u597D\u4E16\u754C\uFF01');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0169
     * @tc.name      testUnicode0169
     * @tc.desc      Unicode sequence 169 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u6648\u70D8\u3089\u4E2D\u6587';
      logCase('testUnicode0169', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(26184);
      expect(text.codePointAt(0)).assertEqual(26184);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u3089')).assertTrue();
      expect(text.indexOf('\u3089') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6648\u70D8');
      expect(text.slice(1, 3)).assertEqual('\u70D8\u3089');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0441\u044A\u4EA9';
      logCase('testUnicode0170', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1089);
      expect(text.codePointAt(0)).assertEqual(1089);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20137);
      expect(text.toUpperCase()).assertEqual('\u0421\u042A\u4EA9');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u044A')).assertTrue();
      expect(text.indexOf('\u044A') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0441\u044A');
      expect(text.slice(1, 3)).assertEqual('\u044A\u4EA9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0171
     * @tc.name      testUnicode0171
     * @tc.desc      Unicode sequence 171 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u039B\u03B7\u03C9';
      logCase('testUnicode0171', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(923);
      expect(text.codePointAt(0)).assertEqual(923);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u039B\u0397\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03BB\u03B7\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B7')).assertTrue();
      expect(text.indexOf('\u03B7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039B\u03B7');
      expect(text.slice(1, 3)).assertEqual('\u03B7\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00D4\u00EE\u4EAB';
      logCase('testUnicode0172', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(212);
      expect(text.codePointAt(0)).assertEqual(212);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20139);
      expect(text.toUpperCase()).assertEqual('\u00D4\u00CE\u4EAB');
      expect(text.toLowerCase()).assertEqual('\u00F4\u00EE\u4EAB');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EE')).assertTrue();
      expect(text.indexOf('\u00EE') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D4\u00EE');
      expect(text.slice(1, 3)).assertEqual('\u00EE\u4EAB');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0173
     * @tc.name      testUnicode0173
     * @tc.desc      Unicode sequence 173 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u22C4\u2260\u2211';
      logCase('testUnicode0173', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8900);
      expect(text.codePointAt(0)).assertEqual(8900);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22C4\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0033\u002E\u0039\u0031';
      logCase('testUnicode0174', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(51);
      expect(text.codePointAt(0)).assertEqual(51);
      expect(text.charCodeAt(text.length - 1)).assertEqual(49);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0039')).assertTrue();
      expect(text.indexOf('\u0039') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0033\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0039');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0033\u002E\u0039\u0031\u0033\u002E\u0039\u0031');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0175
     * @tc.name      testUnicode0175
     * @tc.desc      Unicode sequence 175 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0175', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u674B\u724B\u306E\uD83D\uDE00';
      logCase('testUnicode0176', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(26443);
      expect(text.codePointAt(0)).assertEqual(26443);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u306E')).assertTrue();
      expect(text.indexOf('\u306E') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u674B\u724B');
      expect(text.slice(1, 3)).assertEqual('\u724B\u306E');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0177
     * @tc.name      testUnicode0177
     * @tc.desc      Unicode sequence 177 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0433\u0439\u4EB0';
      logCase('testUnicode0177', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1075);
      expect(text.codePointAt(0)).assertEqual(1075);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20144);
      expect(text.toUpperCase()).assertEqual('\u0413\u0419\u4EB0');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0439')).assertTrue();
      expect(text.indexOf('\u0439') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0433\u0439');
      expect(text.slice(1, 3)).assertEqual('\u0439\u4EB0');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u03A6\u03B4\u03C9';
      logCase('testUnicode0178', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(934);
      expect(text.codePointAt(0)).assertEqual(934);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A6\u0394\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C6\u03B4\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B4')).assertTrue();
      expect(text.indexOf('\u03B4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A6\u03B4');
      expect(text.slice(1, 3)).assertEqual('\u03B4\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0179
     * @tc.name      testUnicode0179
     * @tc.desc      Unicode sequence 179 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u00CC\u00F4\u4EB2';
      logCase('testUnicode0179', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(204);
      expect(text.codePointAt(0)).assertEqual(204);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20146);
      expect(text.toUpperCase()).assertEqual('\u00CC\u00D4\u4EB2');
      expect(text.toLowerCase()).assertEqual('\u00EC\u00F4\u4EB2');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F4')).assertTrue();
      expect(text.indexOf('\u00F4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CC\u00F4');
      expect(text.slice(1, 3)).assertEqual('\u00F4\u4EB2');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u2220\u2260\u2211';
      logCase('testUnicode0180', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8736);
      expect(text.codePointAt(0)).assertEqual(8736);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2220\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u2220\u2260\u2211\u2220\u2260\u2211');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0181
     * @tc.name      testUnicode0181
     * @tc.desc      Unicode sequence 181 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0030\u002E\u0030\u0030';
      logCase('testUnicode0181', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(48);
      expect(text.codePointAt(0)).assertEqual(48);
      expect(text.charCodeAt(text.length - 1)).assertEqual(48);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0030')).assertTrue();
      expect(text.indexOf('\u0030') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0030\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0030');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01\u4E2D\u6587';
      logCase('testUnicode0182', `len=${text.length}`);
      expect(text.length).assertEqual(7);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u754C')).assertTrue();
      expect(text.indexOf('\u754C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0183
     * @tc.name      testUnicode0183
     * @tc.desc      Unicode sequence 183 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u684E\u73BE\u3053';
      logCase('testUnicode0183', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(26702);
      expect(text.codePointAt(0)).assertEqual(26702);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12371);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u73BE')).assertTrue();
      expect(text.indexOf('\u73BE') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u684E\u73BE');
      expect(text.slice(1, 3)).assertEqual('\u73BE\u3053');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0425\u0457\u4EB7';
      logCase('testUnicode0184', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1061);
      expect(text.codePointAt(0)).assertEqual(1061);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20151);
      expect(text.toUpperCase()).assertEqual('\u0425\u0407\u4EB7');
      expect(text.toLowerCase()).assertEqual('\u0445\u0457\u4EB7');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0457')).assertTrue();
      expect(text.indexOf('\u0457') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0425\u0457');
      expect(text.slice(1, 3)).assertEqual('\u0457\u4EB7');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0185
     * @tc.name      testUnicode0185
     * @tc.desc      Unicode sequence 185 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0399\u03B1\u03C9';
      logCase('testUnicode0185', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(921);
      expect(text.codePointAt(0)).assertEqual(921);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0399\u0391\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B9\u03B1\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B1')).assertTrue();
      expect(text.indexOf('\u03B1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0399\u03B1');
      expect(text.slice(1, 3)).assertEqual('\u03B1\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00C4\u00FA\u4EB9';
      logCase('testUnicode0186', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(196);
      expect(text.codePointAt(0)).assertEqual(196);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20153);
      expect(text.toUpperCase()).assertEqual('\u00C4\u00DA\u4EB9');
      expect(text.toLowerCase()).assertEqual('\u00E4\u00FA\u4EB9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00FA')).assertTrue();
      expect(text.indexOf('\u00FA') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C4\u00FA');
      expect(text.slice(1, 3)).assertEqual('\u00FA\u4EB9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u00C4\u00FA\u4EB9\u00C4\u00FA\u4EB9');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0187
     * @tc.name      testUnicode0187
     * @tc.desc      Unicode sequence 187 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u227B\u2260\u2211\uD83D\uDE00';
      logCase('testUnicode0187', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(8827);
      expect(text.codePointAt(0)).assertEqual(8827);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2211')).assertTrue();
      expect(text.indexOf('\u2211') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u227B\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0037\u002E\u0031\u0039';
      logCase('testUnicode0188', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(55);
      expect(text.codePointAt(0)).assertEqual(55);
      expect(text.charCodeAt(text.length - 1)).assertEqual(57);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0031')).assertTrue();
      expect(text.indexOf('\u0031') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0037\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0031');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0189
     * @tc.name      testUnicode0189
     * @tc.desc      Unicode sequence 189 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0189', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u6951\u7531\u3088';
      logCase('testUnicode0190', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(26961);
      expect(text.codePointAt(0)).assertEqual(26961);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12424);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u7531')).assertTrue();
      expect(text.indexOf('\u7531') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6951\u7531');
      expect(text.slice(1, 3)).assertEqual('\u7531\u3088');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0191
     * @tc.name      testUnicode0191
     * @tc.desc      Unicode sequence 191 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0417\u0446\u4EBE';
      logCase('testUnicode0191', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1047);
      expect(text.codePointAt(0)).assertEqual(1047);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20158);
      expect(text.toUpperCase()).assertEqual('\u0417\u0426\u4EBE');
      expect(text.toLowerCase()).assertEqual('\u0437\u0446\u4EBE');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0446')).assertTrue();
      expect(text.indexOf('\u0446') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0417\u0446');
      expect(text.slice(1, 3)).assertEqual('\u0446\u4EBE');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u03A4\u03C6\u03C9';
      logCase('testUnicode0192', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(932);
      expect(text.codePointAt(0)).assertEqual(932);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A4\u03A6\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C4\u03C6\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C6')).assertTrue();
      expect(text.indexOf('\u03C6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A4\u03C6');
      expect(text.slice(1, 3)).assertEqual('\u03C6\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u03A4\u03C6\u03C9\u03A4\u03C6\u03C9');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0193
     * @tc.name      testUnicode0193
     * @tc.desc      Unicode sequence 193 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u00D9\u00E3\u4EC0';
      logCase('testUnicode0193', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(217);
      expect(text.codePointAt(0)).assertEqual(217);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20160);
      expect(text.toUpperCase()).assertEqual('\u00D9\u00C3\u4EC0');
      expect(text.toLowerCase()).assertEqual('\u00F9\u00E3\u4EC0');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E3')).assertTrue();
      expect(text.indexOf('\u00E3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D9\u00E3');
      expect(text.slice(1, 3)).assertEqual('\u00E3\u4EC0');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u22D6\u2260\u2211';
      logCase('testUnicode0194', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8918);
      expect(text.codePointAt(0)).assertEqual(8918);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22D6\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0195
     * @tc.name      testUnicode0195
     * @tc.desc      Unicode sequence 195 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0034\u002E\u0032\u0038\u4E2D\u6587';
      logCase('testUnicode0195', `len=${text.length}`);
      expect(text.length).assertEqual(6);
      expect(text.charCodeAt(0)).assertEqual(52);
      expect(text.codePointAt(0)).assertEqual(52);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0038')).assertTrue();
      expect(text.indexOf('\u0038') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0034\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0032');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0196', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0197
     * @tc.name      testUnicode0197
     * @tc.desc      Unicode sequence 197 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u6A54\u76A4\u306D';
      logCase('testUnicode0197', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(27220);
      expect(text.codePointAt(0)).assertEqual(27220);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12397);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u76A4')).assertTrue();
      expect(text.indexOf('\u76A4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6A54\u76A4');
      expect(text.slice(1, 3)).assertEqual('\u76A4\u306D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0448\u0435\uD83D\uDE00';
      logCase('testUnicode0198', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(1096);
      expect(text.codePointAt(0)).assertEqual(1096);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u0428\u0415\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0448\u0435');
      expect(text.slice(1, 3)).assertEqual('\u0435\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0448\u0435\uD83D\uDE00\u0448\u0435\uD83D\uDE00');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0199
     * @tc.name      testUnicode0199
     * @tc.desc      Unicode sequence 199 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0397\u03C3\u03C9';
      logCase('testUnicode0199', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(919);
      expect(text.codePointAt(0)).assertEqual(919);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0397\u03A3\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B7\u03C3\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C3')).assertTrue();
      expect(text.indexOf('\u03C3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0397\u03C3');
      expect(text.slice(1, 3)).assertEqual('\u03C3\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00D1\u00E9\u4EC7';
      logCase('testUnicode0200', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(209);
      expect(text.codePointAt(0)).assertEqual(209);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20167);
      expect(text.toUpperCase()).assertEqual('\u00D1\u00C9\u4EC7');
      expect(text.toLowerCase()).assertEqual('\u00F1\u00E9\u4EC7');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E9')).assertTrue();
      expect(text.indexOf('\u00E9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D1\u00E9');
      expect(text.slice(1, 3)).assertEqual('\u00E9\u4EC7');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0201
     * @tc.name      testUnicode0201
     * @tc.desc      Unicode sequence 201 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u2232\u2260\u2211';
      logCase('testUnicode0201', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8754);
      expect(text.codePointAt(0)).assertEqual(8754);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2232\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0031\u002E\u0033\u0037';
      logCase('testUnicode0202', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(49);
      expect(text.codePointAt(0)).assertEqual(49);
      expect(text.charCodeAt(text.length - 1)).assertEqual(55);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0033')).assertTrue();
      expect(text.indexOf('\u0033') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0031\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0033');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0203
     * @tc.name      testUnicode0203
     * @tc.desc      Unicode sequence 203 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0203', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u6B57\u7817\u3052';
      logCase('testUnicode0204', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(27479);
      expect(text.codePointAt(0)).assertEqual(27479);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12370);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u7817')).assertTrue();
      expect(text.indexOf('\u7817') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6B57\u7817');
      expect(text.slice(1, 3)).assertEqual('\u7817\u3052');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u6B57\u7817\u3052\u6B57\u7817\u3052');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0205
     * @tc.name      testUnicode0205
     * @tc.desc      Unicode sequence 205 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u043A\u0453\u4ECC';
      logCase('testUnicode0205', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1082);
      expect(text.codePointAt(0)).assertEqual(1082);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20172);
      expect(text.toUpperCase()).assertEqual('\u041A\u0403\u4ECC');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0453')).assertTrue();
      expect(text.indexOf('\u0453') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u043A\u0453');
      expect(text.slice(1, 3)).assertEqual('\u0453\u4ECC');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u03A2\u03C0\u03C9';
      logCase('testUnicode0206', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(930);
      expect(text.codePointAt(0)).assertEqual(930);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A2\u03A0\u03A9');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C0')).assertTrue();
      expect(text.indexOf('\u03C0') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A2\u03C0');
      expect(text.slice(1, 3)).assertEqual('\u03C0\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0207
     * @tc.name      testUnicode0207
     * @tc.desc      Unicode sequence 207 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u00C9\u00EF\u4ECE';
      logCase('testUnicode0207', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(201);
      expect(text.codePointAt(0)).assertEqual(201);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20174);
      expect(text.toUpperCase()).assertEqual('\u00C9\u00CF\u4ECE');
      expect(text.toLowerCase()).assertEqual('\u00E9\u00EF\u4ECE');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EF')).assertTrue();
      expect(text.indexOf('\u00EF') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C9\u00EF');
      expect(text.slice(1, 3)).assertEqual('\u00EF\u4ECE');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u228D\u2260\u2211\u4E2D\u6587';
      logCase('testUnicode0208', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(8845);
      expect(text.codePointAt(0)).assertEqual(8845);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2211')).assertTrue();
      expect(text.indexOf('\u2211') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u228D\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0209
     * @tc.name      testUnicode0209
     * @tc.desc      Unicode sequence 209 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0038\u002E\u0034\u0036\uD83D\uDE00';
      logCase('testUnicode0209', `len=${text.length}`);
      expect(text.length).assertEqual(6);
      expect(text.charCodeAt(0)).assertEqual(56);
      expect(text.codePointAt(0)).assertEqual(56);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0036')).assertTrue();
      expect(text.indexOf('\u0036') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0038\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0034');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0210', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u4F60\u597D\u4E16\u754C\uFF01\u4F60\u597D\u4E16\u754C\uFF01');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0211
     * @tc.name      testUnicode0211
     * @tc.desc      Unicode sequence 211 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u6C5A\u798A\u3087';
      logCase('testUnicode0211', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(27738);
      expect(text.codePointAt(0)).assertEqual(27738);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12423);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u798A')).assertTrue();
      expect(text.indexOf('\u798A') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6C5A\u798A');
      expect(text.slice(1, 3)).assertEqual('\u798A\u3087');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u042C\u0442\u4ED3';
      logCase('testUnicode0212', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1068);
      expect(text.codePointAt(0)).assertEqual(1068);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20179);
      expect(text.toUpperCase()).assertEqual('\u042C\u0422\u4ED3');
      expect(text.toLowerCase()).assertEqual('\u044C\u0442\u4ED3');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0442')).assertTrue();
      expect(text.indexOf('\u0442') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u042C\u0442');
      expect(text.slice(1, 3)).assertEqual('\u0442\u4ED3');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0213
     * @tc.name      testUnicode0213
     * @tc.desc      Unicode sequence 213 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0395\u03BD\u03C9';
      logCase('testUnicode0213', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(917);
      expect(text.codePointAt(0)).assertEqual(917);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0395\u039D\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B5\u03BD\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03BD')).assertTrue();
      expect(text.indexOf('\u03BD') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0395\u03BD');
      expect(text.slice(1, 3)).assertEqual('\u03BD\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00C1\u00F5\u4ED5';
      logCase('testUnicode0214', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(193);
      expect(text.codePointAt(0)).assertEqual(193);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20181);
      expect(text.toUpperCase()).assertEqual('\u00C1\u00D5\u4ED5');
      expect(text.toLowerCase()).assertEqual('\u00E1\u00F5\u4ED5');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F5')).assertTrue();
      expect(text.indexOf('\u00F5') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C1\u00F5');
      expect(text.slice(1, 3)).assertEqual('\u00F5\u4ED5');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0215
     * @tc.name      testUnicode0215
     * @tc.desc      Unicode sequence 215 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u22E8\u2260\u2211';
      logCase('testUnicode0215', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8936);
      expect(text.codePointAt(0)).assertEqual(8936);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22E8\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0035\u002E\u0035\u0035';
      logCase('testUnicode0216', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(53);
      expect(text.codePointAt(0)).assertEqual(53);
      expect(text.charCodeAt(text.length - 1)).assertEqual(53);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0035')).assertTrue();
      expect(text.indexOf('\u0035') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0035\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0035');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0035\u002E\u0035\u0035\u0035\u002E\u0035\u0035');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0217
     * @tc.name      testUnicode0217
     * @tc.desc      Unicode sequence 217 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0217', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u6D5D\u7AFD\u306C';
      logCase('testUnicode0218', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(27997);
      expect(text.codePointAt(0)).assertEqual(27997);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12396);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u7AFD')).assertTrue();
      expect(text.indexOf('\u7AFD') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6D5D\u7AFD');
      expect(text.slice(1, 3)).assertEqual('\u7AFD\u306C');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0219
     * @tc.name      testUnicode0219
     * @tc.desc      Unicode sequence 219 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u041E\u0431\u4EDA';
      logCase('testUnicode0219', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1054);
      expect(text.codePointAt(0)).assertEqual(1054);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20186);
      expect(text.toUpperCase()).assertEqual('\u041E\u0411\u4EDA');
      expect(text.toLowerCase()).assertEqual('\u043E\u0431\u4EDA');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0431')).assertTrue();
      expect(text.indexOf('\u0431') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u041E\u0431');
      expect(text.slice(1, 3)).assertEqual('\u0431\u4EDA');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u03A0\u03BA\u03C9\uD83D\uDE00';
      logCase('testUnicode0220', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(928);
      expect(text.codePointAt(0)).assertEqual(928);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u03A0\u039A\u03A9\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u03C0\u03BA\u03C9\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C9')).assertTrue();
      expect(text.indexOf('\u03C9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A0\u03BA');
      expect(text.slice(1, 3)).assertEqual('\u03BA\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0221
     * @tc.name      testUnicode0221
     * @tc.desc      Unicode sequence 221 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u00D6\u00FB\u4E2D\u6587';
      logCase('testUnicode0221', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(214);
      expect(text.codePointAt(0)).assertEqual(214);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u00D6\u00DB\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u00F6\u00FB\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E2D')).assertTrue();
      expect(text.indexOf('\u4E2D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D6\u00FB');
      expect(text.slice(1, 3)).assertEqual('\u00FB\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u2244\u2260\u2211';
      logCase('testUnicode0222', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8772);
      expect(text.codePointAt(0)).assertEqual(8772);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2244\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u2244\u2260\u2211\u2244\u2260\u2211');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0223
     * @tc.name      testUnicode0223
     * @tc.desc      Unicode sequence 223 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0032\u002E\u0036\u0034';
      logCase('testUnicode0223', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(50);
      expect(text.codePointAt(0)).assertEqual(50);
      expect(text.charCodeAt(text.length - 1)).assertEqual(52);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0036')).assertTrue();
      expect(text.indexOf('\u0036') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0032\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0036');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0224', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0225
     * @tc.name      testUnicode0225
     * @tc.desc      Unicode sequence 225 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u6E60\u7C70\u3051';
      logCase('testUnicode0225', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(28256);
      expect(text.codePointAt(0)).assertEqual(28256);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12369);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u7C70')).assertTrue();
      expect(text.indexOf('\u7C70') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6E60\u7C70');
      expect(text.slice(1, 3)).assertEqual('\u7C70\u3051');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0410\u044F\u4EE1';
      logCase('testUnicode0226', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1040);
      expect(text.codePointAt(0)).assertEqual(1040);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20193);
      expect(text.toUpperCase()).assertEqual('\u0410\u042F\u4EE1');
      expect(text.toLowerCase()).assertEqual('\u0430\u044F\u4EE1');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u044F')).assertTrue();
      expect(text.indexOf('\u044F') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0410\u044F');
      expect(text.slice(1, 3)).assertEqual('\u044F\u4EE1');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0227
     * @tc.name      testUnicode0227
     * @tc.desc      Unicode sequence 227 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0393\u03B7\u03C9';
      logCase('testUnicode0227', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(915);
      expect(text.codePointAt(0)).assertEqual(915);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0393\u0397\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B3\u03B7\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B7')).assertTrue();
      expect(text.indexOf('\u03B7') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0393\u03B7');
      expect(text.slice(1, 3)).assertEqual('\u03B7\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00CE\u00E4\u4EE3';
      logCase('testUnicode0228', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(206);
      expect(text.codePointAt(0)).assertEqual(206);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20195);
      expect(text.toUpperCase()).assertEqual('\u00CE\u00C4\u4EE3');
      expect(text.toLowerCase()).assertEqual('\u00EE\u00E4\u4EE3');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00E4')).assertTrue();
      expect(text.indexOf('\u00E4') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CE\u00E4');
      expect(text.slice(1, 3)).assertEqual('\u00E4\u4EE3');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u00CE\u00E4\u4EE3\u00CE\u00E4\u4EE3');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0229
     * @tc.name      testUnicode0229
     * @tc.desc      Unicode sequence 229 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u229F\u2260\u2211';
      logCase('testUnicode0229', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8863);
      expect(text.codePointAt(0)).assertEqual(8863);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u229F\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0039\u002E\u0037\u0033';
      logCase('testUnicode0230', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(57);
      expect(text.codePointAt(0)).assertEqual(57);
      expect(text.charCodeAt(text.length - 1)).assertEqual(51);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0037')).assertTrue();
      expect(text.indexOf('\u0037') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0039\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0037');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0231
     * @tc.name      testUnicode0231
     * @tc.desc      Unicode sequence 231 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01\uD83D\uDE00';
      logCase('testUnicode0231', `len=${text.length}`);
      expect(text.length).assertEqual(7);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u754C')).assertTrue();
      expect(text.indexOf('\u754C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u6F63\u7DE3\u3086';
      logCase('testUnicode0232', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(28515);
      expect(text.codePointAt(0)).assertEqual(28515);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12422);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u7DE3')).assertTrue();
      expect(text.indexOf('\u7DE3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u6F63\u7DE3');
      expect(text.slice(1, 3)).assertEqual('\u7DE3\u3086');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0233
     * @tc.name      testUnicode0233
     * @tc.desc      Unicode sequence 233 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0441\u043E\u4EE8';
      logCase('testUnicode0233', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1089);
      expect(text.codePointAt(0)).assertEqual(1089);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20200);
      expect(text.toUpperCase()).assertEqual('\u0421\u041E\u4EE8');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u043E')).assertTrue();
      expect(text.indexOf('\u043E') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0441\u043E');
      expect(text.slice(1, 3)).assertEqual('\u043E\u4EE8');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u039E\u03B4\u03C9\u4E2D\u6587';
      logCase('testUnicode0234', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(926);
      expect(text.codePointAt(0)).assertEqual(926);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u039E\u0394\u03A9\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u03BE\u03B4\u03C9\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C9')).assertTrue();
      expect(text.indexOf('\u03C9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039E\u03B4');
      expect(text.slice(1, 3)).assertEqual('\u03B4\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u039E\u03B4\u03C9\u4E2D\u6587\u039E\u03B4\u03C9\u4E2D\u6587');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0235
     * @tc.name      testUnicode0235
     * @tc.desc      Unicode sequence 235 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u00C6\u00EA\u4EEA';
      logCase('testUnicode0235', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(198);
      expect(text.codePointAt(0)).assertEqual(198);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20202);
      expect(text.toUpperCase()).assertEqual('\u00C6\u00CA\u4EEA');
      expect(text.toLowerCase()).assertEqual('\u00E6\u00EA\u4EEA');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00EA')).assertTrue();
      expect(text.indexOf('\u00EA') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00C6\u00EA');
      expect(text.slice(1, 3)).assertEqual('\u00EA\u4EEA');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u22FA\u2260\u2211';
      logCase('testUnicode0236', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8954);
      expect(text.codePointAt(0)).assertEqual(8954);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22FA\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0237
     * @tc.name      testUnicode0237
     * @tc.desc      Unicode sequence 237 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u0036\u002E\u0038\u0032';
      logCase('testUnicode0237', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(54);
      expect(text.codePointAt(0)).assertEqual(54);
      expect(text.charCodeAt(text.length - 1)).assertEqual(50);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0038')).assertTrue();
      expect(text.indexOf('\u0038') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0036\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0038');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0238', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0239
     * @tc.name      testUnicode0239
     * @tc.desc      Unicode sequence 239 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u7066\u4F56\u306B';
      logCase('testUnicode0239', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(28774);
      expect(text.codePointAt(0)).assertEqual(28774);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12395);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4F56')).assertTrue();
      expect(text.indexOf('\u4F56') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u7066\u4F56');
      expect(text.slice(1, 3)).assertEqual('\u4F56\u306B');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0433\u045C\u4EEF';
      logCase('testUnicode0240', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1075);
      expect(text.codePointAt(0)).assertEqual(1075);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20207);
      expect(text.toUpperCase()).assertEqual('\u0413\u040C\u4EEF');
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u045C')).assertTrue();
      expect(text.indexOf('\u045C') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0433\u045C');
      expect(text.slice(1, 3)).assertEqual('\u045C\u4EEF');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0433\u045C\u4EEF\u0433\u045C\u4EEF');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0241
     * @tc.name      testUnicode0241
     * @tc.desc      Unicode sequence 241 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0391\u03B1\u03C9';
      logCase('testUnicode0241', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(913);
      expect(text.codePointAt(0)).assertEqual(913);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u0391\u0391\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03B1\u03B1\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03B1')).assertTrue();
      expect(text.indexOf('\u03B1') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0391\u03B1');
      expect(text.slice(1, 3)).assertEqual('\u03B1\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u00DB\u00F0\uD83D\uDE00';
      logCase('testUnicode0242', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(219);
      expect(text.codePointAt(0)).assertEqual(219);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual('\u00DB\u00D0\uD83D\uDE00');
      expect(text.toLowerCase()).assertEqual('\u00FB\u00F0\uD83D\uDE00');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\uD83D')).assertTrue();
      expect(text.indexOf('\uD83D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00DB\u00F0');
      expect(text.slice(1, 3)).assertEqual('\u00F0\uD83D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0243
     * @tc.name      testUnicode0243
     * @tc.desc      Unicode sequence 243 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u2256\u2260\u2211';
      logCase('testUnicode0243', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8790);
      expect(text.codePointAt(0)).assertEqual(8790);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u2256\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u0033\u002E\u0039\u0031';
      logCase('testUnicode0244', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(51);
      expect(text.codePointAt(0)).assertEqual(51);
      expect(text.charCodeAt(text.length - 1)).assertEqual(49);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0039')).assertTrue();
      expect(text.indexOf('\u0039') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0033\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0039');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0245
     * @tc.name      testUnicode0245
     * @tc.desc      Unicode sequence 245 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0245', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u7169\u50C9\u3050';
      logCase('testUnicode0246', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(29033);
      expect(text.codePointAt(0)).assertEqual(29033);
      expect(text.charCodeAt(text.length - 1)).assertEqual(12368);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u50C9')).assertTrue();
      expect(text.indexOf('\u50C9') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u7169\u50C9');
      expect(text.slice(1, 3)).assertEqual('\u50C9\u3050');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u7169\u50C9\u3050\u7169\u50C9\u3050');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0247
     * @tc.name      testUnicode0247
     * @tc.desc      Unicode sequence 247 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u0425\u044B\u4E2D\u6587';
      logCase('testUnicode0247', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(1061);
      expect(text.codePointAt(0)).assertEqual(1061);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual('\u0425\u042B\u4E2D\u6587');
      expect(text.toLowerCase()).assertEqual('\u0445\u044B\u4E2D\u6587');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E2D')).assertTrue();
      expect(text.indexOf('\u4E2D') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0425\u044B');
      expect(text.slice(1, 3)).assertEqual('\u044B\u4E2D');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u039C\u03C6\u03C9';
      logCase('testUnicode0248', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(924);
      expect(text.codePointAt(0)).assertEqual(924);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u039C\u03A6\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03BC\u03C6\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C6')).assertTrue();
      expect(text.indexOf('\u03C6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u039C\u03C6');
      expect(text.slice(1, 3)).assertEqual('\u03C6\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0249
     * @tc.name      testUnicode0249
     * @tc.desc      Unicode sequence 249 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u00D3\u00F6\u4EF8';
      logCase('testUnicode0249', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(211);
      expect(text.codePointAt(0)).assertEqual(211);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20216);
      expect(text.toUpperCase()).assertEqual('\u00D3\u00D6\u4EF8');
      expect(text.toLowerCase()).assertEqual('\u00F3\u00F6\u4EF8');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00F6')).assertTrue();
      expect(text.indexOf('\u00F6') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00D3\u00F6');
      expect(text.slice(1, 3)).assertEqual('\u00F6\u4EF8');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u22B1\u2260\u2211';
      logCase('testUnicode0250', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8881);
      expect(text.codePointAt(0)).assertEqual(8881);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u22B1\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0251
     * @tc.name      testUnicode0251
     * @tc.desc      Unicode sequence 251 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u0030\u002E\u0030\u0030';
      logCase('testUnicode0251', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(48);
      expect(text.codePointAt(0)).assertEqual(48);
      expect(text.charCodeAt(text.length - 1)).assertEqual(48);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0030')).assertTrue();
      expect(text.indexOf('\u0030') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0030\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0030');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0252', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u4F60\u597D\u4E16\u754C\uFF01\u4F60\u597D\u4E16\u754C\uFF01');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0253
     * @tc.name      testUnicode0253
     * @tc.desc      Unicode sequence 253 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u726C\u523C\u3085\uD83D\uDE00';
      logCase('testUnicode0253', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(29292);
      expect(text.codePointAt(0)).assertEqual(29292);
      expect(text.charCodeAt(text.length - 1)).assertEqual(56832);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u3085')).assertTrue();
      expect(text.indexOf('\u3085') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u726C\u523C');
      expect(text.slice(1, 3)).assertEqual('\u523C\u3085');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0417\u043A\u4EFD';
      logCase('testUnicode0254', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(1047);
      expect(text.codePointAt(0)).assertEqual(1047);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20221);
      expect(text.toUpperCase()).assertEqual('\u0417\u041A\u4EFD');
      expect(text.toLowerCase()).assertEqual('\u0437\u043A\u4EFD');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u043A')).assertTrue();
      expect(text.indexOf('\u043A') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0417\u043A');
      expect(text.slice(1, 3)).assertEqual('\u043A\u4EFD');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0255
     * @tc.name      testUnicode0255
     * @tc.desc      Unicode sequence 255 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUnicode0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const text: string = '\u03A7\u03C3\u03C9';
      logCase('testUnicode0255', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(935);
      expect(text.codePointAt(0)).assertEqual(935);
      expect(text.charCodeAt(text.length - 1)).assertEqual(969);
      expect(text.toUpperCase()).assertEqual('\u03A7\u03A3\u03A9');
      expect(text.toLowerCase()).assertEqual('\u03C7\u03C3\u03C9');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u03C3')).assertTrue();
      expect(text.indexOf('\u03C3') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u03A7\u03C3');
      expect(text.slice(1, 3)).assertEqual('\u03C3\u03C9');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u00CB\u00FC\u4EFF';
      logCase('testUnicode0256', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(203);
      expect(text.codePointAt(0)).assertEqual(203);
      expect(text.charCodeAt(text.length - 1)).assertEqual(20223);
      expect(text.toUpperCase()).assertEqual('\u00CB\u00DC\u4EFF');
      expect(text.toLowerCase()).assertEqual('\u00EB\u00FC\u4EFF');
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u00FC')).assertTrue();
      expect(text.indexOf('\u00FC') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u00CB\u00FC');
      expect(text.slice(1, 3)).assertEqual('\u00FC\u4EFF');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0257
     * @tc.name      testUnicode0257
     * @tc.desc      Unicode sequence 257 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnicode0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '\u220D\u2260\u2211';
      logCase('testUnicode0257', `len=${text.length}`);
      expect(text.length).assertEqual(3);
      expect(text.charCodeAt(0)).assertEqual(8717);
      expect(text.codePointAt(0)).assertEqual(8717);
      expect(text.charCodeAt(text.length - 1)).assertEqual(8721);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u2260')).assertTrue();
      expect(text.indexOf('\u2260') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u220D\u2260');
      expect(text.slice(1, 3)).assertEqual('\u2260\u2211');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(decodeURIComponent(encodeURIComponent(text))).assertEqual(text);
      {
      const text: string = '\u0037\u002E\u0031\u0039';
      logCase('testUnicode0258', `len=${text.length}`);
      expect(text.length).assertEqual(4);
      expect(text.charCodeAt(0)).assertEqual(55);
      expect(text.codePointAt(0)).assertEqual(55);
      expect(text.charCodeAt(text.length - 1)).assertEqual(57);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u0031')).assertTrue();
      expect(text.indexOf('\u0031') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u0037\u002E');
      expect(text.slice(1, 3)).assertEqual('\u002E\u0031');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      expect(text.concat(text)).assertEqual('\u0037\u002E\u0031\u0039\u0037\u002E\u0031\u0039');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_UNICODE_0259
     * @tc.name      testUnicode0259
     * @tc.desc      Unicode sequence 259 keeps its UTF-16 contract
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testUnicode0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\u4F60\u597D\u4E16\u754C\uFF01';
      logCase('testUnicode0259', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(20320);
      expect(text.codePointAt(0)).assertEqual(20320);
      expect(text.charCodeAt(text.length - 1)).assertEqual(65281);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u4E16')).assertTrue();
      expect(text.indexOf('\u4E16') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u4F60\u597D');
      expect(text.slice(1, 3)).assertEqual('\u597D\u4E16');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      {
      const text: string = '\u736F\u53AF\u306A\u4E2D\u6587';
      logCase('testUnicode0260', `len=${text.length}`);
      expect(text.length).assertEqual(5);
      expect(text.charCodeAt(0)).assertEqual(29551);
      expect(text.codePointAt(0)).assertEqual(29551);
      expect(text.charCodeAt(text.length - 1)).assertEqual(25991);
      expect(text.toUpperCase()).assertEqual(text);
      expect(text.toLowerCase()).assertEqual(text);
      expect(JSON.stringify(JSON.parse(JSON.stringify(text)))).assertEqual(JSON.stringify(text));
      expect(text.includes('\u306A')).assertTrue();
      expect(text.indexOf('\u306A') >= 0).assertTrue();
      expect(text.slice(0, 2)).assertEqual('\u736F\u53AF');
      expect(text.slice(1, 3)).assertEqual('\u53AF\u306A');
      expect(text.repeat(2)).assertEqual(text + text);
      expect(text.repeat(0)).assertEqual('');
      expect(text.padStart(text.length + 3, '=')).assertEqual('===' + text);
      expect(text.trim()).assertEqual(text);
      expect(encodeURIComponent(text).length >= text.length).assertTrue();
      }
    });

  });
}

