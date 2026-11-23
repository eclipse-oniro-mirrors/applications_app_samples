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
   * @tc.desc      Encode kappa keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0059', 'encode kappa base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kappa');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('a2FwcGE=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0060
   * @tc.name      testEncodeText0060
   * @tc.desc      Encode kappa keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0060', 'encode kappa base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kappa');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0061
   * @tc.name      testEncodeText0061
   * @tc.desc      Encode lambda keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0061', 'encode lambda byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('lambda');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0062
   * @tc.name      testEncodeText0062
   * @tc.desc      Encode lambda keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0062', 'encode lambda first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('lambda');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0063
   * @tc.name      testEncodeText0063
   * @tc.desc      Encode lambda keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0063', 'encode lambda round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('lambda');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('lambda');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0064
   * @tc.name      testEncodeText0064
   * @tc.desc      Encode lambda keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0064', 'encode lambda base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('lambda');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0065
   * @tc.name      testEncodeText0065
   * @tc.desc      Encode lambda keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0065', 'encode lambda base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('lambda');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('bGFtYmRh');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0066
   * @tc.name      testEncodeText0066
   * @tc.desc      Encode lambda keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0066', 'encode lambda base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('lambda');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0067
   * @tc.name      testEncodeText0067
   * @tc.desc      Encode mu keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0067', 'encode mu byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('mu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0068
   * @tc.name      testEncodeText0068
   * @tc.desc      Encode mu keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0068', 'encode mu first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('mu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(109);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0069
   * @tc.name      testEncodeText0069
   * @tc.desc      Encode mu keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0069', 'encode mu round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('mu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('mu');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0070
   * @tc.name      testEncodeText0070
   * @tc.desc      Encode mu keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0070', 'encode mu base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('mu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0071
   * @tc.name      testEncodeText0071
   * @tc.desc      Encode mu keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0071', 'encode mu base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('mu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('bXU=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0072
   * @tc.name      testEncodeText0072
   * @tc.desc      Encode mu keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0072', 'encode mu base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('mu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0073
   * @tc.name      testEncodeText0073
   * @tc.desc      Encode nu keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0073', 'encode nu byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('nu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0074
   * @tc.name      testEncodeText0074
   * @tc.desc      Encode nu keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0074', 'encode nu first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('nu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(110);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0075
   * @tc.name      testEncodeText0075
   * @tc.desc      Encode nu keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0075', 'encode nu round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('nu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('nu');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0076
   * @tc.name      testEncodeText0076
   * @tc.desc      Encode nu keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0076', 'encode nu base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('nu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0077
   * @tc.name      testEncodeText0077
   * @tc.desc      Encode nu keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0077', 'encode nu base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('nu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('bnU=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0078
   * @tc.name      testEncodeText0078
   * @tc.desc      Encode nu keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0078', 'encode nu base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('nu');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0079
   * @tc.name      testEncodeText0079
   * @tc.desc      Encode xi keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0079', 'encode xi byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('xi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0080
   * @tc.name      testEncodeText0080
   * @tc.desc      Encode xi keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0080', 'encode xi first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('xi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(120);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0081
   * @tc.name      testEncodeText0081
   * @tc.desc      Encode xi keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0081', 'encode xi round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('xi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('xi');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0082
   * @tc.name      testEncodeText0082
   * @tc.desc      Encode xi keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0082', 'encode xi base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('xi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0083
   * @tc.name      testEncodeText0083
   * @tc.desc      Encode xi keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0083', 'encode xi base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('xi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('eGk=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0084
   * @tc.name      testEncodeText0084
   * @tc.desc      Encode xi keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0084', 'encode xi base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('xi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0085
   * @tc.name      testEncodeText0085
   * @tc.desc      Encode omicron keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0085', 'encode omicron byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omicron');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0086
   * @tc.name      testEncodeText0086
   * @tc.desc      Encode omicron keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0086', 'encode omicron first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omicron');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(111);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0087
   * @tc.name      testEncodeText0087
   * @tc.desc      Encode omicron keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0087', 'encode omicron round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omicron');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('omicron');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0088
   * @tc.name      testEncodeText0088
   * @tc.desc      Encode omicron keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0088', 'encode omicron base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omicron');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0089
   * @tc.name      testEncodeText0089
   * @tc.desc      Encode omicron keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0089', 'encode omicron base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omicron');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('b21pY3Jvbg==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0090
   * @tc.name      testEncodeText0090
   * @tc.desc      Encode omicron keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0090', 'encode omicron base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omicron');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0091
   * @tc.name      testEncodeText0091
   * @tc.desc      Encode pi keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0091', 'encode pi byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('pi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0092
   * @tc.name      testEncodeText0092
   * @tc.desc      Encode pi keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0092', 'encode pi first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('pi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0093
   * @tc.name      testEncodeText0093
   * @tc.desc      Encode pi keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0093', 'encode pi round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('pi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('pi');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0094
   * @tc.name      testEncodeText0094
   * @tc.desc      Encode pi keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0094', 'encode pi base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('pi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0095
   * @tc.name      testEncodeText0095
   * @tc.desc      Encode pi keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0095', 'encode pi base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('pi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('cGk=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0096
   * @tc.name      testEncodeText0096
   * @tc.desc      Encode pi keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0096', 'encode pi base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('pi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0097
   * @tc.name      testEncodeText0097
   * @tc.desc      Encode rho keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0097', 'encode rho byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('rho');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0098
   * @tc.name      testEncodeText0098
   * @tc.desc      Encode rho keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0098', 'encode rho first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('rho');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(114);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0099
   * @tc.name      testEncodeText0099
   * @tc.desc      Encode rho keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0099', 'encode rho round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('rho');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('rho');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0100
   * @tc.name      testEncodeText0100
   * @tc.desc      Encode rho keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0100', 'encode rho base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('rho');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0101
   * @tc.name      testEncodeText0101
   * @tc.desc      Encode rho keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0101', 'encode rho base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('rho');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('cmhv');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0102
   * @tc.name      testEncodeText0102
   * @tc.desc      Encode rho keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0102', 'encode rho base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('rho');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0103
   * @tc.name      testEncodeText0103
   * @tc.desc      Encode sigma keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0103', 'encode sigma byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('sigma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0104
   * @tc.name      testEncodeText0104
   * @tc.desc      Encode sigma keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0104', 'encode sigma first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('sigma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0105
   * @tc.name      testEncodeText0105
   * @tc.desc      Encode sigma keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0105', 'encode sigma round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('sigma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('sigma');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0106
   * @tc.name      testEncodeText0106
   * @tc.desc      Encode sigma keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0106', 'encode sigma base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('sigma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0107
   * @tc.name      testEncodeText0107
   * @tc.desc      Encode sigma keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0107', 'encode sigma base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('sigma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('c2lnbWE=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0108
   * @tc.name      testEncodeText0108
   * @tc.desc      Encode sigma keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0108', 'encode sigma base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('sigma');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0109
   * @tc.name      testEncodeText0109
   * @tc.desc      Encode tau keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0109', 'encode tau byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('tau');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0110
   * @tc.name      testEncodeText0110
   * @tc.desc      Encode tau keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0110', 'encode tau first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('tau');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(116);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0111
   * @tc.name      testEncodeText0111
   * @tc.desc      Encode tau keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0111', 'encode tau round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('tau');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('tau');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0112
   * @tc.name      testEncodeText0112
   * @tc.desc      Encode tau keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0112', 'encode tau base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('tau');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0113
   * @tc.name      testEncodeText0113
   * @tc.desc      Encode tau keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0113', 'encode tau base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('tau');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('dGF1');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0114
   * @tc.name      testEncodeText0114
   * @tc.desc      Encode tau keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0114', 'encode tau base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('tau');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0115
   * @tc.name      testEncodeText0115
   * @tc.desc      Encode upsilon keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0115', 'encode upsilon byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('upsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0116
   * @tc.name      testEncodeText0116
   * @tc.desc      Encode upsilon keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0116', 'encode upsilon first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('upsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(117);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0117
   * @tc.name      testEncodeText0117
   * @tc.desc      Encode upsilon keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0117', 'encode upsilon round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('upsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('upsilon');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0118
   * @tc.name      testEncodeText0118
   * @tc.desc      Encode upsilon keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0118', 'encode upsilon base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('upsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0119
   * @tc.name      testEncodeText0119
   * @tc.desc      Encode upsilon keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0119', 'encode upsilon base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('upsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('dXBzaWxvbg==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0120
   * @tc.name      testEncodeText0120
   * @tc.desc      Encode upsilon keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0120', 'encode upsilon base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('upsilon');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0121
   * @tc.name      testEncodeText0121
   * @tc.desc      Encode phi keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0121', 'encode phi byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('phi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0122
   * @tc.name      testEncodeText0122
   * @tc.desc      Encode phi keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0122', 'encode phi first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('phi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0123
   * @tc.name      testEncodeText0123
   * @tc.desc      Encode phi keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0123', 'encode phi round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('phi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('phi');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0124
   * @tc.name      testEncodeText0124
   * @tc.desc      Encode phi keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0124', 'encode phi base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('phi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0125
   * @tc.name      testEncodeText0125
   * @tc.desc      Encode phi keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0125', 'encode phi base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('phi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('cGhp');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0126
   * @tc.name      testEncodeText0126
   * @tc.desc      Encode phi keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0126', 'encode phi base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('phi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0127
   * @tc.name      testEncodeText0127
   * @tc.desc      Encode chi keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0127', 'encode chi byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('chi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0128
   * @tc.name      testEncodeText0128
   * @tc.desc      Encode chi keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0128', 'encode chi first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('chi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(99);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0129
   * @tc.name      testEncodeText0129
   * @tc.desc      Encode chi keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0129', 'encode chi round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('chi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('chi');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0130
   * @tc.name      testEncodeText0130
   * @tc.desc      Encode chi keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0130', 'encode chi base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('chi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0131
   * @tc.name      testEncodeText0131
   * @tc.desc      Encode chi keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0131', 'encode chi base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('chi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('Y2hp');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0132
   * @tc.name      testEncodeText0132
   * @tc.desc      Encode chi keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0132', 'encode chi base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('chi');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0133
   * @tc.name      testEncodeText0133
   * @tc.desc      Encode alpha keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0133', 'encode alpha byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0134
   * @tc.name      testEncodeText0134
   * @tc.desc      Encode alpha keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0134', 'encode alpha first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0135
   * @tc.name      testEncodeText0135
   * @tc.desc      Encode alpha keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0135', 'encode alpha round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('alpha');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0136
   * @tc.name      testEncodeText0136
   * @tc.desc      Encode alpha keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0136', 'encode alpha base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0137
   * @tc.name      testEncodeText0137
   * @tc.desc      Encode alpha keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0137', 'encode alpha base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('alpha');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('YWxwaGE=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0138
   * @tc.name      testEncodeText0138
   * @tc.desc      Encode alpha keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0138', 'encode alpha base64 alphabet');
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
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0139
   * @tc.name      testEncodeText0139
   * @tc.desc      Encode omega keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0139', 'encode omega byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omega');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0140
   * @tc.name      testEncodeText0140
   * @tc.desc      Encode omega keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0140', 'encode omega first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omega');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(111);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0141
   * @tc.name      testEncodeText0141
   * @tc.desc      Encode omega keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0141', 'encode omega round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omega');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('omega');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0142
   * @tc.name      testEncodeText0142
   * @tc.desc      Encode omega keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0142', 'encode omega base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omega');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0143
   * @tc.name      testEncodeText0143
   * @tc.desc      Encode omega keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0143', 'encode omega base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omega');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('b21lZ2E=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0144
   * @tc.name      testEncodeText0144
   * @tc.desc      Encode omega keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0144', 'encode omega base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('omega');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0145
   * @tc.name      testEncodeText0145
   * @tc.desc      Encode node-1 keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0145', 'encode node-1 byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('node-1');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0146
   * @tc.name      testEncodeText0146
   * @tc.desc      Encode node-1 keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0146', 'encode node-1 first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('node-1');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(110);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0147
   * @tc.name      testEncodeText0147
   * @tc.desc      Encode node-1 keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0147', 'encode node-1 round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('node-1');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('node-1');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0148
   * @tc.name      testEncodeText0148
   * @tc.desc      Encode node-1 keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0148', 'encode node-1 base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('node-1');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0149
   * @tc.name      testEncodeText0149
   * @tc.desc      Encode node-1 keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0149', 'encode node-1 base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('node-1');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('bm9kZS0x');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0150
   * @tc.name      testEncodeText0150
   * @tc.desc      Encode node-1 keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0150', 'encode node-1 base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('node-1');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0151
   * @tc.name      testEncodeText0151
   * @tc.desc      Encode a.b.c keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0151', 'encode a.b.c byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('a.b.c');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0152
   * @tc.name      testEncodeText0152
   * @tc.desc      Encode a.b.c keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0152', 'encode a.b.c first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('a.b.c');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0153
   * @tc.name      testEncodeText0153
   * @tc.desc      Encode a.b.c keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0153', 'encode a.b.c round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('a.b.c');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('a.b.c');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0154
   * @tc.name      testEncodeText0154
   * @tc.desc      Encode a.b.c keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0154', 'encode a.b.c base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('a.b.c');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0155
   * @tc.name      testEncodeText0155
   * @tc.desc      Encode a.b.c keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0155', 'encode a.b.c base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('a.b.c');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('YS5iLmM=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0156
   * @tc.name      testEncodeText0156
   * @tc.desc      Encode a.b.c keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0156', 'encode a.b.c base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('a.b.c');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0157
   * @tc.name      testEncodeText0157
   * @tc.desc      Encode x_y_z keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0157', 'encode x_y_z byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('x_y_z');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0158
   * @tc.name      testEncodeText0158
   * @tc.desc      Encode x_y_z keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0158', 'encode x_y_z first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('x_y_z');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(120);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0159
   * @tc.name      testEncodeText0159
   * @tc.desc      Encode x_y_z keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0159', 'encode x_y_z round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('x_y_z');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('x_y_z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0160
   * @tc.name      testEncodeText0160
   * @tc.desc      Encode x_y_z keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0160', 'encode x_y_z base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('x_y_z');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0161
   * @tc.name      testEncodeText0161
   * @tc.desc      Encode x_y_z keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0161', 'encode x_y_z base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('x_y_z');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('eF95X3o=');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0162
   * @tc.name      testEncodeText0162
   * @tc.desc      Encode x_y_z keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0162', 'encode x_y_z base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('x_y_z');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0163
   * @tc.name      testEncodeText0163
   * @tc.desc      Encode kebab-case keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0163', 'encode kebab-case byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kebab-case');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0164
   * @tc.name      testEncodeText0164
   * @tc.desc      Encode kebab-case keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0164', 'encode kebab-case first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kebab-case');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(107);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0165
   * @tc.name      testEncodeText0165
   * @tc.desc      Encode kebab-case keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0165', 'encode kebab-case round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kebab-case');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('kebab-case');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0166
   * @tc.name      testEncodeText0166
   * @tc.desc      Encode kebab-case keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0166', 'encode kebab-case base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kebab-case');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0167
   * @tc.name      testEncodeText0167
   * @tc.desc      Encode kebab-case keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0167', 'encode kebab-case base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kebab-case');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('a2ViYWItY2FzZQ==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0168
   * @tc.name      testEncodeText0168
   * @tc.desc      Encode kebab-case keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0168', 'encode kebab-case base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('kebab-case');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0169
   * @tc.name      testEncodeText0169
   * @tc.desc      Encode slash/path keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0169', 'encode slash/path byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('slash/path');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0170
   * @tc.name      testEncodeText0170
   * @tc.desc      Encode slash/path keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0170', 'encode slash/path first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('slash/path');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0171
   * @tc.name      testEncodeText0171
   * @tc.desc      Encode slash/path keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0171', 'encode slash/path round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('slash/path');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('slash/path');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0172
   * @tc.name      testEncodeText0172
   * @tc.desc      Encode slash/path keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0172', 'encode slash/path base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('slash/path');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0173
   * @tc.name      testEncodeText0173
   * @tc.desc      Encode slash/path keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0173', 'encode slash/path base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('slash/path');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('c2xhc2gvcGF0aA==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0174
   * @tc.name      testEncodeText0174
   * @tc.desc      Encode slash/path keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0174', 'encode slash/path base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('slash/path');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0175
   * @tc.name      testEncodeText0175
   * @tc.desc      Encode space word keeps byte length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0175', 'encode space word byte length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('space word');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes.length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0176
   * @tc.name      testEncodeText0176
   * @tc.desc      Encode space word keeps first byte
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0176', 'encode space word first byte');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('space word');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(bytes[0]).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0177
   * @tc.name      testEncodeText0177
   * @tc.desc      Encode space word keeps round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0177', 'encode space word round trip');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('space word');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(restored).assertEqual('space word');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0178
   * @tc.name      testEncodeText0178
   * @tc.desc      Encode space word keeps base64 length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0178', 'encode space word base64 length');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('space word');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded.length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0179
   * @tc.name      testEncodeText0179
   * @tc.desc      Encode space word keeps base64 value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0179', 'encode space word base64 value');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('space word');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(encoded).assertEqual('c3BhY2Ugd29yZA==');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0180
   * @tc.name      testEncodeText0180
   * @tc.desc      Encode space word keeps base64 alphabet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0180', 'encode space word base64 alphabet');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('space word');
    const encoded: string = helper.encodeToStringSync(bytes);
    const restored: string = decoder.decodeToString(helper.decodeSync(encoded));
    expect(/^[A-Za-z0-9+/]+={0,2}$/.test(encoded)).assertTrue();
    expect(encoded.indexOf(' ')).assertEqual(-1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0181
   * @tc.name      testEncodeText0181
   * @tc.desc      Latin word café keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0181', 'latin café');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('café');
    expect(bytes.length).assertEqual(5);
    expect(bytes.length > 'café'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('Y2Fmw6k=');
    expect(decoder.decodeToString(bytes)).assertEqual('café');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0182
   * @tc.name      testEncodeText0182
   * @tc.desc      Latin word naïve keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0182', 'latin naïve');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('naïve');
    expect(bytes.length).assertEqual(6);
    expect(bytes.length > 'naïve'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('bmHDr3Zl');
    expect(decoder.decodeToString(bytes)).assertEqual('naïve');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0183
   * @tc.name      testEncodeText0183
   * @tc.desc      Latin word über keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0183', 'latin über');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('über');
    expect(bytes.length).assertEqual(5);
    expect(bytes.length > 'über'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('w7xiZXI=');
    expect(decoder.decodeToString(bytes)).assertEqual('über');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0184
   * @tc.name      testEncodeText0184
   * @tc.desc      Latin word señor keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0184', 'latin señor');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('señor');
    expect(bytes.length).assertEqual(6);
    expect(bytes.length > 'señor'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('c2XDsW9y');
    expect(decoder.decodeToString(bytes)).assertEqual('señor');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0185
   * @tc.name      testEncodeText0185
   * @tc.desc      Latin word déjà keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0185', 'latin déjà');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('déjà');
    expect(bytes.length).assertEqual(6);
    expect(bytes.length > 'déjà'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('ZMOpasOg');
    expect(decoder.decodeToString(bytes)).assertEqual('déjà');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0186
   * @tc.name      testEncodeText0186
   * @tc.desc      Latin word façade keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0186', 'latin façade');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('façade');
    expect(bytes.length).assertEqual(7);
    expect(bytes.length > 'façade'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('ZmHDp2FkZQ==');
    expect(decoder.decodeToString(bytes)).assertEqual('façade');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0187
   * @tc.name      testEncodeText0187
   * @tc.desc      Latin word résumé keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0187', 'latin résumé');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('résumé');
    expect(bytes.length).assertEqual(8);
    expect(bytes.length > 'résumé'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('csOpc3Vtw6k=');
    expect(decoder.decodeToString(bytes)).assertEqual('résumé');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0188
   * @tc.name      testEncodeText0188
   * @tc.desc      Latin word piñata keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0188', 'latin piñata');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('piñata');
    expect(bytes.length).assertEqual(7);
    expect(bytes.length > 'piñata'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('cGnDsWF0YQ==');
    expect(decoder.decodeToString(bytes)).assertEqual('piñata');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0189
   * @tc.name      testEncodeText0189
   * @tc.desc      Latin word coöperate keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0189', 'latin coöperate');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('coöperate');
    expect(bytes.length).assertEqual(10);
    expect(bytes.length > 'coöperate'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('Y2/DtnBlcmF0ZQ==');
    expect(decoder.decodeToString(bytes)).assertEqual('coöperate');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0190
   * @tc.name      testEncodeText0190
   * @tc.desc      Latin word jalapeño keeps multibyte bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0190', 'latin jalapeño');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const helper: util.Base64Helper = new util.Base64Helper();
    const bytes: Uint8Array = encoder.encodeInto('jalapeño');
    expect(bytes.length).assertEqual(9);
    expect(bytes.length > 'jalapeño'.length).assertTrue();
    expect(helper.encodeToStringSync(bytes)).assertEqual('amFsYXBlw7Fv');
    expect(decoder.decodeToString(bytes)).assertEqual('jalapeño');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0191
   * @tc.name      testEncodeText0191
   * @tc.desc      Hex round 1 keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0191', 'hex 1');
    const values: number[] = [1, 4];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0104');
    expect(hex.length).assertEqual(4);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(1);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0192
   * @tc.name      testEncodeText0192
   * @tc.desc      Hex round 2 keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0192', 'hex 2');
    const values: number[] = [2, 5, 8];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('020508');
    expect(hex.length).assertEqual(6);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(2);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0193
   * @tc.name      testEncodeText0193
   * @tc.desc      Hex round 3 keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0193', 'hex 3');
    const values: number[] = [3, 6, 9, 12];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0306090c');
    expect(hex.length).assertEqual(8);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(3);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0194
   * @tc.name      testEncodeText0194
   * @tc.desc      Hex round 4 keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0194', 'hex 4');
    const values: number[] = [4];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('04');
    expect(hex.length).assertEqual(2);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(4);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0195
   * @tc.name      testEncodeText0195
   * @tc.desc      Hex round 5 keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0195', 'hex 5');
    const values: number[] = [5, 8];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0508');
    expect(hex.length).assertEqual(4);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(5);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0196
   * @tc.name      testEncodeText0196
   * @tc.desc      Hex round 6 keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0196', 'hex 6');
    const values: number[] = [6, 9, 12];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('06090c');
    expect(hex.length).assertEqual(6);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(6);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0197
   * @tc.name      testEncodeText0197
   * @tc.desc      Hex round 7 keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0197', 'hex 7');
    const values: number[] = [7, 10, 13, 16];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('070a0d10');
    expect(hex.length).assertEqual(8);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(7);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0198
   * @tc.name      testEncodeText0198
   * @tc.desc      Hex round 8 keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0198', 'hex 8');
    const values: number[] = [8];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('08');
    expect(hex.length).assertEqual(2);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(8);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0199
   * @tc.name      testEncodeText0199
   * @tc.desc      Hex round 9 keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0199', 'hex 9');
    const values: number[] = [9, 12];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('090c');
    expect(hex.length).assertEqual(4);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(9);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0200
   * @tc.name      testEncodeText0200
   * @tc.desc      Hex round 10 keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0200', 'hex 10');
    const values: number[] = [10, 13, 16];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0a0d10');
    expect(hex.length).assertEqual(6);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(10);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0201
   * @tc.name      testEncodeText0201
   * @tc.desc      Hex round 11 keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0201', 'hex 11');
    const values: number[] = [11, 14, 17, 20];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0b0e1114');
    expect(hex.length).assertEqual(8);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(11);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0202
   * @tc.name      testEncodeText0202
   * @tc.desc      Hex round 12 keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0202', 'hex 12');
    const values: number[] = [12];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0c');
    expect(hex.length).assertEqual(2);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(12);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0203
   * @tc.name      testEncodeText0203
   * @tc.desc      Hex round 13 keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0203', 'hex 13');
    const values: number[] = [13, 16];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0d10');
    expect(hex.length).assertEqual(4);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(13);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0204
   * @tc.name      testEncodeText0204
   * @tc.desc      Hex round 14 keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0204', 'hex 14');
    const values: number[] = [14, 17, 20];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0e1114');
    expect(hex.length).assertEqual(6);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(14);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0205
   * @tc.name      testEncodeText0205
   * @tc.desc      Hex round 15 keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0205', 'hex 15');
    const values: number[] = [15, 18, 21, 24];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('0f121518');
    expect(hex.length).assertEqual(8);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(15);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0206
   * @tc.name      testEncodeText0206
   * @tc.desc      Hex round 16 keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0206', 'hex 16');
    const values: number[] = [16];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('10');
    expect(hex.length).assertEqual(2);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(16);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0207
   * @tc.name      testEncodeText0207
   * @tc.desc      Hex round 17 keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0207', 'hex 17');
    const values: number[] = [17, 20];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('1114');
    expect(hex.length).assertEqual(4);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(17);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0208
   * @tc.name      testEncodeText0208
   * @tc.desc      Hex round 18 keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0208', 'hex 18');
    const values: number[] = [18, 21, 24];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('121518');
    expect(hex.length).assertEqual(6);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(18);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0209
   * @tc.name      testEncodeText0209
   * @tc.desc      Hex round 19 keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0209', 'hex 19');
    const values: number[] = [19, 22, 25, 28];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('1316191c');
    expect(hex.length).assertEqual(8);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(19);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0210
   * @tc.name      testEncodeText0210
   * @tc.desc      Hex round 20 keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0210', 'hex 20');
    const values: number[] = [20];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('14');
    expect(hex.length).assertEqual(2);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(20);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0211
   * @tc.name      testEncodeText0211
   * @tc.desc      Hex round 21 keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0211', 'hex 21');
    const values: number[] = [21, 24];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('1518');
    expect(hex.length).assertEqual(4);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(21);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0212
   * @tc.name      testEncodeText0212
   * @tc.desc      Hex round 22 keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEncodeText0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEncodeText0212', 'hex 22');
    const values: number[] = [22, 25, 28];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('16191c');
    expect(hex.length).assertEqual(6);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(22);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0213
   * @tc.name      testEncodeText0213
   * @tc.desc      Hex round 23 keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEncodeText0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEncodeText0213', 'hex 23');
    const values: number[] = [23, 26, 29, 32];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('171a1d20');
    expect(hex.length).assertEqual(8);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(23);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_ENC_0214
   * @tc.name      testEncodeText0214
   * @tc.desc      Hex round 24 keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEncodeText0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEncodeText0214', 'hex 24');
    const values: number[] = [24];
    let hex: string = '';
    for (let i: number = 0; i < values.length; i++) {
      const part: string = values[i].toString(16);
      hex += part.length === 1 ? '0' + part : part;
    }
    expect(hex).assertEqual('18');
    expect(hex.length).assertEqual(2);
    const back: number = parseInt(hex.substring(0, 2), 16);
    expect(back).assertEqual(24);
    expect(hex.split('').every((c: string) => '0123456789abcdef'.includes(c))).assertTrue();
  });
  });
}
