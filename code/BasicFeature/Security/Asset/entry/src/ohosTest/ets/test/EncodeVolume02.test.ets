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

export default function encodeVolume02() {
  describe('EncodeVolume02Test', () => {

    /**
     * @tc.name   testEncode020151
     * @tc.number SUB_ASSET_ENCODE_0151
     * @tc.desc   混合字符编码字节数为各段之和且可逆解码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020151 begin');
      const encoded: Uint8Array = stringToArray('A中😀');
      expect(encoded.length).assertEqual(8);
      expect(arrayToString(encoded)).assertEqual('A中😀');
      const empty: Uint8Array = stringToArray('');
      expect(empty.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020151 end');
    })

    /**
     * @tc.name   testEncode020152
     * @tc.number SUB_ASSET_ENCODE_0152
     * @tc.desc   合法值：双中文编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020152 begin');
      const result: Uint8Array = stringToArray("中文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中文"));
      expect(arrayToString(result)).assertEqual("中文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020152 end');
    })

    /**
     * @tc.name   testEncode020153
     * @tc.number SUB_ASSET_ENCODE_0153
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020153 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020153 end');
    })

    /**
     * @tc.name   testEncode020154
     * @tc.number SUB_ASSET_ENCODE_0154
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020154 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020154 end');
    })

    /**
     * @tc.name   testEncode020155
     * @tc.number SUB_ASSET_ENCODE_0155
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020155 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020155 end');
    })

    /**
     * @tc.name   testEncode020156
     * @tc.number SUB_ASSET_ENCODE_0156
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020156 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020156 end');
    })

    /**
     * @tc.name   testEncode020157
     * @tc.number SUB_ASSET_ENCODE_0157
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020157 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020157 end');
    })

    /**
     * @tc.name   testEncode020158
     * @tc.number SUB_ASSET_ENCODE_0158
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020158 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020158 end');
    })

    /**
     * @tc.name   testEncode020159
     * @tc.number SUB_ASSET_ENCODE_0159
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020159 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020159 end');
    })

    /**
     * @tc.name   testEncode020160
     * @tc.number SUB_ASSET_ENCODE_0160
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020160 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020160 end');
    })

    /**
     * @tc.name   testEncode020161
     * @tc.number SUB_ASSET_ENCODE_0161
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020161 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020161 end');
    })

    /**
     * @tc.name   testEncode020162
     * @tc.number SUB_ASSET_ENCODE_0162
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020162 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020162 end');
    })

    /**
     * @tc.name   testEncode020163
     * @tc.number SUB_ASSET_ENCODE_0163
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020163 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020163 end');
    })

    /**
     * @tc.name   testEncode020164
     * @tc.number SUB_ASSET_ENCODE_0164
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020164 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020164 end');
    })

    /**
     * @tc.name   testEncode020165
     * @tc.number SUB_ASSET_ENCODE_0165
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020165 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020165 end');
    })

    /**
     * @tc.name   testEncode020166
     * @tc.number SUB_ASSET_ENCODE_0166
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020166 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020166 end');
    })

    /**
     * @tc.name   testEncode020167
     * @tc.number SUB_ASSET_ENCODE_0167
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020167 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020167 end');
    })

    /**
     * @tc.name   testEncode020168
     * @tc.number SUB_ASSET_ENCODE_0168
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020168 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020168 end');
    })

    /**
     * @tc.name   testEncode020169
     * @tc.number SUB_ASSET_ENCODE_0169
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020169 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020169 end');
    })

    /**
     * @tc.name   testEncode020170
     * @tc.number SUB_ASSET_ENCODE_0170
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020170 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020170 end');
    })

    /**
     * @tc.name   testEncode020171
     * @tc.number SUB_ASSET_ENCODE_0171
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020171 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020171 end');
    })

    /**
     * @tc.name   testEncode020172
     * @tc.number SUB_ASSET_ENCODE_0172
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020172 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020172 end');
    })

    /**
     * @tc.name   testEncode020173
     * @tc.number SUB_ASSET_ENCODE_0173
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020173 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020173 end');
    })

    /**
     * @tc.name   testEncode020174
     * @tc.number SUB_ASSET_ENCODE_0174
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020174 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020174 end');
    })

    /**
     * @tc.name   testEncode020175
     * @tc.number SUB_ASSET_ENCODE_0175
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020175 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020175 end');
    })

    /**
     * @tc.name   testEncode020176
     * @tc.number SUB_ASSET_ENCODE_0176
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020176 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020176 end');
    })

    /**
     * @tc.name   testEncode020177
     * @tc.number SUB_ASSET_ENCODE_0177
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020177 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020177 end');
    })

    /**
     * @tc.name   testEncode020178
     * @tc.number SUB_ASSET_ENCODE_0178
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020178 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020178 end');
    })

    /**
     * @tc.name   testEncode020179
     * @tc.number SUB_ASSET_ENCODE_0179
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020179 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020179 end');
    })

    /**
     * @tc.name   testEncode020180
     * @tc.number SUB_ASSET_ENCODE_0180
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020180 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020180 end');
    })

    /**
     * @tc.name   testEncode020181
     * @tc.number SUB_ASSET_ENCODE_0181
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020181 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020181 end');
    })

    /**
     * @tc.name   testEncode020182
     * @tc.number SUB_ASSET_ENCODE_0182
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020182 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020182 end');
    })

    /**
     * @tc.name   testEncode020183
     * @tc.number SUB_ASSET_ENCODE_0183
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020183 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020183 end');
    })

    /**
     * @tc.name   testEncode020184
     * @tc.number SUB_ASSET_ENCODE_0184
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020184 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020184 end');
    })

    /**
     * @tc.name   testEncode020185
     * @tc.number SUB_ASSET_ENCODE_0185
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020185 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020185 end');
    })

    /**
     * @tc.name   testEncode020186
     * @tc.number SUB_ASSET_ENCODE_0186
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020186 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020186 end');
    })

    /**
     * @tc.name   testEncode020187
     * @tc.number SUB_ASSET_ENCODE_0187
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020187 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020187 end');
    })

    /**
     * @tc.name   testEncode020188
     * @tc.number SUB_ASSET_ENCODE_0188
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020188 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020188 end');
    })

    /**
     * @tc.name   testEncode020189
     * @tc.number SUB_ASSET_ENCODE_0189
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020189 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020189 end');
    })

    /**
     * @tc.name   testEncode020190
     * @tc.number SUB_ASSET_ENCODE_0190
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020190 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020190 end');
    })

    /**
     * @tc.name   testEncode020191
     * @tc.number SUB_ASSET_ENCODE_0191
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020191 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020191 end');
    })

    /**
     * @tc.name   testEncode020192
     * @tc.number SUB_ASSET_ENCODE_0192
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020192 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020192 end');
    })

    /**
     * @tc.name   testEncode020193
     * @tc.number SUB_ASSET_ENCODE_0193
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020193 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020193 end');
    })

    /**
     * @tc.name   testEncode020194
     * @tc.number SUB_ASSET_ENCODE_0194
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020194 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020194 end');
    })

    /**
     * @tc.name   testEncode020195
     * @tc.number SUB_ASSET_ENCODE_0195
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020195 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020195 end');
    })

    /**
     * @tc.name   testEncode020196
     * @tc.number SUB_ASSET_ENCODE_0196
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020196 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020196 end');
    })

    /**
     * @tc.name   testEncode020197
     * @tc.number SUB_ASSET_ENCODE_0197
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020197 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020197 end');
    })

    /**
     * @tc.name   testEncode020198
     * @tc.number SUB_ASSET_ENCODE_0198
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020198 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020198 end');
    })

    /**
     * @tc.name   testEncode020199
     * @tc.number SUB_ASSET_ENCODE_0199
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020199 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020199 end');
    })

    /**
     * @tc.name   testEncode020200
     * @tc.number SUB_ASSET_ENCODE_0200
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020200 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020200 end');
    })

    /**
     * @tc.name   testEncode020201
     * @tc.number SUB_ASSET_ENCODE_0201
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020201 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020201 end');
    })

    /**
     * @tc.name   testEncode020202
     * @tc.number SUB_ASSET_ENCODE_0202
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020202 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020202 end');
    })

    /**
     * @tc.name   testEncode020203
     * @tc.number SUB_ASSET_ENCODE_0203
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020203 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020203 end');
    })

    /**
     * @tc.name   testEncode020204
     * @tc.number SUB_ASSET_ENCODE_0204
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020204 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020204 end');
    })

    /**
     * @tc.name   testEncode020205
     * @tc.number SUB_ASSET_ENCODE_0205
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020205 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020205 end');
    })

    /**
     * @tc.name   testEncode020206
     * @tc.number SUB_ASSET_ENCODE_0206
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020206 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020206 end');
    })

    /**
     * @tc.name   testEncode020207
     * @tc.number SUB_ASSET_ENCODE_0207
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020207 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020207 end');
    })

    /**
     * @tc.name   testEncode020208
     * @tc.number SUB_ASSET_ENCODE_0208
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020208 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020208 end');
    })

    /**
     * @tc.name   testEncode020209
     * @tc.number SUB_ASSET_ENCODE_0209
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020209 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020209 end');
    })

    /**
     * @tc.name   testEncode020210
     * @tc.number SUB_ASSET_ENCODE_0210
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020210 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020210 end');
    })

    /**
     * @tc.name   testEncode020211
     * @tc.number SUB_ASSET_ENCODE_0211
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020211 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020211 end');
    })

    /**
     * @tc.name   testEncode020212
     * @tc.number SUB_ASSET_ENCODE_0212
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020212 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020212 end');
    })

    /**
     * @tc.name   testEncode020213
     * @tc.number SUB_ASSET_ENCODE_0213
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020213 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020213 end');
    })

    /**
     * @tc.name   testEncode020214
     * @tc.number SUB_ASSET_ENCODE_0214
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020214 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020214 end');
    })

    /**
     * @tc.name   testEncode020215
     * @tc.number SUB_ASSET_ENCODE_0215
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020215 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020215 end');
    })

    /**
     * @tc.name   testEncode020216
     * @tc.number SUB_ASSET_ENCODE_0216
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020216 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020216 end');
    })

    /**
     * @tc.name   testEncode020217
     * @tc.number SUB_ASSET_ENCODE_0217
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020217 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020217 end');
    })

    /**
     * @tc.name   testEncode020218
     * @tc.number SUB_ASSET_ENCODE_0218
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020218 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020218 end');
    })

    /**
     * @tc.name   testEncode020219
     * @tc.number SUB_ASSET_ENCODE_0219
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020219 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020219 end');
    })

    /**
     * @tc.name   testEncode020220
     * @tc.number SUB_ASSET_ENCODE_0220
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020220 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020220 end');
    })

    /**
     * @tc.name   testEncode020221
     * @tc.number SUB_ASSET_ENCODE_0221
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020221 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020221 end');
    })

    /**
     * @tc.name   testEncode020222
     * @tc.number SUB_ASSET_ENCODE_0222
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020222 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020222 end');
    })

    /**
     * @tc.name   testEncode020223
     * @tc.number SUB_ASSET_ENCODE_0223
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020223 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020223 end');
    })

    /**
     * @tc.name   testEncode020224
     * @tc.number SUB_ASSET_ENCODE_0224
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020224 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020224 end');
    })

    /**
     * @tc.name   testEncode020225
     * @tc.number SUB_ASSET_ENCODE_0225
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020225 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020225 end');
    })

    /**
     * @tc.name   testEncode020226
     * @tc.number SUB_ASSET_ENCODE_0226
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020226 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020226 end');
    })

    /**
     * @tc.name   testEncode020227
     * @tc.number SUB_ASSET_ENCODE_0227
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020227 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020227 end');
    })

    /**
     * @tc.name   testEncode020228
     * @tc.number SUB_ASSET_ENCODE_0228
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020228 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020228 end');
    })

    /**
     * @tc.name   testEncode020229
     * @tc.number SUB_ASSET_ENCODE_0229
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020229 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020229 end');
    })

    /**
     * @tc.name   testEncode020230
     * @tc.number SUB_ASSET_ENCODE_0230
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020230 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020230 end');
    })

    /**
     * @tc.name   testEncode020231
     * @tc.number SUB_ASSET_ENCODE_0231
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020231 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020231 end');
    })

    /**
     * @tc.name   testEncode020232
     * @tc.number SUB_ASSET_ENCODE_0232
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020232 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020232 end');
    })

    /**
     * @tc.name   testEncode020233
     * @tc.number SUB_ASSET_ENCODE_0233
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020233 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020233 end');
    })

    /**
     * @tc.name   testEncode020234
     * @tc.number SUB_ASSET_ENCODE_0234
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020234 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020234 end');
    })

    /**
     * @tc.name   testEncode020235
     * @tc.number SUB_ASSET_ENCODE_0235
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020235 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020235 end');
    })

    /**
     * @tc.name   testEncode020236
     * @tc.number SUB_ASSET_ENCODE_0236
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020236 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020236 end');
    })

    /**
     * @tc.name   testEncode020237
     * @tc.number SUB_ASSET_ENCODE_0237
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020237 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020237 end');
    })

    /**
     * @tc.name   testEncode020238
     * @tc.number SUB_ASSET_ENCODE_0238
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020238 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020238 end');
    })

    /**
     * @tc.name   testEncode020239
     * @tc.number SUB_ASSET_ENCODE_0239
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020239 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020239 end');
    })

    /**
     * @tc.name   testEncode020240
     * @tc.number SUB_ASSET_ENCODE_0240
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020240 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020240 end');
    })

    /**
     * @tc.name   testEncode020241
     * @tc.number SUB_ASSET_ENCODE_0241
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020241 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020241 end');
    })

    /**
     * @tc.name   testEncode020242
     * @tc.number SUB_ASSET_ENCODE_0242
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020242 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020242 end');
    })

    /**
     * @tc.name   testEncode020243
     * @tc.number SUB_ASSET_ENCODE_0243
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020243 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020243 end');
    })

    /**
     * @tc.name   testEncode020244
     * @tc.number SUB_ASSET_ENCODE_0244
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020244 begin');
      const result: Uint8Array = stringToArray("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测"));
      expect(arrayToString(result)).assertEqual("测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020244 end');
    })

    /**
     * @tc.name   testEncode020245
     * @tc.number SUB_ASSET_ENCODE_0245
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020245 begin');
      const result: Uint8Array = stringToArray("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020245 end');
    })

    /**
     * @tc.name   testEncode020246
     * @tc.number SUB_ASSET_ENCODE_0246
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020246 begin');
      const result: Uint8Array = stringToArray("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020246 end');
    })

    /**
     * @tc.name   testEncode020247
     * @tc.number SUB_ASSET_ENCODE_0247
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020247 begin');
      const result: Uint8Array = stringToArray("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020247 end');
    })

    /**
     * @tc.name   testEncode020248
     * @tc.number SUB_ASSET_ENCODE_0248
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020248 begin');
      const result: Uint8Array = stringToArray("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020248 end');
    })

    /**
     * @tc.name   testEncode020249
     * @tc.number SUB_ASSET_ENCODE_0249
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020249 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020249 end');
    })

    /**
     * @tc.name   testEncode020250
     * @tc.number SUB_ASSET_ENCODE_0250
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020250 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020250 end');
    })

    /**
     * @tc.name   testEncode020251
     * @tc.number SUB_ASSET_ENCODE_0251
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020251 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020251 end');
    })

    /**
     * @tc.name   testEncode020252
     * @tc.number SUB_ASSET_ENCODE_0252
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020252 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020252 end');
    })

    /**
     * @tc.name   testEncode020253
     * @tc.number SUB_ASSET_ENCODE_0253
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020253 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020253 end');
    })

    /**
     * @tc.name   testEncode020254
     * @tc.number SUB_ASSET_ENCODE_0254
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020254 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(39));
      expect(result.length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020254 end');
    })

    /**
     * @tc.name   testEncode020255
     * @tc.number SUB_ASSET_ENCODE_0255
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020255 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(42));
      expect(result.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020255 end');
    })

    /**
     * @tc.name   testEncode020256
     * @tc.number SUB_ASSET_ENCODE_0256
     * @tc.desc   合法值：中文变长串编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020256 begin');
      const result: Uint8Array = stringToArray("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(45));
      expect(result.length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("测测测测测测测测测测测测测测测"));
      expect(arrayToString(result)).assertEqual("测测测测测测测测测测测测测测测");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020256 end');
    })

    /**
     * @tc.name   testEncode020257
     * @tc.number SUB_ASSET_ENCODE_0257
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020257 begin');
      const result: Uint8Array = stringToArray("ab中cd");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cd"));
      expect(arrayToString(result)).assertEqual("ab中cd");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020257 end');
    })

    /**
     * @tc.name   testEncode020258
     * @tc.number SUB_ASSET_ENCODE_0258
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020258 begin');
      const result: Uint8Array = stringToArray("ab中cde");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cde"));
      expect(arrayToString(result)).assertEqual("ab中cde");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020258 end');
    })

    /**
     * @tc.name   testEncode020259
     * @tc.number SUB_ASSET_ENCODE_0259
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020259 begin');
      const result: Uint8Array = stringToArray("ab中cdee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdee"));
      expect(arrayToString(result)).assertEqual("ab中cdee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020259 end');
    })

    /**
     * @tc.name   testEncode020260
     * @tc.number SUB_ASSET_ENCODE_0260
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020260 begin');
      const result: Uint8Array = stringToArray("ab中cdeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020260 end');
    })

    /**
     * @tc.name   testEncode020261
     * @tc.number SUB_ASSET_ENCODE_0261
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020261 begin');
      const result: Uint8Array = stringToArray("ab中cdeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020261 end');
    })

    /**
     * @tc.name   testEncode020262
     * @tc.number SUB_ASSET_ENCODE_0262
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020262 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020262 end');
    })

    /**
     * @tc.name   testEncode020263
     * @tc.number SUB_ASSET_ENCODE_0263
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020263 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020263 end');
    })

    /**
     * @tc.name   testEncode020264
     * @tc.number SUB_ASSET_ENCODE_0264
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020264 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020264 end');
    })

    /**
     * @tc.name   testEncode020265
     * @tc.number SUB_ASSET_ENCODE_0265
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020265 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020265 end');
    })

    /**
     * @tc.name   testEncode020266
     * @tc.number SUB_ASSET_ENCODE_0266
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020266 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020266 end');
    })

    /**
     * @tc.name   testEncode020267
     * @tc.number SUB_ASSET_ENCODE_0267
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020267 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(17));
      expect(result.length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020267 end');
    })

    /**
     * @tc.name   testEncode020268
     * @tc.number SUB_ASSET_ENCODE_0268
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020268 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020268 end');
    })

    /**
     * @tc.name   testEncode020269
     * @tc.number SUB_ASSET_ENCODE_0269
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020269 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020269 end');
    })

    /**
     * @tc.name   testEncode020270
     * @tc.number SUB_ASSET_ENCODE_0270
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020270 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(20));
      expect(result.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020270 end');
    })

    /**
     * @tc.name   testEncode020271
     * @tc.number SUB_ASSET_ENCODE_0271
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020271 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(21));
      expect(result.length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020271 end');
    })

    /**
     * @tc.name   testEncode020272
     * @tc.number SUB_ASSET_ENCODE_0272
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020272 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(22));
      expect(result.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020272 end');
    })

    /**
     * @tc.name   testEncode020273
     * @tc.number SUB_ASSET_ENCODE_0273
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020273 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(23));
      expect(result.length).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020273 end');
    })

    /**
     * @tc.name   testEncode020274
     * @tc.number SUB_ASSET_ENCODE_0274
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020274 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020274 end');
    })

    /**
     * @tc.name   testEncode020275
     * @tc.number SUB_ASSET_ENCODE_0275
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020275 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(25));
      expect(result.length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020275 end');
    })

    /**
     * @tc.name   testEncode020276
     * @tc.number SUB_ASSET_ENCODE_0276
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020276 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(26));
      expect(result.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020276 end');
    })

    /**
     * @tc.name   testEncode020277
     * @tc.number SUB_ASSET_ENCODE_0277
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020277 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(27));
      expect(result.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020277 end');
    })

    /**
     * @tc.name   testEncode020278
     * @tc.number SUB_ASSET_ENCODE_0278
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020278 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020278 end');
    })

    /**
     * @tc.name   testEncode020279
     * @tc.number SUB_ASSET_ENCODE_0279
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020279 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(29));
      expect(result.length).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020279 end');
    })

    /**
     * @tc.name   testEncode020280
     * @tc.number SUB_ASSET_ENCODE_0280
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020280 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(30));
      expect(result.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020280 end');
    })

    /**
     * @tc.name   testEncode020281
     * @tc.number SUB_ASSET_ENCODE_0281
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020281 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(31));
      expect(result.length).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020281 end');
    })

    /**
     * @tc.name   testEncode020282
     * @tc.number SUB_ASSET_ENCODE_0282
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020282 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020282 end');
    })

    /**
     * @tc.name   testEncode020283
     * @tc.number SUB_ASSET_ENCODE_0283
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020283 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(33));
      expect(result.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020283 end');
    })

    /**
     * @tc.name   testEncode020284
     * @tc.number SUB_ASSET_ENCODE_0284
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020284 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(34));
      expect(result.length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020284 end');
    })

    /**
     * @tc.name   testEncode020285
     * @tc.number SUB_ASSET_ENCODE_0285
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020285 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(35));
      expect(result.length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020285 end');
    })

    /**
     * @tc.name   testEncode020286
     * @tc.number SUB_ASSET_ENCODE_0286
     * @tc.desc   组合值：中英混合编码字节数为各段之和
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020286 begin');
      const result: Uint8Array = stringToArray("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeeeee"));
      expect(arrayToString(result)).assertEqual("ab中cdeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020286 end');
    })

    /**
     * @tc.name   testEncode020287
     * @tc.number SUB_ASSET_ENCODE_0287
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020287 begin');
      const result: Uint8Array = stringToArray("中@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$"));
      expect(arrayToString(result)).assertEqual("中@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020287 end');
    })

    /**
     * @tc.name   testEncode020288
     * @tc.number SUB_ASSET_ENCODE_0288
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020288 begin');
      const result: Uint8Array = stringToArray("中@#$文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文"));
      expect(arrayToString(result)).assertEqual("中@#$文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020288 end');
    })

    /**
     * @tc.name   testEncode020289
     * @tc.number SUB_ASSET_ENCODE_0289
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020289 begin');
      const result: Uint8Array = stringToArray("中@#$文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020289 end');
    })

    /**
     * @tc.name   testEncode020290
     * @tc.number SUB_ASSET_ENCODE_0290
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020290 begin');
      const result: Uint8Array = stringToArray("中@#$文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020290 end');
    })

    /**
     * @tc.name   testEncode020291
     * @tc.number SUB_ASSET_ENCODE_0291
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020291 begin');
      const result: Uint8Array = stringToArray("中@#$文文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020291 end');
    })

    /**
     * @tc.name   testEncode020292
     * @tc.number SUB_ASSET_ENCODE_0292
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020292 begin');
      const result: Uint8Array = stringToArray("中@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$"));
      expect(arrayToString(result)).assertEqual("中@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020292 end');
    })

    /**
     * @tc.name   testEncode020293
     * @tc.number SUB_ASSET_ENCODE_0293
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020293 begin');
      const result: Uint8Array = stringToArray("中@#$文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文"));
      expect(arrayToString(result)).assertEqual("中@#$文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020293 end');
    })

    /**
     * @tc.name   testEncode020294
     * @tc.number SUB_ASSET_ENCODE_0294
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020294 begin');
      const result: Uint8Array = stringToArray("中@#$文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020294 end');
    })

    /**
     * @tc.name   testEncode020295
     * @tc.number SUB_ASSET_ENCODE_0295
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020295 begin');
      const result: Uint8Array = stringToArray("中@#$文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020295 end');
    })

    /**
     * @tc.name   testEncode020296
     * @tc.number SUB_ASSET_ENCODE_0296
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020296 begin');
      const result: Uint8Array = stringToArray("中@#$文文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(18));
      expect(result.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020296 end');
    })

    /**
     * @tc.name   testEncode020297
     * @tc.number SUB_ASSET_ENCODE_0297
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020297 begin');
      const result: Uint8Array = stringToArray("中@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$"));
      expect(arrayToString(result)).assertEqual("中@#$");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020297 end');
    })

    /**
     * @tc.name   testEncode020298
     * @tc.number SUB_ASSET_ENCODE_0298
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020298 begin');
      const result: Uint8Array = stringToArray("中@#$文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文"));
      expect(arrayToString(result)).assertEqual("中@#$文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020298 end');
    })

    /**
     * @tc.name   testEncode020299
     * @tc.number SUB_ASSET_ENCODE_0299
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020299 begin');
      const result: Uint8Array = stringToArray("中@#$文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020299 end');
    })

    /**
     * @tc.name   testEncode020300
     * @tc.number SUB_ASSET_ENCODE_0300
     * @tc.desc   组合值：中文与符号混合编码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEncode020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020300 begin');
      const result: Uint8Array = stringToArray("中@#$文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Uint8Array));
      expect(result instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(arrayToString(result)),
        String("中@#$文文文"));
      expect(arrayToString(result)).assertEqual("中@#$文文文");
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEncode020300 end');
    })

  })
}
