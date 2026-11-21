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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function encodeTextMatrixTest() {
  describe('encodeTextMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0001
   * @tc.name      testEncodeText0001
   * @tc.desc      Encode alpha keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0001', 'encode alpha byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0002
   * @tc.name      testEncodeText0002
   * @tc.desc      Encode alpha keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0002', 'encode alpha first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0003
   * @tc.name      testEncodeText0003
   * @tc.desc      Encode alpha keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0003', 'encode alpha round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('alpha');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0004
   * @tc.name      testEncodeText0004
   * @tc.desc      Encode alpha keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0004', 'encode alpha base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0005
   * @tc.name      testEncodeText0005
   * @tc.desc      Encode alpha keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0005', 'encode alpha base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('YWxwaGE=');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0006
   * @tc.name      testEncodeText0006
   * @tc.desc      Encode alpha keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0006', 'encode alpha base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0007
   * @tc.name      testEncodeText0007
   * @tc.desc      Encode beta keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0007', 'encode beta byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('beta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0008
   * @tc.name      testEncodeText0008
   * @tc.desc      Encode beta keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0008', 'encode beta first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('beta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(98);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0009
   * @tc.name      testEncodeText0009
   * @tc.desc      Encode beta keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0009', 'encode beta round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('beta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('beta');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0010
   * @tc.name      testEncodeText0010
   * @tc.desc      Encode beta keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0010', 'encode beta base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('beta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0011
   * @tc.name      testEncodeText0011
   * @tc.desc      Encode beta keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0011', 'encode beta base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('beta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('YmV0YQ==');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0012
   * @tc.name      testEncodeText0012
   * @tc.desc      Encode beta keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0012', 'encode beta base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('beta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0013
   * @tc.name      testEncodeText0013
   * @tc.desc      Encode gamma keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0013', 'encode gamma byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('gamma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0014
   * @tc.name      testEncodeText0014
   * @tc.desc      Encode gamma keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0014', 'encode gamma first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('gamma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(103);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0015
   * @tc.name      testEncodeText0015
   * @tc.desc      Encode gamma keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0015', 'encode gamma round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('gamma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('gamma');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0016
   * @tc.name      testEncodeText0016
   * @tc.desc      Encode gamma keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0016', 'encode gamma base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('gamma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0017
   * @tc.name      testEncodeText0017
   * @tc.desc      Encode gamma keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0017', 'encode gamma base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('gamma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('Z2FtbWE=');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0018
   * @tc.name      testEncodeText0018
   * @tc.desc      Encode gamma keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0018', 'encode gamma base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('gamma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0019
   * @tc.name      testEncodeText0019
   * @tc.desc      Encode delta keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0019', 'encode delta byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('delta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0020
   * @tc.name      testEncodeText0020
   * @tc.desc      Encode delta keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0020', 'encode delta first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('delta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0021
   * @tc.name      testEncodeText0021
   * @tc.desc      Encode delta keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0021', 'encode delta round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('delta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('delta');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0022
   * @tc.name      testEncodeText0022
   * @tc.desc      Encode delta keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0022', 'encode delta base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('delta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0023
   * @tc.name      testEncodeText0023
   * @tc.desc      Encode delta keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0023', 'encode delta base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('delta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('ZGVsdGE=');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_ENC_0024
   * @tc.name      testEncodeText0024
   * @tc.desc      Encode delta keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0024', 'encode delta base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('delta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
