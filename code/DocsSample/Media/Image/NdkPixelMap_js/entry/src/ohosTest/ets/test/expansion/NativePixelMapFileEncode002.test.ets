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
import { EncodeImagesToFile } from 'libentry.so';
import { finishCleanupAsync,
  FixtureScope,
  PixelSpec,
  withNativeJpeg,
  readCompleteJpeg } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_JSNDK_FILE_002
 * @tc.name EXP_JSNDK_FILE_002
 * @tc.desc Native JPEG encoding from 透明PNG解码; fresh complete SOI/EOI JPEG decodes at 13x17; fixed output cleaned.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'JSNDK_FILE_002');
    let primaryFailed1: boolean = true;
    try {
      const input = await scope.input(new PixelSpec(13,
        17,
        'alpha-checker',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.PREMUL),
        'image/png');
      const pixelMap = await scope.decode(input);
      const inputInfo = await pixelMap.getImageInfo();
      expect(inputInfo.size.width).assertEqual(13);
      expect(inputInfo.size.height).assertEqual(17);
      await withNativeJpeg(context, async (path: string): Promise<void> => {
        // Native opens/closes the fixed output FD synchronously. Do not infer success from return.
        EncodeImagesToFile(pixelMap);
        const decoded = scope.own(await readCompleteJpeg(path));
        const resultInfo = await decoded.getImageInfo();
        expect(resultInfo.size.width).assertEqual(inputInfo.size.width);
        expect(resultInfo.size.height).assertEqual(inputInfo.size.height);
      });
      primaryFailed1 = false;
    } finally {
      await finishCleanupAsync(primaryFailed1, async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
