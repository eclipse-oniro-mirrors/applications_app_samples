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
import { assertSize, meanDifference, assertRgbAt } from './fixtures/ImageEffectAssertions';
import { CleanupGuard } from './fixtures/ImageEffectCleanup';

/**
 * @tc.number EXP_EFFECT_CHAIN_003
 * @tc.name EXP_EFFECT_CHAIN_003
 * @tc.desc 有向滤镜顺序、饱和非交换性、连续裁剪; {"pathFixture": {"id": "chainBands", "format": "image/png", "width": 64, "height": 64, "pattern": "large-opaque-gray-bands", "grayValues": [0, 32, 128, 224, 255]}, "filterOptions": [["Brightness", 20], ["Contrast", 20]], "caseId": "EFFECT_CHAIN_003"}
 * @tc.level Level 1
 * Use a physical test device. Call native APIs serially; do not create UI or render targets concurrently.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'EFFECT_CHAIN_003');
    try {
      const spec = new FixtureSpec(64, 64, 'large-opaque-gray-bands', 'image/png', [128, 128, 128, 255], [0,
        64, 128, 255], 100);
      const file = await scope.createFile(spec, 'input.png');
      const reference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const original = await normalizePixels(reference);
      assertSize(original, 64, 64);
      const options: (string | number)[][] = [['Brightness', 20], ['Contrast', 20]];
      scope.restore(file);
      const result: boolean = ImageEffect.PixelMapFilterStart(file.path, options);
      expect(result).assertTrue();
      const output = scope.ownPixelMap(await awaitJpegOutput(file.path));
      expect(isJpegFile(file.path)).assertTrue();
      const actual = await normalizePixels(output);
      assertSize(actual, 64, 64);
      const encodedReference = scope.ownPixelMap(await jpegReference(reference));
      const identity = await normalizePixels(encodedReference);
      expect(meanDifference(actual, identity) > 1).assertTrue();
      scope.restore(file);
      const reverseOptions: (string | number)[][] = [['Contrast', 20], ['Brightness', 20]];
      expect(ImageEffect.PixelMapFilterStart(file.path, reverseOptions)).assertTrue();
      const reverseOutput = scope.ownPixelMap(await awaitJpegOutput(file.path));
      const reversed = await normalizePixels(reverseOutput);
      // Built-in20/20 differs mainly near gray128; whole-image mean need not exceed1.
      // The original gray128 band covers rows26..38. Compare its interior, not JPEG edges.
      let actualBandSum: number = 0;
      let reversedBandSum: number = 0;
      for (let y = 29; y < 36; y++) {
        for (let x = 8; x < 56; x++) {
          const offset = (y * 64 + x) * 4;
          for (let channel = 0; channel < 3; channel++) {
            actualBandSum += actual.rgba[offset + channel];
            reversedBandSum += reversed.rgba[offset + channel];
          }
        }
      }
      const actualBandMean: number = actualBandSum / (7 * 48 * 3);
      const reversedBandMean: number = reversedBandSum / (7 * 48 * 3);
      // CPU LUT predictsBC144/CB143; GPU quantization predictsBC146/CB144.
      // JPEG channel tolerance4 is the fixture catalog bound, not a reversed-order pass.
      assertRgbAt(actual, 32, 32, [145, 145, 145], 4);
      assertRgbAt(reversed, 32, 32, [144, 144, 144], 4);
      expect(actualBandMean > reversedBandMean + 0.5).assertTrue();
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
