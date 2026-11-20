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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0001
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0002
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0003
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0004
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0005
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0006
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0007
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0008
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0009
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0010
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0011
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0012
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0013
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0014
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0015
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0016
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0017
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0018
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0019
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0020
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0021
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0022
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0023
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0024
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
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0025
   * @tc.name      testEncodeText0025
   * @tc.desc      Encode epsilon keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0025', 'encode epsilon byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('epsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0026
   * @tc.name      testEncodeText0026
   * @tc.desc      Encode epsilon keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0026', 'encode epsilon first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('epsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(101);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0027
   * @tc.name      testEncodeText0027
   * @tc.desc      Encode epsilon keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0027', 'encode epsilon round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('epsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('epsilon');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0028
   * @tc.name      testEncodeText0028
   * @tc.desc      Encode epsilon keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0028', 'encode epsilon base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('epsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0029
   * @tc.name      testEncodeText0029
   * @tc.desc      Encode epsilon keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0029', 'encode epsilon base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('epsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('ZXBzaWxvbg==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0030
   * @tc.name      testEncodeText0030
   * @tc.desc      Encode epsilon keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0030', 'encode epsilon base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('epsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0031
   * @tc.name      testEncodeText0031
   * @tc.desc      Encode zeta keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0031', 'encode zeta byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('zeta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0032
   * @tc.name      testEncodeText0032
   * @tc.desc      Encode zeta keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0032', 'encode zeta first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('zeta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(122);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0033
   * @tc.name      testEncodeText0033
   * @tc.desc      Encode zeta keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0033', 'encode zeta round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('zeta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('zeta');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0034
   * @tc.name      testEncodeText0034
   * @tc.desc      Encode zeta keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0034', 'encode zeta base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('zeta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0035
   * @tc.name      testEncodeText0035
   * @tc.desc      Encode zeta keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0035', 'encode zeta base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('zeta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('emV0YQ==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0036
   * @tc.name      testEncodeText0036
   * @tc.desc      Encode zeta keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0036', 'encode zeta base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('zeta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0037
   * @tc.name      testEncodeText0037
   * @tc.desc      Encode eta keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0037', 'encode eta byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('eta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0038
   * @tc.name      testEncodeText0038
   * @tc.desc      Encode eta keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0038', 'encode eta first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('eta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(101);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0039
   * @tc.name      testEncodeText0039
   * @tc.desc      Encode eta keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0039', 'encode eta round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('eta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('eta');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0040
   * @tc.name      testEncodeText0040
   * @tc.desc      Encode eta keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0040', 'encode eta base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('eta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0041
   * @tc.name      testEncodeText0041
   * @tc.desc      Encode eta keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0041', 'encode eta base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('eta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('ZXRh');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0042
   * @tc.name      testEncodeText0042
   * @tc.desc      Encode eta keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0042', 'encode eta base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('eta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0043
   * @tc.name      testEncodeText0043
   * @tc.desc      Encode theta keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0043', 'encode theta byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('theta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0044
   * @tc.name      testEncodeText0044
   * @tc.desc      Encode theta keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0044', 'encode theta first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('theta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(116);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0045
   * @tc.name      testEncodeText0045
   * @tc.desc      Encode theta keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0045', 'encode theta round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('theta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('theta');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0046
   * @tc.name      testEncodeText0046
   * @tc.desc      Encode theta keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0046', 'encode theta base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('theta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0047
   * @tc.name      testEncodeText0047
   * @tc.desc      Encode theta keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0047', 'encode theta base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('theta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('dGhldGE=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0048
   * @tc.name      testEncodeText0048
   * @tc.desc      Encode theta keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0048', 'encode theta base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('theta');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0049
   * @tc.name      testEncodeText0049
   * @tc.desc      Encode iota keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0049', 'encode iota byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('iota');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0050
   * @tc.name      testEncodeText0050
   * @tc.desc      Encode iota keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0050', 'encode iota first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('iota');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(105);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0051
   * @tc.name      testEncodeText0051
   * @tc.desc      Encode iota keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0051', 'encode iota round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('iota');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('iota');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0052
   * @tc.name      testEncodeText0052
   * @tc.desc      Encode iota keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0052', 'encode iota base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('iota');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0053
   * @tc.name      testEncodeText0053
   * @tc.desc      Encode iota keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0053', 'encode iota base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('iota');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('aW90YQ==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0054
   * @tc.name      testEncodeText0054
   * @tc.desc      Encode iota keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0054', 'encode iota base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('iota');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0055
   * @tc.name      testEncodeText0055
   * @tc.desc      Encode kappa keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0055', 'encode kappa byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kappa');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0056
   * @tc.name      testEncodeText0056
   * @tc.desc      Encode kappa keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0056', 'encode kappa first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kappa');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(107);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0057
   * @tc.name      testEncodeText0057
   * @tc.desc      Encode kappa keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0057', 'encode kappa round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kappa');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('kappa');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0058
   * @tc.name      testEncodeText0058
   * @tc.desc      Encode kappa keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0058', 'encode kappa base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kappa');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0059
   * @tc.name      testEncodeText0059
