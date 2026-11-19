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
import { transform } from 'libentry.so';
import { finishCleanupAsync,
  FixtureScope,
  pixelBytes,
  packSdk,
  decodeSdk,
  PixelSpec } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_JSNDK_TRANSFORM_003
 * @tc.name EXP_JSNDK_TRANSFORM_003
 * @tc.desc Real fixed transform chain on legal editable 304x640 format 3 input; 100x100 readable and encodable result.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'JSNDK_TRANSFORM_003');
    let primaryFailed1: boolean = true;
    try {
      const pixelMap: image.PixelMap = await scope.pattern(new PixelSpec(304,
        640,
        'row-ramp',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.OPAQUE));
      const before = await pixelMap.getImageInfo();
      expect(before.size.width).assertEqual(304);
      expect(before.size.height).assertEqual(640);
      expect(before.pixelFormat).assertEqual(3);
      expect(typeof transform(pixelMap)).assertEqual('undefined');
      const info = await pixelMap.getImageInfo();
      expect(info.size.width).assertEqual(100);
      expect(info.size.height).assertEqual(100);
      const bytes = await pixelBytes(pixelMap);
      expect(bytes.length).assertEqual(100 * 100 * 4);
      // Fixed translation/crop may produce black pixels; nonzero is not an oracle.
      const decoded = scope.own(await decodeSdk(await packSdk(pixelMap, 'image/png')));
      const decodedInfo = await decoded.getImageInfo();
      expect(decodedInfo.size.width).assertEqual(100);
      expect(decodedInfo.size.height).assertEqual(100);
      primaryFailed1 = false;
    } finally {
      await finishCleanupAsync(primaryFailed1, async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
