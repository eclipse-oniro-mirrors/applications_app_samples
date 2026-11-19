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
import { delayTick } from './shared/AsyncYield';
import { ListConfigFactory } from '../../../main/ets/model/ListModels';
import { IconTypeV2, ContentItemV2, OperateItemV2 } from '@kit.ArkUI';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_ComposeList]';

export default function ListConfigV2GridMatrixPart1Test(): void {
  describe('ListConfigV2GridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0100
     * @tc.name      testV2Content0001
     * @tc.desc      Verify V2 content NORMAL_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0001 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.NORMAL_ICON, '', '', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.NORMAL_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0200
     * @tc.name      testV2Content0002
     * @tc.desc      Verify V2 content NORMAL_ICON 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0002 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.NORMAL_ICON, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.NORMAL_ICON);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0300
     * @tc.name      testV2Content0003
     * @tc.desc      Verify V2 content NORMAL_ICON '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0003 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.NORMAL_ICON, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconTypeV2.NORMAL_ICON);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0400
     * @tc.name      testV2Content0004
     * @tc.desc      Verify V2 content NORMAL_ICON 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0004 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.NORMAL_ICON, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconTypeV2.NORMAL_ICON);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0500
     * @tc.name      testV2Content0005
     * @tc.desc      Verify V2 content NORMAL_ICON 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0005 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.NORMAL_ICON, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconTypeV2.NORMAL_ICON);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0600
     * @tc.name      testV2Content0006
     * @tc.desc      Verify V2 content SYSTEM_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0006 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.SYSTEM_ICON, '', '', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0700
     * @tc.name      testV2Content0007
     * @tc.desc      Verify V2 content SYSTEM_ICON 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0007 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.SYSTEM_ICON, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0800
     * @tc.name      testV2Content0008
     * @tc.desc      Verify V2 content SYSTEM_ICON '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0008 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.SYSTEM_ICON, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconTypeV2.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_0900
     * @tc.name      testV2Content0009
     * @tc.desc      Verify V2 content SYSTEM_ICON 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0009 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.SYSTEM_ICON, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconTypeV2.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1000
     * @tc.name      testV2Content0010
     * @tc.desc      Verify V2 content SYSTEM_ICON 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0010 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.SYSTEM_ICON, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconTypeV2.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1100
     * @tc.name      testV2Content0011
     * @tc.desc      Verify V2 content APP_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0011 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.APP_ICON, '', '', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.APP_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1200
     * @tc.name      testV2Content0012
     * @tc.desc      Verify V2 content APP_ICON 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0012 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.APP_ICON, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.APP_ICON);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1300
     * @tc.name      testV2Content0013
     * @tc.desc      Verify V2 content APP_ICON '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0013 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.APP_ICON, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconTypeV2.APP_ICON);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1400
     * @tc.name      testV2Content0014
     * @tc.desc      Verify V2 content APP_ICON 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0014 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.APP_ICON, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconTypeV2.APP_ICON);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1500
     * @tc.name      testV2Content0015
     * @tc.desc      Verify V2 content APP_ICON 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0015 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.APP_ICON, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconTypeV2.APP_ICON);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1600
     * @tc.name      testV2Content0016
     * @tc.desc      Verify V2 content PREVIEW ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0016 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.PREVIEW, '', '', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.PREVIEW);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1700
     * @tc.name      testV2Content0017
     * @tc.desc      Verify V2 content PREVIEW 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0017 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.PREVIEW, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconTypeV2.PREVIEW);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1800
     * @tc.name      testV2Content0018
     * @tc.desc      Verify V2 content PREVIEW '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0018 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.PREVIEW, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconTypeV2.PREVIEW);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_1900
     * @tc.name      testV2Content0019
     * @tc.desc      Verify V2 content PREVIEW 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0019 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.PREVIEW, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconTypeV2.PREVIEW);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2000
     * @tc.name      testV2Content0020
     * @tc.desc      Verify V2 content PREVIEW 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Content0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0020 begin');
      await delayTick();
      const item: ContentItemV2 = ListConfigFactory.buildV2ContentItemWithDesc('icon.png', IconTypeV2.PREVIEW, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconTypeV2.PREVIEW);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Content0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2100
     * @tc.name      testV2Toggle0021
     * @tc.desc      Verify V2 toggle initial true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Toggle0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Toggle0021 begin');
      await delayTick();
      let seen: boolean = false;
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateToggle(true, (v: boolean): void => { seen = v; });
      expect(op.toggle?.isCheck).assertEqual(true);
      op.toggle?.onChange?.(!true);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Toggle0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2200
     * @tc.name      testV2Toggle0022
     * @tc.desc      Verify V2 toggle initial false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Toggle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Toggle0022 begin');
      await delayTick();
      let seen: boolean = true;
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateToggle(false, (v: boolean): void => { seen = v; });
      expect(op.toggle?.isCheck).assertEqual(false);
      op.toggle?.onChange?.(!false);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Toggle0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2300
     * @tc.name      testV2Checkbox0023
     * @tc.desc      Verify V2 checkbox initial true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Checkbox0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Checkbox0023 begin');
      await delayTick();
      let seen: boolean = false;
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateCheckbox(true, (v: boolean): void => { seen = v; });
      expect(op.checkbox?.isCheck).assertEqual(true);
      op.checkbox?.onChange?.(!true);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Checkbox0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2400
     * @tc.name      testV2Checkbox0024
     * @tc.desc      Verify V2 checkbox initial false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Checkbox0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Checkbox0024 begin');
      await delayTick();
      let seen: boolean = true;
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateCheckbox(false, (v: boolean): void => { seen = v; });
      expect(op.checkbox?.isCheck).assertEqual(false);
      op.checkbox?.onChange?.(!false);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Checkbox0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2500
     * @tc.name      testV2Button0025
     * @tc.desc      Verify V2 button text ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Button0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0025 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateButton('');
      expect(op.button?.text).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2600
     * @tc.name      testV2Button0026
     * @tc.desc      Verify V2 button text 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Button0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0026 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateButton('OK');
      expect(op.button?.text).assertEqual('OK');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2700
     * @tc.name      testV2Button0027
     * @tc.desc      Verify V2 button text '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Button0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0027 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateButton('确定');
      expect(op.button?.text).assertEqual('确定');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0027 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2800
     * @tc.name      testV2Button0028
     * @tc.desc      Verify V2 button text 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Button0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0028 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateButton('a b');
      expect(op.button?.text).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0028 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_2900
     * @tc.name      testV2Button0029
     * @tc.desc      Verify V2 button text '#1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Button0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0029 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateButton('#1');
      expect(op.button?.text).assertEqual('#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Button0029 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_3000
     * @tc.name      testV2Text0030
     * @tc.desc      Verify V2 text operate ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Text0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0030 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateText('');
      expect(op.text).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0030 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_3100
     * @tc.name      testV2Text0031
     * @tc.desc      Verify V2 text operate 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Text0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0031 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateText('OK');
      expect(op.text).assertEqual('OK');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0031 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_3200
     * @tc.name      testV2Text0032
     * @tc.desc      Verify V2 text operate '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Text0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0032 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateText('确定');
      expect(op.text).assertEqual('确定');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0032 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_3300
     * @tc.name      testV2Text0033
     * @tc.desc      Verify V2 text operate 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Text0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0033 begin');
      await delayTick();
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateText('a b');
      expect(op.text).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Text0033 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC2P1_3400
     * @tc.name      testV2Double0034
     * @tc.desc      Verify V2 double icon actions 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV2Double0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Double0034 begin');
      await delayTick();
      let hits: number = 0;
      const op: OperateItemV2 = ListConfigFactory.buildV2OperateDoubleIcon((): void => { hits++; }, (): void => { hits += 10; });
      op.icon?.action?.();
      op.subIcon?.action?.();
      expect(hits).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV2Double0034 end');
    })

  })
}
