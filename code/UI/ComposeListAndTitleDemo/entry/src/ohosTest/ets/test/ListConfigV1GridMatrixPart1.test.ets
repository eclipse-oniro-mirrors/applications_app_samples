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
import { IconType, ContentItem, OperateItem } from '@kit.ArkUI';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_ComposeList]';

export default function ListConfigV1GridMatrixPart1Test(): void {
  describe('ListConfigV1GridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0100
     * @tc.name      testV1Content0001
     * @tc.desc      Verify V1 content NORMAL_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0001 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.NORMAL_ICON, '', '', '');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0200
     * @tc.name      testV1Content0002
     * @tc.desc      Verify V1 content NORMAL_ICON 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0002 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.NORMAL_ICON, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0300
     * @tc.name      testV1Content0003
     * @tc.desc      Verify V1 content NORMAL_ICON '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0003 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.NORMAL_ICON, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0400
     * @tc.name      testV1Content0004
     * @tc.desc      Verify V1 content NORMAL_ICON 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0004 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.NORMAL_ICON, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0500
     * @tc.name      testV1Content0005
     * @tc.desc      Verify V1 content NORMAL_ICON 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0005 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.NORMAL_ICON, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0600
     * @tc.name      testV1Content0006
     * @tc.desc      Verify V1 content SYSTEM_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0006 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.SYSTEM_ICON, '', '', '');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0700
     * @tc.name      testV1Content0007
     * @tc.desc      Verify V1 content SYSTEM_ICON 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0007 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.SYSTEM_ICON, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0800
     * @tc.name      testV1Content0008
     * @tc.desc      Verify V1 content SYSTEM_ICON '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0008 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.SYSTEM_ICON, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_0900
     * @tc.name      testV1Content0009
     * @tc.desc      Verify V1 content SYSTEM_ICON 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0009 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.SYSTEM_ICON, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1000
     * @tc.name      testV1Content0010
     * @tc.desc      Verify V1 content SYSTEM_ICON 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0010 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.SYSTEM_ICON, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1100
     * @tc.name      testV1Content0011
     * @tc.desc      Verify V1 content APP_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0011 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.APP_ICON, '', '', '');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1200
     * @tc.name      testV1Content0012
     * @tc.desc      Verify V1 content APP_ICON 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0012 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.APP_ICON, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1300
     * @tc.name      testV1Content0013
     * @tc.desc      Verify V1 content APP_ICON '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0013 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.APP_ICON, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1400
     * @tc.name      testV1Content0014
     * @tc.desc      Verify V1 content APP_ICON 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0014 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.APP_ICON, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1500
     * @tc.name      testV1Content0015
     * @tc.desc      Verify V1 content APP_ICON 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0015 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.APP_ICON, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1600
     * @tc.name      testV1Content0016
     * @tc.desc      Verify V1 content PREVIEW ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0016 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.PREVIEW, '', '', '');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1700
     * @tc.name      testV1Content0017
     * @tc.desc      Verify V1 content PREVIEW 'Main'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0017 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.PREVIEW, 'Main', 'Sub', '');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('Main');
      expect(item.secondaryText).assertEqual('Sub');
      expect(item.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1800
     * @tc.name      testV1Content0018
     * @tc.desc      Verify V1 content PREVIEW '主标题'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0018 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.PREVIEW, '主标题', '副标题', '描述');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_1900
     * @tc.name      testV1Content0019
     * @tc.desc      Verify V1 content PREVIEW 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0019 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.PREVIEW, 'a b', 'c#d', 'e f');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('a b');
      expect(item.secondaryText).assertEqual('c#d');
      expect(item.description).assertEqual('e f');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2000
     * @tc.name      testV1Content0020
     * @tc.desc      Verify V1 content PREVIEW 'line1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Content0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0020 begin');
      await delayTick();
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc('icon.png', IconType.PREVIEW, 'line1', 'line2', 'line3');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('line1');
      expect(item.secondaryText).assertEqual('line2');
      expect(item.description).assertEqual('line3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Content0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2100
     * @tc.name      testV1Switch0021
     * @tc.desc      Verify V1 switch initial true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Switch0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Switch0021 begin');
      await delayTick();
      let seen: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateSwitch(true, (v: boolean): void => { seen = v; });
      expect(op.switch?.isCheck).assertEqual(true);
      op.switch?.onChange?.(!true);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Switch0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2200
     * @tc.name      testV1Switch0022
     * @tc.desc      Verify V1 switch initial false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Switch0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Switch0022 begin');
      await delayTick();
      let seen: boolean = true;
      const op: OperateItem = ListConfigFactory.buildV1OperateSwitch(false, (v: boolean): void => { seen = v; });
      expect(op.switch?.isCheck).assertEqual(false);
      op.switch?.onChange?.(!false);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Switch0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2300
     * @tc.name      testV1Checkbox0023
     * @tc.desc      Verify V1 checkbox initial true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Checkbox0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Checkbox0023 begin');
      await delayTick();
      let seen: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateCheckbox(true, (v: boolean): void => { seen = v; });
      expect(op.checkbox?.isCheck).assertEqual(true);
      op.checkbox?.onChange?.(!true);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Checkbox0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2400
     * @tc.name      testV1Checkbox0024
     * @tc.desc      Verify V1 checkbox initial false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Checkbox0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Checkbox0024 begin');
      await delayTick();
      let seen: boolean = true;
      const op: OperateItem = ListConfigFactory.buildV1OperateCheckbox(false, (v: boolean): void => { seen = v; });
      expect(op.checkbox?.isCheck).assertEqual(false);
      op.checkbox?.onChange?.(!false);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Checkbox0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2500
     * @tc.name      testV1Radio0025
     * @tc.desc      Verify V1 radio initial true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Radio0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Radio0025 begin');
      await delayTick();
      let seen: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateRadio(true, (v: boolean): void => { seen = v; });
      expect(op.radio?.isCheck).assertEqual(true);
      op.radio?.onChange?.(!true);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Radio0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2600
     * @tc.name      testV1Radio0026
     * @tc.desc      Verify V1 radio initial false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Radio0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Radio0026 begin');
      await delayTick();
      let seen: boolean = true;
      const op: OperateItem = ListConfigFactory.buildV1OperateRadio(false, (v: boolean): void => { seen = v; });
      expect(op.radio?.isCheck).assertEqual(false);
      op.radio?.onChange?.(!false);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Radio0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2700
     * @tc.name      testV1Button0027
     * @tc.desc      Verify V1 button text ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Button0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0027 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('');
      expect(op.button?.text).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0027 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2800
     * @tc.name      testV1Button0028
     * @tc.desc      Verify V1 button text 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Button0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0028 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('OK');
      expect(op.button?.text).assertEqual('OK');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0028 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_2900
     * @tc.name      testV1Button0029
     * @tc.desc      Verify V1 button text '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Button0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0029 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('确定');
      expect(op.button?.text).assertEqual('确定');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0029 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3000
     * @tc.name      testV1Button0030
     * @tc.desc      Verify V1 button text 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Button0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0030 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('a b');
      expect(op.button?.text).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0030 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3100
     * @tc.name      testV1Button0031
     * @tc.desc      Verify V1 button text '#1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Button0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0031 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('#1');
      expect(op.button?.text).assertEqual('#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Button0031 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3200
     * @tc.name      testV1Text0032
     * @tc.desc      Verify V1 text operate ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Text0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0032 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateText('');
      expect(op.text).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0032 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3300
     * @tc.name      testV1Text0033
     * @tc.desc      Verify V1 text operate 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Text0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0033 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateText('OK');
      expect(op.text).assertEqual('OK');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0033 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3400
     * @tc.name      testV1Text0034
     * @tc.desc      Verify V1 text operate '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Text0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0034 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateText('确定');
      expect(op.text).assertEqual('确定');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0034 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3500
     * @tc.name      testV1Text0035
     * @tc.desc      Verify V1 text operate 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Text0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0035 begin');
      await delayTick();
      const op: OperateItem = ListConfigFactory.buildV1OperateText('a b');
      expect(op.text).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Text0035 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_LC1P1_3600
     * @tc.name      testV1Double0036
     * @tc.desc      Verify V1 double icon actions 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testV1Double0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Double0036 begin');
      await delayTick();
      let hits: number = 0;
      const op: OperateItem = ListConfigFactory.buildV1OperateDoubleIcon((): void => { hits++; }, (): void => { hits += 10; });
      op.icon?.action?.();
      op.subIcon?.action?.();
      expect(hits).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testV1Double0036 end');
    })

  })
}
