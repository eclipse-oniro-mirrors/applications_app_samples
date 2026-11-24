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
import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import { entryContext, PngOracle } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

function bytesToText(bytes: Uint8Array): string {
  const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
  return decoder.decodeToString(bytes);
}

export default function harMediaMatrixTest() {
  describe('harMediaMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0001
   * @tc.name      testHarMedia0001
   * @tc.desc      Media background keeps byte 0
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0001', 'background offset 0');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[0]).assertEqual(137);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0002
   * @tc.name      testHarMedia0002
   * @tc.desc      Media background keeps byte 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0002', 'background offset 1');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[1]).assertEqual(80);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0003
   * @tc.name      testHarMedia0003
   * @tc.desc      Media background keeps byte 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0003', 'background offset 2');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[2]).assertEqual(78);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0004
   * @tc.name      testHarMedia0004
   * @tc.desc      Media background keeps byte 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0004', 'background offset 3');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[3]).assertEqual(71);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0005
   * @tc.name      testHarMedia0005
   * @tc.desc      Media background keeps byte 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0005', 'background offset 4');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[4]).assertEqual(13);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0006
   * @tc.name      testHarMedia0006
   * @tc.desc      Media background keeps byte 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0006', 'background offset 5');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[5]).assertEqual(10);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0007
   * @tc.name      testHarMedia0007
   * @tc.desc      Media background keeps byte 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0007', 'background offset 6');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[6]).assertEqual(26);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0008
   * @tc.name      testHarMedia0008
   * @tc.desc      Media background keeps byte 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0008', 'background offset 7');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[7]).assertEqual(10);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0009
   * @tc.name      testHarMedia0009
   * @tc.desc      Media background keeps byte 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0009', 'background offset 12');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[12]).assertEqual(73);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0010
   * @tc.name      testHarMedia0010
   * @tc.desc      Media background keeps byte 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0010', 'background offset 13');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[13]).assertEqual(72);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0011
   * @tc.name      testHarMedia0011
   * @tc.desc      Media background keeps byte 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0011', 'background offset 14');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[14]).assertEqual(68);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0012
   * @tc.name      testHarMedia0012
   * @tc.desc      Media background keeps byte 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0012', 'background offset 15');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[15]).assertEqual(82);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0013
   * @tc.name      testHarMedia0013
   * @tc.desc      Media background keeps byte 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0013', 'background offset 16');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[16]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0014
   * @tc.name      testHarMedia0014
   * @tc.desc      Media background keeps byte 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0014', 'background offset 17');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[17]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0015
   * @tc.name      testHarMedia0015
   * @tc.desc      Media background keeps byte 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0015', 'background offset 18');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[18]).assertEqual(4);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0016
   * @tc.name      testHarMedia0016
   * @tc.desc      Media background keeps byte 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0016', 'background offset 19');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[19]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0017
   * @tc.name      testHarMedia0017
   * @tc.desc      Media background keeps byte 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0017', 'background offset 20');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[20]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0018
   * @tc.name      testHarMedia0018
   * @tc.desc      Media background keeps byte 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0018', 'background offset 21');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[21]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0019
   * @tc.name      testHarMedia0019
   * @tc.desc      Media background keeps byte 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0019', 'background offset 22');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[22]).assertEqual(4);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0020
   * @tc.name      testHarMedia0020
   * @tc.desc      Media background keeps byte 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0020', 'background offset 23');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(bytes.length).assertEqual(91942);
    expect(bytes[23]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(1024);
    expect(PngOracle.height(bytes)).assertEqual(1024);
  });




  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0050
   * @tc.name      testHarMedia0050
   * @tc.desc      Media startIcon keeps byte 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0050', 'startIcon offset 13');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[13]).assertEqual(72);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0051
   * @tc.name      testHarMedia0051
   * @tc.desc      Media startIcon keeps byte 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0051', 'startIcon offset 14');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[14]).assertEqual(68);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0052
   * @tc.name      testHarMedia0052
   * @tc.desc      Media startIcon keeps byte 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0052', 'startIcon offset 15');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[15]).assertEqual(82);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0053
   * @tc.name      testHarMedia0053
   * @tc.desc      Media startIcon keeps byte 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0053', 'startIcon offset 16');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[16]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0054
   * @tc.name      testHarMedia0054
   * @tc.desc      Media startIcon keeps byte 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0054', 'startIcon offset 17');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[17]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0055
   * @tc.name      testHarMedia0055
   * @tc.desc      Media startIcon keeps byte 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0055', 'startIcon offset 18');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[18]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0056
   * @tc.name      testHarMedia0056
   * @tc.desc      Media startIcon keeps byte 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0056', 'startIcon offset 19');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[19]).assertEqual(144);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0057
   * @tc.name      testHarMedia0057
   * @tc.desc      Media startIcon keeps byte 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0057', 'startIcon offset 20');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[20]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
    expect(PngOracle.height(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0058
   * @tc.name      testHarMedia0058
   * @tc.desc      Media startIcon keeps byte 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0058', 'startIcon offset 21');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[21]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
    expect(PngOracle.height(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0059
   * @tc.name      testHarMedia0059
   * @tc.desc      Media startIcon keeps byte 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0059', 'startIcon offset 22');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[22]).assertEqual(0);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
    expect(PngOracle.height(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0060
   * @tc.name      testHarMedia0060
   * @tc.desc      Media startIcon keeps byte 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0060', 'startIcon offset 23');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(bytes.length).assertEqual(20093);
    expect(bytes[23]).assertEqual(144);
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
    expect(PngOracle.width(bytes)).assertEqual(144);
    expect(PngOracle.height(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0061
   * @tc.name      testHarMedia0061
   * @tc.desc      Media background keeps size repeats
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0061', 'background size repeats');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const first: Uint8Array = res.getMediaByNameSync('background');
    const second: Uint8Array = res.getMediaByNameSync('background');
    expect(second.length).assertEqual(first.length);
    expect(first[0]).assertEqual(second[0]);
    expect(first[first.length - 1]).assertEqual(second[first.length - 1]);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0062
   * @tc.name      testHarMedia0062
   * @tc.desc      Media background keeps squared canvas
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0062', 'background squared canvas');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(PngOracle.width(bytes)).assertEqual(PngOracle.height(bytes));
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0063
   * @tc.name      testHarMedia0063
   * @tc.desc      Media background keeps positive canvas
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0063', 'background positive canvas');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(PngOracle.width(bytes) > 0).assertTrue();
    expect(PngOracle.height(bytes) > 0).assertTrue();
    expect(PngOracle.width(bytes) <= 2048).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0064
   * @tc.name      testHarMedia0064
   * @tc.desc      Media background keeps chunk sits early
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0064', 'background chunk sits early');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('background');
    expect(String.fromCharCode(bytes[8], bytes[9], bytes[10], bytes[11])).assertEqual(String.fromCharCode(0, 0, 0, 13));
    expect(bytes.length > 100).assertTrue();
  });


  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0066
   * @tc.name      testHarMedia0066
   * @tc.desc      Media background keeps two calls equal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0066', 'background two calls equal');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const left: Uint8Array = res.getMediaByNameSync('background');
    const right: Uint8Array = res.getMediaByNameSync('background');
    expect(left.length === right.length).assertTrue();
    expect(left[16] === right[16] && left[20] === right[20]).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0067
   * @tc.name      testHarMedia0067
   * @tc.desc      Media foreground keeps size repeats
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0067', 'foreground size repeats');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const first: Uint8Array = res.getMediaByNameSync('foreground');
    const second: Uint8Array = res.getMediaByNameSync('foreground');
    expect(second.length).assertEqual(first.length);
    expect(first[0]).assertEqual(second[0]);
    expect(first[first.length - 1]).assertEqual(second[first.length - 1]);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0068
   * @tc.name      testHarMedia0068
   * @tc.desc      Media foreground keeps squared canvas
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0068', 'foreground squared canvas');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.width(bytes)).assertEqual(PngOracle.height(bytes));
    expect(PngOracle.width(bytes)).assertEqual(1024);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0069
   * @tc.name      testHarMedia0069
   * @tc.desc      Media foreground keeps positive canvas
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0069', 'foreground positive canvas');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.width(bytes) > 0).assertTrue();
    expect(PngOracle.height(bytes) > 0).assertTrue();
    expect(PngOracle.width(bytes) <= 2048).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0070
   * @tc.name      testHarMedia0070
   * @tc.desc      Media foreground keeps chunk sits early
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0070', 'foreground chunk sits early');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('foreground');
    expect(String.fromCharCode(bytes[8], bytes[9], bytes[10], bytes[11])).assertEqual(String.fromCharCode(0, 0, 0, 13));
    expect(bytes.length > 100).assertTrue();
  });



  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0072
   * @tc.name      testHarMedia0072
   * @tc.desc      Media foreground keeps two calls equal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0072', 'foreground two calls equal');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const left: Uint8Array = res.getMediaByNameSync('foreground');
    const right: Uint8Array = res.getMediaByNameSync('foreground');
    expect(left.length === right.length).assertTrue();
    expect(left[16] === right[16] && left[20] === right[20]).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0073
   * @tc.name      testHarMedia0073
   * @tc.desc      Media startIcon keeps size repeats
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0073', 'startIcon size repeats');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const first: Uint8Array = res.getMediaByNameSync('startIcon');
    const second: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(second.length).assertEqual(first.length);
    expect(first[0]).assertEqual(second[0]);
    expect(first[first.length - 1]).assertEqual(second[first.length - 1]);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0074
   * @tc.name      testHarMedia0074
   * @tc.desc      Media startIcon keeps squared canvas
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0074', 'startIcon squared canvas');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(PngOracle.width(bytes)).assertEqual(PngOracle.height(bytes));
    expect(PngOracle.width(bytes)).assertEqual(144);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0075
   * @tc.name      testHarMedia0075
   * @tc.desc      Media startIcon keeps positive canvas
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0075', 'startIcon positive canvas');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(PngOracle.width(bytes) > 0).assertTrue();
    expect(PngOracle.height(bytes) > 0).assertTrue();
    expect(PngOracle.width(bytes) <= 2048).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0076
   * @tc.name      testHarMedia0076
   * @tc.desc      Media startIcon keeps chunk sits early
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0076', 'startIcon chunk sits early');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const bytes: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(String.fromCharCode(bytes[8], bytes[9], bytes[10], bytes[11])).assertEqual(String.fromCharCode(0, 0, 0, 13));
    expect(bytes.length > 100).assertTrue();
  });



  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0078
   * @tc.name      testHarMedia0078
   * @tc.desc      Media startIcon keeps two calls equal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0078', 'startIcon two calls equal');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const left: Uint8Array = res.getMediaByNameSync('startIcon');
    const right: Uint8Array = res.getMediaByNameSync('startIcon');
    expect(left.length === right.length).assertTrue();
    expect(left[16] === right[16] && left[20] === right[20]).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0079
   * @tc.name      testHarMedia0079
   * @tc.desc      Layered icon layered file parses
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0079', 'layered layered file parses');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = bytesToText(res.getMediaByNameSync('layered_image'));
    const doc: object = JSON.parse(text) as object;
    expect(doc !== undefined).assertTrue();
  });



  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0081
   * @tc.name      testHarMedia0081
   * @tc.desc      Layered icon layered json braces balance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0081', 'layered layered json braces balance');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = bytesToText(res.getMediaByNameSync('layered_image'));
    expect(text.split('{').length).assertEqual(3);
    expect(text.split('}').length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0082
   * @tc.name      testHarMedia0082
   * @tc.desc      Layered icon layered ordering
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarMedia0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarMedia0082', 'layered layered ordering');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = bytesToText(res.getMediaByNameSync('layered_image'));
    expect(text.indexOf('background') < text.indexOf('foreground')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0083
   * @tc.name      testHarMedia0083
   * @tc.desc      Layered icon layered quotes balanced
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarMedia0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarMedia0083', 'layered layered quotes balanced');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = bytesToText(res.getMediaByNameSync('layered_image'));
    expect(text.split('"').length % 2).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARMED_0084
   * @tc.name      testHarMedia0084
   * @tc.desc      Layered icon layered no trailing comma
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarMedia0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarMedia0084', 'layered layered no trailing comma');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = bytesToText(res.getMediaByNameSync('layered_image'));
    expect(text.trim().endsWith('}')).assertTrue();
  });
  });
}
