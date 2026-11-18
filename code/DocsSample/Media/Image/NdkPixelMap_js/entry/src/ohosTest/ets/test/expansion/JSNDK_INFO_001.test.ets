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
import { testGetImageInfo } from 'libentry.so';
import { finishCleanupAsync, FixtureScope, PixelSpec, pixelBytes } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_JSNDK_INFO_001
 * @tc.name EXP_JSNDK_INFO_001
 * @tc.desc 6x4 alpha-checker format 3: native undefined and unchanged metadata/pixel snapshot after info.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'JSNDK_INFO_001');
    let primaryFailed1: boolean = true;
    try {
      const pixelMap = await scope.pattern(new PixelSpec(6,
        4,
        'alpha-checker',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.PREMUL));
      const beforeInfo = await pixelMap.getImageInfo();
      expect(beforeInfo.size.width).assertEqual(6);
      expect(beforeInfo.size.height).assertEqual(4);
      expect(beforeInfo.pixelFormat).assertEqual(3);
      expect(beforeInfo.alphaType).assertEqual(image.AlphaType.PREMUL);
      const beforeBytes = await pixelBytes(pixelMap);
      expect(typeof testGetImageInfo(pixelMap)).assertEqual('undefined');
      const afterInfo = await pixelMap.getImageInfo();
      expect(afterInfo.size.width).assertEqual(beforeInfo.size.width);
      expect(afterInfo.size.height).assertEqual(beforeInfo.size.height);
      expect(afterInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterInfo.alphaType).assertEqual(beforeInfo.alphaType);
      const afterBytes = await pixelBytes(pixelMap);
      expect(afterBytes.length).assertEqual(beforeBytes.length);
      let mismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (beforeBytes[i] !== afterBytes[i]) {
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
