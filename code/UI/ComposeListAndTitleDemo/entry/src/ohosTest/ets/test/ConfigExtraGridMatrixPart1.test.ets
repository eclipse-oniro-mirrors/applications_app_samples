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
import { IconType, IconTypeV2 } from '@kit.ArkUI';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_ComposeList]';

export default function ConfigExtraGridMatrixPart1Test(): void {
  describe('ConfigExtraGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0100
     * @tc.name      testConfigExtra0001
     * @tc.desc      Verify config extra two-line V1 content NORMAL_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0001 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.NORMAL_ICON, '', '-sub');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0001 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0200
     * @tc.name      testConfigExtra0002
     * @tc.desc      Verify config extra two-line V1 content NORMAL_ICON 'A'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0002 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.NORMAL_ICON, 'A', 'A-sub');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('A');
      expect(item.secondaryText).assertEqual('A-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0002 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0300
     * @tc.name      testConfigExtra0003
     * @tc.desc      Verify config extra two-line V1 content NORMAL_ICON 'A B'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0003 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.NORMAL_ICON, 'A B', 'A B-sub');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('A B');
      expect(item.secondaryText).assertEqual('A B-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0003 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0400
     * @tc.name      testConfigExtra0004
     * @tc.desc      Verify config extra two-line V1 content NORMAL_ICON '主'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0004 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.NORMAL_ICON, '主', '主-sub');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('主');
      expect(item.secondaryText).assertEqual('主-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0004 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0500
     * @tc.name      testConfigExtra0005
     * @tc.desc      Verify config extra two-line V1 content NORMAL_ICON 'a#b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0005 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.NORMAL_ICON, 'a#b', 'a#b-sub');
      expect(item.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(item.primaryText).assertEqual('a#b');
      expect(item.secondaryText).assertEqual('a#b-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0005 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0600
     * @tc.name      testConfigExtra0006
     * @tc.desc      Verify config extra two-line V1 content SYSTEM_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0006 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.SYSTEM_ICON, '', '-sub');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0006 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0700
     * @tc.name      testConfigExtra0007
     * @tc.desc      Verify config extra two-line V1 content SYSTEM_ICON 'A'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0007 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.SYSTEM_ICON, 'A', 'A-sub');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('A');
      expect(item.secondaryText).assertEqual('A-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0007 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0800
     * @tc.name      testConfigExtra0008
     * @tc.desc      Verify config extra two-line V1 content SYSTEM_ICON 'A B'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0008 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.SYSTEM_ICON, 'A B', 'A B-sub');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('A B');
      expect(item.secondaryText).assertEqual('A B-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0008 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_0900
     * @tc.name      testConfigExtra0009
     * @tc.desc      Verify config extra two-line V1 content SYSTEM_ICON '主'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0009 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.SYSTEM_ICON, '主', '主-sub');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('主');
      expect(item.secondaryText).assertEqual('主-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0009 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1000
     * @tc.name      testConfigExtra0010
     * @tc.desc      Verify config extra two-line V1 content SYSTEM_ICON 'a#b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0010 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.SYSTEM_ICON, 'a#b', 'a#b-sub');
      expect(item.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(item.primaryText).assertEqual('a#b');
      expect(item.secondaryText).assertEqual('a#b-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0010 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1100
     * @tc.name      testConfigExtra0011
     * @tc.desc      Verify config extra two-line V1 content APP_ICON ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0011 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.APP_ICON, '', '-sub');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0011 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1200
     * @tc.name      testConfigExtra0012
     * @tc.desc      Verify config extra two-line V1 content APP_ICON 'A'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0012 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.APP_ICON, 'A', 'A-sub');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('A');
      expect(item.secondaryText).assertEqual('A-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0012 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1300
     * @tc.name      testConfigExtra0013
     * @tc.desc      Verify config extra two-line V1 content APP_ICON 'A B'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0013 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.APP_ICON, 'A B', 'A B-sub');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('A B');
      expect(item.secondaryText).assertEqual('A B-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0013 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1400
     * @tc.name      testConfigExtra0014
     * @tc.desc      Verify config extra two-line V1 content APP_ICON '主'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0014 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.APP_ICON, '主', '主-sub');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('主');
      expect(item.secondaryText).assertEqual('主-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0014 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1500
     * @tc.name      testConfigExtra0015
     * @tc.desc      Verify config extra two-line V1 content APP_ICON 'a#b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0015 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.APP_ICON, 'a#b', 'a#b-sub');
      expect(item.iconStyle).assertEqual(IconType.APP_ICON);
      expect(item.primaryText).assertEqual('a#b');
      expect(item.secondaryText).assertEqual('a#b-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0015 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1600
     * @tc.name      testConfigExtra0016
     * @tc.desc      Verify config extra two-line V1 content PREVIEW ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0016 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.PREVIEW, '', '-sub');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('');
      expect(item.secondaryText).assertEqual('-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0016 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1700
     * @tc.name      testConfigExtra0017
     * @tc.desc      Verify config extra two-line V1 content PREVIEW 'A'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0017 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.PREVIEW, 'A', 'A-sub');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('A');
      expect(item.secondaryText).assertEqual('A-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0017 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1800
     * @tc.name      testConfigExtra0018
     * @tc.desc      Verify config extra two-line V1 content PREVIEW 'A B'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0018 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.PREVIEW, 'A B', 'A B-sub');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('A B');
      expect(item.secondaryText).assertEqual('A B-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0018 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_1900
     * @tc.name      testConfigExtra0019
     * @tc.desc      Verify config extra two-line V1 content PREVIEW '主'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0019 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.PREVIEW, '主', '主-sub');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('主');
      expect(item.secondaryText).assertEqual('主-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0019 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2000
     * @tc.name      testConfigExtra0020
     * @tc.desc      Verify config extra two-line V1 content PREVIEW 'a#b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigExtra0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0020 begin');
      await delayTick();
      const item = ListConfigFactory.buildV1ContentItem('icon.png', IconType.PREVIEW, 'a#b', 'a#b-sub');
      expect(item.iconStyle).assertEqual(IconType.PREVIEW);
      expect(item.primaryText).assertEqual('a#b');
      expect(item.secondaryText).assertEqual('a#b-sub');
      expect(item.description === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigExtra0020 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2100
     * @tc.name      testConfigToggle0021
     * @tc.desc      Verify V2 toggle initial true action true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigToggle0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0021 begin');
      await delayTick();
      let seen: boolean = false;
      const op = ListConfigFactory.buildV2OperateToggle(true, (v: boolean): void => { seen = v; });
      op.toggle?.onChange?.(true);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0021 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2200
     * @tc.name      testConfigToggle0022
     * @tc.desc      Verify V2 toggle initial true action false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigToggle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0022 begin');
      await delayTick();
      let seen: boolean = true;
      const op = ListConfigFactory.buildV2OperateToggle(true, (v: boolean): void => { seen = v; });
      op.toggle?.onChange?.(false);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0022 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2300
     * @tc.name      testConfigToggle0023
     * @tc.desc      Verify V2 toggle initial false action true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigToggle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0023 begin');
      await delayTick();
      let seen: boolean = false;
      const op = ListConfigFactory.buildV2OperateToggle(false, (v: boolean): void => { seen = v; });
      op.toggle?.onChange?.(true);
      expect(seen).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0023 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2400
     * @tc.name      testConfigToggle0024
     * @tc.desc      Verify V2 toggle initial false action false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigToggle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0024 begin');
      await delayTick();
      let seen: boolean = true;
      const op = ListConfigFactory.buildV2OperateToggle(false, (v: boolean): void => { seen = v; });
      op.toggle?.onChange?.(false);
      expect(seen).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigToggle0024 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2500
     * @tc.name      testConfigButton0025
     * @tc.desc      Verify V1 button extra ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigButton0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0025 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateButton('');
      expect(op.button?.text).assertEqual('');
      expect(op.switch === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0025 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2600
     * @tc.name      testConfigButton0026
     * @tc.desc      Verify V1 button extra 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigButton0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0026 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateButton('OK');
      expect(op.button?.text).assertEqual('OK');
      expect(op.switch === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0026 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2700
     * @tc.name      testConfigButton0027
     * @tc.desc      Verify V1 button extra '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigButton0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0027 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateButton('确定');
      expect(op.button?.text).assertEqual('确定');
      expect(op.switch === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0027 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2800
     * @tc.name      testConfigButton0028
     * @tc.desc      Verify V1 button extra 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigButton0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0028 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateButton('a b');
      expect(op.button?.text).assertEqual('a b');
      expect(op.switch === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0028 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_2900
     * @tc.name      testConfigButton0029
     * @tc.desc      Verify V1 button extra '#1'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigButton0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0029 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateButton('#1');
      expect(op.button?.text).assertEqual('#1');
      expect(op.switch === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0029 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_3000
     * @tc.name      testConfigButton0030
     * @tc.desc      Verify V1 button extra 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigButton0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0030 begin');
      await delayTick();
      const op = ListConfigFactory.buildV1OperateButton('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(op.button?.text).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(op.switch === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigButton0030 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_3100
     * @tc.name      testConfigText0031
     * @tc.desc      Verify V2 text extra ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigText0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0031 begin');
      await delayTick();
      const op = ListConfigFactory.buildV2OperateText('');
      expect(op.text).assertEqual('');
      expect(op.toggle === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0031 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_3200
     * @tc.name      testConfigText0032
     * @tc.desc      Verify V2 text extra 'OK'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigText0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0032 begin');
      await delayTick();
      const op = ListConfigFactory.buildV2OperateText('OK');
      expect(op.text).assertEqual('OK');
      expect(op.toggle === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0032 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_3300
     * @tc.name      testConfigText0033
     * @tc.desc      Verify V2 text extra '确定'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigText0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0033 begin');
      await delayTick();
      const op = ListConfigFactory.buildV2OperateText('确定');
      expect(op.text).assertEqual('确定');
      expect(op.toggle === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0033 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_3400
     * @tc.name      testConfigText0034
     * @tc.desc      Verify V2 text extra 'a b'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigText0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0034 begin');
      await delayTick();
      const op = ListConfigFactory.buildV2OperateText('a b');
      expect(op.text).assertEqual('a b');
      expect(op.toggle === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigText0034 end');
    })

    /**
     * @tc.number    SUB_COMPOSE_CFGP1_3500
     * @tc.name      testConfigDouble0035
     * @tc.desc      Verify V1 double icon extra 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfigDouble0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigDouble0035 begin');
      await delayTick();
      let hit: number = 0;
      const op = ListConfigFactory.buildV1OperateDoubleIcon((): void => { hit++; }, (): void => { hit += 10; });
      op.icon?.action?.();
      op.subIcon?.action?.();
      expect(hit).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfigDouble0035 end');
    })

  })
}
