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
import ImageEffect from 'libentry.so';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { FixtureSpec, FixtureScope, decodeFileReference, normalizePixels, jpegReference, isJpegFile,
  awaitJpegOutput } from './fixtures/ImageEffectFixture';
import { assertSize, assertPixelsClose } from './fixtures/ImageEffectAssertions';
import { CleanupGuard } from './fixtures/ImageEffectCleanup';

/**
 * @tc.number EXP_EFFECT_CHAIN_007
 * @tc.name EXP_EFFECT_CHAIN_007
 * @tc.desc 有向滤镜顺序、饱和非交换性、连续裁剪; {"pathFixture": {"id": "chainBands", "format": "image/png", "width": 64, "height": 64, "pattern": "large-opaque-gray-bands", "grayValues": [0, 32, 128, 224, 255]}, "filterOptions": [["Brightness", 0], ["Contrast", 0]], "caseId": "EFFECT_CHAIN_007"}
 * @tc.level Level 1
 * Use a physical test device. Call native APIs serially; do not create UI or render targets concurrently.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'EFFECT_CHAIN_007');
    try {
      const spec = new FixtureSpec(64, 64, 'large-opaque-gray-bands', 'image/png', [128, 128, 128, 255], [0,
        64, 128, 255], 100);
      const file = await scope.createFile(spec, 'input.png');
      const reference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const original = await normalizePixels(reference);
      assertSize(original, 64, 64);
      const options: (string | number)[][] = [['Brightness', 0], ['Contrast', 0]];
      scope.restore(file);
      const result: boolean = ImageEffect.PixelMapFilterStart(file.path, options);
      expect(result).assertTrue();
      const output = scope.ownPixelMap(await awaitJpegOutput(file.path));
      expect(isJpegFile(file.path)).assertTrue();
      const actual = await normalizePixels(output);
      assertSize(actual, 64, 64);
      const encodedReference = scope.ownPixelMap(await jpegReference(reference));
      const expected = await normalizePixels(encodedReference);
      assertPixelsClose(actual, expected, 3);
    } catch (primaryError1) {
      cleanupGuard1.primaryFailed = true;
      throw primaryError1 as Error;
    } finally {
      await cleanupGuard1.run(async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
