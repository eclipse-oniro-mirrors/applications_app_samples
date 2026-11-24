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
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { selfBundle, entryResources } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function layeredJsonMatrixTest() {
  describe('layeredJsonMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0001
   * @tc.name      testLayeredJson0001
   * @tc.desc      Layered json check root key count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredJson0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredJson0001', 'layered json 1');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    expect(groups.length).assertEqual(1);
    expect(groups[0]).assertEqual('layered-image');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0002
   * @tc.name      testLayeredJson0002
   * @tc.desc      Layered json check ref keys
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLayeredJson0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLayeredJson0002', 'layered json 2');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    const refs: string[] = Object.keys(layered);
    expect(refs.length).assertEqual(2);
    expect(refs.includes('background')).assertTrue();
    expect(refs.includes('foreground')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0005
   * @tc.name      testLayeredJson0005
   * @tc.desc      Layered json check media prefix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLayeredJson0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLayeredJson0005', 'layered json 5');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    expect(layered['background'].startsWith('$media:')).assertTrue();
    expect(layered['foreground'].startsWith('$media:')).assertTrue();
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0007
   * @tc.name      testLayeredJson0007
   * @tc.desc      Layered json check colon split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredJson0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredJson0007', 'layered json 7');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    expect(layered['background'].split(':').length).assertEqual(2);
    expect(layered['foreground'].split(':').length).assertEqual(2);
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0011
   * @tc.name      testLayeredJson0011
   * @tc.desc      Layered json check text braces
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLayeredJson0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLayeredJson0011', 'layered json 11');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    expect(text.trim().startsWith('{')).assertTrue();
    expect(text.trim().endsWith('}')).assertTrue();
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0013
   * @tc.name      testLayeredJson0013
   * @tc.desc      Layered json check text mentions key
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredJson0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredJson0013', 'layered json 13');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    expect(text.indexOf('layered-image') >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0014
   * @tc.name      testLayeredJson0014
   * @tc.desc      Layered json check sorted ref names
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testLayeredJson0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testLayeredJson0014', 'layered json 14');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    const names: string[] = Object.keys(layered);
    names.sort();
    expect(names.join(',')).assertEqual('background,foreground');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0015
   * @tc.name      testLayeredJson0015
   * @tc.desc      Layered json check distinct values
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLayeredJson0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLayeredJson0015', 'layered json 15');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    expect(layered['background'] === layered['foreground']).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_LJSON_0016
   * @tc.name      testLayeredJson0016
   * @tc.desc      Layered json check first ref name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredJson0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredJson0016', 'layered json 16');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    expect(Object.keys(layered)[0]).assertEqual('background');
  });
  });
}
