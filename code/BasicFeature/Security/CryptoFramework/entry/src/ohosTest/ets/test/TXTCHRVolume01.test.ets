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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import TextFileManager from '../../../main/ets/textfilemanager/TextFileManager';
import { fileIo as fs } from '@kit.CoreFileKit';
const TEXT_DIR: string = '/data/storage/el2/base/haps/entry_test/files/';
function prepareFile(p: string, content: string): void {
  const f: fs.File = fs.openSync(p, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  if (content.length > 0) {
    fs.writeSync(f.fd, content);
  }
  fs.closeSync(f);
}
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function txtChrTest() {
  describe('TxtChr', () => {

    /**
     * @tc.name   testTxtChr0001
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0001
     * @tc.desc   digits content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0001 begin');
      const path: string = TEXT_DIR + 'tfc' + 1 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '0');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(48));
      expect(result.charCodeAt(0)).assertEqual(48);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0001 end');
    });

    /**
     * @tc.name   testTxtChr0002
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0002
     * @tc.desc   digits content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0002 begin');
      const path: string = TEXT_DIR + 'tfc' + 2 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '01234567');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01234567'));
      expect(result).assertEqual('01234567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(48));
      expect(result.charCodeAt(0)).assertEqual(48);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0002 end');
    });

    /**
     * @tc.name   testTxtChr0003
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0003
     * @tc.desc   digits content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0003 begin');
      const path: string = TEXT_DIR + 'tfc' + 3 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '0123456789012345');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('0123456789012345'));
      expect(result).assertEqual('0123456789012345');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(48));
      expect(result.charCodeAt(0)).assertEqual(48);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0003 end');
    });

    /**
     * @tc.name   testTxtChr0004
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0004
     * @tc.desc   digits content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0004 begin');
      const path: string = TEXT_DIR + 'tfc' + 4 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '01234567890123456789012345678901');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('01234567890123456789012345678901'));
      expect(result).assertEqual('01234567890123456789012345678901');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(48));
      expect(result.charCodeAt(0)).assertEqual(48);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0004 end');
    });

    /**
     * @tc.name   testTxtChr0005
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0005
     * @tc.desc   lowercase content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0005 begin');
      const path: string = TEXT_DIR + 'tfc' + 5 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'a');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0005 end');
    });

    /**
     * @tc.name   testTxtChr0006
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0006
     * @tc.desc   lowercase content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0006 begin');
      const path: string = TEXT_DIR + 'tfc' + 6 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'abcdefgh');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('abcdefgh'));
      expect(result).assertEqual('abcdefgh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0006 end');
    });

    /**
     * @tc.name   testTxtChr0007
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0007
     * @tc.desc   lowercase content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0007 begin');
      const path: string = TEXT_DIR + 'tfc' + 7 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'abcdefghijklmnop');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('abcdefghijklmnop'));
      expect(result).assertEqual('abcdefghijklmnop');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0007 end');
    });

    /**
     * @tc.name   testTxtChr0008
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0008
     * @tc.desc   lowercase content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0008 begin');
      const path: string = TEXT_DIR + 'tfc' + 8 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'abcdefghijklmnopqrstuvwxyzabcdef');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('abcdefghijklmnopqrstuvwxyzabcdef'));
      expect(result).assertEqual('abcdefghijklmnopqrstuvwxyzabcdef');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0008 end');
    });

    /**
     * @tc.name   testTxtChr0009
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0009
     * @tc.desc   uppercase content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0009 begin');
      const path: string = TEXT_DIR + 'tfc' + 9 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'A');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A'));
      expect(result).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(65));
      expect(result.charCodeAt(0)).assertEqual(65);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0009 end');
    });

    /**
     * @tc.name   testTxtChr0010
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0010
     * @tc.desc   uppercase content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0010 begin');
      const path: string = TEXT_DIR + 'tfc' + 10 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'ABCDEFGH');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ABCDEFGH'));
      expect(result).assertEqual('ABCDEFGH');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(65));
      expect(result.charCodeAt(0)).assertEqual(65);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0010 end');
    });

    /**
     * @tc.name   testTxtChr0011
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0011
     * @tc.desc   uppercase content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0011 begin');
      const path: string = TEXT_DIR + 'tfc' + 11 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'ABCDEFGHIJKLMNOP');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('ABCDEFGHIJKLMNOP'));
      expect(result).assertEqual('ABCDEFGHIJKLMNOP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(65));
      expect(result.charCodeAt(0)).assertEqual(65);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0011 end');
    });

    /**
     * @tc.name   testTxtChr0012
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0012
     * @tc.desc   uppercase content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0012 begin');
      const path: string = TEXT_DIR + 'tfc' + 12 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF'));
      expect(result).assertEqual('ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(65));
      expect(result.charCodeAt(0)).assertEqual(65);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0012 end');
    });

    /**
     * @tc.name   testTxtChr0013
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0013
     * @tc.desc   mixed content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0013 begin');
      const path: string = TEXT_DIR + 'tfc' + 13 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'a');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0013 end');
    });

    /**
     * @tc.name   testTxtChr0014
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0014
     * @tc.desc   mixed content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0014 begin');
      const path: string = TEXT_DIR + 'tfc' + 14 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'ab12XYab');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ab12XYab'));
      expect(result).assertEqual('ab12XYab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0014 end');
    });

    /**
     * @tc.name   testTxtChr0015
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0015
     * @tc.desc   mixed content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0015 begin');
      const path: string = TEXT_DIR + 'tfc' + 15 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'ab12XYab12XYab12');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('ab12XYab12XYab12'));
      expect(result).assertEqual('ab12XYab12XYab12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0015 end');
    });

    /**
     * @tc.name   testTxtChr0016
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0016
     * @tc.desc   mixed content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0016 begin');
      const path: string = TEXT_DIR + 'tfc' + 16 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'ab12XYab12XYab12XYab12XYab12XYab');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('ab12XYab12XYab12XYab12XYab12XYab'));
      expect(result).assertEqual('ab12XYab12XYab12XYab12XYab12XYab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(97));
      expect(result.charCodeAt(0)).assertEqual(97);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0016 end');
    });

    /**
     * @tc.name   testTxtChr0017
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0017
     * @tc.desc   punctuation content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0017 begin');
      const path: string = TEXT_DIR + 'tfc' + 17 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '.');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('.'));
      expect(result).assertEqual('.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(46));
      expect(result.charCodeAt(0)).assertEqual(46);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0017 end');
    });

    /**
     * @tc.name   testTxtChr0018
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0018
     * @tc.desc   punctuation content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0018 begin');
      const path: string = TEXT_DIR + 'tfc' + 18 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '.,;:!?.,');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('.,;:!?.,'));
      expect(result).assertEqual('.,;:!?.,');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(46));
      expect(result.charCodeAt(0)).assertEqual(46);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0018 end');
    });

    /**
     * @tc.name   testTxtChr0019
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0019
     * @tc.desc   punctuation content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0019 begin');
      const path: string = TEXT_DIR + 'tfc' + 19 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '.,;:!?.,;:!?.,;:');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('.,;:!?.,;:!?.,;:'));
      expect(result).assertEqual('.,;:!?.,;:!?.,;:');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(46));
      expect(result.charCodeAt(0)).assertEqual(46);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0019 end');
    });

    /**
     * @tc.name   testTxtChr0020
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0020
     * @tc.desc   punctuation content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0020 begin');
      const path: string = TEXT_DIR + 'tfc' + 20 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '.,;:!?.,;:!?.,;:!?.,;:!?.,;:!?.,');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('.,;:!?.,;:!?.,;:!?.,;:!?.,;:!?.,'));
      expect(result).assertEqual('.,;:!?.,;:!?.,;:!?.,;:!?.,;:!?.,');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(46));
      expect(result.charCodeAt(0)).assertEqual(46);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0020 end');
    });

    /**
     * @tc.name   testTxtChr0021
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0021
     * @tc.desc   whitespace content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0021 begin');
      const path: string = TEXT_DIR + 'tfc' + 21 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, ' ');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' '));
      expect(result).assertEqual(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(32));
      expect(result.charCodeAt(0)).assertEqual(32);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0021 end');
    });

    /**
     * @tc.name   testTxtChr0022
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0022
     * @tc.desc   whitespace content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0022 begin');
      const path: string = TEXT_DIR + 'tfc' + 22 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, ' \t\n \t\n \t');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(' \t\n \t\n \t'));
      expect(result).assertEqual(' \t\n \t\n \t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(32));
      expect(result.charCodeAt(0)).assertEqual(32);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0022 end');
    });

    /**
     * @tc.name   testTxtChr0023
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0023
     * @tc.desc   whitespace content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0023 begin');
      const path: string = TEXT_DIR + 'tfc' + 23 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, ' \t\n \t\n \t\n \t\n \t\n ');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String(' \t\n \t\n \t\n \t\n \t\n '));
      expect(result).assertEqual(' \t\n \t\n \t\n \t\n \t\n ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(32));
      expect(result.charCodeAt(0)).assertEqual(32);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0023 end');
    });

    /**
     * @tc.name   testTxtChr0024
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0024
     * @tc.desc   whitespace content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0024 begin');
      const path: string = TEXT_DIR + 'tfc' + 24 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, ' \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String(' \t\n \t\n \t\n \t\n \t\n \t\n \t\n ' +
          '\t\n \t\n \t\n \t'));
      expect(result).assertEqual(' \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t\n \t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(32));
      expect(result.charCodeAt(0)).assertEqual(32);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0024 end');
    });

    /**
     * @tc.name   testTxtChr0025
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0025
     * @tc.desc   cjk content reads back as its per-byte utf8 char sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0025 begin');
      const path: string = TEXT_DIR + 'tfc' + 25 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '密');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('å¯'));
      expect(result).assertEqual('å¯');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(229));
      expect(result.charCodeAt(0)).assertEqual(229);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0025 end');
    });

    /**
     * @tc.name   testTxtChr0026
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0026
     * @tc.desc   cjk content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0026 begin');
      const path: string = TEXT_DIR + 'tfc' + 26 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '密文测试密文测试');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('å¯ææµè¯å¯ææµè¯'));
      expect(result).assertEqual('å¯ææµè¯å¯ææµè¯');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(229));
      expect(result.charCodeAt(0)).assertEqual(229);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0026 end');
    });

    /**
     * @tc.name   testTxtChr0027
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0027
     * @tc.desc   cjk content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0027 begin');
      const path: string = TEXT_DIR + 'tfc' + 27 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '密文测试密文测试密文测试密文测试');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµ' +
        'è¯'));
      expect(result).assertEqual('å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµè¯');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      expect(result.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(229));
      expect(result.charCodeAt(0)).assertEqual(229);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0027 end');
    });

    /**
     * @tc.name   testTxtChr0028
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0028
     * @tc.desc   cjk content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0028 begin');
      const path: string = TEXT_DIR + 'tfc' + 28 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '密文测试密文测试密文测试密文测试密文测试密文测试密文测试密文测试');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµ' +
        'è¯å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµè¯'));
      expect(result).assertEqual('å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯ææµè¯å¯æ' +
        'æµè¯å¯ææµè¯');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      expect(result.length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(229));
      expect(result.charCodeAt(0)).assertEqual(229);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0028 end');
    });

    /**
     * @tc.name   testTxtChr0029
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0029
     * @tc.desc   latin1 content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0029 begin');
      const path: string = TEXT_DIR + 'tfc' + 29 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'é');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Ã©'));
      expect(result).assertEqual('Ã©');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(195));
      expect(result.charCodeAt(0)).assertEqual(195);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0029 end');
    });

    /**
     * @tc.name   testTxtChr0030
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0030
     * @tc.desc   latin1 content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0030 begin');
      const path: string = TEXT_DIR + 'tfc' + 30 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'éàöéàöéà');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã '));
      expect(result).assertEqual('Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(195));
      expect(result.charCodeAt(0)).assertEqual(195);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0030 end');
    });

    /**
     * @tc.name   testTxtChr0031
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0031
     * @tc.desc   latin1 content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0031 begin');
      const path: string = TEXT_DIR + 'tfc' + 31 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'éàöéàöéàöéàöéàöé');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©'));
      expect(result).assertEqual('Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(195));
      expect(result.charCodeAt(0)).assertEqual(195);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0031 end');
    });

    /**
     * @tc.name   testTxtChr0032
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0032
     * @tc.desc   latin1 content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0032 begin');
      const path: string = TEXT_DIR + 'tfc' + 32 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'éàöéàöéàöéàöéàöéàöéàöéàöéàöéàöéà');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©' +
        'Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã '));
      expect(result).assertEqual('Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã Ã¶Ã©Ã ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      expect(result.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(195));
      expect(result.charCodeAt(0)).assertEqual(195);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0032 end');
    });

    /**
     * @tc.name   testTxtChr0033
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0033
     * @tc.desc   symbols content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0033 begin');
      const path: string = TEXT_DIR + 'tfc' + 33 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '@');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('@'));
      expect(result).assertEqual('@');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(64));
      expect(result.charCodeAt(0)).assertEqual(64);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0033 end');
    });

    /**
     * @tc.name   testTxtChr0034
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0034
     * @tc.desc   symbols content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0034 begin');
      const path: string = TEXT_DIR + 'tfc' + 34 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '@#$%&@#$');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('@#$%&@#$'));
      expect(result).assertEqual('@#$%&@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(64));
      expect(result.charCodeAt(0)).assertEqual(64);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0034 end');
    });

    /**
     * @tc.name   testTxtChr0035
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0035
     * @tc.desc   symbols content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0035 begin');
      const path: string = TEXT_DIR + 'tfc' + 35 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '@#$%&@#$%&@#$%&@');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('@#$%&@#$%&@#$%&@'));
      expect(result).assertEqual('@#$%&@#$%&@#$%&@');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(64));
      expect(result.charCodeAt(0)).assertEqual(64);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0035 end');
    });

    /**
     * @tc.name   testTxtChr0036
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0036
     * @tc.desc   symbols content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0036 begin');
      const path: string = TEXT_DIR + 'tfc' + 36 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '@#$%&@#$%&@#$%&@#$%&@#$%&@#$%&@#');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('@#$%&@#$%&@#$%&@#$%&@#$%&@#$%&@#'));
      expect(result).assertEqual('@#$%&@#$%&@#$%&@#$%&@#$%&@#$%&@#');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(64));
      expect(result.charCodeAt(0)).assertEqual(64);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0036 end');
    });

    /**
     * @tc.name   testTxtChr0037
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0037
     * @tc.desc   brackets content of length 1 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0037 begin');
      const path: string = TEXT_DIR + 'tfc' + 37 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '(');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('('));
      expect(result).assertEqual('(');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(40));
      expect(result.charCodeAt(0)).assertEqual(40);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0037 end');
    });

    /**
     * @tc.name   testTxtChr0038
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0038
     * @tc.desc   brackets content of length 8 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0038 begin');
      const path: string = TEXT_DIR + 'tfc' + 38 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '()[]{}()');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('()[]{}()'));
      expect(result).assertEqual('()[]{}()');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(40));
      expect(result.charCodeAt(0)).assertEqual(40);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0038 end');
    });

    /**
     * @tc.name   testTxtChr0039
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0039
     * @tc.desc   brackets content of length 16 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0039 begin');
      const path: string = TEXT_DIR + 'tfc' + 39 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '()[]{}()[]{}()[]');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('()[]{}()[]{}()[]'));
      expect(result).assertEqual('()[]{}()[]{}()[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(40));
      expect(result.charCodeAt(0)).assertEqual(40);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0039 end');
    });

    /**
     * @tc.name   testTxtChr0040
     * @tc.number SUB_CryptoFramework_TXTCHR_01_0040
     * @tc.desc   brackets content of length 32 maps to per-byte utf8 chars after read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtChr0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0040 begin');
      const path: string = TEXT_DIR + 'tfc' + 40 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, '()[]{}()[]{}()[]{}()[]{}()[]{}()');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('()[]{}()[]{}()[]{}()[]{}()[]{}()'));
      expect(result).assertEqual('()[]{}()[]{}()[]{}()[]{}()[]{}()');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.charCodeAt(0)), String(40));
      expect(result.charCodeAt(0)).assertEqual(40);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtChr0040 end');
    });

  });
}
