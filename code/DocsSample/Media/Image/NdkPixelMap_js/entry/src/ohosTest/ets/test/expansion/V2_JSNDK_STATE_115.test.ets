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
import { testGetImageInfo, testAccessPixels, testUnAccessPixels } from 'libentry.so';
import {
  pixelInfo,
  finishCleanupAsync,
  finishCleanup,
  FixtureScope,
  PixelSpec,
  pixelBytes
} from './fixtures/NdkPixelMapFixture';

/**
 * @tc.number EXP_V2_JSNDK_STATE_115
 * @tc.name EXP_V2_JSNDK_STATE_115
 * @tc.desc 23x1 BGRA_8888 OPAQUE solid; info-info-pair with full snapshots and isolated 1x23 peer.
 * @tc.size MEDIUMTEST
 * @tc.type FUNCTION
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
    const scope = new FixtureScope(context, 'V2_JSNDK_STATE_115');
    let primaryFailed1: boolean = true;
    try {
      const pixelMap: image.PixelMap = await scope.pattern(new PixelSpec(23,
        1,
        'solid',
        image.PixelMapFormat.BGRA_8888,
        image.AlphaType.OPAQUE));
      const peer: image.PixelMap = await scope.pattern(new PixelSpec(1,
        23,
        'gradient',
        image.PixelMapFormat.RGBA_8888,
        image.AlphaType.OPAQUE));
      const beforeInfo = await pixelInfo(pixelMap);
      expect(beforeInfo.size.width).assertEqual(23);
      expect(beforeInfo.size.height).assertEqual(1);
      expect(beforeInfo.pixelFormat).assertEqual(image.PixelMapFormat.BGRA_8888);
      expect(beforeInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
      const beforeBytes = await pixelBytes(pixelMap);
      expect(beforeBytes.length).assertLarger(23 * 1 * 4 - 1);
      const peerBeforeInfo = await pixelInfo(peer);
      expect(peerBeforeInfo.size.width).assertEqual(1);
      expect(peerBeforeInfo.size.height).assertEqual(23);
      expect(peerBeforeInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);
      expect(peerBeforeInfo.alphaType).assertEqual(image.AlphaType.OPAQUE);
      const peerBeforeBytes = await pixelBytes(peer);
      expect(peerBeforeBytes.length).assertLarger(1 * 23 * 4 - 1);
      expect(typeof testGetImageInfo(pixelMap)).assertEqual('undefined');
      const afterStep1Info = await pixelInfo(pixelMap);
      expect(afterStep1Info.size.width).assertEqual(23);
      expect(afterStep1Info.size.height).assertEqual(1);
      expect(afterStep1Info.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterStep1Info.alphaType).assertEqual(beforeInfo.alphaType);
      expect(afterStep1Info.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const afterStep1Bytes = await pixelBytes(pixelMap);
      expect(afterStep1Bytes.length).assertEqual(beforeBytes.length);
      let afterStep1Mismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (afterStep1Bytes[i] !== beforeBytes[i]) {
          afterStep1Mismatches++;
        }
      }
      expect(afterStep1Mismatches).assertEqual(0);
      expect(typeof testGetImageInfo(pixelMap)).assertEqual('undefined');
      const afterStep2Info = await pixelInfo(pixelMap);
      expect(afterStep2Info.size.width).assertEqual(23);
      expect(afterStep2Info.size.height).assertEqual(1);
      expect(afterStep2Info.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterStep2Info.alphaType).assertEqual(beforeInfo.alphaType);
      expect(afterStep2Info.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const afterStep2Bytes = await pixelBytes(pixelMap);
      expect(afterStep2Bytes.length).assertEqual(beforeBytes.length);
      let afterStep2Mismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (afterStep2Bytes[i] !== beforeBytes[i]) {
          afterStep2Mismatches++;
        }
      }
      expect(afterStep2Mismatches).assertEqual(0);
      let step3Locked: boolean = false;
      let primaryFailed2: boolean = true;
      try {
        const step3Access = testAccessPixels(pixelMap);
        step3Locked = true;
        expect(typeof step3Access).assertEqual('undefined');
        primaryFailed2 = false;
      } finally {
        finishCleanup(primaryFailed2, (): void => {
          if (step3Locked) {
            const step3Unlock = testUnAccessPixels(pixelMap);
            step3Locked = false;
            expect(typeof step3Unlock).assertEqual('undefined');
          }
        });
      }
      const afterStep3Info = await pixelInfo(pixelMap);
      expect(afterStep3Info.size.width).assertEqual(23);
      expect(afterStep3Info.size.height).assertEqual(1);
      expect(afterStep3Info.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterStep3Info.alphaType).assertEqual(beforeInfo.alphaType);
      expect(afterStep3Info.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const afterStep3Bytes = await pixelBytes(pixelMap);
      expect(afterStep3Bytes.length).assertEqual(beforeBytes.length);
      let afterStep3Mismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (afterStep3Bytes[i] !== beforeBytes[i]) {
          afterStep3Mismatches++;
        }
      }
      expect(afterStep3Mismatches).assertEqual(0);
      expect(typeof testGetImageInfo(peer)).assertEqual('undefined');
      const peerAfterInfo = await pixelInfo(peer);
      expect(peerAfterInfo.size.width).assertEqual(1);
      expect(peerAfterInfo.size.height).assertEqual(23);
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
      const afterPeerQueryInfo = await pixelInfo(pixelMap);
      expect(afterPeerQueryInfo.size.width).assertEqual(23);
      expect(afterPeerQueryInfo.size.height).assertEqual(1);
      expect(afterPeerQueryInfo.pixelFormat).assertEqual(beforeInfo.pixelFormat);
      expect(afterPeerQueryInfo.alphaType).assertEqual(beforeInfo.alphaType);
      expect(afterPeerQueryInfo.colorSpace).assertEqual(beforeInfo.colorSpace);
      expect(pixelMap.getPixelBytesNumber()).assertEqual(beforeBytes.length);
      const afterPeerQueryBytes = await pixelBytes(pixelMap);
      expect(afterPeerQueryBytes.length).assertEqual(beforeBytes.length);
      let afterPeerQueryMismatches: number = 0;
      for (let i = 0; i < beforeBytes.length; i++) {
        if (afterPeerQueryBytes[i] !== beforeBytes[i]) {
          afterPeerQueryMismatches++;
        }
      }
      expect(afterPeerQueryMismatches).assertEqual(0);
      primaryFailed1 = false;
    } finally {
      await finishCleanupAsync(primaryFailed1, async (): Promise<void> => {
        await scope.dispose();
      });
    }
  };

export default runExpansionCase;
