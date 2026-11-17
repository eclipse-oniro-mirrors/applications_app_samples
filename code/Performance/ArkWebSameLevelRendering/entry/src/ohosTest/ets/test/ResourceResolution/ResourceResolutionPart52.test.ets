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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { yieldTestEventLoop } from '../Shared/TestScheduling';
import { getResources, getProductImage, getProductTitle, getProductPrice, readRawPage } from '../Shared/SharedDriver';

export default function ResourceResolutionPart52(): void {
  describe('ResourceResolutionPart52', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number ResourceResolutionPart52_0001_resources_title1_price1_image1
    // @tc.name ResourceResolutionPart52_0001_resources_title1_price1_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0001_resources_title1_price1_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0002_resources_title2_price1_image1
    // @tc.name ResourceResolutionPart52_0002_resources_title2_price1_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0002_resources_title2_price1_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0003_resources_title3_price1_image1
    // @tc.name ResourceResolutionPart52_0003_resources_title3_price1_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0003_resources_title3_price1_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0004_resources_title4_price1_image1
    // @tc.name ResourceResolutionPart52_0004_resources_title4_price1_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0004_resources_title4_price1_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(4).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0005_resources_title5_price1_image1
    // @tc.name ResourceResolutionPart52_0005_resources_title5_price1_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0005_resources_title5_price1_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(5).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0006_resources_title0_price2_image1
    // @tc.name ResourceResolutionPart52_0006_resources_title0_price2_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0006_resources_title0_price2_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(0).id);
      const price: string = manager.getStringSync(getProductPrice(2).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0007_resources_title1_price2_image1
    // @tc.name ResourceResolutionPart52_0007_resources_title1_price2_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0007_resources_title1_price2_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(2).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0008_resources_title2_price2_image1
    // @tc.name ResourceResolutionPart52_0008_resources_title2_price2_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0008_resources_title2_price2_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(2).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0009_resources_title3_price2_image1
    // @tc.name ResourceResolutionPart52_0009_resources_title3_price2_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0009_resources_title3_price2_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(2).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0010_resources_title4_price2_image1
    // @tc.name ResourceResolutionPart52_0010_resources_title4_price2_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0010_resources_title4_price2_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(4).id);
      const price: string = manager.getStringSync(getProductPrice(2).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0011_resources_title5_price2_image1
    // @tc.name ResourceResolutionPart52_0011_resources_title5_price2_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0011_resources_title5_price2_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(5).id);
      const price: string = manager.getStringSync(getProductPrice(2).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0012_resources_title0_price3_image1
    // @tc.name ResourceResolutionPart52_0012_resources_title0_price3_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0012_resources_title0_price3_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(0).id);
      const price: string = manager.getStringSync(getProductPrice(3).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0013_resources_title1_price3_image1
    // @tc.name ResourceResolutionPart52_0013_resources_title1_price3_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0013_resources_title1_price3_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(3).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0014_resources_title2_price3_image1
    // @tc.name ResourceResolutionPart52_0014_resources_title2_price3_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0014_resources_title2_price3_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(3).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0015_resources_title3_price3_image1
    // @tc.name ResourceResolutionPart52_0015_resources_title3_price3_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0015_resources_title3_price3_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(3).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0016_resources_title4_price3_image1
    // @tc.name ResourceResolutionPart52_0016_resources_title4_price3_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0016_resources_title4_price3_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(4).id);
      const price: string = manager.getStringSync(getProductPrice(3).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0017_resources_title5_price3_image1
    // @tc.name ResourceResolutionPart52_0017_resources_title5_price3_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0017_resources_title5_price3_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(5).id);
      const price: string = manager.getStringSync(getProductPrice(3).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0018_resources_title0_price4_image1
    // @tc.name ResourceResolutionPart52_0018_resources_title0_price4_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0018_resources_title0_price4_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(0).id);
      const price: string = manager.getStringSync(getProductPrice(4).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0019_resources_title1_price4_image1
    // @tc.name ResourceResolutionPart52_0019_resources_title1_price4_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0019_resources_title1_price4_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(4).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0020_resources_title2_price4_image1
    // @tc.name ResourceResolutionPart52_0020_resources_title2_price4_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0020_resources_title2_price4_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(4).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0021_resources_title3_price4_image1
    // @tc.name ResourceResolutionPart52_0021_resources_title3_price4_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0021_resources_title3_price4_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(4).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0022_resources_title4_price4_image1
    // @tc.name ResourceResolutionPart52_0022_resources_title4_price4_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0022_resources_title4_price4_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(4).id);
      const price: string = manager.getStringSync(getProductPrice(4).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0023_resources_title5_price4_image1
    // @tc.name ResourceResolutionPart52_0023_resources_title5_price4_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0023_resources_title5_price4_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(5).id);
      const price: string = manager.getStringSync(getProductPrice(4).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0024_resources_title0_price5_image1
    // @tc.name ResourceResolutionPart52_0024_resources_title0_price5_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0024_resources_title0_price5_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(0).id);
      const price: string = manager.getStringSync(getProductPrice(5).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0025_resources_title1_price5_image1
    // @tc.name ResourceResolutionPart52_0025_resources_title1_price5_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0025_resources_title1_price5_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(5).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0026_resources_title2_price5_image1
    // @tc.name ResourceResolutionPart52_0026_resources_title2_price5_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0026_resources_title2_price5_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(5).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0027_resources_title3_price5_image1
    // @tc.name ResourceResolutionPart52_0027_resources_title3_price5_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0027_resources_title3_price5_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(5).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0028_resources_title4_price5_image1
    // @tc.name ResourceResolutionPart52_0028_resources_title4_price5_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0028_resources_title4_price5_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(4).id);
      const price: string = manager.getStringSync(getProductPrice(5).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0029_resources_title5_price5_image1
    // @tc.name ResourceResolutionPart52_0029_resources_title5_price5_image1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0029_resources_title5_price5_image1', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(5).id);
      const price: string = manager.getStringSync(getProductPrice(5).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(1).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0030_resources_title0_price0_image2
    // @tc.name ResourceResolutionPart52_0030_resources_title0_price0_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0030_resources_title0_price0_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(0).id);
      const price: string = manager.getStringSync(getProductPrice(0).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0031_resources_title1_price0_image2
    // @tc.name ResourceResolutionPart52_0031_resources_title1_price0_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0031_resources_title1_price0_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(0).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0032_resources_title2_price0_image2
    // @tc.name ResourceResolutionPart52_0032_resources_title2_price0_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0032_resources_title2_price0_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(0).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0033_resources_title3_price0_image2
    // @tc.name ResourceResolutionPart52_0033_resources_title3_price0_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0033_resources_title3_price0_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(0).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0034_resources_title4_price0_image2
    // @tc.name ResourceResolutionPart52_0034_resources_title4_price0_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0034_resources_title4_price0_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(4).id);
      const price: string = manager.getStringSync(getProductPrice(0).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0035_resources_title5_price0_image2
    // @tc.name ResourceResolutionPart52_0035_resources_title5_price0_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0035_resources_title5_price0_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(5).id);
      const price: string = manager.getStringSync(getProductPrice(0).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0036_resources_title0_price1_image2
    // @tc.name ResourceResolutionPart52_0036_resources_title0_price1_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0036_resources_title0_price1_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(0).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0037_resources_title1_price1_image2
    // @tc.name ResourceResolutionPart52_0037_resources_title1_price1_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0037_resources_title1_price1_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(1).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0038_resources_title2_price1_image2
    // @tc.name ResourceResolutionPart52_0038_resources_title2_price1_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0038_resources_title2_price1_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(2).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });

    // @tc.number ResourceResolutionPart52_0039_resources_title3_price1_image2
    // @tc.name ResourceResolutionPart52_0039_resources_title3_price1_image2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ResourceManager resolves product strings PNG images and the packaged nativeSearch HTML
    it('ResourceResolutionPart52_0039_resources_title3_price1_image2', 0, async (): Promise<void> => {
      const manager = getResources();
      const title: string = manager.getStringSync(getProductTitle(3).id);
      const price: string = manager.getStringSync(getProductPrice(1).id);
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(titleLength).assertLarger(0);
      expect(priceLength).assertLarger(0);
      const image = await manager.getMediaContent(getProductImage(2).id);
      const imageLength: number = image.length;
      expect(imageLength).assertLarger(8);
      const signature0: number = image[0];
      const signature1: number = image[1];
      expect(signature0).assertEqual(137);
      expect(signature1).assertEqual(80);
      const raw: string = await readRawPage();
      const hasEmbed: boolean = raw.includes('id="nativeSearch"');
      const hasNativeType: boolean = raw.includes('"native/component"');
      expect(hasEmbed).assertTrue();
      expect(hasNativeType).assertTrue();
    });
  });
}
