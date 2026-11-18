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

// Adapted from ets/test/Validation/KeyCodeValidation.test.ets.
// Boundary and mutation scenarios exercise the production model, not a copied implementation.
import { yieldToLifecycle } from '../Shared/SharedDriver';

export default function renderingKeyCodeValidationTest(): void {
  describe('RenderingKeyCodeValidation', (): void => {
    let snapshot: ProductDataModel[] = [];
    beforeAll((): void => {
      logSuite('RenderingKeyCodeValidation', 'begin');
    });
    beforeEach(async (): Promise<void> => {
      await yieldToLifecycle();
      snapshot = catalogSnapshot();
    });
    afterEach((): void => {
      assertCatalogUnchanged(snapshot);
    });
    afterAll((): void => {
      logSuite('RenderingKeyCodeValidation', 'end');
    });

    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001297
    // @tc.name renderingKeyCodeValidation001
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation001', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001298
    // @tc.name renderingKeyCodeValidation002
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation002', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001299
    // @tc.name renderingKeyCodeValidation003
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation003', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001300
    // @tc.name renderingKeyCodeValidation004
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation004', 0, (): void => {
      const initialId: number = 0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001301
    // @tc.name renderingKeyCodeValidation005
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation005', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001302
    // @tc.name renderingKeyCodeValidation006
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation006', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001303
    // @tc.name renderingKeyCodeValidation007
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation007', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001304
    // @tc.name renderingKeyCodeValidation008
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation008', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001305
    // @tc.name renderingKeyCodeValidation009
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation009', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001306
    // @tc.name renderingKeyCodeValidation010
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation010', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001307
    // @tc.name renderingKeyCodeValidation011
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation011', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001308
    // @tc.name renderingKeyCodeValidation012
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation012', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001309
    // @tc.name renderingKeyCodeValidation013
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation013', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001310
    // @tc.name renderingKeyCodeValidation014
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation014', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001311
    // @tc.name renderingKeyCodeValidation015
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation015', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001312
    // @tc.name renderingKeyCodeValidation016
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation016', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001313
    // @tc.name renderingKeyCodeValidation017
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation017', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001314
    // @tc.name renderingKeyCodeValidation018
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation018', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001315
    // @tc.name renderingKeyCodeValidation019
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation019', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001316
    // @tc.name renderingKeyCodeValidation020
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation020', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001317
    // @tc.name renderingKeyCodeValidation021
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation021', 0, (): void => {
      const initialId: number = Number.MIN_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001318
    // @tc.name renderingKeyCodeValidation022
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation022', 0, (): void => {
      const initialId: number = Number.MIN_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001319
    // @tc.name renderingKeyCodeValidation023
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation023', 0, (): void => {
      const initialId: number = Number.MIN_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001320
    // @tc.name renderingKeyCodeValidation024
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation024', 0, (): void => {
      const initialId: number = Number.MIN_SAFE_INTEGER;
      const initialUri: ResourceStr = $r(
        'app.string.nativeembed_product_price000',
      );
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001321
    // @tc.name renderingKeyCodeValidation025
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation025', 0, (): void => {
      const initialId: number = 0;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001322
    // @tc.name renderingKeyCodeValidation026
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation026', 0, (): void => {
      const initialId: number = 0;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001323
    // @tc.name renderingKeyCodeValidation027
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation027', 0, (): void => {
      const initialId: number = 0;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001324
    // @tc.name renderingKeyCodeValidation028
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation028', 0, (): void => {
      const initialId: number = 0;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001325
    // @tc.name renderingKeyCodeValidation029
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation029', 0, (): void => {
      const initialId: number = -1;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001326
    // @tc.name renderingKeyCodeValidation030
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation030', 0, (): void => {
      const initialId: number = -1;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001327
    // @tc.name renderingKeyCodeValidation031
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingKeyCodeValidation031', 0, (): void => {
      const initialId: number = -1;
      const initialUri: ResourceStr = '';
      const initialTitle: ResourceStr = 'line\nbreak\ttab';
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
  });
}
