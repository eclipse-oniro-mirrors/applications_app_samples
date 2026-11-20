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
   * @tc.number    SUB_BMS_MULTIINSTANCE_LJSON_0001
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_LJSON_0002
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_LJSON_0003
   * @tc.name      testLayeredJson0003
   * @tc.desc      Layered json check background literal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testLayeredJson0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testLayeredJson0003', 'layered json 3');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    expect(layered['background']).assertEqual('$media:background');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_LJSON_0004
   * @tc.name      testLayeredJson0004
   * @tc.desc      Layered json check foreground literal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testLayeredJson0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testLayeredJson0004', 'layered json 4');
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const decoder: util.TextDecoder = new util.TextDecoder('utf-8');
    const text: string = decoder.decodeToString(bytes);
    const doc: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
    const groups: string[] = Object.keys(doc);
    const layered: Record<string, string> = doc['layered-image'] as Record<string, string>;
    expect(layered['foreground']).assertEqual('$media:foreground');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_LJSON_0005
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
