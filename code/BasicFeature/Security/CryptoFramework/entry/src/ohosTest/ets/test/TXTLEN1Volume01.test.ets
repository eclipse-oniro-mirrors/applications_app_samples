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

export default function txtLen1Test() {
  describe('TxtLen1', () => {

    /**
     * @tc.name   testTxtLen10001
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0001
     * @tc.desc   write then read of a 1-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10001 begin');
      const path: string = TEXT_DIR + 'tfl' + 1 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'x');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x'));
      expect(result).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(2));
      expect(result.split('x').length).assertEqual(2);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10001 end');
    });

    /**
     * @tc.name   testTxtLen10002
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0002
     * @tc.desc   write then read of a 2-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10002 begin');
      const path: string = TEXT_DIR + 'tfl' + 2 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xx'));
      expect(result).assertEqual('xx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(3));
      expect(result.split('x').length).assertEqual(3);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10002 end');
    });

    /**
     * @tc.name   testTxtLen10003
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0003
     * @tc.desc   write then read of a 3-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10003 begin');
      const path: string = TEXT_DIR + 'tfl' + 3 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxx'));
      expect(result).assertEqual('xxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(4));
      expect(result.split('x').length).assertEqual(4);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10003 end');
    });

    /**
     * @tc.name   testTxtLen10004
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0004
     * @tc.desc   write then read of a 4-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10004 begin');
      const path: string = TEXT_DIR + 'tfl' + 4 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxx'));
      expect(result).assertEqual('xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(5));
      expect(result.split('x').length).assertEqual(5);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10004 end');
    });

    /**
     * @tc.name   testTxtLen10005
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0005
     * @tc.desc   write then read of a 5-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10005 begin');
      const path: string = TEXT_DIR + 'tfl' + 5 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxx'));
      expect(result).assertEqual('xxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(6));
      expect(result.split('x').length).assertEqual(6);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10005 end');
    });

    /**
     * @tc.name   testTxtLen10006
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0006
     * @tc.desc   write then read of a 6-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10006 begin');
      const path: string = TEXT_DIR + 'tfl' + 6 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxx'));
      expect(result).assertEqual('xxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(7));
      expect(result.split('x').length).assertEqual(7);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10006 end');
    });

    /**
     * @tc.name   testTxtLen10007
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0007
     * @tc.desc   write then read of a 7-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10007 begin');
      const path: string = TEXT_DIR + 'tfl' + 7 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxx'));
      expect(result).assertEqual('xxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(8));
      expect(result.split('x').length).assertEqual(8);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10007 end');
    });

    /**
     * @tc.name   testTxtLen10008
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0008
     * @tc.desc   write then read of a 8-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10008 begin');
      const path: string = TEXT_DIR + 'tfl' + 8 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxx'));
      expect(result).assertEqual('xxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(9));
      expect(result.split('x').length).assertEqual(9);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10008 end');
    });

    /**
     * @tc.name   testTxtLen10009
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0009
     * @tc.desc   write then read of a 9-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10009 begin');
      const path: string = TEXT_DIR + 'tfl' + 9 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(10));
      expect(result.split('x').length).assertEqual(10);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10009 end');
    });

    /**
     * @tc.name   testTxtLen10010
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0010
     * @tc.desc   write then read of a 10-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10010 begin');
      const path: string = TEXT_DIR + 'tfl' + 10 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(11));
      expect(result.split('x').length).assertEqual(11);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10010 end');
    });

    /**
     * @tc.name   testTxtLen10011
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0011
     * @tc.desc   write then read of a 11-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10011 begin');
      const path: string = TEXT_DIR + 'tfl' + 11 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(12));
      expect(result.split('x').length).assertEqual(12);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10011 end');
    });

    /**
     * @tc.name   testTxtLen10012
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0012
     * @tc.desc   write then read of a 12-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10012 begin');
      const path: string = TEXT_DIR + 'tfl' + 12 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(13));
      expect(result.split('x').length).assertEqual(13);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10012 end');
    });

    /**
     * @tc.name   testTxtLen10013
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0013
     * @tc.desc   write then read of a 13-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10013 begin');
      const path: string = TEXT_DIR + 'tfl' + 13 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(14));
      expect(result.split('x').length).assertEqual(14);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10013 end');
    });

    /**
     * @tc.name   testTxtLen10014
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0014
     * @tc.desc   write then read of a 14-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10014 begin');
      const path: string = TEXT_DIR + 'tfl' + 14 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(15));
      expect(result.split('x').length).assertEqual(15);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10014 end');
    });

    /**
     * @tc.name   testTxtLen10015
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0015
     * @tc.desc   write then read of a 15-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10015 begin');
      const path: string = TEXT_DIR + 'tfl' + 15 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(16));
      expect(result.split('x').length).assertEqual(16);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10015 end');
    });

    /**
     * @tc.name   testTxtLen10016
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0016
     * @tc.desc   write then read of a 16-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10016 begin');
      const path: string = TEXT_DIR + 'tfl' + 16 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(17));
      expect(result.split('x').length).assertEqual(17);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10016 end');
    });

    /**
     * @tc.name   testTxtLen10017
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0017
     * @tc.desc   write then read of a 17-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10017 begin');
      const path: string = TEXT_DIR + 'tfl' + 17 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(18));
      expect(result.split('x').length).assertEqual(18);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10017 end');
    });

    /**
     * @tc.name   testTxtLen10018
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0018
     * @tc.desc   write then read of a 18-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10018 begin');
      const path: string = TEXT_DIR + 'tfl' + 18 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(19));
      expect(result.split('x').length).assertEqual(19);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10018 end');
    });

    /**
     * @tc.name   testTxtLen10019
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0019
     * @tc.desc   write then read of a 19-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10019 begin');
      const path: string = TEXT_DIR + 'tfl' + 19 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(20));
      expect(result.split('x').length).assertEqual(20);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10019 end');
    });

    /**
     * @tc.name   testTxtLen10020
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0020
     * @tc.desc   write then read of a 20-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10020 begin');
      const path: string = TEXT_DIR + 'tfl' + 20 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(21));
      expect(result.split('x').length).assertEqual(21);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10020 end');
    });

    /**
     * @tc.name   testTxtLen10021
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0021
     * @tc.desc   write then read of a 21-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10021 begin');
      const path: string = TEXT_DIR + 'tfl' + 21 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(22));
      expect(result.split('x').length).assertEqual(22);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10021 end');
    });

    /**
     * @tc.name   testTxtLen10022
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0022
     * @tc.desc   write then read of a 22-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10022 begin');
      const path: string = TEXT_DIR + 'tfl' + 22 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(23));
      expect(result.split('x').length).assertEqual(23);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10022 end');
    });

    /**
     * @tc.name   testTxtLen10023
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0023
     * @tc.desc   write then read of a 23-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10023 begin');
      const path: string = TEXT_DIR + 'tfl' + 23 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(23));
      expect(result.length).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(24));
      expect(result.split('x').length).assertEqual(24);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10023 end');
    });

    /**
     * @tc.name   testTxtLen10024
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0024
     * @tc.desc   write then read of a 24-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10024 begin');
      const path: string = TEXT_DIR + 'tfl' + 24 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(25));
      expect(result.split('x').length).assertEqual(25);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10024 end');
    });

    /**
     * @tc.name   testTxtLen10025
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0025
     * @tc.desc   write then read of a 25-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10025 begin');
      const path: string = TEXT_DIR + 'tfl' + 25 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(25));
      expect(result.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(26));
      expect(result.split('x').length).assertEqual(26);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10025 end');
    });

    /**
     * @tc.name   testTxtLen10026
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0026
     * @tc.desc   write then read of a 26-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10026 begin');
      const path: string = TEXT_DIR + 'tfl' + 26 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(26));
      expect(result.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(27));
      expect(result.split('x').length).assertEqual(27);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10026 end');
    });

    /**
     * @tc.name   testTxtLen10027
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0027
     * @tc.desc   write then read of a 27-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10027 begin');
      const path: string = TEXT_DIR + 'tfl' + 27 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(28));
      expect(result.split('x').length).assertEqual(28);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10027 end');
    });

    /**
     * @tc.name   testTxtLen10028
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0028
     * @tc.desc   write then read of a 28-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10028 begin');
      const path: string = TEXT_DIR + 'tfl' + 28 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(29));
      expect(result.split('x').length).assertEqual(29);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10028 end');
    });

    /**
     * @tc.name   testTxtLen10029
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0029
     * @tc.desc   write then read of a 29-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10029 begin');
      const path: string = TEXT_DIR + 'tfl' + 29 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(29));
      expect(result.length).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(30));
      expect(result.split('x').length).assertEqual(30);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10029 end');
    });

    /**
     * @tc.name   testTxtLen10030
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0030
     * @tc.desc   write then read of a 30-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10030 begin');
      const path: string = TEXT_DIR + 'tfl' + 30 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(31));
      expect(result.split('x').length).assertEqual(31);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10030 end');
    });

    /**
     * @tc.name   testTxtLen10031
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0031
     * @tc.desc   write then read of a 31-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10031 begin');
      const path: string = TEXT_DIR + 'tfl' + 31 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(31));
      expect(result.length).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(32));
      expect(result.split('x').length).assertEqual(32);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10031 end');
    });

    /**
     * @tc.name   testTxtLen10032
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0032
     * @tc.desc   write then read of a 32-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10032 begin');
      const path: string = TEXT_DIR + 'tfl' + 32 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(33));
      expect(result.split('x').length).assertEqual(33);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10032 end');
    });

    /**
     * @tc.name   testTxtLen10033
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0033
     * @tc.desc   write then read of a 33-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10033 begin');
      const path: string = TEXT_DIR + 'tfl' + 33 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(34));
      expect(result.split('x').length).assertEqual(34);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10033 end');
    });

    /**
     * @tc.name   testTxtLen10034
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0034
     * @tc.desc   write then read of a 34-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10034 begin');
      const path: string = TEXT_DIR + 'tfl' + 34 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(34));
      expect(result.length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(35));
      expect(result.split('x').length).assertEqual(35);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10034 end');
    });

    /**
     * @tc.name   testTxtLen10035
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0035
     * @tc.desc   write then read of a 35-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10035 begin');
      const path: string = TEXT_DIR + 'tfl' + 35 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(36));
      expect(result.split('x').length).assertEqual(36);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10035 end');
    });

    /**
     * @tc.name   testTxtLen10036
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0036
     * @tc.desc   write then read of a 36-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10036 begin');
      const path: string = TEXT_DIR + 'tfl' + 36 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(37));
      expect(result.split('x').length).assertEqual(37);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10036 end');
    });

    /**
     * @tc.name   testTxtLen10037
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0037
     * @tc.desc   write then read of a 37-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10037 begin');
      const path: string = TEXT_DIR + 'tfl' + 37 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(37));
      expect(result.length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(38));
      expect(result.split('x').length).assertEqual(38);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10037 end');
    });

    /**
     * @tc.name   testTxtLen10038
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0038
     * @tc.desc   write then read of a 38-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10038 begin');
      const path: string = TEXT_DIR + 'tfl' + 38 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(38));
      expect(result.length).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(39));
      expect(result.split('x').length).assertEqual(39);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10038 end');
    });

    /**
     * @tc.name   testTxtLen10039
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0039
     * @tc.desc   write then read of a 39-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10039 begin');
      const path: string = TEXT_DIR + 'tfl' + 39 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(40));
      expect(result.split('x').length).assertEqual(40);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10039 end');
    });

    /**
     * @tc.name   testTxtLen10040
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0040
     * @tc.desc   write then read of a 40-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10040 begin');
      const path: string = TEXT_DIR + 'tfl' + 40 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      expect(result.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(41));
      expect(result.split('x').length).assertEqual(41);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10040 end');
    });

    /**
     * @tc.name   testTxtLen10041
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0041
     * @tc.desc   write then read of a 41-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10041 begin');
      const path: string = TEXT_DIR + 'tfl' + 41 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(41));
      expect(result.length).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(42));
      expect(result.split('x').length).assertEqual(42);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10041 end');
    });

    /**
     * @tc.name   testTxtLen10042
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0042
     * @tc.desc   write then read of a 42-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10042 begin');
      const path: string = TEXT_DIR + 'tfl' + 42 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(43));
      expect(result.split('x').length).assertEqual(43);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10042 end');
    });

    /**
     * @tc.name   testTxtLen10043
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0043
     * @tc.desc   write then read of a 43-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10043 begin');
      const path: string = TEXT_DIR + 'tfl' + 43 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(43));
      expect(result.length).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(44));
      expect(result.split('x').length).assertEqual(44);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10043 end');
    });

    /**
     * @tc.name   testTxtLen10044
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0044
     * @tc.desc   write then read of a 44-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10044 begin');
      const path: string = TEXT_DIR + 'tfl' + 44 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(45));
      expect(result.split('x').length).assertEqual(45);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10044 end');
    });

    /**
     * @tc.name   testTxtLen10045
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0045
     * @tc.desc   write then read of a 45-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10045 begin');
      const path: string = TEXT_DIR + 'tfl' + 45 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(46));
      expect(result.split('x').length).assertEqual(46);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10045 end');
    });

    /**
     * @tc.name   testTxtLen10046
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0046
     * @tc.desc   write then read of a 46-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10046 begin');
      const path: string = TEXT_DIR + 'tfl' + 46 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(46));
      expect(result.length).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(47));
      expect(result.split('x').length).assertEqual(47);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10046 end');
    });

    /**
     * @tc.name   testTxtLen10047
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0047
     * @tc.desc   write then read of a 47-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10047 begin');
      const path: string = TEXT_DIR + 'tfl' + 47 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(47));
      expect(result.length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(48));
      expect(result.split('x').length).assertEqual(48);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10047 end');
    });

    /**
     * @tc.name   testTxtLen10048
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0048
     * @tc.desc   write then read of a 48-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10048 begin');
      const path: string = TEXT_DIR + 'tfl' + 48 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      expect(result.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(49));
      expect(result.split('x').length).assertEqual(49);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10048 end');
    });

    /**
     * @tc.name   testTxtLen10049
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0049
     * @tc.desc   63-char content write and read roundtrip keeps content and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10049 begin');
      const path: string = TEXT_DIR + 'tfl' + 49 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(63));
      expect(result.length).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(64));
      expect(result.split('x').length).assertEqual(64);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10049 end');
    });

    /**
     * @tc.name   testTxtLen10050
     * @tc.number SUB_CryptoFramework_TXTLEN1_01_0050
     * @tc.desc   write then read of a 100-char content roundtrips through TextFileManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTxtLen10050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10050 begin');
      const path: string = TEXT_DIR + 'tfl' + 50 + '.txt';
      prepareFile(path, '');
      await TextFileManager.writeTextFile(path, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      await TextFileManager.readTextFile(path);
      const result: string = TextFileManager.getString();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      expect(result.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(result.split('x').length), String(101));
      expect(result.split('x').length).assertEqual(101);
      fs.unlinkSync(path);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testTxtLen10050 end');
    });

  });
}
