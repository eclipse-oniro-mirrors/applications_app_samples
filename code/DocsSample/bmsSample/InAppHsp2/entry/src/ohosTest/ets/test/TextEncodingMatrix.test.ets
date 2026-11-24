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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function encodingMatrixTest() {
  describe('EncodingMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0001
     * @tc.name      testEncoding0001
     * @tc.desc      Encode and decode token alpha
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-alpha-0');
      logCase('testEncoding0001', 'encode alpha bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-alpha-0');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('alpha')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0002
     * @tc.name      testEncoding0002
     * @tc.desc      Encode and decode token bravo
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-bravo-1');
      logCase('testEncoding0002', 'encode bravo bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-bravo-1');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('bravo')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0003
     * @tc.name      testEncoding0003
     * @tc.desc      Encode and decode token charlie
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-charlie-2');
      logCase('testEncoding0003', 'encode charlie bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-charlie-2');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('charlie')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0004
     * @tc.name      testEncoding0004
     * @tc.desc      Encode and decode token delta
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-delta-3');
      logCase('testEncoding0004', 'encode delta bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-delta-3');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('delta')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0005
     * @tc.name      testEncoding0005
     * @tc.desc      Encode and decode token echo
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-echo-4');
      logCase('testEncoding0005', 'encode echo bytes ' + bytes.length);
      expect(bytes.length).assertEqual(11);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-echo-4');
      expect(back.length).assertEqual(11);
      expect(back.indexOf('echo')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0006
     * @tc.name      testEncoding0006
     * @tc.desc      Encode and decode token foxtrot
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-foxtrot-5');
      logCase('testEncoding0006', 'encode foxtrot bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-foxtrot-5');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('foxtrot')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0007
     * @tc.name      testEncoding0007
     * @tc.desc      Encode and decode token golf
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-golf-6');
      logCase('testEncoding0007', 'encode golf bytes ' + bytes.length);
      expect(bytes.length).assertEqual(11);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-golf-6');
      expect(back.length).assertEqual(11);
      expect(back.indexOf('golf')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0008
     * @tc.name      testEncoding0008
     * @tc.desc      Encode and decode token hotel
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-hotel-7');
      logCase('testEncoding0008', 'encode hotel bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-hotel-7');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('hotel')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0009
     * @tc.name      testEncoding0009
     * @tc.desc      Encode and decode token india
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-india-8');
      logCase('testEncoding0009', 'encode india bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-india-8');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('india')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0010
     * @tc.name      testEncoding0010
     * @tc.desc      Encode and decode token juliet
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-juliet-9');
      logCase('testEncoding0010', 'encode juliet bytes ' + bytes.length);
      expect(bytes.length).assertEqual(13);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-juliet-9');
      expect(back.length).assertEqual(13);
      expect(back.indexOf('juliet')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0011
     * @tc.name      testEncoding0011
     * @tc.desc      Encode and decode token kilo
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-kilo-10');
      logCase('testEncoding0011', 'encode kilo bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-kilo-10');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('kilo')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0012
     * @tc.name      testEncoding0012
     * @tc.desc      Encode and decode token lima
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-lima-11');
      logCase('testEncoding0012', 'encode lima bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-lima-11');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('lima')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0013
     * @tc.name      testEncoding0013
     * @tc.desc      Encode and decode token mike
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-mike-12');
      logCase('testEncoding0013', 'encode mike bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-mike-12');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('mike')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0014
     * @tc.name      testEncoding0014
     * @tc.desc      Encode and decode token november
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-november-13');
      logCase('testEncoding0014', 'encode november bytes ' + bytes.length);
      expect(bytes.length).assertEqual(16);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-november-13');
      expect(back.length).assertEqual(16);
      expect(back.indexOf('november')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0015
     * @tc.name      testEncoding0015
     * @tc.desc      Encode and decode token oscar
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-oscar-14');
      logCase('testEncoding0015', 'encode oscar bytes ' + bytes.length);
      expect(bytes.length).assertEqual(13);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-oscar-14');
      expect(back.length).assertEqual(13);
      expect(back.indexOf('oscar')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0016
     * @tc.name      testEncoding0016
     * @tc.desc      Encode and decode token papa
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-papa-15');
      logCase('testEncoding0016', 'encode papa bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-papa-15');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('papa')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0017
     * @tc.name      testEncoding0017
     * @tc.desc      Encode and decode token quebec
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-quebec-16');
      logCase('testEncoding0017', 'encode quebec bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-quebec-16');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('quebec')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0018
     * @tc.name      testEncoding0018
     * @tc.desc      Encode and decode token romeo
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-romeo-17');
      logCase('testEncoding0018', 'encode romeo bytes ' + bytes.length);
      expect(bytes.length).assertEqual(13);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-romeo-17');
      expect(back.length).assertEqual(13);
      expect(back.indexOf('romeo')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0019
     * @tc.name      testEncoding0019
     * @tc.desc      Encode and decode token sierra
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-sierra-18');
      logCase('testEncoding0019', 'encode sierra bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-sierra-18');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('sierra')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0020
     * @tc.name      testEncoding0020
     * @tc.desc      Encode and decode token tango
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-tango-19');
      logCase('testEncoding0020', 'encode tango bytes ' + bytes.length);
      expect(bytes.length).assertEqual(13);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-tango-19');
      expect(back.length).assertEqual(13);
      expect(back.indexOf('tango')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0021
     * @tc.name      testEncoding0021
     * @tc.desc      Encode and decode token uniform
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-uniform-20');
      logCase('testEncoding0021', 'encode uniform bytes ' + bytes.length);
      expect(bytes.length).assertEqual(15);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-uniform-20');
      expect(back.length).assertEqual(15);
      expect(back.indexOf('uniform')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0022
     * @tc.name      testEncoding0022
     * @tc.desc      Encode and decode token victor
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-victor-21');
      logCase('testEncoding0022', 'encode victor bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-victor-21');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('victor')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0023
     * @tc.name      testEncoding0023
     * @tc.desc      Encode and decode token whiskey
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-whiskey-22');
      logCase('testEncoding0023', 'encode whiskey bytes ' + bytes.length);
      expect(bytes.length).assertEqual(15);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-whiskey-22');
      expect(back.length).assertEqual(15);
      expect(back.indexOf('whiskey')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0024
     * @tc.name      testEncoding0024
     * @tc.desc      Encode and decode token xray
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-xray-23');
      logCase('testEncoding0024', 'encode xray bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-xray-23');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('xray')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0025
     * @tc.name      testEncoding0025
     * @tc.desc      Encode and decode token yankee
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-yankee-24');
      logCase('testEncoding0025', 'encode yankee bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-yankee-24');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('yankee')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0026
     * @tc.name      testEncoding0026
     * @tc.desc      Encode and decode token zulu
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-zulu-25');
      logCase('testEncoding0026', 'encode zulu bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-zulu-25');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('zulu')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0027
     * @tc.name      testEncoding0027
     * @tc.desc      Encode and decode token amber
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-amber-26');
      logCase('testEncoding0027', 'encode amber bytes ' + bytes.length);
      expect(bytes.length).assertEqual(13);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-amber-26');
      expect(back.length).assertEqual(13);
      expect(back.indexOf('amber')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0028
     * @tc.name      testEncoding0028
     * @tc.desc      Encode and decode token basalt
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-basalt-27');
      logCase('testEncoding0028', 'encode basalt bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-basalt-27');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('basalt')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0029
     * @tc.name      testEncoding0029
     * @tc.desc      Encode and decode token cobalt
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-cobalt-28');
      logCase('testEncoding0029', 'encode cobalt bytes ' + bytes.length);
      expect(bytes.length).assertEqual(14);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-cobalt-28');
      expect(back.length).assertEqual(14);
      expect(back.indexOf('cobalt')).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ENC_0030
     * @tc.name      testEncoding0030
     * @tc.desc      Encode and decode token dune
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testEncoding0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
      const bytes: Uint8Array = encoder.encodeInto('text-dune-29');
      logCase('testEncoding0030', 'encode dune bytes ' + bytes.length);
      expect(bytes.length).assertEqual(12);
      const back: string = decoder.decodeToString(bytes);
      expect(back).assertEqual('text-dune-29');
      expect(back.length).assertEqual(12);
      expect(back.indexOf('dune')).assertEqual(5);
    });
;
  });
}
