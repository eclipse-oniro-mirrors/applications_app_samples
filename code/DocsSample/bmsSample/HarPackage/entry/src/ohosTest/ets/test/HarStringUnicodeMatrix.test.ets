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
