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
import { fileIo as fs } from '@kit.CoreFileKit';
import TextFileManager from '../../../main/ets/textfilemanager/TextFileManager';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';
const TEST_FILE: string = '/data/storage/el2/base/haps/entry_test/files/cryptoframework_tr2.txt';
const SECOND_FILE: string = '/data/storage/el2/base/haps/entry_test/files/cryptoframework_tr2b.txt';
const TEXT_MAX_READ_LEN: number = 8192;

function prepareFile(path: string, content: string): boolean {
  try {
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    if (content.length > 0) {
      fs.writeSync(file.fd, content);
    }
    fs.closeSync(file);
    return true;
  } catch (e) {
    return false;
  }
}

function cleanUp(path: string): void {
  try {
    fs.unlinkSync(path);
  } catch (e) {
    // file may not exist; nothing to clean
  }
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

export default function textFileReal2Test() {
  describe('TextFileReal2', () => {

    /**
     * @tc.name   testTextFileReal20001
     * @tc.number SUB_CryptoFramework_TXTRL2_0001
     * @tc.desc   a written text comes back exactly after reading
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20001 begin');      const content: string = 'b' +
        'asic write read cycle';
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', got, content);
      expect(got).assertEqual(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(22));
      expect(got.length).assertEqual(22);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20001 end');
    });

    /**
     * @tc.name   testTextFileReal20002
     * @tc.number SUB_CryptoFramework_TXTRL2_0002
     * @tc.desc   an empty write reads back as an empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20002 begin');      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, '');
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', got, '');
      expect(got).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(0));
      expect(got.length).assertEqual(0);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20002 end');
    });

    /**
     * @tc.name   testTextFileReal20003
     * @tc.number SUB_CryptoFramework_TXTRL2_0003
     * @tc.desc   a single char write reads back unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20003 begin');      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, 'z');
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', got, 'z');
      expect(got).assertEqual('z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(1));
      expect(got.length).assertEqual(1);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20003 end');
    });

    /**
     * @tc.name   testTextFileReal20004
     * @tc.number SUB_CryptoFramework_TXTRL2_0004
     * @tc.desc   a 100 char write reads back unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20004 begin');      const content: string = repeatChar('h', 100);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(100));
      expect(got.length).assertEqual(100);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20004 end');
    });

    /**
     * @tc.name   testTextFileReal20005
     * @tc.number SUB_CryptoFramework_TXTRL2_0005
     * @tc.desc   a 500 char write reads back unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20005 begin');      const content: string = repeatChar('i', 500);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(500));
      expect(got.length).assertEqual(500);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20005 end');
    });

    /**
     * @tc.name   testTextFileReal20006
     * @tc.number SUB_CryptoFramework_TXTRL2_0006
     * @tc.desc   a 4000 char write reads back unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20006 begin');      const content: string = repeatChar('j', 4000);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(4000));
      expect(got.length).assertEqual(4000);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20006 end');
    });

    /**
     * @tc.name   testTextFileReal20007
     * @tc.number SUB_CryptoFramework_TXTRL2_0007
     * @tc.desc   a write of exactly 8192 chars reads back completely
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20007 begin');      const content: string = repeatChar('k', TEXT_MAX_READ_LEN);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(8192));
      expect(got.length).assertEqual(8192);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20007 end');
    });

    /**
     * @tc.name   testTextFileReal20008
     * @tc.number SUB_CryptoFramework_TXTRL2_0008
     * @tc.desc   a 9000 char file reads back only the first 8192 chars
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20008 begin');      const content: string = repeatChar('l', 9000);
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(8192));
      expect(got.length).assertEqual(8192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === repeatChar('l', 8192)));
      expect(got === repeatChar('l', 8192)).assertTrue();
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20008 end');
    });

    /**
     * @tc.name   testTextFileReal20009
     * @tc.number SUB_CryptoFramework_TXTRL2_0009
     * @tc.desc   a second same-length write replaces the first content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20009 begin');      const first: string = repeatChar('A', 100);
      const second: string = repeatChar('B', 100);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, first);
      await TextFileManager.writeTextFile(TEST_FILE, second);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === second));
      expect(got === second).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got !== first));
      expect(got !== first).assertTrue();
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20009 end');
    });

    /**
     * @tc.name   testTextFileReal20010
     * @tc.number SUB_CryptoFramework_TXTRL2_0010
     * @tc.desc   reading after the file is deleted keeps the last value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20010 begin');      const content: string = 'p' +
        'ersist before delete';
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const before: string = TextFileManager.getString();
      cleanUp(TEST_FILE);
      await TextFileManager.readTextFile(TEST_FILE);
      const after: string = TextFileManager.getString();
      const actResult: string = after;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', before, content);
      expect(before).assertEqual(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(after === before));
      expect(after === before).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20010 end');
    });

    /**
     * @tc.name   testTextFileReal20011
     * @tc.number SUB_CryptoFramework_TXTRL2_0011
     * @tc.desc   repeated access through the module export returns the same stored value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20011 begin');
      const content: string = 'shared static state';
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const gotA: string = TextFileManager.getString();
      const gotB: string = TextFileManager.getString();
      const actResult: string = gotA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', gotA, content);
      expect(gotA).assertEqual(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', gotB, gotA);
      expect(gotB).assertEqual(gotA);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20011 end');
    });

    /**
     * @tc.name   testTextFileReal20012
     * @tc.number SUB_CryptoFramework_TXTRL2_0012
     * @tc.desc   numeric content roundtrips through the file
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20012 begin');      const content: string = repeatChar('0123456789', 8);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(80));
      expect(got.length).assertEqual(80);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20012 end');
    });

    /**
     * @tc.name   testTextFileReal20013
     * @tc.number SUB_CryptoFramework_TXTRL2_0013
     * @tc.desc   symbol content roundtrips through the file
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20013 begin');      const content: string = '+' +
        '-*/=<>|&^%~#@!';
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', got, content);
      expect(got).assertEqual(content);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(15));
      expect(got.length).assertEqual(15);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20013 end');
    });

    /**
     * @tc.name   testTextFileReal20014
     * @tc.number SUB_CryptoFramework_TXTRL2_0014
     * @tc.desc   newline and tab content roundtrips through the file
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20014 begin');      const content: string = 'r' +
        'ow one\nrow two\n\tend';
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(20));
      expect(got.length).assertEqual(20);
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20014 end');
    });

    /**
     * @tc.name   testTextFileReal20015
     * @tc.number SUB_CryptoFramework_TXTRL2_0015
     * @tc.desc   a latin1 word expands to its utf8 byte count on read back
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20015 begin');      const content: string = 'c' +
        'af\u00e9';
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(5));
      expect(got.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got !== content));
      expect(got !== content).assertTrue();
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20015 end');
    });

    /**
     * @tc.name   testTextFileReal20016
     * @tc.number SUB_CryptoFramework_TXTRL2_0016
     * @tc.desc   a cjk word reads back as its utf8 byte sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}' +
        's', 'testTextFileReal20016 begin');      const content: string = '\u4e2d\u6587';
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(got.length), String(6));
      expect(got.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got !== content));
      expect(got !== content).assertTrue();
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20016 end');
    });

    /**
     * @tc.name   testTextFileReal20017
     * @tc.number SUB_CryptoFramework_TXTRL2_0017
     * @tc.desc   two files keep independent content through alternating reads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20017 begin');      const readyA: boolean = prepareFile(TEST_FILE, '');
      const readyB: boolean = prepareFile(SECOND_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, 'alpha file');
      await TextFileManager.writeTextFile(SECOND_FILE, 'beta file');
      await TextFileManager.readTextFile(TEST_FILE);
      const gotA: string = TextFileManager.getString();
      await TextFileManager.readTextFile(SECOND_FILE);
      const gotB: string = TextFileManager.getString();
      const actResult: string = gotA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(readyA && readyB));
      expect(readyA && readyB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', gotA, 'alpha file');
      expect(gotA).assertEqual('alpha file');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', gotB, 'beta file');
      expect(gotB).assertEqual('beta file');
      cleanUp(TEST_FILE);
      cleanUp(SECOND_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20017 end');
    });

    /**
     * @tc.name   testTextFileReal20018
     * @tc.number SUB_CryptoFramework_TXTRL2_0018
     * @tc.desc   writing through the manager keeps the full 8192 boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTextFileReal20018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG,
        '%{public}s', 'testTextFileReal20018 begin');      const content: string = repeatChar('n', TEXT_MAX_READ_LEN);
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const got: string = TextFileManager.getString();
      const actResult: string = got;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ready));
      expect(ready).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got === content));
      expect(got === content).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(got.length === TEXT_MAX_READ_LEN));
      expect(got.length === TEXT_MAX_READ_LEN).assertTrue();
      cleanUp(TEST_FILE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTextFileReal20018 end');
    });

  });
}
