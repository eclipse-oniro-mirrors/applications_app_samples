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

// Adapted from ets/test/Integration/ComprehensiveRegression.test.ets.
// Boundary and mutation scenarios exercise the production model, not a copied implementation.
import { yieldToLifecycle } from '../Shared/SharedDriver';

export default function renderingComprehensiveRegressionTest(): void {
  describe('RenderingComprehensiveRegression', (): void => {
    let snapshot: ProductDataModel[] = [];
    beforeAll((): void => {
      logSuite('RenderingComprehensiveRegression', 'begin');
    });
    beforeEach(async (): Promise<void> => {
      await yieldToLifecycle();
      snapshot = catalogSnapshot();
    });
    afterEach((): void => {
      assertCatalogUnchanged(snapshot);
    });
    afterAll((): void => {
      logSuite('RenderingComprehensiveRegression', 'end');
    });

    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000029
    // @tc.name renderingComprehensiveRegression001
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression001', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000030
    // @tc.name renderingComprehensiveRegression002
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression002', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000031
    // @tc.name renderingComprehensiveRegression003
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression003', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000032
    // @tc.name renderingComprehensiveRegression004
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression004', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000033
    // @tc.name renderingComprehensiveRegression005
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression005', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000034
    // @tc.name renderingComprehensiveRegression006
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression006', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000035
    // @tc.name renderingComprehensiveRegression007
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression007', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000036
    // @tc.name renderingComprehensiveRegression008
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression008', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000037
    // @tc.name renderingComprehensiveRegression009
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression009', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000038
    // @tc.name renderingComprehensiveRegression010
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression010', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000039
    // @tc.name renderingComprehensiveRegression011
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression011', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000040
    // @tc.name renderingComprehensiveRegression012
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression012', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000041
    // @tc.name renderingComprehensiveRegression013
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression013', 0, (): void => {
      const initialId: number = Number.MIN_SAFE_INTEGER;
      const initialUri: ResourceStr = '';
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_000042
    // @tc.name renderingComprehensiveRegression014
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingComprehensiveRegression014', 0, (): void => {
      const initialId: number = Number.MIN_SAFE_INTEGER;
      const initialUri: ResourceStr = '';
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
