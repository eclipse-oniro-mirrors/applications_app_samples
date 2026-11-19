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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { CardItemInfo, FormModel } from '@ohos/base';

function createCard(cardId: number, cardName: string): CardItemInfo {
  const card: CardItemInfo = new CardItemInfo();
  card.cardId = cardId;
  card.cardName = cardName;
  card.bundleName = 'com.samples.form';
  card.abilityName = 'FormAbility';
  card.moduleName = 'entry';
  card.formConfigAbility = 'FormConfigAbility';
  card.appLabelId = 'form_label';
  return card;
}

export default function formModelCacheTest() {
  describe('LauncherFormModelCacheTest', () => {

    /**
     * @tc.name   testSetAndGetFormInfo0001
     * @tc.number SUB_LAUNCHER_ENTRY_FORMMODEL_0100
     * @tc.desc   Test that FormModel stores and returns the form list of a bundle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetAndGetFormInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cards: CardItemInfo[] = [createCard(1, 'WeatherCard'), createCard(2, 'ClockCard')];
      FormModel.setAppItemFormInfo('com.samples.form', cards);
      const result: CardItemInfo[] | undefined = FormModel.getAppItemFormInfo('com.samples.form');
      expect(result !== undefined).assertTrue();
      expect(result?.length).assertEqual(2);
      expect(result?.[0].cardName).assertEqual('WeatherCard');
      expect(result?.[1].cardId).assertEqual(2);
      FormModel.setAppItemFormInfo('com.samples.form', []);
    })

    /**
     * @tc.name   testGetMissingFormInfo0002
     * @tc.number SUB_LAUNCHER_ENTRY_FORMMODEL_0200
     * @tc.desc   Test that an unknown bundle name returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMissingFormInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: CardItemInfo[] | undefined = FormModel.getAppItemFormInfo('com.samples.missing');
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.name   testOverwriteFormInfo0003
     * @tc.number SUB_LAUNCHER_ENTRY_FORMMODEL_0300
     * @tc.desc   Test that writing the same bundle replaces its form list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverwriteFormInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      FormModel.setAppItemFormInfo('com.samples.overwrite', [createCard(1, 'OldCard')]);
      FormModel.setAppItemFormInfo('com.samples.overwrite', [createCard(2, 'NewCard')]);
      const result: CardItemInfo[] | undefined = FormModel.getAppItemFormInfo('com.samples.overwrite');
      expect(result?.length).assertEqual(1);
      expect(result?.[0].cardId).assertEqual(2);
      expect(result?.[0].cardName).assertEqual('NewCard');
      FormModel.setAppItemFormInfo('com.samples.overwrite', []);
    })

    /**
     * @tc.name   testEmptyFormList0004
     * @tc.number SUB_LAUNCHER_ENTRY_FORMMODEL_0400
     * @tc.desc   Test that an explicitly stored empty form list is returned as empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmptyFormList0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      FormModel.setAppItemFormInfo('com.samples.empty', []);
      const result: CardItemInfo[] | undefined = FormModel.getAppItemFormInfo('com.samples.empty');
      expect(result !== undefined).assertTrue();
      expect(result?.length).assertEqual(0);
    })

    /**
     * @tc.name   testMultipleBundleIsolation0005
     * @tc.number SUB_LAUNCHER_ENTRY_FORMMODEL_0500
     * @tc.desc   Test that form lists of different bundles are isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultipleBundleIsolation0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      FormModel.setAppItemFormInfo('com.samples.one', [createCard(11, 'OneCard')]);
      FormModel.setAppItemFormInfo('com.samples.two', [createCard(22, 'TwoCard')]);
      expect(FormModel.getAppItemFormInfo('com.samples.one')?.[0].cardId).assertEqual(11);
      expect(FormModel.getAppItemFormInfo('com.samples.two')?.[0].cardId).assertEqual(22);
      FormModel.setAppItemFormInfo('com.samples.one', []);
      FormModel.setAppItemFormInfo('com.samples.two', []);
    })

    /**
     * @tc.name   testStoredArrayReference0006
     * @tc.number SUB_LAUNCHER_ENTRY_FORMMODEL_0600
     * @tc.desc   Test that the form list is stored by reference and reflects later changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoredArrayReference0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cards: CardItemInfo[] = [createCard(1, 'FirstCard')];
      FormModel.setAppItemFormInfo('com.samples.reference', cards);
      cards.push(createCard(2, 'SecondCard'));
      const result: CardItemInfo[] | undefined = FormModel.getAppItemFormInfo('com.samples.reference');
      expect(result?.length).assertEqual(2);
      expect(result?.[1].cardName).assertEqual('SecondCard');
      FormModel.setAppItemFormInfo('com.samples.reference', []);
    })

  })
}
