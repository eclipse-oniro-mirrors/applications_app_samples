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

export default function txtLen2Test() {
  describe('TxtLen2', () => {

    /**
     * @tc.name   testTxtLen20001
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0001
     * @tc.desc   write then read of a 101-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20001 begin');
      const path: string = TEXT_DIR + 'tfl2' + 1 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(101));
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(102));
      expect(result.split('x').length).assertEqual(102);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20001 end');
    });

    /**
     * @tc.name   testTxtLen20002
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0002
     * @tc.desc   write then read of a 102-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20002 begin');
      const path: string = TEXT_DIR + 'tfl2' + 2 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(102));
      expect(result.length).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(103));
      expect(result.split('x').length).assertEqual(103);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20002 end');
    });

    /**
     * @tc.name   testTxtLen20003
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0003
     * @tc.desc   write then read of a 103-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20003 begin');
      const path: string = TEXT_DIR + 'tfl2' + 3 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(103));
      expect(result.length).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(104));
      expect(result.split('x').length).assertEqual(104);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20003 end');
    });

    /**
     * @tc.name   testTxtLen20004
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0004
     * @tc.desc   write then read of a 104-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20004 begin');
      const path: string = TEXT_DIR + 'tfl2' + 4 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      expect(result.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(105));
      expect(result.split('x').length).assertEqual(105);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20004 end');
    });

    /**
     * @tc.name   testTxtLen20005
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0005
     * @tc.desc   write then read of a 105-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20005 begin');
      const path: string = TEXT_DIR + 'tfl2' + 5 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(105));
      expect(result.length).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(106));
      expect(result.split('x').length).assertEqual(106);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20005 end');
    });

    /**
     * @tc.name   testTxtLen20006
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0006
     * @tc.desc   write then read of a 106-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20006 begin');
      const path: string = TEXT_DIR + 'tfl2' + 6 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(106));
      expect(result.length).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(107));
      expect(result.split('x').length).assertEqual(107);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20006 end');
    });

    /**
     * @tc.name   testTxtLen20007
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0007
     * @tc.desc   write then read of a 107-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20007 begin');
      const path: string = TEXT_DIR + 'tfl2' + 7 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(107));
      expect(result.length).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(108));
      expect(result.split('x').length).assertEqual(108);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20007 end');
    });

    /**
     * @tc.name   testTxtLen20008
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0008
     * @tc.desc   write then read of a 108-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20008 begin');
      const path: string = TEXT_DIR + 'tfl2' + 8 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(108));
      expect(result.length).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(109));
      expect(result.split('x').length).assertEqual(109);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20008 end');
    });

    /**
     * @tc.name   testTxtLen20009
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0009
     * @tc.desc   write then read of a 109-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20009 begin');
      const path: string = TEXT_DIR + 'tfl2' + 9 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(109));
      expect(result.length).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(110));
      expect(result.split('x').length).assertEqual(110);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20009 end');
    });

    /**
     * @tc.name   testTxtLen20010
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0010
     * @tc.desc   write then read of a 110-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20010 begin');
      const path: string = TEXT_DIR + 'tfl2' + 10 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(110));
      expect(result.length).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(111));
      expect(result.split('x').length).assertEqual(111);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20010 end');
    });

    /**
     * @tc.name   testTxtLen20011
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0011
     * @tc.desc   write then read of a 111-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20011 begin');
      const path: string = TEXT_DIR + 'tfl2' + 11 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(111));
      expect(result.length).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(112));
      expect(result.split('x').length).assertEqual(112);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20011 end');
    });

    /**
     * @tc.name   testTxtLen20012
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0012
     * @tc.desc   write then read of a 112-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20012 begin');
      const path: string = TEXT_DIR + 'tfl2' + 12 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(112));
      expect(result.length).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(113));
      expect(result.split('x').length).assertEqual(113);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20012 end');
    });

    /**
     * @tc.name   testTxtLen20013
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0013
     * @tc.desc   write then read of a 113-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20013 begin');
      const path: string = TEXT_DIR + 'tfl2' + 13 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(113));
      expect(result.length).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(114));
      expect(result.split('x').length).assertEqual(114);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20013 end');
    });

    /**
     * @tc.name   testTxtLen20014
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0014
     * @tc.desc   write then read of a 114-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20014 begin');
      const path: string = TEXT_DIR + 'tfl2' + 14 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(114));
      expect(result.length).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(115));
      expect(result.split('x').length).assertEqual(115);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20014 end');
    });

    /**
     * @tc.name   testTxtLen20015
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0015
     * @tc.desc   write then read of a 115-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20015 begin');
      const path: string = TEXT_DIR + 'tfl2' + 15 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(115));
      expect(result.length).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(116));
      expect(result.split('x').length).assertEqual(116);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20015 end');
    });

    /**
     * @tc.name   testTxtLen20016
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0016
     * @tc.desc   write then read of a 116-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20016 begin');
      const path: string = TEXT_DIR + 'tfl2' + 16 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(116));
      expect(result.length).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(117));
      expect(result.split('x').length).assertEqual(117);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20016 end');
    });

    /**
     * @tc.name   testTxtLen20017
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0017
     * @tc.desc   write then read of a 117-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20017 begin');
      const path: string = TEXT_DIR + 'tfl2' + 17 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(117));
      expect(result.length).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(118));
      expect(result.split('x').length).assertEqual(118);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20017 end');
    });

    /**
     * @tc.name   testTxtLen20018
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0018
     * @tc.desc   write then read of a 118-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20018 begin');
      const path: string = TEXT_DIR + 'tfl2' + 18 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(118));
      expect(result.length).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(119));
      expect(result.split('x').length).assertEqual(119);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20018 end');
    });

    /**
     * @tc.name   testTxtLen20019
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0019
     * @tc.desc   write then read of a 119-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20019 begin');
      const path: string = TEXT_DIR + 'tfl2' + 19 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(119));
      expect(result.length).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(120));
      expect(result.split('x').length).assertEqual(120);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20019 end');
    });

    /**
     * @tc.name   testTxtLen20020
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0020
     * @tc.desc   write then read of a 120-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20020 begin');
      const path: string = TEXT_DIR + 'tfl2' + 20 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(120));
      expect(result.length).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(121));
      expect(result.split('x').length).assertEqual(121);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20020 end');
    });

    /**
     * @tc.name   testTxtLen20021
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0021
     * @tc.desc   write then read of a 121-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20021 begin');
      const path: string = TEXT_DIR + 'tfl2' + 21 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(121));
      expect(result.length).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(122));
      expect(result.split('x').length).assertEqual(122);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20021 end');
    });

    /**
     * @tc.name   testTxtLen20022
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0022
     * @tc.desc   write then read of a 122-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20022 begin');
      const path: string = TEXT_DIR + 'tfl2' + 22 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(122));
      expect(result.length).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(123));
      expect(result.split('x').length).assertEqual(123);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20022 end');
    });

    /**
     * @tc.name   testTxtLen20023
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0023
     * @tc.desc   write then read of a 123-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20023 begin');
      const path: string = TEXT_DIR + 'tfl2' + 23 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(123));
      expect(result.length).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(124));
      expect(result.split('x').length).assertEqual(124);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20023 end');
    });

    /**
     * @tc.name   testTxtLen20024
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0024
     * @tc.desc   write then read of a 124-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20024 begin');
      const path: string = TEXT_DIR + 'tfl2' + 24 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(124));
      expect(result.length).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(125));
      expect(result.split('x').length).assertEqual(125);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20024 end');
    });

    /**
     * @tc.name   testTxtLen20025
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0025
     * @tc.desc   write then read of a 125-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20025 begin');
      const path: string = TEXT_DIR + 'tfl2' + 25 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(125));
      expect(result.length).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(126));
      expect(result.split('x').length).assertEqual(126);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20025 end');
    });

    /**
     * @tc.name   testTxtLen20026
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0026
     * @tc.desc   write then read of a 126-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20026 begin');
      const path: string = TEXT_DIR + 'tfl2' + 26 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(126));
      expect(result.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(127));
      expect(result.split('x').length).assertEqual(127);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20026 end');
    });

    /**
     * @tc.name   testTxtLen20027
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0027
     * @tc.desc   write then read of a 127-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20027 begin');
      const path: string = TEXT_DIR + 'tfl2' + 27 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(127));
      expect(result.length).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(128));
      expect(result.split('x').length).assertEqual(128);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20027 end');
    });

    /**
     * @tc.name   testTxtLen20028
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0028
     * @tc.desc   write then read of a 128-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20028 begin');
      const path: string = TEXT_DIR + 'tfl2' + 28 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(128));
      expect(result.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(129));
      expect(result.split('x').length).assertEqual(129);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20028 end');
    });

    /**
     * @tc.name   testTxtLen20029
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0029
     * @tc.desc   write then read of a 129-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20029 begin');
      const path: string = TEXT_DIR + 'tfl2' + 29 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(129));
      expect(result.length).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(130));
      expect(result.split('x').length).assertEqual(130);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20029 end');
    });

    /**
     * @tc.name   testTxtLen20030
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0030
     * @tc.desc   write then read of a 130-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20030 begin');
      const path: string = TEXT_DIR + 'tfl2' + 30 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(130));
      expect(result.length).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(131));
      expect(result.split('x').length).assertEqual(131);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20030 end');
    });

    /**
     * @tc.name   testTxtLen20031
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0031
     * @tc.desc   write then read of a 131-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20031 begin');
      const path: string = TEXT_DIR + 'tfl2' + 31 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(131));
      expect(result.length).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(132));
      expect(result.split('x').length).assertEqual(132);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20031 end');
    });

    /**
     * @tc.name   testTxtLen20032
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0032
     * @tc.desc   write then read of a 132-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20032 begin');
      const path: string = TEXT_DIR + 'tfl2' + 32 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(132));
      expect(result.length).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(133));
      expect(result.split('x').length).assertEqual(133);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20032 end');
    });

    /**
     * @tc.name   testTxtLen20033
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0033
     * @tc.desc   write then read of a 133-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20033 begin');
      const path: string = TEXT_DIR + 'tfl2' + 33 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(133));
      expect(result.length).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(134));
      expect(result.split('x').length).assertEqual(134);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20033 end');
    });

    /**
     * @tc.name   testTxtLen20034
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0034
     * @tc.desc   write then read of a 134-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20034 begin');
      const path: string = TEXT_DIR + 'tfl2' + 34 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(134));
      expect(result.length).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(135));
      expect(result.split('x').length).assertEqual(135);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20034 end');
    });

    /**
     * @tc.name   testTxtLen20035
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0035
     * @tc.desc   write then read of a 135-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20035 begin');
      const path: string = TEXT_DIR + 'tfl2' + 35 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(135));
      expect(result.length).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(136));
      expect(result.split('x').length).assertEqual(136);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20035 end');
    });

    /**
     * @tc.name   testTxtLen20036
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0036
     * @tc.desc   write then read of a 136-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20036 begin');
      const path: string = TEXT_DIR + 'tfl2' + 36 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(136));
      expect(result.length).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(137));
      expect(result.split('x').length).assertEqual(137);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20036 end');
    });

    /**
     * @tc.name   testTxtLen20037
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0037
     * @tc.desc   write then read of a 137-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20037 begin');
      const path: string = TEXT_DIR + 'tfl2' + 37 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(137));
      expect(result.length).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(138));
      expect(result.split('x').length).assertEqual(138);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20037 end');
    });

    /**
     * @tc.name   testTxtLen20038
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0038
     * @tc.desc   write then read of a 138-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20038 begin');
      const path: string = TEXT_DIR + 'tfl2' + 38 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(138));
      expect(result.length).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(139));
      expect(result.split('x').length).assertEqual(139);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20038 end');
    });

    /**
     * @tc.name   testTxtLen20039
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0039
     * @tc.desc   write then read of a 139-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20039 begin');
      const path: string = TEXT_DIR + 'tfl2' + 39 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(139));
      expect(result.length).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(140));
      expect(result.split('x').length).assertEqual(140);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20039 end');
    });

    /**
     * @tc.name   testTxtLen20040
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0040
     * @tc.desc   write then read of a 140-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20040 begin');
      const path: string = TEXT_DIR + 'tfl2' + 40 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(140));
      expect(result.length).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(141));
      expect(result.split('x').length).assertEqual(141);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20040 end');
    });

    /**
     * @tc.name   testTxtLen20041
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0041
     * @tc.desc   write then read of a 141-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20041 begin');
      const path: string = TEXT_DIR + 'tfl2' + 41 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(141));
      expect(result.length).assertEqual(141);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(142));
      expect(result.split('x').length).assertEqual(142);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20041 end');
    });

    /**
     * @tc.name   testTxtLen20042
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0042
     * @tc.desc   write then read of a 142-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20042 begin');
      const path: string = TEXT_DIR + 'tfl2' + 42 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(142));
      expect(result.length).assertEqual(142);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(143));
      expect(result.split('x').length).assertEqual(143);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20042 end');
    });

    /**
     * @tc.name   testTxtLen20043
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0043
     * @tc.desc   write then read of a 143-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20043 begin');
      const path: string = TEXT_DIR + 'tfl2' + 43 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(143));
      expect(result.length).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(144));
      expect(result.split('x').length).assertEqual(144);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20043 end');
    });

    /**
     * @tc.name   testTxtLen20044
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0044
     * @tc.desc   write then read of a 144-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20044 begin');
      const path: string = TEXT_DIR + 'tfl2' + 44 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(144));
      expect(result.length).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(145));
      expect(result.split('x').length).assertEqual(145);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20044 end');
    });

    /**
     * @tc.name   testTxtLen20045
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0045
     * @tc.desc   write then read of a 145-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20045 begin');
      const path: string = TEXT_DIR + 'tfl2' + 45 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(145));
      expect(result.length).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(146));
      expect(result.split('x').length).assertEqual(146);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20045 end');
    });

    /**
     * @tc.name   testTxtLen20046
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0046
     * @tc.desc   write then read of a 146-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20046 begin');
      const path: string = TEXT_DIR + 'tfl2' + 46 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(146));
      expect(result.length).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(147));
      expect(result.split('x').length).assertEqual(147);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20046 end');
    });

    /**
     * @tc.name   testTxtLen20047
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0047
     * @tc.desc   write then read of a 147-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20047 begin');
      const path: string = TEXT_DIR + 'tfl2' + 47 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(147));
      expect(result.length).assertEqual(147);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(148));
      expect(result.split('x').length).assertEqual(148);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20047 end');
    });

    /**
     * @tc.name   testTxtLen20048
     * @tc.number SUB_CryptoFramework_TXTLEN2_01_0048
     * @tc.desc   148-char content write and read roundtrip keeps content and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20048 begin');
      const path: string = TEXT_DIR + 'tfl2' + 48 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(148));
      expect(result.length).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(149));
      expect(result.split('x').length).assertEqual(149);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen20048 end');
    });

  });
}
