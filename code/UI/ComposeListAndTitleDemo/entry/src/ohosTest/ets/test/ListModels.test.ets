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
import { ContactStore, ContactItem, ListConfigFactory } from '../../../main/ets/model/ListModels';
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';
import { IconType, IconTypeV2, ContentItem, OperateItem } from '@kit.ArkUI';

/**
 * ListModels 业务模型设备侧测试
 * - ContactStore：增删/在线切换/搜索/查找/统计/清空/边界（含 id 单调不复用、日志联动）
 * - ListConfigFactory：V1/V2 配置工厂字段映射（含图标透传、箭头操作区回调）
 */
export default function listModelsTest() {
  describe('listModelsTest', () => {
    let store: ContactStore = new ContactStore();

    beforeAll(() => {
    });

    /** 构建含 4 人的全新仓库（张三/李四/王五/赵六） */
    const freshStore = (): ContactStore => {
      const s: ContactStore = new ContactStore();
      s.add('张三', '13800000001', '研发部', true);
      s.add('李四', '13800000002', '产品部', false);
      s.add('王五', '13800000003', '研发部', true);
      s.add('赵六', '13800000004', '测试部', false);
      return s;
    };

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0100
     * @tc.name contactStore_add
     * @tc.desc Verify ContactStore.add appends a contact with a new id and offline default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_add', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.count()).assertEqual(4);
      const c: ContactItem = store.add('新联系人', '13900000000', '设计部');
      expect(store.count()).assertEqual(5);
      expect(c.id > 0).assertTrue();
      expect(c.name).assertEqual('新联系人');
      expect(c.online).assertFalse();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0200
     * @tc.name contactStore_remove
     * @tc.desc Verify removing an existing contact by id shrinks the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_remove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.remove(1)).assertTrue();
      expect(store.count()).assertEqual(3);
      expect(store.findById(1) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0300
     * @tc.name contactStore_removeMissing
     * @tc.desc Verify removing a missing contact returns false and keeps data intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_removeMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.remove(999)).assertFalse();
      expect(store.count()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0400
     * @tc.name contactStore_toggleOnline
     * @tc.desc Verify toggleOnline flips state and restores the online count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_toggleOnline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.toggleOnline(2)).assertTrue();
      const c: ContactItem | null = store.findById(2);
      expect(c !== null && c.online).assertTrue();
      expect(store.toggleOnline(2)).assertFalse();
      expect(store.onlineCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0500
     * @tc.name contactStore_toggleMissing_returnsNull
     * @tc.desc Verify toggling a missing contact returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_toggleMissing_returnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.toggleOnline(999) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0600
     * @tc.name contactStore_search
     * @tc.desc Verify search matches name and department case-insensitively and returns all for empty keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_search', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      // 按姓名
      expect(store.search('张三').length).assertEqual(1);
      // 按部门（研发部 2 人）
      expect(store.search('研发部').length).assertEqual(2);
      // 大小写不敏感（英文部门场景）
      store.add('Tom', '13900000001', 'RD');
      expect(store.search('tom').length).assertEqual(1);
      // 空关键字返回全部
      expect(store.search('').length).assertEqual(5);
      // 未命中
      expect(store.search('不存在').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0700
     * @tc.name contactStore_getAllIsCopy
     * @tc.desc Verify getAll returns a copy so mutations do not affect the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_getAllIsCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const all: ContactItem[] = store.getAll();
      all.pop();
      expect(store.count()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0800
     * @tc.name contactStore_clear
     * @tc.desc Verify clear empties the contacts and resets the online count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_clear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_0900
     * @tc.name factory_v1ContentItem
     * @tc.desc Verify V1 content item maps icon style and primary/secondary text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1ContentItem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item: ContentItem = ListConfigFactory.buildV1ContentItem(
        'icon.png', IconType.HEAD_SCULPTURE, '张三', '研发部');
      expect(item.iconStyle).assertEqual(IconType.HEAD_SCULPTURE);
      expect(item.primaryText).assertEqual('张三');
      expect(item.secondaryText).assertEqual('研发部');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1000
     * @tc.name factory_v1OperateSwitch
     * @tc.desc Verify V1 switch operate carries the checked state and change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateSwitch(true, (v: boolean): void => {
        changed = v;
      });
      const check = op.switch;
      expect(check !== undefined).assertTrue();
      if (check !== undefined) {
        expect(check.isCheck).assertTrue();
        check.onChange?.(false);
        expect(changed).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1100
     * @tc.name factory_v1OperateButton
     * @tc.desc Verify V1 button operate maps its text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateButton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op: OperateItem = ListConfigFactory.buildV1OperateButton('安装');
      expect(op.button !== undefined).assertTrue();
      expect(op.button?.text).assertEqual('安装');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1200
     * @tc.name factory_v2ContentItem
     * @tc.desc Verify V2 content item maps icon style and primary/secondary text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2ContentItem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item = ListConfigFactory.buildV2ContentItem('icon.png', IconTypeV2.HEAD_SCULPTURE, '李四', '产品部');
      expect(item.iconStyle).assertEqual(IconTypeV2.HEAD_SCULPTURE);
      expect(item.primaryText).assertEqual('李四');
      expect(item.secondaryText).assertEqual('产品部');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1300
     * @tc.name factory_v2OperateToggle
     * @tc.desc Verify V2 toggle operate carries the checked state and change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2OperateToggle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op = ListConfigFactory.buildV2OperateToggle(true, (v: boolean): void => {
        changed = v;
      });
      const toggle = op.toggle;
      expect(toggle !== undefined).assertTrue();
      if (toggle !== undefined) {
        expect(toggle.isCheck).assertTrue();
        toggle.onChange?.(false);
        expect(changed).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1400
     * @tc.name factory_v2OperateButton
     * @tc.desc Verify V2 button operate maps its text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2OperateButton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const op = ListConfigFactory.buildV2OperateButton('检查');
      expect(op.button !== undefined).assertTrue();
      expect(op.button?.text).assertEqual('检查');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1500
     * @tc.name contactStore_searchSpecialChars
     * @tc.desc Verify search treats regex special characters literally without crashing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_searchSpecialChars', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      // 正则特殊字符不崩溃、按字面匹配
      store.add('a.b*c', '13900000002', 'RD');
      expect(store.search('a.b*c').length).assertEqual(1);
      expect(store.search('[').length).assertEqual(0);
      expect(store.search('\\').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1600
     * @tc.name contactStore_duplicateName
     * @tc.desc Verify duplicate names are allowed and keep distinct ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_duplicateName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      // 同名联系人允许存在，id 不同
      const a: ContactItem = store.add('张三', '13900000003', '研发部');
      const b: ContactItem = store.add('张三', '13900000004', '测试部');
      expect(a.id !== b.id).assertTrue();
      expect(store.search('张三').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1700
     * @tc.name contactStore_onlineCountTracking
     * @tc.desc Verify the online count tracks toggles and removals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_onlineCountTracking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.onlineCount()).assertEqual(2);
      store.toggleOnline(2);
      expect(store.onlineCount()).assertEqual(3);
      store.toggleOnline(1);
      expect(store.onlineCount()).assertEqual(2);
      store.remove(3);
      expect(store.onlineCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1800
     * @tc.name factory_v1ContentItemWithDesc
     * @tc.desc Verify V1 content item with description maps the description text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1ContentItemWithDesc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item: ContentItem = ListConfigFactory.buildV1ContentItemWithDesc(
        'icon.png', IconType.BADGE, '未读消息', '含 3 条置顶', '长按可标记全部已读');
      expect(item.iconStyle).assertEqual(IconType.BADGE);
      expect(item.description).assertEqual('长按可标记全部已读');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_1900
     * @tc.name factory_v1OperateCheckbox
     * @tc.desc Verify V1 checkbox operate triggers its change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateCheckbox', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateCheckbox(true, (v: boolean): void => {
        changed = v;
      });
      expect(op.checkbox !== undefined).assertTrue();
      op.checkbox?.onChange?.(false);
      expect(changed).assertFalse();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2000
     * @tc.name factory_v1OperateRadio
     * @tc.desc Verify V1 radio operate triggers its change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateRadio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateRadio(false, (v: boolean): void => {
        changed = v;
      });
      expect(op.radio !== undefined).assertTrue();
      op.radio?.onChange?.(true);
      expect(changed).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2100
     * @tc.name factory_v1OperateImageAndText
     * @tc.desc Verify V1 image and text operate items map their values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateImageAndText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const img: OperateItem = ListConfigFactory.buildV1OperateImage('img.png');
      expect(img.image).assertEqual('img.png');
      const txt: OperateItem = ListConfigFactory.buildV1OperateText('3 条');
      expect(txt.text).assertEqual('3 条');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2200
     * @tc.name factory_v1OperateDoubleIcon
     * @tc.desc Verify V1 double icon operate wires both icon actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateDoubleIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit1: boolean = false;
      let hit2: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateDoubleIcon((): void => {
        hit1 = true;
      }, (): void => {
        hit2 = true;
      });
      expect(op.icon !== undefined && op.subIcon !== undefined).assertTrue();
      op.icon?.action?.();
      op.subIcon?.action?.();
      expect(hit1 && hit2).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2300
     * @tc.name factory_v2ContentItemWithDesc
     * @tc.desc Verify V2 content item with description maps the description text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2ContentItemWithDesc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const item = ListConfigFactory.buildV2ContentItemWithDesc(
        'icon.png', IconTypeV2.PREVIEW, '图片预览', 'PREVIEW 档位', 'V2 版三行文本');
      expect(item.iconStyle).assertEqual(IconTypeV2.PREVIEW);
      expect(item.description).assertEqual('V2 版三行文本');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2400
     * @tc.name factory_v2OperateCheckboxRadio
     * @tc.desc Verify V2 checkbox and radio operate items expose components and callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2OperateCheckboxRadio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: boolean = false;
      const cb = ListConfigFactory.buildV2OperateCheckbox(false, (v: boolean): void => {
        changed = v;
      });
      expect(cb.checkbox !== undefined).assertTrue();
      cb.checkbox?.onChange?.(true);
      expect(changed).assertTrue();
      const rd = ListConfigFactory.buildV2OperateRadio(true, (v: boolean): void => {
        changed = v;
      });
      expect(rd.radio !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2500
     * @tc.name factory_v2OperateImageAndText
     * @tc.desc Verify V2 image and text operate items map their values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2OperateImageAndText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const img = ListConfigFactory.buildV2OperateImage('img.png');
      expect(img.image).assertEqual('img.png');
      const txt = ListConfigFactory.buildV2OperateText('预览');
      expect(txt.text).assertEqual('预览');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2600
     * @tc.name factory_v2OperateDoubleIcon
     * @tc.desc Verify V2 double icon operate wires both icon actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2OperateDoubleIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit1: boolean = false;
      let hit2: boolean = false;
      const op = ListConfigFactory.buildV2OperateDoubleIcon((): void => {
        hit1 = true;
      }, (): void => {
        hit2 = true;
      });
      expect(op.icon !== undefined && op.subIcon !== undefined).assertTrue();
      op.icon?.action?.();
      op.subIcon?.action?.();
      expect(hit1 && hit2).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2700
     * @tc.name factory_v1MenuItem
     * @tc.desc Verify V1 menu item maps its value and triggers the action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1MenuItem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let clicked: boolean = false;
      const mi = ListConfigFactory.buildV1MenuItem('刷新', (): void => {
        clicked = true;
      });
      expect(mi.value).assertEqual('刷新');
      mi.action?.();
      expect(clicked).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2800
     * @tc.name factory_v2MenuItem
     * @tc.desc Verify V2 menu item maps its value and triggers the action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2MenuItem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let clicked: boolean = false;
      const mi = ListConfigFactory.buildV2MenuItem('搜索', (): void => {
        clicked = true;
      });
      expect(mi.value).assertEqual('搜索');
      mi.action?.();
      expect(clicked).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_2900
     * @tc.name contactStore_findById
     * @tc.desc Verify findById returns the matching contact fields and null for a missing id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_findById', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const hit: ContactItem | null = store.findById(3);
      expect(hit !== null).assertTrue();
      if (hit !== null) {
        expect(hit.name).assertEqual('王五');
        expect(hit.phone).assertEqual('13800000003');
        expect(hit.dept).assertEqual('研发部');
      }
      expect(store.findById(999) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3000
     * @tc.name contactStore_idNotReusedAfterRemove
     * @tc.desc Verify a new contact never reuses the id of a removed contact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_idNotReusedAfterRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const removedId: number = 3;
      expect(store.remove(removedId)).assertTrue();
      const added: ContactItem = store.add('钱七', '13900000005', '运营部');
      expect(added.id > 4).assertTrue();
      expect(added.id !== removedId).assertTrue();
      expect(store.findById(removedId) === null).assertTrue();
      expect(store.findById(added.id) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3100
     * @tc.name contactStore_idsMonotonicAfterClear
     * @tc.desc Verify clear resets data but keeps the id sequence monotonic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_idsMonotonicAfterClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const maxBefore: number = store.getAll()[store.count() - 1].id;
      store.clear();
      const added: ContactItem = store.add('重新开始', '13900000006', '综合部', true);
      expect(added.id > maxBefore).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.onlineCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3200
     * @tc.name factory_v1OperateArrow
     * @tc.desc Verify V1 arrow operate carries a resource value and triggers its action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v1OperateArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit: boolean = false;
      const op: OperateItem = ListConfigFactory.buildV1OperateArrow((): void => {
        hit = true;
      });
      expect(op.arrow !== undefined).assertTrue();
      expect(op.arrow?.value !== undefined).assertTrue();
      op.arrow?.action?.();
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3300
     * @tc.name factory_v2OperateArrow
     * @tc.desc Verify V2 arrow operate carries a resource value and triggers its action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_v2OperateArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hit: boolean = false;
      const op = ListConfigFactory.buildV2OperateArrow((): void => {
        hit = true;
      });
      expect(op.arrow !== undefined).assertTrue();
      expect(op.arrow?.value !== undefined).assertTrue();
      op.arrow?.action?.();
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3400
     * @tc.name factory_contentItemIconPassthrough
     * @tc.desc Verify V1/V2 content factories pass the icon resource through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_contentItemIconPassthrough', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const v1: ContentItem = ListConfigFactory.buildV1ContentItem(
        'list.png', IconType.APP_ICON, '主标题', '副标题');
      expect(v1.icon).assertEqual('list.png');
      const v2 = ListConfigFactory.buildV2ContentItem(
        'list_v2.png', IconTypeV2.APP_ICON, '主标题', '副标题');
      expect(v2.icon).assertEqual('list_v2.png');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3500
     * @tc.name contactStore_searchPartialKeyword
     * @tc.desc Verify search matches partial keywords inside name and department
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_searchPartialKeyword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.search('研发').length).assertEqual(2);
      expect(store.search('三').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LISTMODELS_3600
     * @tc.name contactStore_addWritesLogLine
     * @tc.desc Verify each add writes one formatted log line carrying id, name and count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('contactStore_addWritesLogLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      // 4 人仓库 → 每条 add 产生一行日志
      store = freshStore();
      expect(lines.length).assertEqual(4);
      const last: string = lines[3];
      expect(last.includes('[I][ListModels]')).assertTrue();
      expect(last.includes('ContactStore.add')).assertTrue();
      expect(last.includes('#4')).assertTrue();
      expect(last.includes('赵六')).assertTrue();
      expect(last.includes('当前 4 人')).assertTrue();
      const before: number = lines.length;
      store.add('孙七', '13900000009', '客服部');
      expect(lines.length).assertEqual(before + 1);
      expect(lines[4].includes('#5')).assertTrue();
      expect(lines[4].includes('当前 5 人')).assertTrue();
    });
  });
}
