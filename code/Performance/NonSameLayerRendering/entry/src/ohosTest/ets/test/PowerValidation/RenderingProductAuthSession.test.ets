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

// Adapted from ets/test/PowerValidation/PowerAuthSession.test.ets.
// Boundary and mutation scenarios exercise the production model, not a copied implementation.
import { yieldToLifecycle } from '../Shared/SharedDriver';

export default function renderingProductAuthSessionTest(): void {
  describe('RenderingProductAuthSession', (): void => {
    let snapshot: ProductDataModel[] = [];
    beforeAll((): void => {
      logSuite('RenderingProductAuthSession', 'begin');
    });
    beforeEach(async (): Promise<void> => {
      await yieldToLifecycle();
      snapshot = catalogSnapshot();
    });
    afterEach((): void => {
      assertCatalogUnchanged(snapshot);
    });
    afterAll((): void => {
      logSuite('RenderingProductAuthSession', 'end');
    });

    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000978
    // @tc.name renderingProductAuthSession001
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession001', 0, (): void => {
      const initialId: number = 1;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000979
    // @tc.name renderingProductAuthSession002
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession002', 0, (): void => {
      const initialId: number = 1;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000980
    // @tc.name renderingProductAuthSession003
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession003', 0, (): void => {
      const initialId: number = 1;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000981
    // @tc.name renderingProductAuthSession004
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession004', 0, (): void => {
      const initialId: number = 4;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000982
    // @tc.name renderingProductAuthSession005
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession005', 0, (): void => {
      const initialId: number = 4;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000983
    // @tc.name renderingProductAuthSession006
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession006', 0, (): void => {
      const initialId: number = 4;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000984
    // @tc.name renderingProductAuthSession007
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession007', 0, (): void => {
      const initialId: number = 4;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000985
    // @tc.name renderingProductAuthSession008
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession008', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000986
    // @tc.name renderingProductAuthSession009
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession009', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000987
    // @tc.name renderingProductAuthSession010
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession010', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000988
    // @tc.name renderingProductAuthSession011
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession011', 0, (): void => {
      const initialId: number = 16;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000989
    // @tc.name renderingProductAuthSession012
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession012', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000990
    // @tc.name renderingProductAuthSession013
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession013', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000991
    // @tc.name renderingProductAuthSession014
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession014', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000992
    // @tc.name renderingProductAuthSession015
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession015', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000993
    // @tc.name renderingProductAuthSession016
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession016', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000994
    // @tc.name renderingProductAuthSession017
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession017', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000995
    // @tc.name renderingProductAuthSession018
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession018', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000996
    // @tc.name renderingProductAuthSession019
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession019', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000997
    // @tc.name renderingProductAuthSession020
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingProductAuthSession020', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = 'file:///data/local/item.png';
      const initialTitle: ResourceStr = '  leading and trailing  ';
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
  });
}
