/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import TextFileManager from '../../../main/ets/textfilemanager/TextFileManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CryptoFramework]';
const TEST_FILE: string = '/data/storage/el2/base/haps/entry_test/files/cryptoframework_tf.txt';
const SECOND_FILE: string = '/data/storage/el2/base/haps/entry_test/files/cryptoframework_tf2.txt';

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

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

export default function textFileCore() {
  describe('TextFileCore', () => {
    beforeEach(() => {
      // 每个用例独立准备已知内容，保证用例间零依赖
    });

    afterEach(() => {
      // 静态状态复位由用例自身控制；文件内容在下个用例的 prepareFile 中被覆盖
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0001
     * @tc.name testTxtFile0001
     * @tc.desc 状态：初始 getString 为空串；读取空文件后仍为空串（静态状态不残留）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0001 begin');
      const initial: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', initial, '');
      expect(initial).assertEqual('');
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.readTextFile(TEST_FILE);
      const after: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', after, '');
      expect(ready).assertTrue();
      expect(after).assertEqual('');
      expect(after.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0001 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0002
     * @tc.name testTxtFile0002
     * @tc.desc 合法值：写入英文文本后读取还原内容
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0002 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      const content: string = 'hello text file';
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, content);
      expect(ready).assertTrue();
      expect(actual).assertEqual(content);
      expect(actual.length).assertEqual(content.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0002 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0003
     * @tc.name testTxtFile0003
     * @tc.desc 合法值：写入后读回的内容与字节数一致（writeResult 行为等价）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0003 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      const content: string = 'write length check';
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, content);
      expect(ready).assertTrue();
      expect(actual).assertEqual(content);
      expect(actual.length).assertEqual(content.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0003 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0004
     * @tc.name testTxtFile0004
     * @tc.desc 合法值：读取已存在文件后内容与字节数与文件一致（readResult 行为等价）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0004 begin');
      const content: string = 'read length check';
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, content);
      expect(ready).assertTrue();
      expect(actual).assertEqual(content);
      expect(actual.length).assertEqual(content.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0004 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0005
     * @tc.name testTxtFile0005
     * @tc.desc 边界值：空字符串写入后读取回空串且长度为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0005 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      await TextFileManager.writeTextFile(TEST_FILE, '');
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '');
      expect(ready).assertTrue();
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0005 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0006
     * @tc.name testTxtFile0006
     * @tc.desc 边界值：超过 8192 字节的文件只读取前 8192 字节（TEXT_MAX_READ_LEN 上限）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0006 begin');
      const content: string = repeatChar('x', 9000);
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 8192);
      expect(ready).assertTrue();
      expect(actual.length).assertEqual(8192);
      expect(actual).assertEqual(content.substring(0, 8192));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0006 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0007
     * @tc.name testTxtFile0007
     * @tc.desc 边界值：恰好 8192 字节的文件完整读取（上限闭区间）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testTxtFile0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0007 begin');
      const content: string = repeatChar('y', 8192);
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 8192);
      expect(ready).assertTrue();
      expect(actual.length).assertEqual(8192);
      expect(actual).assertEqual(content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0007 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0008
     * @tc.name testTxtFile0008
     * @tc.desc 非法值：读取不存在的路径后状态保持上次成功值（不崩溃不重置）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testTxtFile0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0008 begin');
      const content: string = 'stable value';
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const before: string = TextFileManager.getString();
      await TextFileManager.readTextFile('/data/storage/el2/base/haps/entry_test/files/not_exist_tf.txt');
      const after: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', after, before);
      expect(ready).assertTrue();
      expect(after).assertEqual(before);
      expect(after.length).assertEqual(before.length);
      expect(before).assertEqual(content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0008 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0009
     * @tc.name testTxtFile0009
     * @tc.desc 非法值：读取目录路径不抛异常且状态保持上次成功值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testTxtFile0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0009 begin');
      const content: string = 'directory guard';
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const before: string = TextFileManager.getString();
      await TextFileManager.readTextFile('/data/storage/el2/base/haps/entry_test/files');
      const after: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', after, before);
      expect(ready).assertTrue();
      expect(after).assertEqual(before);
      expect(before).assertEqual(content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0009 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0010
     * @tc.name testTxtFile0010
     * @tc.desc 非法值：空 URI 读取不抛异常且状态保持上次成功值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testTxtFile0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0010 begin');
      const content: string = 'empty uri guard';
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const before: string = TextFileManager.getString();
      await TextFileManager.readTextFile('');
      const after: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', after, before);
      expect(ready).assertTrue();
      expect(after).assertEqual(before);
      expect(before).assertEqual(content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0010 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0011
     * @tc.name testTxtFile0011
     * @tc.desc 状态：同一文件连续读取两次结果一致（读取无副作用）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testTxtFile0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0011 begin');
      const content: string = 'double read';
      const ready: boolean = prepareFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const first: string = TextFileManager.getString();
      await TextFileManager.readTextFile(TEST_FILE);
      const second: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', second, first);
      expect(ready).assertTrue();
      expect(second).assertEqual(first);
      expect(second.length).assertEqual(first.length);
      expect(first).assertEqual(content);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0011 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0012
     * @tc.name testTxtFile0012
     * @tc.desc 状态：连续两次写读，最后一次内容生效（覆盖行为）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testTxtFile0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0012 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      const contentA: string = 'first content';
      const contentB: string = 'second content';
      await TextFileManager.writeTextFile(TEST_FILE, contentA);
      await TextFileManager.readTextFile(TEST_FILE);
      const first: string = TextFileManager.getString();
      await TextFileManager.writeTextFile(TEST_FILE, contentB);
      await TextFileManager.readTextFile(TEST_FILE);
      const second: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', second, contentB);
      expect(ready).assertTrue();
      expect(first).assertEqual(contentA);
      expect(second).assertEqual(contentB);
      expect(second === first).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0012 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0013
     * @tc.name testTxtFile0013
     * @tc.desc 状态：READ_WRITE 模式不截断文件，较短新内容写入后残留旧尾部字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testTxtFile0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0013 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      const contentA: string = 'before write';
      const contentB: string = 'after write';
      const residual: string = 'after writee';
      await TextFileManager.writeTextFile(TEST_FILE, contentA);
      await TextFileManager.readTextFile(TEST_FILE);
      const before: string = TextFileManager.getString();
      await TextFileManager.writeTextFile(TEST_FILE, contentB);
      await TextFileManager.readTextFile(TEST_FILE);
      const after: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', after, residual);
      expect(ready).assertTrue();
      expect(before).assertEqual(contentA);
      expect(after).assertEqual(residual);
      expect(after === before).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0013 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0014
     * @tc.name testTxtFile0014
     * @tc.desc 极值：100 字节内容往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testTxtFile0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0014 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      const content: string = repeatChar('w', 100);
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual.length, 100);
      expect(ready).assertTrue();
      expect(actual).assertEqual(content);
      expect(actual.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0014 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0015
     * @tc.name testTxtFile0015
     * @tc.desc 极值：含换行与制表符的内容往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testTxtFile0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0015 begin');
      const ready: boolean = prepareFile(TEST_FILE, '');
      const content: string = 'line1\nline2\tcol3\r\nend';
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const actual: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, content);
      expect(ready).assertTrue();
      expect(actual).assertEqual(content);
      expect(actual.indexOf('\n') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0015 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_TXTFL_0016
     * @tc.name testTxtFile0016
     * @tc.desc 组合：单字节 ASCII 符号混合内容往返一致（写入与读取串联）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testTxtFile0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0016 begin');
      const readyA: boolean = prepareFile(TEST_FILE, '');
      const readyB: boolean = prepareFile(SECOND_FILE, '');
      const content: string = 'a!@#b$%^c&*()d-=+e_';
      await TextFileManager.writeTextFile(TEST_FILE, content);
      await TextFileManager.readTextFile(TEST_FILE);
      const first: string = TextFileManager.getString();
      await TextFileManager.writeTextFile(SECOND_FILE, content);
      await TextFileManager.readTextFile(SECOND_FILE);
      const second: string = TextFileManager.getString();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', first, content);
      expect(readyA).assertTrue();
      expect(readyB).assertTrue();
      expect(first).assertEqual(content);
      expect(second).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTxtFile0016 end');
    });
  });
}
