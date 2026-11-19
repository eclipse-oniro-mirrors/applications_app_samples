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
import { testGetImageInfo, testAccessPixels, testUnAccessPixels, transform } from 'libentry.so';
import { pixelInfo, finishCleanupAsync,
  finishCleanup,
  FixtureScope,
  PixelSpec,
  pixelBytes,
  packSdk,
  decodeSdk } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_V2_JSNDK_TRANSFORM_021
 * @tc.name EXP_V2_JSNDK_TRANSFORM_021
 * @tc.desc Safe 479x321 RGBA_8888 quadrants native transform, lock before/after, 100x100 PNG usability and untouched peer.
 * @tc.size MEDIUMTEST
 * @tc.type FUNCTION
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'V2_JSNDK_TRANSFORM_021');
    let primaryFailed1: boolean = true;
    try {
      const pixelMap: image.PixelMap = await scope.pattern(new PixelSpec(479,
        321,
        'quadrants',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.OPAQUE));
      const peer: image.PixelMap = await scope.pattern(new PixelSpec(8,
        5,
        'color-bars',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.OPAQUE));
      const beforeInfo = await pixelInfo(pixelMap);
      expect(beforeInfo.size.width).assertEqual(479);
      expect(beforeInfo.size.height).assertEqual(321);
      expect(beforeInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(beforeInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
      const beforeBytes = await pixelBytes(pixelMap);
      expect(beforeBytes.length).assertLarger(479 * 321 * 4 - 1);
      const peerBeforeInfo = await pixelInfo(peer);
      expect(peerBeforeInfo.size.width).assertEqual(8);
      expect(peerBeforeInfo.size.height).assertEqual(5);
      expect(peerBeforeInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(peerBeforeInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
      const peerBeforeBytes = await pixelBytes(peer);
      expect(peerBeforeBytes.length).assertLarger(8 * 5 * 4 - 1);
      expect(typeof testGetImageInfo(pixelMap)).assertEqual('undefined');
      let beforeTransformLocked: boolean = false;
      let primaryFailed2: boolean = true;
      try {
        const beforeTransformAccess = testAccessPixels(pixelMap);
        beforeTransformLocked = true;
        expect(typeof beforeTransformAccess).assertEqual('undefined');
        primaryFailed2 = false;
      } finally {
        finishCleanup(primaryFailed2, (): void => {
          if (beforeTransformLocked) {
            const beforeTransformUnlock = testUnAccessPixels(pixelMap);
            beforeTransformLocked = false;
            expect(typeof beforeTransformUnlock).assertEqual('undefined');
          }
        });
      }
      const unlockedInputInfo = await pixelInfo(pixelMap);
      expect(unlockedInputInfo.size.width).assertEqual(479);
      expect(unlockedInputInfo.size.height).assertEqual(321);
      expect(unlockedInputInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(unlockedInputInfo.alphaType).assertEqual(beforeInfo.alphaType);
      expect(unlockedInputInfo.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const unlockedInputBytes = await pixelBytes(pixelMap);
      expect(unlockedInputBytes.length).assertEqual(beforeBytes.length);
      let unlockedInputMismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (unlockedInputBytes[i] !== beforeBytes[i]) {
          unlockedInputMismatches++;
        }
      }
      expect(unlockedInputMismatches).assertEqual(0);
      expect(typeof transform(pixelMap)).assertEqual('undefined');
      const transformedInfo = await pixelInfo(pixelMap);
      expect(transformedInfo.size.width).assertEqual(100);
      expect(transformedInfo.size.height).assertEqual(100);
      expect(transformedInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      const transformedBytes = await pixelBytes(pixelMap);
      expect(transformedBytes.length).assertLarger(100 * 100 * 4 - 1);
      expect(typeof testGetImageInfo(pixelMap)).assertEqual('undefined');
      let afterTransformLocked: boolean = false;
      let primaryFailed3: boolean = true;
      try {
        const afterTransformAccess = testAccessPixels(pixelMap);
        afterTransformLocked = true;
        expect(typeof afterTransformAccess).assertEqual('undefined');
        primaryFailed3 = false;
      } finally {
        finishCleanup(primaryFailed3, (): void => {
          if (afterTransformLocked) {
            const afterTransformUnlock = testUnAccessPixels(pixelMap);
            afterTransformLocked = false;
            expect(typeof afterTransformUnlock).assertEqual('undefined');
          }
        });
      }
      const afterTransformedUnlockInfo = await pixelInfo(pixelMap);
      expect(afterTransformedUnlockInfo.size.width).assertEqual(100);
      expect(afterTransformedUnlockInfo.size.height).assertEqual(100);
      expect(afterTransformedUnlockInfo.pixelFormat).assertEqual(transformedInfo.pixelFormat);
      expect(afterTransformedUnlockInfo.alphaType).assertEqual(transformedInfo.alphaType);
      expect(afterTransformedUnlockInfo.colorSpace).assertEqual(transformedInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(transformedBytes.length);
      const afterTransformedUnlockBytes = await pixelBytes(pixelMap);
      expect(afterTransformedUnlockBytes.length).assertEqual(transformedBytes.length);
      let afterTransformedUnlockMismatches: number = 0;
      for (let i = 0; i < transformedBytes.length; i++) {
        if (afterTransformedUnlockBytes[i] !== transformedBytes[i]) {
          afterTransformedUnlockMismatches++;
        }
      }
      expect(afterTransformedUnlockMismatches).assertEqual(0);
      const png = await packSdk(pixelMap, 'image/png');
      expect(png.byteLength).assertLarger(8);
      const decoded: image.PixelMap = scope.own(await decodeSdk(png));
      const decodedInfo = await pixelInfo(decoded);
      expect(decodedInfo.size.width).assertEqual(100);
      expect(decodedInfo.size.height).assertEqual(100);
      expect(decodedInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      const decodedBytes = await pixelBytes(decoded);
      expect(decodedBytes.length).assertLarger(100 * 100 * 4 - 1);
      const afterPngReadInfo = await pixelInfo(pixelMap);
      expect(afterPngReadInfo.size.width).assertEqual(100);
      expect(afterPngReadInfo.size.height).assertEqual(100);
      expect(afterPngReadInfo.pixelFormat).assertEqual(transformedInfo.pixelFormat);
      expect(afterPngReadInfo.alphaType).assertEqual(transformedInfo.alphaType);
      expect(afterPngReadInfo.colorSpace).assertEqual(transformedInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(transformedBytes.length);
      const afterPngReadBytes = await pixelBytes(pixelMap);
      expect(afterPngReadBytes.length).assertEqual(transformedBytes.length);
      let afterPngReadMismatches: number = 0;
      for (let i = 0; i < transformedBytes.length; i++) {
        if (afterPngReadBytes[i] !== transformedBytes[i]) {
          afterPngReadMismatches++;
        }
      }
      expect(afterPngReadMismatches).assertEqual(0);
      const peerAfterInfo = await pixelInfo(peer);
      expect(peerAfterInfo.size.width).assertEqual(8);
      expect(peerAfterInfo.size.height).assertEqual(5);
      expect(peerAfterInfo.pixelFormat).assertEqual(peerBeforeInfo.pixelFormat);
      expect(peerAfterInfo.alphaType).assertEqual(peerBeforeInfo.alphaType);
      expect(peerAfterInfo.colorSpace).assertEqual(peerBeforeInfo.colorSpace);
      expect(peer.getPixelBytesNumber()).assertEqual(peerBeforeBytes.length);
      const peerAfterBytes = await pixelBytes(peer);
      expect(peerAfterBytes.length).assertEqual(peerBeforeBytes.length);
      let peerAfterMismatches: number = 0;
      for (let i = 0; i < peerBeforeBytes.length; i++) {
        if (peerAfterBytes[i] !== peerBeforeBytes[i]) {
          peerAfterMismatches++;
        }
      }
      expect(peerAfterMismatches).assertEqual(0);
      primaryFailed1 = false;
    } finally {
      await finishCleanupAsync(primaryFailed1, async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
