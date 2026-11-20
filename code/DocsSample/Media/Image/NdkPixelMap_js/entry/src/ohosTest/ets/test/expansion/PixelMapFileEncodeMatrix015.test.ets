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
import { testGetImageInfo, testAccessPixels, testUnAccessPixels, EncodeImagesToFile } from 'libentry.so';
import { pixelInfo, finishCleanupAsync,
  finishCleanup,
  FixtureScope,
  PixelSpec,
  pixelBytes,
  withNativeJpeg,
  readCompleteJpeg } from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_V2_JSNDK_FILE_015
 * @tc.name EXP_V2_JSNDK_FILE_015
 * @tc.desc 5x3 image/jpeg RGBA_8888 OPAQUE color-bars; native complete JPEG, source/peer snapshots and relock after encoding.
 * @tc.size MEDIUMTEST
 * @tc.type FUNCTION
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'V2_JSNDK_FILE_015');
    let primaryFailed1: boolean = true;
    try {
      const inputPath = await scope.input(new PixelSpec(5,
        3,
        'color-bars',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.OPAQUE),
        'image/jpeg');
      const pixelMap: image.PixelMap = await scope.decode(inputPath);
      const beforeInfo = await pixelInfo(pixelMap);
      expect(beforeInfo.size.width).assertEqual(5);
      expect(beforeInfo.size.height).assertEqual(3);
      expect(beforeInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      const beforeBytes = await pixelBytes(pixelMap);
      expect(beforeBytes.length).assertLarger(5 * 3 * 4 - 1);
      const peer: image.PixelMap = await scope.pattern(new PixelSpec(4,
        6,
        'gradient',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.OPAQUE));
      const peerBeforeInfo = await pixelInfo(peer);
      expect(peerBeforeInfo.size.width).assertEqual(4);
      expect(peerBeforeInfo.size.height).assertEqual(6);
      expect(peerBeforeInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(peerBeforeInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
      const peerBeforeBytes = await pixelBytes(peer);
      expect(peerBeforeBytes.length).assertLarger(4 * 6 * 4 - 1);
      expect(typeof testGetImageInfo(pixelMap)).assertEqual('undefined');
      let beforeEncodingLocked: boolean = false;
      let primaryFailed2: boolean = true;
      try {
        const beforeEncodingAccess = testAccessPixels(pixelMap);
        beforeEncodingLocked = true;
        expect(typeof beforeEncodingAccess).assertEqual('undefined');
        primaryFailed2 = false;
      } finally {
        finishCleanup(primaryFailed2, (): void => {
          if (beforeEncodingLocked) {
            const beforeEncodingUnlock = testUnAccessPixels(pixelMap);
            beforeEncodingLocked = false;
            expect(typeof beforeEncodingUnlock).assertEqual('undefined');
          }
        });
      }
      const readyToEncodeInfo = await pixelInfo(pixelMap);
      expect(readyToEncodeInfo.size.width).assertEqual(5);
      expect(readyToEncodeInfo.size.height).assertEqual(3);
      expect(readyToEncodeInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(readyToEncodeInfo.alphaType).assertEqual(beforeInfo.alphaType);
      expect(readyToEncodeInfo.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const readyToEncodeBytes = await pixelBytes(pixelMap);
      expect(readyToEncodeBytes.length).assertEqual(beforeBytes.length);
      let readyToEncodeMismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (readyToEncodeBytes[i] !== beforeBytes[i]) {
          readyToEncodeMismatches++;
        }
      }
      expect(readyToEncodeMismatches).assertEqual(0);
      await withNativeJpeg(context, async (path: string): Promise<void> => {
        EncodeImagesToFile(pixelMap);
        const output: image.PixelMap = scope.own(await readCompleteJpeg(path));
        const outputInfo = await pixelInfo(output);
        expect(outputInfo.size.width).assertEqual(beforeInfo.size.width);
        expect(outputInfo.size.height).assertEqual(beforeInfo.size.height);
        expect(outputInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
        const outputBytes = await pixelBytes(output);
        expect(outputBytes.length).assertLarger(beforeInfo.size.width * beforeInfo.size.height * 4 - 1);
        expect(typeof testGetImageInfo(output)).assertEqual('undefined');
      });
      const afterNativeEncodingInfo = await pixelInfo(pixelMap);
      expect(afterNativeEncodingInfo.size.width).assertEqual(5);
      expect(afterNativeEncodingInfo.size.height).assertEqual(3);
      expect(afterNativeEncodingInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterNativeEncodingInfo.alphaType).assertEqual(beforeInfo.alphaType);
      expect(afterNativeEncodingInfo.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const afterNativeEncodingBytes = await pixelBytes(pixelMap);
      expect(afterNativeEncodingBytes.length).assertEqual(beforeBytes.length);
      let afterNativeEncodingMismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (afterNativeEncodingBytes[i] !== beforeBytes[i]) {
          afterNativeEncodingMismatches++;
        }
      }
      expect(afterNativeEncodingMismatches).assertEqual(0);
      let afterEncodingLocked: boolean = false;
      let primaryFailed3: boolean = true;
      try {
        const afterEncodingAccess = testAccessPixels(pixelMap);
        afterEncodingLocked = true;
        expect(typeof afterEncodingAccess).assertEqual('undefined');
        primaryFailed3 = false;
      } finally {
        finishCleanup(primaryFailed3, (): void => {
          if (afterEncodingLocked) {
            const afterEncodingUnlock = testUnAccessPixels(pixelMap);
            afterEncodingLocked = false;
            expect(typeof afterEncodingUnlock).assertEqual('undefined');
          }
        });
      }
      const afterRelockInfo = await pixelInfo(pixelMap);
      expect(afterRelockInfo.size.width).assertEqual(5);
      expect(afterRelockInfo.size.height).assertEqual(3);
      expect(afterRelockInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterRelockInfo.alphaType).assertEqual(beforeInfo.alphaType);
      expect(afterRelockInfo.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const afterRelockBytes = await pixelBytes(pixelMap);
      expect(afterRelockBytes.length).assertEqual(beforeBytes.length);
      let afterRelockMismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (afterRelockBytes[i] !== beforeBytes[i]) {
          afterRelockMismatches++;
        }
      }
      expect(afterRelockMismatches).assertEqual(0);
      const peerAfterInfo = await pixelInfo(peer);
      expect(peerAfterInfo.size.width).assertEqual(4);
      expect(peerAfterInfo.size.height).assertEqual(6);
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
