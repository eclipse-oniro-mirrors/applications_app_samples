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

// Expanded async media payload matrix. Every packaged media asset is read twice
// through the Promise API so the payload is non-empty and stable without
// blocking the main thread with synchronous Base64 encoding.

const EXPANDED_MEDIA_COUNT: number = 65;

export default function mediaPayloadExpandedMatrixTest(): void {
  describe('MediaPayloadExpandedMatrixTest', () => {
    let manager: resourceManager.ResourceManager;

    beforeAll((): void => {
      manager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1000
     * @tc.name mediaPayloadExpanded000
     * @tc.desc Verify packaged media about resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded000', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.about');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1100
     * @tc.name mediaPayloadExpanded001
     * @tc.desc Verify packaged media AI resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded001', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.AI');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1200
     * @tc.name mediaPayloadExpanded002
     * @tc.desc Verify packaged media background resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded002', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.background');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1300
     * @tc.name mediaPayloadExpanded003
     * @tc.desc Verify packaged media backgroundIMage resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded003', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.backgroundIMage');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1400
     * @tc.name mediaPayloadExpanded004
     * @tc.desc Verify packaged media backgroundphoto resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded004', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.backgroundphoto');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1500
     * @tc.name mediaPayloadExpanded005
     * @tc.desc Verify packaged media bj1 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded005', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.bj1');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1600
     * @tc.name mediaPayloadExpanded006
     * @tc.desc Verify packaged media blueSpot resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded006', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.blueSpot');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1700
     * @tc.name mediaPayloadExpanded007
     * @tc.desc Verify packaged media camera resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded007', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.camera');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1800
     * @tc.name mediaPayloadExpanded008
     * @tc.desc Verify packaged media Cast resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded008', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.Cast');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_1900
     * @tc.name mediaPayloadExpanded009
     * @tc.desc Verify packaged media cat resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded009', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.cat');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2000
     * @tc.name mediaPayloadExpanded010
     * @tc.desc Verify packaged media ChildCare resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded010', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.ChildCare');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2100
     * @tc.name mediaPayloadExpanded011
     * @tc.desc Verify packaged media compare resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded011', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.compare');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2200
     * @tc.name mediaPayloadExpanded012
     * @tc.desc Verify packaged media connect_icon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded012', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.connect_icon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2300
     * @tc.name mediaPayloadExpanded013
     * @tc.desc Verify packaged media cycle resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded013', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.cycle');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2400
     * @tc.name mediaPayloadExpanded014
     * @tc.desc Verify packaged media disk resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded014', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.disk');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2500
     * @tc.name mediaPayloadExpanded015
     * @tc.desc Verify packaged media Distributed resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded015', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.Distributed');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2600
     * @tc.name mediaPayloadExpanded016
     * @tc.desc Verify packaged media eye_icon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded016', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.eye_icon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2700
     * @tc.name mediaPayloadExpanded017
     * @tc.desc Verify packaged media foreground resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded017', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.foreground');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2800
     * @tc.name mediaPayloadExpanded018
     * @tc.desc Verify packaged media icon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded018', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.icon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_2900
     * @tc.name mediaPayloadExpanded019
     * @tc.desc Verify packaged media icon2 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded019', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.icon2');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3000
     * @tc.name mediaPayloadExpanded020
     * @tc.desc Verify packaged media left resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded020', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.left');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3100
     * @tc.name mediaPayloadExpanded021
     * @tc.desc Verify packaged media leftBack resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded021', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.leftBack');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3200
     * @tc.name mediaPayloadExpanded022
     * @tc.desc Verify packaged media Media resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded022', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.Media');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3300
     * @tc.name mediaPayloadExpanded023
     * @tc.desc Verify packaged media music resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded023', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.music');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3400
     * @tc.name mediaPayloadExpanded024
     * @tc.desc Verify packaged media NewProduct resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded024', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.NewProduct');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3500
     * @tc.name mediaPayloadExpanded025
     * @tc.desc Verify packaged media noVideo resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded025', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.noVideo');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3600
     * @tc.name mediaPayloadExpanded026
     * @tc.desc Verify packaged media page1 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded026', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.page1');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3700
     * @tc.name mediaPayloadExpanded027
     * @tc.desc Verify packaged media play_icon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded027', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.play_icon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3800
     * @tc.name mediaPayloadExpanded028
     * @tc.desc Verify packaged media PointingRemoteControl resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded028', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.PointingRemoteControl');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_3900
     * @tc.name mediaPayloadExpanded029
     * @tc.desc Verify packaged media preview resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded029', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.preview');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4000
     * @tc.name mediaPayloadExpanded030
     * @tc.desc Verify packaged media product1 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded030', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.product1');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4100
     * @tc.name mediaPayloadExpanded031
     * @tc.desc Verify packaged media product2 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded031', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.product2');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4200
     * @tc.name mediaPayloadExpanded032
     * @tc.desc Verify packaged media product3 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded032', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.product3');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4300
     * @tc.name mediaPayloadExpanded033
     * @tc.desc Verify packaged media ProductImage1 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded033', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.ProductImage1');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4400
     * @tc.name mediaPayloadExpanded034
     * @tc.desc Verify packaged media protocol resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded034', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.protocol');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4500
     * @tc.name mediaPayloadExpanded035
     * @tc.desc Verify packaged media pure resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded035', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.pure');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4600
     * @tc.name mediaPayloadExpanded036
     * @tc.desc Verify packaged media remoteAssistance resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded036', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.remoteAssistance');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4700
     * @tc.name mediaPayloadExpanded037
     * @tc.desc Verify packaged media right resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded037', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.right');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4800
     * @tc.name mediaPayloadExpanded038
     * @tc.desc Verify packaged media scene2 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded038', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.scene2');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_4900
     * @tc.name mediaPayloadExpanded039
     * @tc.desc Verify packaged media scene3 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded039', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.scene3');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5000
     * @tc.name mediaPayloadExpanded040
     * @tc.desc Verify packaged media ScreenSaver resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded040', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.ScreenSaver');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5100
     * @tc.name mediaPayloadExpanded041
     * @tc.desc Verify packaged media service resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded041', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.service');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5200
     * @tc.name mediaPayloadExpanded042
     * @tc.desc Verify packaged media singleLeft resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded042', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.singleLeft');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5300
     * @tc.name mediaPayloadExpanded043
     * @tc.desc Verify packaged media singleRight resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded043', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.singleRight');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5400
     * @tc.name mediaPayloadExpanded044
     * @tc.desc Verify packaged media size resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded044', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.size');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5500
     * @tc.name mediaPayloadExpanded045
     * @tc.desc Verify packaged media size_distance resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded045', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.size_distance');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5600
     * @tc.name mediaPayloadExpanded046
     * @tc.desc Verify packaged media sm1 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded046', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.sm1');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5700
     * @tc.name mediaPayloadExpanded047
     * @tc.desc Verify packaged media sm2 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded047', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.sm2');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5800
     * @tc.name mediaPayloadExpanded048
     * @tc.desc Verify packaged media sm3 resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded048', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.sm3');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_5900
     * @tc.name mediaPayloadExpanded049
     * @tc.desc Verify packaged media SmartScreensaver resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded049', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.SmartScreensaver');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6000
     * @tc.name mediaPayloadExpanded050
     * @tc.desc Verify packaged media sound_icon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded050', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.sound_icon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6100
     * @tc.name mediaPayloadExpanded051
     * @tc.desc Verify packaged media splitLine resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded051', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.splitLine');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6200
     * @tc.name mediaPayloadExpanded052
     * @tc.desc Verify packaged media startIcon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded052', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.startIcon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6300
     * @tc.name mediaPayloadExpanded053
     * @tc.desc Verify packaged media store_icon resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded053', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.store_icon');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6400
     * @tc.name mediaPayloadExpanded054
     * @tc.desc Verify packaged media swiper_arrow_left resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded054', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.swiper_arrow_left');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6500
     * @tc.name mediaPayloadExpanded055
     * @tc.desc Verify packaged media swiper_arrow_right resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded055', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.swiper_arrow_right');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6600
     * @tc.name mediaPayloadExpanded056
     * @tc.desc Verify packaged media UniversalInterconnection resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded056', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.UniversalInterconnection');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6700
     * @tc.name mediaPayloadExpanded057
     * @tc.desc Verify packaged media update resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded057', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.update');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6800
     * @tc.name mediaPayloadExpanded058
     * @tc.desc Verify packaged media updateCompleted resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded058', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.updateCompleted');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_6900
     * @tc.name mediaPayloadExpanded059
     * @tc.desc Verify packaged media updateFailed resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded059', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.updateFailed');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_7000
     * @tc.name mediaPayloadExpanded060
     * @tc.desc Verify packaged media video_thumb resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded060', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.video_thumb');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_7100
     * @tc.name mediaPayloadExpanded061
     * @tc.desc Verify packaged media videoPlay resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded061', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.videoPlay');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_7200
     * @tc.name mediaPayloadExpanded062
     * @tc.desc Verify packaged media Voice resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded062', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.Voice');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_7300
     * @tc.name mediaPayloadExpanded063
     * @tc.desc Verify packaged media yanshi resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded063', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.yanshi');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_MEDIA_EXPANDED_7400
     * @tc.name mediaPayloadExpanded064
     * @tc.desc Verify packaged media yanshiselected resolves to a non-empty stable byte payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('mediaPayloadExpanded064', 0, async (): Promise<void> => {
      const resource: Resource = $r('app.media.yanshiselected');
      const first: Uint8Array = await manager.getMediaContent(resource);
      const second: Uint8Array = await manager.getMediaContent(resource);
      expect(first.byteLength > 0).assertTrue();
      expect(second.byteLength).assertEqual(first.byteLength);
      expect(second[0]).assertEqual(first[0]);
    });

  });
}
