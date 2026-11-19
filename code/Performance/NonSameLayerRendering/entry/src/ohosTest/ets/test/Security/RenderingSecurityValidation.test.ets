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

// Adapted from ets/test/Security/SecurityValidation.test.ets.
// Boundary and mutation scenarios exercise the production model, not a copied implementation.
import { yieldToLifecycle } from '../Shared/SharedDriver';

export default function renderingSecurityValidationTest(): void {
  describe('RenderingSecurityValidation', (): void => {
    let snapshot: ProductDataModel[] = [];
    beforeAll((): void => {
      logSuite('RenderingSecurityValidation', 'begin');
    });
    beforeEach(async (): Promise<void> => {
      await yieldToLifecycle();
      snapshot = catalogSnapshot();
    });
    afterEach((): void => {
      assertCatalogUnchanged(snapshot);
    });
    afterAll((): void => {
      logSuite('RenderingSecurityValidation', 'end');
    });

    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001126
    // @tc.name renderingSecurityValidation001
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation001', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001127
    // @tc.name renderingSecurityValidation002
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation002', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001128
    // @tc.name renderingSecurityValidation003
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation003', 0, (): void => {
      const initialId: number = -0.5;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001129
    // @tc.name renderingSecurityValidation004
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation004', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001130
    // @tc.name renderingSecurityValidation005
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation005', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001131
    // @tc.name renderingSecurityValidation006
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation006', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001132
    // @tc.name renderingSecurityValidation007
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation007', 0, (): void => {
      const initialId: number = 2147483647;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001133
    // @tc.name renderingSecurityValidation008
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation008', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001134
    // @tc.name renderingSecurityValidation009
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation009', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001135
    // @tc.name renderingSecurityValidation010
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation010', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001136
    // @tc.name renderingSecurityValidation011
    // @tc.desc Verify ProductDataModel price assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation011', 0, (): void => {
      const initialId: number = -2147483648;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001137
    // @tc.name renderingSecurityValidation012
    // @tc.desc Verify ProductDataModel id assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation012', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001138
    // @tc.name renderingSecurityValidation013
    // @tc.desc Verify ProductDataModel uri assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation013', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
    // @tc.number SUB_ARKWEB_NON_SAME_LAYER_001139
    // @tc.name renderingSecurityValidation014
    // @tc.desc Verify ProductDataModel title assignment preserves other fields and independent instances
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2

    it('renderingSecurityValidation014', 0, (): void => {
      const initialId: number = Number.MAX_SAFE_INTEGER;
      const initialUri: ResourceStr = 'x'.repeat(4096);
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
  });
}
