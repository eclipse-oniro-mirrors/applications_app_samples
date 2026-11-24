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
import { CryptoOperation } from '../../../main/ets/cryptoframework/CryptoOperation';
import cryptoFramework from '@ohos.security.cryptoFramework';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CryptoFramework]';
const HEX_CHARS: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  'a', 'b', 'c', 'd', 'e', 'f', 'A', 'B', 'C', 'D', 'E', 'F'];

function isHexString(str: string, expectedLen: number): boolean {
  if (str.length !== expectedLen) {
    return false;
  }
  for (let i = 0; i < str.length; i++) {
    if (HEX_CHARS.indexOf(str.charAt(i)) < 0) {
      return false;
    }
  }
  return true;
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

export default function aesKeyCore() {
  describe('AesKeyCore', () => {
    let op: CryptoOperation = new CryptoOperation();

    beforeEach(() => {
      op = new CryptoOperation();
    });

    afterEach(() => {
      op = new CryptoOperation();
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0001
     * @tc.name testAesKey0001
     * @tc.desc 合法值：generateAesKey 返回 64 位 hex 字符串（AES256 = 32 字节 = 64 hex）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0001 begin');
      const keyHex: string = await op.generateAesKey();
      const actual: boolean = isHexString(keyHex, 64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(actual), 'true');
      expect(actual).assertTrue();
      expect(keyHex.length).assertEqual(64);
      expect(keyHex === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0001 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0002
     * @tc.name testAesKey0002
     * @tc.desc 合法值：两次随机生成的 AES 密钥互不相同
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0002 begin');
      const keyA: string = await op.generateAesKey();
      const keyB: string = await op.generateAesKey();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyA === keyB ? 'same' : 'diff', 'diff');
      expect(keyA === keyB).assertFalse();
      expect(keyA.length).assertEqual(64);
      expect(keyB.length).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0002 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0003
     * @tc.name testAesKey0003
     * @tc.desc 合法值：生成的密钥串可被 convertAesKey 还原为 SymKey（非 null）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0003 begin');
      const keyHex: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.algName).assertEqual('AES256');
      expect(key.getEncoded().data.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0003 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0004
     * @tc.name testAesKey0004
     * @tc.desc 合法值：convertAesKey 输出的 SymKey algName 为 AES256
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0004 begin');
      const keyHex: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      const actual: string = key.algName;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, 'AES256');
      expect(actual).assertEqual('AES256');
      expect(key.getEncoded().data.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key.format, 'PKCS#8');
      expect(key.format).assertEqual('PKCS#8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0004 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0005
     * @tc.name testAesKey0005
     * @tc.desc 合法值：convertAesKey 输出的编码字节长度为 32（AES256）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0005 begin');
      const keyHex: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      const actual: number = key.getEncoded().data.length;
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', actual, 32);
      expect(actual).assertEqual(32);
      expect(key.getEncoded().data instanceof Uint8Array).assertTrue();
      expect(key === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0005 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0006
     * @tc.name testAesKey0006
     * @tc.desc 合法值：连续三次生成的密钥两两互异（随机性）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0006 begin');
      const k1: string = await op.generateAesKey();
      const k2: string = await op.generateAesKey();
      const k3: string = await op.generateAesKey();
      const diffAll: boolean = k1 !== k2 && k2 !== k3 && k1 !== k3;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(diffAll), 'true');
      expect(diffAll).assertTrue();
      expect(k1.length).assertEqual(64);
      expect(k2.length).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0006 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0007
     * @tc.name testAesKey0007
     * @tc.desc 边界值：全大写 64-hex 串 convert 成功（hex 大小写不敏感）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0007 begin');
      const upperKey: string = repeatChar('AB', 32);
      const key: cryptoFramework.SymKey = await op.convertAesKey(upperKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.algName).assertEqual('AES256');
      expect(key.getEncoded().data.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0007 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0008
     * @tc.name testAesKey0008
     * @tc.desc 边界值：全 0 的 64-hex 串（密钥下界）convert 成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0008 begin');
      const zeroKey: string = repeatChar('0', 64);
      const key: cryptoFramework.SymKey = await op.convertAesKey(zeroKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0008 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0009
     * @tc.name testAesKey0009
     * @tc.desc 边界值：全 f 的 64-hex 串（密钥上界）convert 成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesKey0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0009 begin');
      const ffKey: string = repeatChar('f', 64);
      const key: cryptoFramework.SymKey = await op.convertAesKey(ffKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[31]).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0009 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0010
     * @tc.name testAesKey0010
     * @tc.desc 边界值：63-hex（奇数长度）被 fromHexString 切为 32 段（尾字符单独成字节 0x0a），convert 成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0010 begin');
      const shortKey: string = repeatChar('a', 63);
      const key: cryptoFramework.SymKey = await op.convertAesKey(shortKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[31]).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0010 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0011
     * @tc.name testAesKey0011
     * @tc.desc 边界值：65-hex（上界+1）convert 返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0011 begin');
      const longKey: string = repeatChar('a', 65);
      const key: cryptoFramework.SymKey = await op.convertAesKey(longKey);
      const again: cryptoFramework.SymKey = await op.convertAesKey(longKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'null');
      expect(key === null).assertTrue();
      expect(again === null).assertTrue();
      expect(isHexString(longKey, 64)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0011 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0012
     * @tc.name testAesKey0012
     * @tc.desc 非法值：空字符串在 fromHexString 抛 TypeError（main 未捕获，仅记录不修复），重复两次均抛
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0012 begin');
      let thrownCount: number = 0;
      for (let i = 0; i < 2; i++) {
        try {
          const key: cryptoFramework.SymKey = await op.convertAesKey('');
        } catch (e) {
          thrownCount++;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', thrownCount, 2);
      expect(thrownCount).assertEqual(2);
      expect(thrownCount > 0).assertTrue();
      expect(isHexString('', 64)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0012 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0013
     * @tc.name testAesKey0013
     * @tc.desc 非法值：含非 hex 字符 g 的 64 长串被 parseInt 吞掉腐蚀为 0 字节，convert 仍成功（main 冻结行为）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0013 begin');
      const badKey: string = 'g' + repeatChar('a', 63);
      const key: cryptoFramework.SymKey = await op.convertAesKey(badKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0013 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0014
     * @tc.name testAesKey0014
     * @tc.desc 非法值：含前导空格字符的 64 长串被 parseInt 吞掉（' a' 解析为 0x0a），convert 仍成功（main 冻结行为）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0014 begin');
      const spaceKey: string = ' ' + repeatChar('a', 63);
      const key: cryptoFramework.SymKey = await op.convertAesKey(spaceKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[0]).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0014 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0015
     * @tc.name testAesKey0015
     * @tc.desc 非法值：含符号 - 的 64 长串被 parseInt 当负号吞掉（'-a' 解析为 -10，Uint8Array 回绕为 246），convert 仍成功（main 冻结行为）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0015 begin');
      const dashKey: string = '-' + repeatChar('a', 63);
      const key: cryptoFramework.SymKey = await op.convertAesKey(dashKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[0]).assertEqual(246);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0015 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0016
     * @tc.name testAesKey0016
     * @tc.desc 非法值：128-hex（64 字节，AES256 要求 32 字节）convert 返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0016 begin');
      const doubleKey: string = repeatChar('a', 128);
      const key: cryptoFramework.SymKey = await op.convertAesKey(doubleKey);
      const validKey: string = await op.generateAesKey();
      const okKey: cryptoFramework.SymKey = await op.convertAesKey(validKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'null');
      expect(key === null).assertTrue();
      expect(okKey === null).assertFalse();
      expect(doubleKey.length).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0016 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0017
     * @tc.name testAesKey0017
     * @tc.desc 非法值：32-hex（16 字节，AES128 长度）convert 返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0017 begin');
      const shortKey: string = repeatChar('b', 32);
      const key: cryptoFramework.SymKey = await op.convertAesKey(shortKey);
      const validKey: string = await op.generateAesKey();
      const okKey: cryptoFramework.SymKey = await op.convertAesKey(validKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'null');
      expect(key === null).assertTrue();
      expect(okKey === null).assertFalse();
      expect(shortKey.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0017 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0018
     * @tc.name testAesKey0018
     * @tc.desc 非法值：0x 前缀 + 62-hex（总长 64）被 parseInt 吞掉前缀（'0x' 解析为 0），convert 仍成功（main 冻结行为）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0018 begin');
      const prefixedKey: string = '0x' + repeatChar('c', 62);
      const key: cryptoFramework.SymKey = await op.convertAesKey(prefixedKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'key');
      expect(key === null).assertFalse();
      expect(key.getEncoded().data.length).assertEqual(32);
      expect(key.getEncoded().data[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0018 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0019
     * @tc.name testAesKey0019
     * @tc.desc 极值：同一 64-hex 串连续 convert 五次全部成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0019 begin');
      const keyHex: string = await op.generateAesKey();
      let allOk: boolean = true;
      for (let i = 0; i < 5; i++) {
        const k: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
        if (k === null) {
          allOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(allOk), 'true');
      expect(allOk).assertTrue();
      expect(keyHex.length).assertEqual(64);
      expect(isHexString(keyHex, 64)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0019 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0020
     * @tc.name testAesKey0020
     * @tc.desc 极值：200 字符超长输入 convert 返回 null 且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesKey0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0020 begin');
      const hugeKey: string = repeatChar('a', 200);
      const key: cryptoFramework.SymKey = await op.convertAesKey(hugeKey);
      const again: cryptoFramework.SymKey = await op.convertAesKey(hugeKey);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', key === null ? 'null' : 'key', 'null');
      expect(key === null).assertTrue();
      expect(again === null).assertTrue();
      expect(isHexString(hugeKey, 64)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0020 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0021
     * @tc.name testAesKey0021
     * @tc.desc 状态：同一 hex 两次 convert 得到的 SymKey 编码字节一致（确定性还原）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesKey0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0021 begin');
      const keyHex: string = await op.generateAesKey();
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      const bytesA: Uint8Array = keyA.getEncoded().data;
      const bytesB: Uint8Array = keyB.getEncoded().data;
      let sameBytes: boolean = true;
      for (let i = 0; i < 32; i++) {
        if (bytesA[i] !== bytesB[i]) {
          sameBytes = false;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(sameBytes), 'true');
      expect(sameBytes).assertTrue();
      expect(bytesA.length).assertEqual(32);
      expect(bytesB.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0021 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESKEY_0022
     * @tc.name testAesKey0022
     * @tc.desc 状态：convert 出的密钥立即可用于加密（跨主题联动，输出非空 JSON）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesKey0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0022 begin');
      const keyHex: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      const encrypted: string = await op.aesGcmEncrypt(key, 'link-check');
      const notEmpty: boolean = encrypted !== null && encrypted !== '';
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(notEmpty), 'true');
      expect(notEmpty).assertTrue();
      expect(encrypted.indexOf('aesGcmTag') >= 0).assertTrue();
      expect(encrypted.indexOf('encryptedText') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesKey0022 end');
    });
  });
}
