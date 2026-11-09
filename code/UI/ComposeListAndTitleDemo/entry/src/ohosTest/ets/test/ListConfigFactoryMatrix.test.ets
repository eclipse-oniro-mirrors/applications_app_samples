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
 

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ListConfigFactory } from '../../../main/ets/model/ListModels';
import { IconType, IconTypeV2, ContentItem, OperateItem } from '@kit.ArkUI';

export default function listConfigFactoryMatrixTest() {
  describe('listConfigFactoryMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0100
     * @tc.name v1ContentItemIconStyleVariants001
     * @tc.desc Verify V1 content items keep NORMAL_ICON, SYSTEM_ICON and PREVIEW styles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1ContentItemIconStyleVariants001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const normal: ContentItem = ListConfigFactory.buildV1ContentItem('a.png', IconType.NORMAL_ICON, 'A', 'a');
      const system: ContentItem = ListConfigFactory.buildV1ContentItem('b.png', IconType.SYSTEM_ICON, 'B', 'b');
      const preview: ContentItem = ListConfigFactory.buildV1ContentItem('c.png', IconType.PREVIEW, 'C', 'c');
      expect(normal.iconStyle).assertEqual(IconType.NORMAL_ICON);
      expect(system.iconStyle).assertEqual(IconType.SYSTEM_ICON);
      expect(preview.iconStyle).assertEqual(IconType.PREVIEW);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0200
     * @tc.name v1ContentItemWithDescAllTexts002
     * @tc.desc Verify V1 three-line content maps primary, secondary and description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1ContentItemWithDescAllTexts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc(
        'icon.png', IconType.SYSTEM_ICON, '主标题', '副标题', '描述文本');
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述文本');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0300
     * @tc.name v1ContentItemResourceIcon003
     * @tc.desc Verify a Resource icon is carried through the V1 content item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1ContentItemResourceIcon003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item: ContentItem = ListConfigFactory.buildV1ContentItem(
        $r('app.media.startIcon'), IconType.APP_ICON, '资源图标', 'Resource');
      expect(item.icon !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0400
     * @tc.name v1OperateSwitchInitialFalse004
     * @tc.desc Verify a V1 switch built unchecked reports false and forwards true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateSwitchInitialFalse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateSwitch(false, (v: boolean): void => {
        changed = v;
      });
      expect(op.switch?.isCheck).assertFalse();
      op.switch?.onChange?.(true);
      expect(changed).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0500
     * @tc.name v1OperateButtonEmptyText005
     * @tc.desc Verify an empty button text is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateButtonEmptyText005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('');
      expect(op.button !== undefined).assertTrue();
      expect(op.button?.text).assertEqual('');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0600
     * @tc.name v1OperateCheckboxInitialFalse006
     * @tc.desc Verify a V1 checkbox built unchecked reports false and forwards true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateCheckboxInitialFalse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateCheckbox(false, (v: boolean): void => {
        changed = v;
      });
      expect(op.checkbox?.isCheck).assertFalse();
      op.checkbox?.onChange?.(true);
      expect(changed).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0700
     * @tc.name v1OperateRadioInitialTrue007
     * @tc.desc Verify a V1 radio built checked reports true and forwards false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateRadioInitialTrue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = true;
      const op: OperateItem = ListConfigFactory.buildV1OperateRadio(true, (v: boolean): void => {
        changed = v;
      });
      expect(op.radio?.isCheck).assertTrue();
      op.radio?.onChange?.(false);
      expect(changed).assertFalse();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0800
     * @tc.name v1OperateImageResource008
     * @tc.desc Verify a Resource image is carried through the V1 image operate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateImageResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op: OperateItem = ListConfigFactory.buildV1OperateImage($r('app.media.startIcon'));
      expect(op.image !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_0900
     * @tc.name v1OperateTextEmpty009
     * @tc.desc Verify an empty V1 text operate value is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateTextEmpty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op: OperateItem = ListConfigFactory.buildV1OperateText('');
      expect(op.text).assertEqual('');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1000
     * @tc.name v1OperateDoubleIconIndependent010
     * @tc.desc Verify each V1 double icon action fires independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateDoubleIconIndependent010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit1: boolean = false;
      let hit2: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateDoubleIcon((): void => {
        hit1 = true;
      }, (): void => {
        hit2 = true;
      });
      op.icon?.action?.();
      expect(hit1).assertTrue();
      expect(hit2).assertFalse();
      op.subIcon?.action?.();
      expect(hit2).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1100
     * @tc.name v1OperateArrowValueDefined011
     * @tc.desc Verify the V1 arrow operate carries a non-null resource value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateArrowValueDefined011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateArrow((): void => {
        hit = true;
      });
      expect(op.arrow !== undefined).assertTrue();
      expect(op.arrow?.value !== undefined).assertTrue();
      expect(hit).assertFalse();
      op.arrow?.action?.();
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1200
     * @tc.name v1MenuItemEmptyValue012
     * @tc.desc Verify an empty V1 menu value is preserved and its action still fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1MenuItemEmptyValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let clicked: boolean = false;
      const mi = ListConfigFactory.buildV1MenuItem('', (): void => {
        clicked = true;
      });
      expect(mi.value).assertEqual('');
      mi.action?.();
      expect(clicked).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1300
     * @tc.name v1OperateButtonFieldIsolation013
     * @tc.desc Verify a V1 button operate leaves all other operate fields unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateButtonFieldIsolation013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('按钮');
      expect(op.button !== undefined).assertTrue();
      expect(op.arrow === undefined).assertTrue();
      expect(op.switch === undefined).assertTrue();
      expect(op.checkbox === undefined).assertTrue();
      expect(op.radio === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      expect(op.text === undefined).assertTrue();
      expect(op.icon === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1400
     * @tc.name v2ContentItemIconStyleVariants014
     * @tc.desc Verify V2 content items keep NORMAL_ICON, SYSTEM_ICON and PREVIEW styles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2ContentItemIconStyleVariants014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const normal = ListConfigFactory.buildV2ContentItem('a.png', IconTypeV2.NORMAL_ICON, 'A', 'a');
      const system = ListConfigFactory.buildV2ContentItem('b.png', IconTypeV2.SYSTEM_ICON, 'B', 'b');
      const preview = ListConfigFactory.buildV2ContentItem('c.png', IconTypeV2.PREVIEW, 'C', 'c');
      expect(normal.iconStyle).assertEqual(IconTypeV2.NORMAL_ICON);
      expect(system.iconStyle).assertEqual(IconTypeV2.SYSTEM_ICON);
      expect(preview.iconStyle).assertEqual(IconTypeV2.PREVIEW);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1500
     * @tc.name v2ContentItemWithDescAllTexts015
     * @tc.desc Verify V2 three-line content maps primary, secondary and description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2ContentItemWithDescAllTexts015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item = ListConfigFactory.buildV2ContentItemWithDesc(
        'icon.png', IconTypeV2.SYSTEM_ICON, '主标题', '副标题', '描述文本');
      expect(item.primaryText).assertEqual('主标题');
      expect(item.secondaryText).assertEqual('副标题');
      expect(item.description).assertEqual('描述文本');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1600
     * @tc.name v2ContentItemResourceIcon016
     * @tc.desc Verify a Resource icon is carried through the V2 content item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2ContentItemResourceIcon016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item = ListConfigFactory.buildV2ContentItem(
        $r('app.media.startIcon'), IconTypeV2.APP_ICON, '资源图标', 'Resource');
      expect(item.icon !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1700
     * @tc.name v2OperateToggleInitialFalse017
     * @tc.desc Verify a V2 toggle built unchecked reports false and forwards true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateToggleInitialFalse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op = ListConfigFactory.buildV2OperateToggle(false, (v: boolean): void => {
        changed = v;
      });
      expect(op.toggle?.isCheck).assertFalse();
      op.toggle?.onChange?.(true);
      expect(changed).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1800
     * @tc.name v2OperateButtonEmptyText018
     * @tc.desc Verify an empty V2 button text is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateButtonEmptyText018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op = ListConfigFactory.buildV2OperateButton('');
      expect(op.button !== undefined).assertTrue();
      expect(op.button?.text).assertEqual('');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_1900
     * @tc.name v2OperateCheckboxInitialTrue019
     * @tc.desc Verify a V2 checkbox built checked reports true and forwards false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateCheckboxInitialTrue019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = true;
      const op = ListConfigFactory.buildV2OperateCheckbox(true, (v: boolean): void => {
        changed = v;
      });
      expect(op.checkbox?.isCheck).assertTrue();
      op.checkbox?.onChange?.(false);
      expect(changed).assertFalse();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2000
     * @tc.name v2OperateRadioInitialFalse020
     * @tc.desc Verify a V2 radio built unchecked reports false and forwards true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateRadioInitialFalse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op = ListConfigFactory.buildV2OperateRadio(false, (v: boolean): void => {
        changed = v;
      });
      expect(op.radio?.isCheck).assertFalse();
      op.radio?.onChange?.(true);
      expect(changed).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2100
     * @tc.name v2OperateImageResource021
     * @tc.desc Verify a Resource image is carried through the V2 image operate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateImageResource021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op = ListConfigFactory.buildV2OperateImage($r('app.media.startIcon'));
      expect(op.image !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2200
     * @tc.name v2OperateTextEmpty022
     * @tc.desc Verify an empty V2 text operate value is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateTextEmpty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op = ListConfigFactory.buildV2OperateText('');
      expect(op.text).assertEqual('');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2300
     * @tc.name v2OperateDoubleIconIndependent023
     * @tc.desc Verify each V2 double icon action fires independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateDoubleIconIndependent023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit1: boolean = false;
      let hit2: boolean = false;
      const op = ListConfigFactory.buildV2OperateDoubleIcon((): void => {
        hit1 = true;
      }, (): void => {
        hit2 = true;
      });
      op.icon?.action?.();
      expect(hit1).assertTrue();
      expect(hit2).assertFalse();
      op.subIcon?.action?.();
      expect(hit2).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2400
     * @tc.name v2MenuItemEmptyValue024
     * @tc.desc Verify an empty V2 menu value is preserved and its action still fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2MenuItemEmptyValue024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let clicked: boolean = false;
      const mi = ListConfigFactory.buildV2MenuItem('', (): void => {
        clicked = true;
      });
      expect(mi.value).assertEqual('');
      mi.action?.();
      expect(clicked).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2500
     * @tc.name v2OperateButtonFieldIsolation025
     * @tc.desc Verify a V2 button operate leaves all other operate fields unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateButtonFieldIsolation025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op = ListConfigFactory.buildV2OperateButton('按钮');
      expect(op.button !== undefined).assertTrue();
      expect(op.toggle === undefined).assertTrue();
      expect(op.checkbox === undefined).assertTrue();
      expect(op.radio === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      expect(op.text === undefined).assertTrue();
      expect(op.icon === undefined).assertTrue();
      expect(op.arrow === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2600
     * @tc.name v2OperateImageFieldIsolation026
     * @tc.desc Verify a V2 image operate sets only the image field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2OperateImageFieldIsolation026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op = ListConfigFactory.buildV2OperateImage('img_v2.png');
      expect(op.image).assertEqual('img_v2.png');
      expect(op.text === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.toggle === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2700
     * @tc.name v2BuildersReturnFreshInstances027
     * @tc.desc Verify V2 class builders return a new instance on every call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v2BuildersReturnFreshInstances027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // V2 配置为 class 构造：两次相同入参应得到互不共享的实例
      const a = ListConfigFactory.buildV2ContentItem('x.png', IconTypeV2.NORMAL_ICON, '甲', '副甲');
      const b = ListConfigFactory.buildV2ContentItem('x.png', IconTypeV2.NORMAL_ICON, '甲', '副甲');
      expect(a === b).assertFalse();
      const mi1 = ListConfigFactory.buildV2MenuItem('菜单', (): void => {
      });
      const mi2 = ListConfigFactory.buildV2MenuItem('菜单', (): void => {
      });
      expect(mi1 === mi2).assertFalse();
      expect(a.primaryText).assertEqual('甲');
      expect(b.primaryText).assertEqual('甲');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2800
     * @tc.name contentItemBasicNoDescription028
     * @tc.desc Verify the two-line builders leave the description field unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contentItemBasicNoDescription028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const v1: ContentItem = ListConfigFactory.buildV1ContentItem('n.png', IconType.NORMAL_ICON, '主', '副');
      expect(v1.description === undefined).assertTrue();
      const v2 = ListConfigFactory.buildV2ContentItem('n.png', IconTypeV2.NORMAL_ICON, '主', '副');
      expect(v2.description === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_2900
     * @tc.name menuItemUnicodeValue029
     * @tc.desc Verify Emoji and CJK menu values are preserved and actions still fire
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('menuItemUnicodeValue029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit1: boolean = false;
      const mi1 = ListConfigFactory.buildV1MenuItem('菜单 📋', (): void => {
        hit1 = true;
      });
      expect(mi1.value).assertEqual('菜单 📋');
      mi1.action?.();
      expect(hit1).assertTrue();
      let hit2: boolean = false;
      const mi2 = ListConfigFactory.buildV2MenuItem('搜索 🔍', (): void => {
        hit2 = true;
      });
      expect(mi2.value).assertEqual('搜索 🔍');
      mi2.action?.();
      expect(hit2).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTCONFIGFACTORYMATRIX_3000
     * @tc.name v1OperateSwitchFieldIsolation030
     * @tc.desc Verify a V1 switch operate leaves all other fields including subIcon unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('v1OperateSwitchFieldIsolation030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op: OperateItem = ListConfigFactory.buildV1OperateSwitch(true, (v: boolean): void => {
      });
      expect(op.switch !== undefined).assertTrue();
      expect(op.arrow === undefined).assertTrue();
      expect(op.button === undefined).assertTrue();
      expect(op.checkbox === undefined).assertTrue();
      expect(op.radio === undefined).assertTrue();
      expect(op.image === undefined).assertTrue();
      expect(op.text === undefined).assertTrue();
      expect(op.icon === undefined).assertTrue();
      expect(op.subIcon === undefined).assertTrue();
    });
  });
}
