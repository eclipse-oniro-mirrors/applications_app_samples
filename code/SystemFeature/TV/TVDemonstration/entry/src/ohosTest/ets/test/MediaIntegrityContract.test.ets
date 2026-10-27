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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';

// Media packaging integrity sweep generated from the actual base/media
// assets. Every packaged image/icon/video-poster must resolve through the
// resource manager using the same literal $r('app.media.<name>') form the
// pages render; the known-good assets must also carry non-empty payload
// bytes so a silently truncated asset fails loudly.

export default function mediaIntegrityContractTest(): void {
  describe('MediaIntegrityContractTest', () => {
    let manager: resourceManager.ResourceManager;

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    // Reads raw bytes through the Promise API: synchronous reads/encodes of the
    // 50 MB media set block the main thread past the 6s AppFreeze watchdog and
    // the system kills the test process ("App died").
    /** Returns the raw payload bytes of the given literal media Resource, or null on resolve failure. */
    const mediaBytesOf = async (resource: Resource): Promise<Uint8Array | null> => {
      try {
        return await manager.getMediaContent(resource);
      } catch (error) {
        return null;
      }
    };

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_0100
     * @tc.name mediaIntegrityAllPackagedResolve
     * @tc.desc Verify every packaged media asset resolves through the resource manager
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityAllPackagedResolve', 0, async (): Promise<void> => {
      const assets0: Resource[] =
        [$r('app.media.AI'), $r('app.media.Cast'), $r('app.media.ChildCare'), $r('app.media.Distributed'),
          $r('app.media.Media'), $r('app.media.NewProduct'), $r('app.media.PointingRemoteControl'),
          $r('app.media.ProductImage1')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        expect(await mediaBytesOf(assets0[assetPos]) !== null).assertTrue();
      }
      const assets1: Resource[] =
        [$r('app.media.ScreenSaver'), $r('app.media.SmartScreensaver'), $r('app.media.UniversalInterconnection'),
          $r('app.media.Voice'), $r('app.media.about'), $r('app.media.background'), $r('app.media.backgroundIMage'),
          $r('app.media.backgroundphoto')];
      for (let assetPos: number = 0; assetPos < assets1.length; assetPos++) {
        expect(await mediaBytesOf(assets1[assetPos]) !== null).assertTrue();
      }
      const assets2: Resource[] =
        [$r('app.media.bj1'), $r('app.media.blueSpot'), $r('app.media.camera'), $r('app.media.cat'),
          $r('app.media.compare'), $r('app.media.connect_icon'), $r('app.media.cycle'), $r('app.media.disk')];
      for (let assetPos: number = 0; assetPos < assets2.length; assetPos++) {
        expect(await mediaBytesOf(assets2[assetPos]) !== null).assertTrue();
      }
      const assets3: Resource[] =
        [$r('app.media.dolby_icon'), $r('app.media.eye_icon'), $r('app.media.foreground'), $r('app.media.icon'),
          $r('app.media.icon2'), $r('app.media.left'), $r('app.media.leftBack'), $r('app.media.music')];
      for (let assetPos: number = 0; assetPos < assets3.length; assetPos++) {
        expect(await mediaBytesOf(assets3[assetPos]) !== null).assertTrue();
      }
      const assets4: Resource[] =
        [$r('app.media.noVideo'), $r('app.media.page1'), $r('app.media.play_icon'), $r('app.media.preview'),
          $r('app.media.product1'), $r('app.media.product2'), $r('app.media.product3'), $r('app.media.protocol')];
      for (let assetPos: number = 0; assetPos < assets4.length; assetPos++) {
        expect(await mediaBytesOf(assets4[assetPos]) !== null).assertTrue();
      }
      const assets5: Resource[] =
        [$r('app.media.pure'), $r('app.media.remoteAssistance'), $r('app.media.right'), $r('app.media.scene2'),
          $r('app.media.scene3'), $r('app.media.service'), $r('app.media.singleLeft'), $r('app.media.singleRight')];
      for (let assetPos: number = 0; assetPos < assets5.length; assetPos++) {
        expect(await mediaBytesOf(assets5[assetPos]) !== null).assertTrue();
      }
      const assets6: Resource[] =
        [$r('app.media.size'), $r('app.media.size_distance'), $r('app.media.sm1'), $r('app.media.sm2'),
          $r('app.media.sm3'), $r('app.media.sound_icon'), $r('app.media.splitLine'), $r('app.media.startIcon')];
      for (let assetPos: number = 0; assetPos < assets6.length; assetPos++) {
        expect(await mediaBytesOf(assets6[assetPos]) !== null).assertTrue();
      }
      const assets7: Resource[] =
        [$r('app.media.store_icon'), $r('app.media.swiper_arrow_left'), $r('app.media.swiper_arrow_right'),
          $r('app.media.update'), $r('app.media.updateCompleted'), $r('app.media.updateFailed'),
          $r('app.media.videoPlay'), $r('app.media.video_thumb')];
      for (let assetPos: number = 0; assetPos < assets7.length; assetPos++) {
        expect(await mediaBytesOf(assets7[assetPos]) !== null).assertTrue();
      }
      const assets8: Resource[] = [$r('app.media.yanshi'), $r('app.media.yanshiselected')];
      for (let assetPos: number = 0; assetPos < assets8.length; assetPos++) {
        expect(await mediaBytesOf(assets8[assetPos]) !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_000100
     * @tc.name mediaIntegrityNonEmptyPayload001
     * @tc.desc Verify media group 1 carries non-empty payload bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityNonEmptyPayload001', 0, async (): Promise<void> => {
      const assets0: Resource[] =
        [$r('app.media.AI'), $r('app.media.Cast'), $r('app.media.ChildCare'), $r('app.media.Distributed'),
          $r('app.media.Media'), $r('app.media.NewProduct')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets0[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
      const assets1: Resource[] =
        [$r('app.media.PointingRemoteControl'), $r('app.media.ProductImage1'), $r('app.media.ScreenSaver'),
          $r('app.media.SmartScreensaver'), $r('app.media.UniversalInterconnection'), $r('app.media.Voice')];
      for (let assetPos: number = 0; assetPos < assets1.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets1[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_000200
     * @tc.name mediaIntegrityNonEmptyPayload002
     * @tc.desc Verify media group 2 carries non-empty payload bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityNonEmptyPayload002', 0, async (): Promise<void> => {
      const assets0: Resource[] = [$r('app.media.about'), $r('app.media.background'), $r('app.media.backgroundIMage'),
        $r('app.media.backgroundphoto'), $r('app.media.bj1'), $r('app.media.blueSpot')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets0[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
      const assets1: Resource[] =
        [$r('app.media.camera'), $r('app.media.cat'), $r('app.media.compare'), $r('app.media.connect_icon'),
          $r('app.media.cycle'), $r('app.media.disk')];
      for (let assetPos: number = 0; assetPos < assets1.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets1[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_000300
     * @tc.name mediaIntegrityNonEmptyPayload003
     * @tc.desc Verify media group 3 carries non-empty payload bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityNonEmptyPayload003', 0, async (): Promise<void> => {
      const assets0: Resource[] =
        [$r('app.media.eye_icon'), $r('app.media.foreground'), $r('app.media.icon'), $r('app.media.icon2'),
          $r('app.media.left'), $r('app.media.leftBack')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets0[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
      const assets1: Resource[] =
        [$r('app.media.music'), $r('app.media.noVideo'), $r('app.media.page1'), $r('app.media.play_icon'),
          $r('app.media.preview'), $r('app.media.product1')];
      for (let assetPos: number = 0; assetPos < assets1.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets1[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_000400
     * @tc.name mediaIntegrityNonEmptyPayload004
     * @tc.desc Verify media group 4 carries non-empty payload bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityNonEmptyPayload004', 0, async (): Promise<void> => {
      const assets0: Resource[] =
        [$r('app.media.product2'), $r('app.media.product3'), $r('app.media.protocol'), $r('app.media.pure'),
          $r('app.media.remoteAssistance'), $r('app.media.right')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets0[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
      const assets1: Resource[] =
        [$r('app.media.scene2'), $r('app.media.scene3'), $r('app.media.service'), $r('app.media.singleLeft'),
          $r('app.media.singleRight'), $r('app.media.size')];
      for (let assetPos: number = 0; assetPos < assets1.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets1[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_000500
     * @tc.name mediaIntegrityNonEmptyPayload005
     * @tc.desc Verify media group 5 carries non-empty payload bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityNonEmptyPayload005', 0, async (): Promise<void> => {
      const assets0: Resource[] =
        [$r('app.media.size_distance'), $r('app.media.sm1'), $r('app.media.sm2'), $r('app.media.sm3'),
          $r('app.media.sound_icon'), $r('app.media.splitLine')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets0[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
      const assets1: Resource[] =
        [$r('app.media.startIcon'), $r('app.media.store_icon'), $r('app.media.swiper_arrow_left'),
          $r('app.media.swiper_arrow_right'), $r('app.media.update'), $r('app.media.updateCompleted')];
      for (let assetPos: number = 0; assetPos < assets1.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets1[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_000600
     * @tc.name mediaIntegrityNonEmptyPayload006
     * @tc.desc Verify media group 6 carries non-empty payload bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityNonEmptyPayload006', 0, async (): Promise<void> => {
      const assets0: Resource[] =
        [$r('app.media.updateFailed'), $r('app.media.videoPlay'), $r('app.media.video_thumb'), $r('app.media.yanshi'),
          $r('app.media.yanshiselected')];
      for (let assetPos: number = 0; assetPos < assets0.length; assetPos++) {
        const payload: Uint8Array | null = await mediaBytesOf(assets0[assetPos]);
        expect(payload !== null).assertTrue();
        expect((payload as Uint8Array).byteLength > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_INTEGRITY_9000
     * @tc.name mediaIntegrityZeroBytePlaceholderResolves
     * @tc.desc Verify the zero-byte placeholder asset still resolves (present, empty payload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaIntegrityZeroBytePlaceholderResolves', 0, async (): Promise<void> => {
      const assets: Resource[] = [$r('app.media.dolby_icon')];
      for (let assetPos: number = 0; assetPos < assets.length; assetPos++) {
        expect(await mediaBytesOf(assets[assetPos]) !== null).assertTrue();
      }
    });

  });
}
