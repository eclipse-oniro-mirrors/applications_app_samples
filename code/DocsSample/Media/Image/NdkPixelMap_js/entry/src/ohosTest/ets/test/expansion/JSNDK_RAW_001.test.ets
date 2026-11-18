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

import { expect } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { getSyncPixelMap } from 'libentry.so';
import { finishCleanupAsync,
  FixtureScope,
  decodeRawReference,
  packSdk,
  decodeSdk,
  pixelBytes } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_JSNDK_RAW_001
 * @tc.name EXP_JSNDK_RAW_001
 * @tc.desc Decode existing 700x700 raw JPEG through real ResourceManager; compare normalized SDK first frame.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const context = appContext.createModuleContext('entry');
    const scope = new FixtureScope(context, 'JSNDK_RAW_001');
    let primaryFailed1: boolean = true;
    try {
      const rawBytes = await context.resourceManager.getRawFileContent('example.jpg');
      expect(rawBytes.byteLength).assertEqual(291024);
      const pixelMap: image.PixelMap = scope.own(getSyncPixelMap(context.resourceManager, 'example.jpg'));
      const info = await pixelMap.getImageInfo();
      expect(info.size.width).assertEqual(700);
      expect(info.size.height).assertEqual(700);
      const reference = scope.own(await decodeRawReference(context));
      const referenceInfo = await reference.getImageInfo();
      expect(info.size.width).assertEqual(referenceInfo.size.width);
      expect(info.size.height).assertEqual(referenceInfo.size.height);
      // Same SDK lossless round trip normalizes channel layout for both decoders.
      const nativeRgba = scope.own(await decodeSdk(await packSdk(pixelMap, 'image/png')));
      const referenceRgba = scope.own(await decodeSdk(await packSdk(reference, 'image/png')));
      const actual = await pixelBytes(nativeRgba);
      const expected = await pixelBytes(referenceRgba);
      expect(actual.length).assertEqual(expected.length);
      let mismatches: number = 0;
      for (let i = 0; i < expected.length; i++) {
        if (actual[i] !== expected[i]) {
          mismatches++;
        }
      }
      expect(mismatches).assertEqual(0);
      primaryFailed1 = false;
    } finally {
      await finishCleanupAsync(primaryFailed1, async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
