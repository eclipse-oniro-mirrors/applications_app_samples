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
import { stringToArray, arrayToString } from '../../../main/ets/model/AssetModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function encodeVolume01() {
  describe('EncodeVolume01Test', () => {

    /**
     * @tc.name   testEncode010001
     * @tc.number SUB_ASSET_ENCODE_0001
     * @tc.desc   混合字符编码字节数为各段之和且可逆解码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010001 begin');
      const encoded: Uint8Array = stringToArray('A中😀');
      expect(encoded.length).assertEqual(8);
      expect(arrayToString(encoded)).assertEqual('A中😀');
      const empty: Uint8Array = stringToArray('');
      expect(empty.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010001 end');
    })

    /**
     * @tc.name   testEncode010002
     * @tc.number SUB_ASSET_ENCODE_0002
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010002 begin');
      const result: Uint8Array = stringToArray("a");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a"));
      expect(arrayToString(result)).assertEqual("a");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010002 end');
    })

    /**
     * @tc.name   testEncode010003
     * @tc.number SUB_ASSET_ENCODE_0003
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010003 begin');
      const result: Uint8Array = stringToArray("Z");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("Z"));
      expect(arrayToString(result)).assertEqual("Z");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010003 end');
    })

    /**
     * @tc.name   testEncode010004
     * @tc.number SUB_ASSET_ENCODE_0004
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010004 begin');
      const result: Uint8Array = stringToArray("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("0"));
      expect(arrayToString(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010004 end');
    })

    /**
     * @tc.name   testEncode010005
     * @tc.number SUB_ASSET_ENCODE_0005
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010005 begin');
      const result: Uint8Array = stringToArray("@");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@"));
      expect(arrayToString(result)).assertEqual("@");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010005 end');
    })

    /**
     * @tc.name   testEncode010006
     * @tc.number SUB_ASSET_ENCODE_0006
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010006 begin');
      const result: Uint8Array = stringToArray(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String(" "));
      expect(arrayToString(result)).assertEqual(" ");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010006 end');
    })

    /**
     * @tc.name   testEncode010007
     * @tc.number SUB_ASSET_ENCODE_0007
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010007 begin');
      const result: Uint8Array = stringToArray("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("\t"));
      expect(arrayToString(result)).assertEqual("\t");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010007 end');
    })

    /**
     * @tc.name   testEncode010008
     * @tc.number SUB_ASSET_ENCODE_0008
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010008 begin');
      const result: Uint8Array = stringToArray("\n");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("\n"));
      expect(arrayToString(result)).assertEqual("\n");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010008 end');
    })

    /**
     * @tc.name   testEncode010009
     * @tc.number SUB_ASSET_ENCODE_0009
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010009 begin');
      // 设备 TextDecoder 会丢弃 0 字节（NUL 无法回读），改用 \u0001 验证控制字符往返
      const result: Uint8Array = stringToArray("\u0001");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("\u0001"));
      expect(arrayToString(result)).assertEqual("\u0001");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010009 end');
    })

    /**
     * @tc.name   testEncode010010
     * @tc.number SUB_ASSET_ENCODE_0010
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010010 begin');
      const result: Uint8Array = stringToArray("\\");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("\\"));
      expect(arrayToString(result)).assertEqual("\\");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010010 end');
    })

    /**
     * @tc.name   testEncode010011
     * @tc.number SUB_ASSET_ENCODE_0011
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010011 begin');
      const result: Uint8Array = stringToArray("\"");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("\""));
      expect(arrayToString(result)).assertEqual("\"");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010011 end');
    })

    /**
     * @tc.name   testEncode010012
     * @tc.number SUB_ASSET_ENCODE_0012
     * @tc.desc   边界值：单字符编码字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010012 begin');
      const result: Uint8Array = stringToArray("'");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("'"));
      expect(arrayToString(result)).assertEqual("'");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010012 end');
    })

    /**
     * @tc.name   testEncode010013
     * @tc.number SUB_ASSET_ENCODE_0013
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010013 begin');
      const result: Uint8Array = stringToArray("ab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab"));
      expect(arrayToString(result)).assertEqual("ab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010013 end');
    })

    /**
     * @tc.name   testEncode010014
     * @tc.number SUB_ASSET_ENCODE_0014
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010014 begin');
      const result: Uint8Array = stringToArray("abab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abab"));
      expect(arrayToString(result)).assertEqual("abab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010014 end');
    })

    /**
     * @tc.name   testEncode010015
     * @tc.number SUB_ASSET_ENCODE_0015
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010015 begin');
      const result: Uint8Array = stringToArray("ababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababab"));
      expect(arrayToString(result)).assertEqual("ababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010015 end');
    })

    /**
     * @tc.name   testEncode010016
     * @tc.number SUB_ASSET_ENCODE_0016
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010016 begin');
      const result: Uint8Array = stringToArray("abababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababab"));
      expect(arrayToString(result)).assertEqual("abababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010016 end');
    })

    /**
     * @tc.name   testEncode010017
     * @tc.number SUB_ASSET_ENCODE_0017
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010017 begin');
      const result: Uint8Array = stringToArray("ababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababab"));
      expect(arrayToString(result)).assertEqual("ababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010017 end');
    })

    /**
     * @tc.name   testEncode010018
     * @tc.number SUB_ASSET_ENCODE_0018
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010018 begin');
      const result: Uint8Array = stringToArray("abababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababab"));
      expect(arrayToString(result)).assertEqual("abababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010018 end');
    })

    /**
     * @tc.name   testEncode010019
     * @tc.number SUB_ASSET_ENCODE_0019
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010019 begin');
      const result: Uint8Array = stringToArray("ababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010019 end');
    })

    /**
     * @tc.name   testEncode010020
     * @tc.number SUB_ASSET_ENCODE_0020
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010020 begin');
      const result: Uint8Array = stringToArray("abababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010020 end');
    })

    /**
     * @tc.name   testEncode010021
     * @tc.number SUB_ASSET_ENCODE_0021
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010021 begin');
      const result: Uint8Array = stringToArray("ababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010021 end');
    })

    /**
     * @tc.name   testEncode010022
     * @tc.number SUB_ASSET_ENCODE_0022
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010022 begin');
      const result: Uint8Array = stringToArray("abababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010022 end');
    })

    /**
     * @tc.name   testEncode010023
     * @tc.number SUB_ASSET_ENCODE_0023
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010023 begin');
      const result: Uint8Array = stringToArray("ababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010023 end');
    })

    /**
     * @tc.name   testEncode010024
     * @tc.number SUB_ASSET_ENCODE_0024
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010024 begin');
      const result: Uint8Array = stringToArray("abababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010024 end');
    })

    /**
     * @tc.name   testEncode010025
     * @tc.number SUB_ASSET_ENCODE_0025
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010025 begin');
      const result: Uint8Array = stringToArray("ababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(26));
      expect(result.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010025 end');
    })

    /**
     * @tc.name   testEncode010026
     * @tc.number SUB_ASSET_ENCODE_0026
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010026 begin');
      const result: Uint8Array = stringToArray("abababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010026 end');
    })

    /**
     * @tc.name   testEncode010027
     * @tc.number SUB_ASSET_ENCODE_0027
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010027 begin');
      const result: Uint8Array = stringToArray("ababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababababababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010027 end');
    })

    /**
     * @tc.name   testEncode010028
     * @tc.number SUB_ASSET_ENCODE_0028
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010028 begin');
      const result: Uint8Array = stringToArray("abababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababababababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010028 end');
    })

    /**
     * @tc.name   testEncode010029
     * @tc.number SUB_ASSET_ENCODE_0029
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010029 begin');
      const result: Uint8Array = stringToArray("ababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(34));
      expect(result.length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababababababababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010029 end');
    })

    /**
     * @tc.name   testEncode010030
     * @tc.number SUB_ASSET_ENCODE_0030
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010030 begin');
      const result: Uint8Array = stringToArray("abababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababababababababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010030 end');
    })

    /**
     * @tc.name   testEncode010031
     * @tc.number SUB_ASSET_ENCODE_0031
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010031 begin');
      const result: Uint8Array = stringToArray("ababababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(38));
      expect(result.length).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ababababababababababababababababababab"));
      expect(arrayToString(result)).assertEqual("ababababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010031 end');
    })

    /**
     * @tc.name   testEncode010032
     * @tc.number SUB_ASSET_ENCODE_0032
     * @tc.desc   合法值：ASCII 短串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010032 begin');
      const result: Uint8Array = stringToArray("abababababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      expect(result.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("abababababababababababababababababababab"));
      expect(arrayToString(result)).assertEqual("abababababababababababababababababababab");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010032 end');
    })

    /**
     * @tc.name   testEncode010033
     * @tc.number SUB_ASSET_ENCODE_0033
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010033 begin');
      const result: Uint8Array = stringToArray("K00aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K00aaa"));
      expect(arrayToString(result)).assertEqual("K00aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010033 end');
    })

    /**
     * @tc.name   testEncode010034
     * @tc.number SUB_ASSET_ENCODE_0034
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010034 begin');
      const result: Uint8Array = stringToArray("K01aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K01aaaa"));
      expect(arrayToString(result)).assertEqual("K01aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010034 end');
    })

    /**
     * @tc.name   testEncode010035
     * @tc.number SUB_ASSET_ENCODE_0035
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010035 begin');
      const result: Uint8Array = stringToArray("K02aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K02aaaaa"));
      expect(arrayToString(result)).assertEqual("K02aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010035 end');
    })

    /**
     * @tc.name   testEncode010036
     * @tc.number SUB_ASSET_ENCODE_0036
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010036 begin');
      const result: Uint8Array = stringToArray("K03aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K03aaaaaa"));
      expect(arrayToString(result)).assertEqual("K03aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010036 end');
    })

    /**
     * @tc.name   testEncode010037
     * @tc.number SUB_ASSET_ENCODE_0037
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010037 begin');
      const result: Uint8Array = stringToArray("K04aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K04aaaaaaa"));
      expect(arrayToString(result)).assertEqual("K04aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010037 end');
    })

    /**
     * @tc.name   testEncode010038
     * @tc.number SUB_ASSET_ENCODE_0038
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010038 begin');
      const result: Uint8Array = stringToArray("K05aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K05aaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K05aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010038 end');
    })

    /**
     * @tc.name   testEncode010039
     * @tc.number SUB_ASSET_ENCODE_0039
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010039 begin');
      const result: Uint8Array = stringToArray("K06aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K06aaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K06aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010039 end');
    })

    /**
     * @tc.name   testEncode010040
     * @tc.number SUB_ASSET_ENCODE_0040
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010040 begin');
      const result: Uint8Array = stringToArray("K07aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K07aaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K07aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010040 end');
    })

    /**
     * @tc.name   testEncode010041
     * @tc.number SUB_ASSET_ENCODE_0041
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010041 begin');
      const result: Uint8Array = stringToArray("K08aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K08aaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K08aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010041 end');
    })

    /**
     * @tc.name   testEncode010042
     * @tc.number SUB_ASSET_ENCODE_0042
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010042 begin');
      const result: Uint8Array = stringToArray("K09aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K09aaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K09aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010042 end');
    })

    /**
     * @tc.name   testEncode010043
     * @tc.number SUB_ASSET_ENCODE_0043
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010043 begin');
      const result: Uint8Array = stringToArray("K10aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K10aaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K10aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010043 end');
    })

    /**
     * @tc.name   testEncode010044
     * @tc.number SUB_ASSET_ENCODE_0044
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010044 begin');
      const result: Uint8Array = stringToArray("K11aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K11aaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K11aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010044 end');
    })

    /**
     * @tc.name   testEncode010045
     * @tc.number SUB_ASSET_ENCODE_0045
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010045 begin');
      const result: Uint8Array = stringToArray("K12aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K12aaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K12aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010045 end');
    })

    /**
     * @tc.name   testEncode010046
     * @tc.number SUB_ASSET_ENCODE_0046
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010046 begin');
      const result: Uint8Array = stringToArray("K13aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K13aaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K13aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010046 end');
    })

    /**
     * @tc.name   testEncode010047
     * @tc.number SUB_ASSET_ENCODE_0047
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010047 begin');
      const result: Uint8Array = stringToArray("K14aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K14aaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K14aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010047 end');
    })

    /**
     * @tc.name   testEncode010048
     * @tc.number SUB_ASSET_ENCODE_0048
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010048 begin');
      const result: Uint8Array = stringToArray("K15aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K15aaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K15aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010048 end');
    })

    /**
     * @tc.name   testEncode010049
     * @tc.number SUB_ASSET_ENCODE_0049
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010049 begin');
      const result: Uint8Array = stringToArray("K16aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K16aaaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K16aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010049 end');
    })

    /**
     * @tc.name   testEncode010050
     * @tc.number SUB_ASSET_ENCODE_0050
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010050 begin');
      const result: Uint8Array = stringToArray("K17aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K17aaa"));
      expect(arrayToString(result)).assertEqual("K17aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010050 end');
    })

    /**
     * @tc.name   testEncode010051
     * @tc.number SUB_ASSET_ENCODE_0051
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010051 begin');
      const result: Uint8Array = stringToArray("K18aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K18aaaa"));
      expect(arrayToString(result)).assertEqual("K18aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010051 end');
    })

    /**
     * @tc.name   testEncode010052
     * @tc.number SUB_ASSET_ENCODE_0052
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010052 begin');
      const result: Uint8Array = stringToArray("K19aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K19aaaaa"));
      expect(arrayToString(result)).assertEqual("K19aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010052 end');
    })

    /**
     * @tc.name   testEncode010053
     * @tc.number SUB_ASSET_ENCODE_0053
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010053 begin');
      const result: Uint8Array = stringToArray("K20aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K20aaaaaa"));
      expect(arrayToString(result)).assertEqual("K20aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010053 end');
    })

    /**
     * @tc.name   testEncode010054
     * @tc.number SUB_ASSET_ENCODE_0054
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010054 begin');
      const result: Uint8Array = stringToArray("K21aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K21aaaaaaa"));
      expect(arrayToString(result)).assertEqual("K21aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010054 end');
    })

    /**
     * @tc.name   testEncode010055
     * @tc.number SUB_ASSET_ENCODE_0055
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010055 begin');
      const result: Uint8Array = stringToArray("K22aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K22aaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K22aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010055 end');
    })

    /**
     * @tc.name   testEncode010056
     * @tc.number SUB_ASSET_ENCODE_0056
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010056 begin');
      const result: Uint8Array = stringToArray("K23aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K23aaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K23aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010056 end');
    })

    /**
     * @tc.name   testEncode010057
     * @tc.number SUB_ASSET_ENCODE_0057
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010057 begin');
      const result: Uint8Array = stringToArray("K24aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K24aaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K24aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010057 end');
    })

    /**
     * @tc.name   testEncode010058
     * @tc.number SUB_ASSET_ENCODE_0058
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010058 begin');
      const result: Uint8Array = stringToArray("K25aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K25aaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K25aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010058 end');
    })

    /**
     * @tc.name   testEncode010059
     * @tc.number SUB_ASSET_ENCODE_0059
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010059 begin');
      const result: Uint8Array = stringToArray("K26aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K26aaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K26aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010059 end');
    })

    /**
     * @tc.name   testEncode010060
     * @tc.number SUB_ASSET_ENCODE_0060
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010060 begin');
      const result: Uint8Array = stringToArray("K27aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K27aaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K27aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010060 end');
    })

    /**
     * @tc.name   testEncode010061
     * @tc.number SUB_ASSET_ENCODE_0061
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010061 begin');
      const result: Uint8Array = stringToArray("K28aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K28aaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K28aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010061 end');
    })

    /**
     * @tc.name   testEncode010062
     * @tc.number SUB_ASSET_ENCODE_0062
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010062 begin');
      const result: Uint8Array = stringToArray("K29aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K29aaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K29aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010062 end');
    })

    /**
     * @tc.name   testEncode010063
     * @tc.number SUB_ASSET_ENCODE_0063
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010063 begin');
      const result: Uint8Array = stringToArray("K30aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K30aaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K30aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010063 end');
    })

    /**
     * @tc.name   testEncode010064
     * @tc.number SUB_ASSET_ENCODE_0064
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010064 begin');
      const result: Uint8Array = stringToArray("K31aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K31aaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K31aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010064 end');
    })

    /**
     * @tc.name   testEncode010065
     * @tc.number SUB_ASSET_ENCODE_0065
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010065 begin');
      const result: Uint8Array = stringToArray("K32aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K32aaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K32aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010065 end');
    })

    /**
     * @tc.name   testEncode010066
     * @tc.number SUB_ASSET_ENCODE_0066
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010066 begin');
      const result: Uint8Array = stringToArray("K33aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K33aaaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K33aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010066 end');
    })

    /**
     * @tc.name   testEncode010067
     * @tc.number SUB_ASSET_ENCODE_0067
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010067 begin');
      const result: Uint8Array = stringToArray("K34aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K34aaa"));
      expect(arrayToString(result)).assertEqual("K34aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010067 end');
    })

    /**
     * @tc.name   testEncode010068
     * @tc.number SUB_ASSET_ENCODE_0068
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010068 begin');
      const result: Uint8Array = stringToArray("K35aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K35aaaa"));
      expect(arrayToString(result)).assertEqual("K35aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010068 end');
    })

    /**
     * @tc.name   testEncode010069
     * @tc.number SUB_ASSET_ENCODE_0069
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010069 begin');
      const result: Uint8Array = stringToArray("K36aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K36aaaaa"));
      expect(arrayToString(result)).assertEqual("K36aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010069 end');
    })

    /**
     * @tc.name   testEncode010070
     * @tc.number SUB_ASSET_ENCODE_0070
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010070 begin');
      const result: Uint8Array = stringToArray("K37aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K37aaaaaa"));
      expect(arrayToString(result)).assertEqual("K37aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010070 end');
    })

    /**
     * @tc.name   testEncode010071
     * @tc.number SUB_ASSET_ENCODE_0071
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010071 begin');
      const result: Uint8Array = stringToArray("K38aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K38aaaaaaa"));
      expect(arrayToString(result)).assertEqual("K38aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010071 end');
    })

    /**
     * @tc.name   testEncode010072
     * @tc.number SUB_ASSET_ENCODE_0072
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010072 begin');
      const result: Uint8Array = stringToArray("K39aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K39aaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K39aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010072 end');
    })

    /**
     * @tc.name   testEncode010073
     * @tc.number SUB_ASSET_ENCODE_0073
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010073 begin');
      const result: Uint8Array = stringToArray("K40aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K40aaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K40aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010073 end');
    })

    /**
     * @tc.name   testEncode010074
     * @tc.number SUB_ASSET_ENCODE_0074
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010074 begin');
      const result: Uint8Array = stringToArray("K41aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K41aaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K41aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010074 end');
    })

    /**
     * @tc.name   testEncode010075
     * @tc.number SUB_ASSET_ENCODE_0075
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010075 begin');
      const result: Uint8Array = stringToArray("K42aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K42aaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K42aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010075 end');
    })

    /**
     * @tc.name   testEncode010076
     * @tc.number SUB_ASSET_ENCODE_0076
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010076 begin');
      const result: Uint8Array = stringToArray("K43aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K43aaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K43aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010076 end');
    })

    /**
     * @tc.name   testEncode010077
     * @tc.number SUB_ASSET_ENCODE_0077
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010077 begin');
      const result: Uint8Array = stringToArray("K44aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K44aaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K44aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010077 end');
    })

    /**
     * @tc.name   testEncode010078
     * @tc.number SUB_ASSET_ENCODE_0078
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010078 begin');
      const result: Uint8Array = stringToArray("K45aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K45aaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K45aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010078 end');
    })

    /**
     * @tc.name   testEncode010079
     * @tc.number SUB_ASSET_ENCODE_0079
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010079 begin');
      const result: Uint8Array = stringToArray("K46aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K46aaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K46aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010079 end');
    })

    /**
     * @tc.name   testEncode010080
     * @tc.number SUB_ASSET_ENCODE_0080
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010080 begin');
      const result: Uint8Array = stringToArray("K47aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K47aaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K47aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010080 end');
    })

    /**
     * @tc.name   testEncode010081
     * @tc.number SUB_ASSET_ENCODE_0081
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010081 begin');
      const result: Uint8Array = stringToArray("K48aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K48aaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K48aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010081 end');
    })

    /**
     * @tc.name   testEncode010082
     * @tc.number SUB_ASSET_ENCODE_0082
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010082 begin');
      const result: Uint8Array = stringToArray("K49aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K49aaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K49aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010082 end');
    })

    /**
     * @tc.name   testEncode010083
     * @tc.number SUB_ASSET_ENCODE_0083
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010083 begin');
      const result: Uint8Array = stringToArray("K50aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K50aaaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K50aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010083 end');
    })

    /**
     * @tc.name   testEncode010084
     * @tc.number SUB_ASSET_ENCODE_0084
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010084 begin');
      const result: Uint8Array = stringToArray("K51aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K51aaa"));
      expect(arrayToString(result)).assertEqual("K51aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010084 end');
    })

    /**
     * @tc.name   testEncode010085
     * @tc.number SUB_ASSET_ENCODE_0085
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010085 begin');
      const result: Uint8Array = stringToArray("K52aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K52aaaa"));
      expect(arrayToString(result)).assertEqual("K52aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010085 end');
    })

    /**
     * @tc.name   testEncode010086
     * @tc.number SUB_ASSET_ENCODE_0086
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010086 begin');
      const result: Uint8Array = stringToArray("K53aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K53aaaaa"));
      expect(arrayToString(result)).assertEqual("K53aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010086 end');
    })

    /**
     * @tc.name   testEncode010087
     * @tc.number SUB_ASSET_ENCODE_0087
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010087 begin');
      const result: Uint8Array = stringToArray("K54aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K54aaaaaa"));
      expect(arrayToString(result)).assertEqual("K54aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010087 end');
    })

    /**
     * @tc.name   testEncode010088
     * @tc.number SUB_ASSET_ENCODE_0088
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010088 begin');
      const result: Uint8Array = stringToArray("K55aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K55aaaaaaa"));
      expect(arrayToString(result)).assertEqual("K55aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010088 end');
    })

    /**
     * @tc.name   testEncode010089
     * @tc.number SUB_ASSET_ENCODE_0089
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010089 begin');
      const result: Uint8Array = stringToArray("K56aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K56aaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K56aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010089 end');
    })

    /**
     * @tc.name   testEncode010090
     * @tc.number SUB_ASSET_ENCODE_0090
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010090 begin');
      const result: Uint8Array = stringToArray("K57aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K57aaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K57aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010090 end');
    })

    /**
     * @tc.name   testEncode010091
     * @tc.number SUB_ASSET_ENCODE_0091
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010091 begin');
      const result: Uint8Array = stringToArray("K58aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K58aaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K58aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010091 end');
    })

    /**
     * @tc.name   testEncode010092
     * @tc.number SUB_ASSET_ENCODE_0092
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010092 begin');
      const result: Uint8Array = stringToArray("K59aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K59aaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K59aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010092 end');
    })

    /**
     * @tc.name   testEncode010093
     * @tc.number SUB_ASSET_ENCODE_0093
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010093 begin');
      const result: Uint8Array = stringToArray("K60aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K60aaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K60aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010093 end');
    })

    /**
     * @tc.name   testEncode010094
     * @tc.number SUB_ASSET_ENCODE_0094
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010094 begin');
      const result: Uint8Array = stringToArray("K61aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K61aaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K61aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010094 end');
    })

    /**
     * @tc.name   testEncode010095
     * @tc.number SUB_ASSET_ENCODE_0095
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010095 begin');
      const result: Uint8Array = stringToArray("K62aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K62aaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K62aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010095 end');
    })

    /**
     * @tc.name   testEncode010096
     * @tc.number SUB_ASSET_ENCODE_0096
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010096 begin');
      const result: Uint8Array = stringToArray("K63aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K63aaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K63aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010096 end');
    })

    /**
     * @tc.name   testEncode010097
     * @tc.number SUB_ASSET_ENCODE_0097
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010097 begin');
      const result: Uint8Array = stringToArray("K64aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K64aaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K64aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010097 end');
    })

    /**
     * @tc.name   testEncode010098
     * @tc.number SUB_ASSET_ENCODE_0098
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010098 begin');
      const result: Uint8Array = stringToArray("K65aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K65aaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K65aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010098 end');
    })

    /**
     * @tc.name   testEncode010099
     * @tc.number SUB_ASSET_ENCODE_0099
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010099 begin');
      const result: Uint8Array = stringToArray("K66aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K66aaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K66aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010099 end');
    })

    /**
     * @tc.name   testEncode010100
     * @tc.number SUB_ASSET_ENCODE_0100
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010100 begin');
      const result: Uint8Array = stringToArray("K67aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K67aaaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K67aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010100 end');
    })

    /**
     * @tc.name   testEncode010101
     * @tc.number SUB_ASSET_ENCODE_0101
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010101 begin');
      const result: Uint8Array = stringToArray("K68aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K68aaa"));
      expect(arrayToString(result)).assertEqual("K68aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010101 end');
    })

    /**
     * @tc.name   testEncode010102
     * @tc.number SUB_ASSET_ENCODE_0102
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010102 begin');
      const result: Uint8Array = stringToArray("K69aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K69aaaa"));
      expect(arrayToString(result)).assertEqual("K69aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010102 end');
    })

    /**
     * @tc.name   testEncode010103
     * @tc.number SUB_ASSET_ENCODE_0103
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010103 begin');
      const result: Uint8Array = stringToArray("K70aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K70aaaaa"));
      expect(arrayToString(result)).assertEqual("K70aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010103 end');
    })

    /**
     * @tc.name   testEncode010104
     * @tc.number SUB_ASSET_ENCODE_0104
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010104 begin');
      const result: Uint8Array = stringToArray("K71aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K71aaaaaa"));
      expect(arrayToString(result)).assertEqual("K71aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010104 end');
    })

    /**
     * @tc.name   testEncode010105
     * @tc.number SUB_ASSET_ENCODE_0105
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010105 begin');
      const result: Uint8Array = stringToArray("K72aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K72aaaaaaa"));
      expect(arrayToString(result)).assertEqual("K72aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010105 end');
    })

    /**
     * @tc.name   testEncode010106
     * @tc.number SUB_ASSET_ENCODE_0106
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010106 begin');
      const result: Uint8Array = stringToArray("K73aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K73aaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K73aaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010106 end');
    })

    /**
     * @tc.name   testEncode010107
     * @tc.number SUB_ASSET_ENCODE_0107
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010107 begin');
      const result: Uint8Array = stringToArray("K74aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K74aaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K74aaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010107 end');
    })

    /**
     * @tc.name   testEncode010108
     * @tc.number SUB_ASSET_ENCODE_0108
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010108 begin');
      const result: Uint8Array = stringToArray("K75aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K75aaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K75aaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010108 end');
    })

    /**
     * @tc.name   testEncode010109
     * @tc.number SUB_ASSET_ENCODE_0109
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010109 begin');
      const result: Uint8Array = stringToArray("K76aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K76aaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K76aaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010109 end');
    })

    /**
     * @tc.name   testEncode010110
     * @tc.number SUB_ASSET_ENCODE_0110
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010110 begin');
      const result: Uint8Array = stringToArray("K77aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K77aaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K77aaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010110 end');
    })

    /**
     * @tc.name   testEncode010111
     * @tc.number SUB_ASSET_ENCODE_0111
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010111 begin');
      const result: Uint8Array = stringToArray("K78aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K78aaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K78aaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010111 end');
    })

    /**
     * @tc.name   testEncode010112
     * @tc.number SUB_ASSET_ENCODE_0112
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010112 begin');
      const result: Uint8Array = stringToArray("K79aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K79aaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K79aaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010112 end');
    })

    /**
     * @tc.name   testEncode010113
     * @tc.number SUB_ASSET_ENCODE_0113
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010113 begin');
      const result: Uint8Array = stringToArray("K80aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K80aaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K80aaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010113 end');
    })

    /**
     * @tc.name   testEncode010114
     * @tc.number SUB_ASSET_ENCODE_0114
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010114 begin');
      const result: Uint8Array = stringToArray("K81aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K81aaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K81aaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010114 end');
    })

    /**
     * @tc.name   testEncode010115
     * @tc.number SUB_ASSET_ENCODE_0115
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010115 begin');
      const result: Uint8Array = stringToArray("K82aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K82aaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K82aaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010115 end');
    })

    /**
     * @tc.name   testEncode010116
     * @tc.number SUB_ASSET_ENCODE_0116
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010116 begin');
      const result: Uint8Array = stringToArray("K83aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K83aaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K83aaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010116 end');
    })

    /**
     * @tc.name   testEncode010117
     * @tc.number SUB_ASSET_ENCODE_0117
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010117 begin');
      const result: Uint8Array = stringToArray("K84aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K84aaaaaaaaaaaaaaaaaaa"));
      expect(arrayToString(result)).assertEqual("K84aaaaaaaaaaaaaaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010117 end');
    })

    /**
     * @tc.name   testEncode010118
     * @tc.number SUB_ASSET_ENCODE_0118
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010118 begin');
      const result: Uint8Array = stringToArray("K85aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K85aaa"));
      expect(arrayToString(result)).assertEqual("K85aaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010118 end');
    })

    /**
     * @tc.name   testEncode010119
     * @tc.number SUB_ASSET_ENCODE_0119
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010119 begin');
      const result: Uint8Array = stringToArray("K86aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K86aaaa"));
      expect(arrayToString(result)).assertEqual("K86aaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010119 end');
    })

    /**
     * @tc.name   testEncode010120
     * @tc.number SUB_ASSET_ENCODE_0120
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010120 begin');
      const result: Uint8Array = stringToArray("K87aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K87aaaaa"));
      expect(arrayToString(result)).assertEqual("K87aaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010120 end');
    })

    /**
     * @tc.name   testEncode010121
     * @tc.number SUB_ASSET_ENCODE_0121
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010121 begin');
      const result: Uint8Array = stringToArray("K88aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K88aaaaaa"));
      expect(arrayToString(result)).assertEqual("K88aaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010121 end');
    })

    /**
     * @tc.name   testEncode010122
     * @tc.number SUB_ASSET_ENCODE_0122
     * @tc.desc   合法值：ASCII 变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010122 begin');
      const result: Uint8Array = stringToArray("K89aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("K89aaaaaaa"));
      expect(arrayToString(result)).assertEqual("K89aaaaaaa");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010122 end');
    })

    /**
     * @tc.name   testEncode010123
     * @tc.number SUB_ASSET_ENCODE_0123
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010123 begin');
      const result: Uint8Array = stringToArray("@");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@"));
      expect(arrayToString(result)).assertEqual("@");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010123 end');
    })

    /**
     * @tc.name   testEncode010124
     * @tc.number SUB_ASSET_ENCODE_0124
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010124 begin');
      const result: Uint8Array = stringToArray("@#");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#"));
      expect(arrayToString(result)).assertEqual("@#");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010124 end');
    })

    /**
     * @tc.name   testEncode010125
     * @tc.number SUB_ASSET_ENCODE_0125
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010125 begin');
      const result: Uint8Array = stringToArray("@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$"));
      expect(arrayToString(result)).assertEqual("@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010125 end');
    })

    /**
     * @tc.name   testEncode010126
     * @tc.number SUB_ASSET_ENCODE_0126
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010126 begin');
      const result: Uint8Array = stringToArray("@#$%");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%"));
      expect(arrayToString(result)).assertEqual("@#$%");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010126 end');
    })

    /**
     * @tc.name   testEncode010127
     * @tc.number SUB_ASSET_ENCODE_0127
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010127 begin');
      const result: Uint8Array = stringToArray("@#$%^");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%^"));
      expect(arrayToString(result)).assertEqual("@#$%^");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010127 end');
    })

    /**
     * @tc.name   testEncode010128
     * @tc.number SUB_ASSET_ENCODE_0128
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010128 begin');
      const result: Uint8Array = stringToArray("@#$%^&");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%^&"));
      expect(arrayToString(result)).assertEqual("@#$%^&");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010128 end');
    })

    /**
     * @tc.name   testEncode010129
     * @tc.number SUB_ASSET_ENCODE_0129
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010129 begin');
      const result: Uint8Array = stringToArray("@#$%^&*");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%^&*"));
      expect(arrayToString(result)).assertEqual("@#$%^&*");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010129 end');
    })

    /**
     * @tc.name   testEncode010130
     * @tc.number SUB_ASSET_ENCODE_0130
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010130 begin');
      const result: Uint8Array = stringToArray("@#$%^&*(");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%^&*("));
      expect(arrayToString(result)).assertEqual("@#$%^&*(");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010130 end');
    })

    /**
     * @tc.name   testEncode010131
     * @tc.number SUB_ASSET_ENCODE_0131
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010131 begin');
      const result: Uint8Array = stringToArray("@#$%^&*()");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%^&*()"));
      expect(arrayToString(result)).assertEqual("@#$%^&*()");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010131 end');
    })

    /**
     * @tc.name   testEncode010132
     * @tc.number SUB_ASSET_ENCODE_0132
     * @tc.desc   合法值：符号串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010132 begin');
      const result: Uint8Array = stringToArray("@#$%^&*()_");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("@#$%^&*()_"));
      expect(arrayToString(result)).assertEqual("@#$%^&*()_");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010132 end');
    })

    /**
     * @tc.name   testEncode010133
     * @tc.number SUB_ASSET_ENCODE_0133
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010133 begin');
      const result: Uint8Array = stringToArray("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("0"));
      expect(arrayToString(result)).assertEqual("0");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010133 end');
    })

    /**
     * @tc.name   testEncode010134
     * @tc.number SUB_ASSET_ENCODE_0134
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010134 begin');
      const result: Uint8Array = stringToArray("11");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("11"));
      expect(arrayToString(result)).assertEqual("11");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010134 end');
    })

    /**
     * @tc.name   testEncode010135
     * @tc.number SUB_ASSET_ENCODE_0135
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010135 begin');
      const result: Uint8Array = stringToArray("222");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("222"));
      expect(arrayToString(result)).assertEqual("222");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010135 end');
    })

    /**
     * @tc.name   testEncode010136
     * @tc.number SUB_ASSET_ENCODE_0136
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010136 begin');
      const result: Uint8Array = stringToArray("3333");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("3333"));
      expect(arrayToString(result)).assertEqual("3333");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010136 end');
    })

    /**
     * @tc.name   testEncode010137
     * @tc.number SUB_ASSET_ENCODE_0137
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010137 begin');
      const result: Uint8Array = stringToArray("44444");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("44444"));
      expect(arrayToString(result)).assertEqual("44444");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010137 end');
    })

    /**
     * @tc.name   testEncode010138
     * @tc.number SUB_ASSET_ENCODE_0138
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010138 begin');
      const result: Uint8Array = stringToArray("555555");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("555555"));
      expect(arrayToString(result)).assertEqual("555555");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010138 end');
    })

    /**
     * @tc.name   testEncode010139
     * @tc.number SUB_ASSET_ENCODE_0139
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010139 begin');
      const result: Uint8Array = stringToArray("6666666");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("6666666"));
      expect(arrayToString(result)).assertEqual("6666666");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010139 end');
    })

    /**
     * @tc.name   testEncode010140
     * @tc.number SUB_ASSET_ENCODE_0140
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010140 begin');
      const result: Uint8Array = stringToArray("77777777");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("77777777"));
      expect(arrayToString(result)).assertEqual("77777777");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010140 end');
    })

    /**
     * @tc.name   testEncode010141
     * @tc.number SUB_ASSET_ENCODE_0141
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010141 begin');
      const result: Uint8Array = stringToArray("888888888");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("888888888"));
      expect(arrayToString(result)).assertEqual("888888888");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010141 end');
    })

    /**
     * @tc.name   testEncode010142
     * @tc.number SUB_ASSET_ENCODE_0142
     * @tc.desc   合法值：数字串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010142 begin');
      const result: Uint8Array = stringToArray("9999999999");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("9999999999"));
      expect(arrayToString(result)).assertEqual("9999999999");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010142 end');
    })

    /**
     * @tc.name   testEncode010143
     * @tc.number SUB_ASSET_ENCODE_0143
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010143 begin');
      const result: Uint8Array = stringToArray("a");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a"));
      expect(arrayToString(result)).assertEqual("a");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010143 end');
    })

    /**
     * @tc.name   testEncode010144
     * @tc.number SUB_ASSET_ENCODE_0144
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010144 begin');
      const result: Uint8Array = stringToArray("a\u0001");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001"));
      expect(arrayToString(result)).assertEqual("a\u0001");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010144 end');
    })

    /**
     * @tc.name   testEncode010145
     * @tc.number SUB_ASSET_ENCODE_0145
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010145 begin');
      const result: Uint8Array = stringToArray("a\u0001b");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001b"));
      expect(arrayToString(result)).assertEqual("a\u0001b");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010145 end');
    })

    /**
     * @tc.name   testEncode010146
     * @tc.number SUB_ASSET_ENCODE_0146
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010146 begin');
      const result: Uint8Array = stringToArray("a\u0001b\u0002");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001b\u0002"));
      expect(arrayToString(result)).assertEqual("a\u0001b\u0002");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010146 end');
    })

    /**
     * @tc.name   testEncode010147
     * @tc.number SUB_ASSET_ENCODE_0147
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010147 begin');
      const result: Uint8Array = stringToArray("a\u0001b\u0002c");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001b\u0002c"));
      expect(arrayToString(result)).assertEqual("a\u0001b\u0002c");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010147 end');
    })

    /**
     * @tc.name   testEncode010148
     * @tc.number SUB_ASSET_ENCODE_0148
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010148 begin');
      const result: Uint8Array = stringToArray("a\u0001b\u0002c\u001f");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001b\u0002c\u001f"));
      expect(arrayToString(result)).assertEqual("a\u0001b\u0002c\u001f");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010148 end');
    })

    /**
     * @tc.name   testEncode010149
     * @tc.number SUB_ASSET_ENCODE_0149
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010149 begin');
      const result: Uint8Array = stringToArray("a\u0001b\u0002c\u001f");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001b\u0002c\u001f"));
      expect(arrayToString(result)).assertEqual("a\u0001b\u0002c\u001f");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010149 end');
    })

    /**
     * @tc.name   testEncode010150
     * @tc.number SUB_ASSET_ENCODE_0150
     * @tc.desc   非法值：控制字符编码不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010150 begin');
      const result: Uint8Array = stringToArray("a\u0001b\u0002c\u001f");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("a\u0001b\u0002c\u001f"));
      expect(arrayToString(result)).assertEqual("a\u0001b\u0002c\u001f");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode010150 end');
    })

  })
}
