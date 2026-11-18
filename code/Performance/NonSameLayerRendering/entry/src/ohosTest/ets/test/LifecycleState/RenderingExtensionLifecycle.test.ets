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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
} from '@ohos/hypium';
import { ProductDataModel } from '../../../../main/ets/model/GoodsModel';
import {
  catalogSnapshot,
  assertCatalogUnchanged,
  logSuite,
} from '../Shared/SharedDriver';

// Adapted from ets/test/LifecycleState/ExtensionLifecycle.test.ets.
// Boundary and mutation scenarios exercise the production model, not a copied implementation.
import { yieldToLifecycle } from '../Shared/SharedDriver';

export default function renderingExtensionLifecycleTest(): void {
  describe('RenderingExtensionLifecycle', (): void => {
    let snapshot: ProductDataModel[] = [];
    beforeAll((): void => {
      logSuite('RenderingExtensionLifecycle', 'begin');
    });
    beforeEach(async (): Promise<void> => {
      await yieldToLifecycle();
      snapshot = catalogSnapshot();
    });
    afterEach((): void => {
      assertCatalogUnchanged(snapshot);
    });
    afterAll((): void => {
      logSuite('RenderingExtensionLifecycle', 'end');
    });

    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000499
    // @tc.name renderingExtensionLifecycle001
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle001', 0, (): void => {
      const initialId: number = 4;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.title = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(replacement);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000500
    // @tc.name renderingExtensionLifecycle002
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle002', 0, (): void => {
      const initialId: number = 4;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.price = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(replacement);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000501
    // @tc.name renderingExtensionLifecycle003
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle003', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: number = initialId + 1;
      subject.id = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(replacement);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000502
    // @tc.name renderingExtensionLifecycle004
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle004', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.uri = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(replacement);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000503
    // @tc.name renderingExtensionLifecycle005
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle005', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.title = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(replacement);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000504
    // @tc.name renderingExtensionLifecycle006
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle006', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.price = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(replacement);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000505
    // @tc.name renderingExtensionLifecycle007
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle007', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: number = initialId + 1;
      subject.id = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(replacement);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000506
    // @tc.name renderingExtensionLifecycle008
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle008', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.uri = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(replacement);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000507
    // @tc.name renderingExtensionLifecycle009
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle009', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.title = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(replacement);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000508
    // @tc.name renderingExtensionLifecycle010
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle010', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.price = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(replacement);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000509
    // @tc.name renderingExtensionLifecycle011
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle011', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: number = initialId + 1;
      subject.id = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(replacement);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000510
    // @tc.name renderingExtensionLifecycle012
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle012', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.uri = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(replacement);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000511
    // @tc.name renderingExtensionLifecycle013
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle013', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.title = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(replacement);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000512
    // @tc.name renderingExtensionLifecycle014
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle014', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.price = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(replacement);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000513
    // @tc.name renderingExtensionLifecycle015
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle015', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: number = initialId + 1;
      subject.id = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(replacement);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(initialUri);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000514
    // @tc.name renderingExtensionLifecycle016
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingExtensionLifecycle016', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = '\u0000embedded';
      const initialTitle: ResourceStr = 'plain text';
      const initialPrice: ResourceStr = $r(
        'app.string.nativeembed_product_price004',
      );
      const subject: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const independent: ProductDataModel = new ProductDataModel(
        initialId,
        initialUri,
        initialTitle,
        initialPrice,
      );
      const constructedId: number = subject.id;
      expect(constructedId).assertEqual(initialId);
      const constructedUri: ResourceStr = subject.uri;
      expect(constructedUri).assertEqual(initialUri);
      const constructedTitle: ResourceStr = subject.title;
      expect(constructedTitle).assertEqual(initialTitle);
      const constructedPrice: ResourceStr = subject.price;
      expect(constructedPrice).assertEqual(initialPrice);
      const replacement: ResourceStr =
        'replacement-' + initialId.toString();
      subject.uri = replacement;
      const updatedId: number = subject.id;
      expect(updatedId).assertEqual(initialId);
      const independentId: number = independent.id;
      expect(independentId).assertEqual(initialId);
      const updatedUri: ResourceStr = subject.uri;
      expect(updatedUri).assertEqual(replacement);
      const independentUri: ResourceStr = independent.uri;
      expect(independentUri).assertEqual(initialUri);
      const updatedTitle: ResourceStr = subject.title;
      expect(updatedTitle).assertEqual(initialTitle);
      const independentTitle: ResourceStr = independent.title;
      expect(independentTitle).assertEqual(initialTitle);
      const updatedPrice: ResourceStr = subject.price;
      expect(updatedPrice).assertEqual(initialPrice);
      const independentPrice: ResourceStr = independent.price;
      expect(independentPrice).assertEqual(initialPrice);
    });
  });
}
