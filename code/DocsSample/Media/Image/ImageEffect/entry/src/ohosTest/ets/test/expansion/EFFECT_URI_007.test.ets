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
 * @tc.number EXP_EFFECT_URI_007
 * @tc.name EXP_EFFECT_URI_007
 * @tc.desc URI既有入口：自定义亮度/裁剪和完整ROI; {"pathFixture": {"id": "uriCrop", "format": "image/jpeg", "width": 32, "height": 24, "pattern": "opaque-row-bands", "quality": 100}, "filterOptions": [["CustomCrop", 50]], "expectedRenderedSize": [32, 12], "caseId": "EFFECT_URI_007"}
 * @tc.level Level 1
 * Prerequisite: real HarmonyOS device; serial native calls, no concurrent UI/surface creation.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'EFFECT_URI_007');
    try {
      const spec = new FixtureSpec(32, 24, 'opaque-row-bands', 'image/jpeg', [128, 128, 128, 255], [0, 64,
        128, 255], 100);
      const file = await scope.createFile(spec, 'input.jpg');
      const reference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const original = await normalizePixels(reference);
      assertSize(original, 32, 24);
      const options: (string | number)[][] = [['CustomCrop', 50]];
      scope.restore(file);
      const result: boolean = ImageEffect.URIFilterStart(file.path, options);
      expect(result).assertTrue();
      const output = scope.ownPixelMap(await awaitJpegOutput(file.path));
      expect(isJpegFile(file.path)).assertTrue();
      const actual = await normalizePixels(output);
      assertSize(actual, 32, 12);
      const geometry = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      await geometry.crop({ x: 0, y: 0, size: { width: 32, height: 12 } });
      const encodedReference = scope.ownPixelMap(await jpegReference(geometry));
      const expected = await normalizePixels(encodedReference);
      assertPixelsClose(actual, expected, 4);
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
