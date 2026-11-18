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
import { ImageUtils } from '../../../../main/ets/utils/ImageUtils';
import { FixtureSpec, FixtureScope, decodeFileReference, normalizePixels, isJpegFile,
  readFileBytes } from './fixtures/ImageEffectFixture';
import { assertSize, assertPixelsClose } from './fixtures/ImageEffectAssertions';
import { assertBytesEqual, assertOpaque } from './fixtures/ImageEffectV2Contracts';
import { CleanupGuard } from './fixtures/ImageEffectCleanup';

/**
 * @tc.number EXP_V2_EFFECT_DECODE_0001
 * @tc.name EXP_V2_EFFECT_DECODE_0001
 * @tc.desc DECODE; ImageUtils.getPixelMapByFilePath; 13x17; solid; image/png; []
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    const cleanupGuard1 = new CleanupGuard();
    const scope = new FixtureScope(context.cacheDir, 'V2_EFFECT_DECODE_0001');
    try {
      const inputSpec = new FixtureSpec(13, 17, 'solid', 'image/png', [48, 112, 176, 255]);
      const file = await scope.createFile(inputSpec, 'input.png');
      const originalBytes = readFileBytes(file.originalPath);
      expect(originalBytes.byteLength > 4).assertTrue();
      assertBytesEqual(originalBytes, file.originalBytes);
      assertBytesEqual(readFileBytes(file.path), originalBytes);
      expect(isJpegFile(file.path)).assertEqual(false);
      const reference = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const original = await normalizePixels(reference);
      assertSize(original, 13, 17);
      const referenceInfo = await reference.getImageInfo();
      expect(referenceInfo.size.width).assertEqual(13);
      expect(referenceInfo.size.height).assertEqual(17);
      assertOpaque(original);
      const survivor = scope.ownPixelMap(await ImageUtils.getInstance().getPixelMapByFilePath(file.path));
      const survivorBefore = await normalizePixels(survivor);
      assertPixelsClose(survivorBefore, original, 0);
      const second = scope.ownPixelMap(await ImageUtils.getInstance().getPixelMapByFilePath(file.path));
      const secondPixels = await normalizePixels(second);
      const cleanupGuard2 = new CleanupGuard();
      const first = await ImageUtils.getInstance().getPixelMapByFilePath(file.path);
      try {
        expect(first === survivor).assertFalse();
        const firstPixels = await normalizePixels(first);
        assertSize(firstPixels, 13, 17);
        assertPixelsClose(firstPixels, original, 0);
        const firstInfo = await first.getImageInfo();
        expect(firstInfo.size.width).assertEqual(13);
        expect(firstInfo.size.height).assertEqual(17);
        assertBytesEqual(readFileBytes(file.path), originalBytes);
        expect(first === second).assertFalse();
        assertPixelsClose(secondPixels, original, 0);
        const secondInfo = await second.getImageInfo();
        expect(secondInfo.size.width).assertEqual(firstInfo.size.width);
        expect(secondInfo.size.height).assertEqual(firstInfo.size.height);
      } catch (primaryError2) {
        cleanupGuard2.primaryFailed = true;
        throw primaryError2 as Error;
      } finally {
        await cleanupGuard2.run(async (): Promise<void> => {
          await first.release();
        });
      }
      const survivorAfterRelease = await normalizePixels(survivor);
      assertSize(survivorAfterRelease, 13, 17);
      assertPixelsClose(survivorAfterRelease, survivorBefore, 0);
      const retainedSecond = await normalizePixels(second);
      assertSize(retainedSecond, 13, 17);
      assertPixelsClose(retainedSecond, secondPixels, 0);
      const retainedReference = await normalizePixels(reference);
      assertPixelsClose(retainedReference, original, 0);
      assertBytesEqual(readFileBytes(file.path), originalBytes);
      const third = scope.ownPixelMap(await ImageUtils.getInstance().getPixelMapByFilePath(file.path));
      expect(first === third).assertFalse();
      expect(second === third).assertFalse();
      const thirdPixels = await normalizePixels(third);
      assertSize(thirdPixels, 13, 17);
      assertPixelsClose(thirdPixels, original, 0);
      const thirdInfo = await third.getImageInfo();
      expect(thirdInfo.size.width).assertEqual(13);
      expect(thirdInfo.size.height).assertEqual(17);
      assertOpaque(thirdPixels);
      assertBytesEqual(readFileBytes(file.originalPath), originalBytes);
      assertBytesEqual(readFileBytes(file.path), originalBytes);
      const backupDecoded = scope.ownPixelMap(await decodeFileReference(file.originalPath));
      const backupPixels = await normalizePixels(backupDecoded);
      assertPixelsClose(backupPixels, original, 0);
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
