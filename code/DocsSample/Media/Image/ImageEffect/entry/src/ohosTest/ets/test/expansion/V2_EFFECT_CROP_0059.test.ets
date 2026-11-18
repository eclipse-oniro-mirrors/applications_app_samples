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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import ImageEffect from 'libentry.so';
import { FixtureSpec, FixtureScope, decodeFileReference, normalizePixels, jpegReference, isJpegFile,
  awaitJpegOutput, readFileBytes } from './fixtures/ImageEffectFixture';
import { assertSize, assertPixelsClose } from './fixtures/ImageEffectAssertions';
import { assertBytesEqual, assertOpaque } from './fixtures/ImageEffectV2Contracts';
import { CleanupGuard } from './fixtures/ImageEffectCleanup';

/**
 * @tc.number EXP_V2_EFFECT_CROP_0059
 * @tc.name EXP_V2_EFFECT_CROP_0059
 * @tc.desc CROP; PixelMapFilterStart; 61x101; opaque-color-quadrants; image/png; [["CustomCrop", 66]]
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'V2_EFFECT_CROP_0059');
    try {
      const inputSpec = new FixtureSpec(61, 101, 'opaque-color-quadrants', 'image/png', [128, 128, 128, 255]);
      const file = await scope.createFile(inputSpec, 'input.png');
      const originalBytes = readFileBytes(file.originalPath);
      expect(originalBytes.byteLength > 4).assertTrue();
      assertBytesEqual(originalBytes, file.originalBytes);
      assertBytesEqual(readFileBytes(file.path), originalBytes);
      expect(isJpegFile(file.path)).assertEqual(false);
      const reference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const original = await normalizePixels(reference);
      assertSize(original, 61, 101);
      const referenceInfo = await reference.getImageInfo();
      expect(referenceInfo.size.width).assertEqual(61);
      expect(referenceInfo.size.height).assertEqual(101);
      assertOpaque(original);
      const options: (string | number)[][] = [['CustomCrop', 66]];
      const optionsBefore: string = JSON.stringify(options);
      scope.restore(file);
      const firstResult: boolean = ImageEffect.PixelMapFilterStart(file.path, options);
      expect(firstResult).assertTrue();
      expect(JSON.stringify(options)).assertEqual(optionsBefore);
      expect(options.length).assertEqual(1);
      expect(options[0].length).assertEqual(2);
      expect(options[0][0]).assertEqual('CustomCrop');
      expect(options[0][1]).assertEqual(66);
      const first = scope.ownPixelMap(await awaitJpegOutput(file.path));
      expect(isJpegFile(file.path)).assertTrue();
      const firstPixels = await normalizePixels(first);
      assertSize(firstPixels, 61, 66);
      assertOpaque(firstPixels);
      const firstInfo = await first.getImageInfo();
      expect(firstInfo.size.width).assertEqual(61);
      expect(firstInfo.size.height).assertEqual(66);
      const outputBytes = readFileBytes(file.path);
      expect(outputBytes.byteLength > 4).assertTrue();
      const independentOutput = scope.ownPixelMap(await decodeFileReference(file.path));
      const independentlyDecoded = await normalizePixels(independentOutput);
      assertPixelsClose(independentlyDecoded, firstPixels, 0);
      const geometryReference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      await geometryReference.crop({ x: 0, y: 0, size: { width: 61, height: 66 } });
      const geometryPixels = await normalizePixels(geometryReference);
      assertSize(geometryPixels, 61, 66);
      const expectedEncoded = scope.ownPixelMap(await jpegReference(geometryReference));
      const expectedPixels = await normalizePixels(expectedEncoded);
      assertPixelsClose(firstPixels, expectedPixels, 4);
      const retainedReference = await normalizePixels(reference);
      assertPixelsClose(retainedReference, original, 0);
      assertBytesEqual(readFileBytes(file.originalPath), originalBytes);
      scope.restore(file);
      assertBytesEqual(readFileBytes(file.path), originalBytes);
      expect(isJpegFile(file.path)).assertEqual(false);
      const replayResult: boolean = ImageEffect.PixelMapFilterStart(file.path, options);
      expect(replayResult).assertTrue();
      expect(JSON.stringify(options)).assertEqual(optionsBefore);
      const replay = scope.ownPixelMap(await awaitJpegOutput(file.path));
      expect(isJpegFile(file.path)).assertTrue();
      const replayPixels = await normalizePixels(replay);
      assertSize(replayPixels, 61, 66);
      assertOpaque(replayPixels);
      assertPixelsClose(replayPixels, firstPixels, 0);
      const replayInfo = await replay.getImageInfo();
      expect(replayInfo.size.width).assertEqual(firstInfo.size.width);
      expect(replayInfo.size.height).assertEqual(firstInfo.size.height);
      const retainedFirst = await normalizePixels(first);
      assertPixelsClose(retainedFirst, firstPixels, 0);
      assertBytesEqual(readFileBytes(file.originalPath), originalBytes);
      const backupDecoded = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const backupPixels = await normalizePixels(backupDecoded);
      assertPixelsClose(backupPixels, original, 0);
      scope.restore(file);
      assertBytesEqual(readFileBytes(file.path), originalBytes);
      const restored = scope.ownPixelMap(await decodeFileReference(file.path));
      const restoredPixels = await normalizePixels(restored);
      assertSize(restoredPixels, 61, 101);
      assertPixelsClose(restoredPixels, original, 0);
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
