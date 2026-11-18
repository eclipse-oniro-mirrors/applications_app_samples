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
import { createPixelMapTest } from 'libentry.so';
import { finishCleanupAsync, FixtureScope, pixelBytes, packSdk, decodeSdk } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_JSNDK_CREATE_001
 * @tc.name EXP_JSNDK_CREATE_001
 * @tc.desc Native fixed creation yields readable 500x500 BGRA PixelMap and valid lossless SDK round trip.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'JSNDK_CREATE_001');
    let primaryFailed1: boolean = true;
    try {
      const pixelMap: image.PixelMap = scope.own(createPixelMapTest());
      const info = await pixelMap.getImageInfo();
      expect(info.size.width).assertEqual(500);
      expect(info.size.height).assertEqual(500);
      expect(info.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
      const bytes = await pixelBytes(pixelMap);
      expect(bytes.length).assertEqual(500 * 500 * 4);
      // Native UNKNOWN alpha may be normalized by SDK; do not invent an alpha oracle.
      const decoded = scope.own(await decodeSdk(await packSdk(pixelMap, 'image/png')));
      const decodedInfo = await decoded.getImageInfo();
      expect(decodedInfo.size.width).assertEqual(500);
      expect(decodedInfo.size.height).assertEqual(500);
      primaryFailed1 = false;
    } finally {
      await finishCleanupAsync(primaryFailed1, async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
