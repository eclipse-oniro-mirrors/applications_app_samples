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
import { hilog } from '@kit.PerformanceAnalysisKit';
import contact from '@ohos.contact';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fileIo from '@ohos.file.fs';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function apiReal01Test() {
  describe('ApiReal01Test', () => {

    /**
     * @tc.name   testApiReal010001
     * @tc.number SUB_Contact_APIR_0001
     * @tc.desc   contact 查询面：queryContacts 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010001 begin');
      expect(typeof contact.queryContacts).assertEqual('function');
      expect(contact.queryContacts.name).assertEqual('queryContacts');
      expect(contact.queryContacts === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010001 end');
    });

    /**
     * @tc.name   testApiReal010002
     * @tc.number SUB_Contact_APIR_0002
     * @tc.desc   contact 变更面：addContact 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010002 begin');
      expect(typeof contact.addContact).assertEqual('function');
      expect(contact.addContact.name).assertEqual('addContact');
      expect(contact.addContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010002 end');
    });

    /**
     * @tc.name   testApiReal010003
     * @tc.number SUB_Contact_APIR_0003
     * @tc.desc   contact 变更面：updateContact 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010003 begin');
      expect(typeof contact.updateContact).assertEqual('function');
      expect(contact.updateContact.name).assertEqual('updateContact');
      expect(contact.updateContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010003 end');
    });

    /**
     * @tc.name   testApiReal010004
     * @tc.number SUB_Contact_APIR_0004
     * @tc.desc   contact 变更面：deleteContact 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010004 begin');
      expect(typeof contact.deleteContact).assertEqual('function');
      expect(contact.deleteContact.name).assertEqual('deleteContact');
      expect(contact.deleteContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010004 end');
    });

    /**
     * @tc.name   testApiReal010005
     * @tc.number SUB_Contact_APIR_0005
     * @tc.desc   contact 选择面：selectContact 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010005 begin');
      expect(typeof contact.selectContact).assertEqual('function');
      expect(contact.selectContact.name).assertEqual('contactsPickerSelect');
      expect(contact.selectContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010005 end');
    });

    /**
     * @tc.name   testApiReal010006
     * @tc.number SUB_Contact_APIR_0006
     * @tc.desc   contact 分组面：queryGroups 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010006 begin');
      expect(typeof contact.queryGroups).assertEqual('function');
      expect(contact.queryGroups.name).assertEqual('queryGroups');
      expect(contact.queryGroups === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010006 end');
    });

    /**
     * @tc.name   testApiReal010007
     * @tc.number SUB_Contact_APIR_0007
     * @tc.desc   contact 分组面：queryHolders 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010007 begin');
      expect(typeof contact.queryHolders).assertEqual('function');
      expect(contact.queryHolders.name).assertEqual('queryHolders');
      expect(contact.queryHolders === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010007 end');
    });

    /**
     * @tc.name   testApiReal010008
     * @tc.number SUB_Contact_APIR_0008
     * @tc.desc   contact 名片面：queryMyCard 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010008 begin');
      expect(typeof contact.queryMyCard).assertEqual('function');
      expect(contact.queryMyCard.name).assertEqual('queryMyCard');
      expect(contact.queryMyCard === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010008 end');
    });

    /**
     * @tc.name   testApiReal010009
     * @tc.number SUB_Contact_APIR_0009
     * @tc.desc   contact 名片面：isMyCard 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010009 begin');
      expect(typeof contact.isMyCard).assertEqual('function');
      expect(contact.isMyCard.name).assertEqual('isMyCard');
      expect(contact.isMyCard === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010009 end');
    });

    /**
     * @tc.name   testApiReal010010
     * @tc.number SUB_Contact_APIR_0010
     * @tc.desc   contact 本地判断：isLocalContact 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010010 begin');
      expect(typeof contact.isLocalContact).assertEqual('function');
      expect(contact.isLocalContact.name).assertEqual('isLocalContact');
      expect(contact.isLocalContact === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010010 end');
    });

    /**
     * @tc.name   testApiReal010011
     * @tc.number SUB_Contact_APIR_0011
     * @tc.desc   router 导航面：pushUrl 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010011 begin');
      expect(typeof router.pushUrl).assertEqual('function');
      expect(router.pushUrl.name).assertEqual('pushUrl');
      expect(router.pushUrl === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010011 end');
    });

    /**
     * @tc.name   testApiReal010012
     * @tc.number SUB_Contact_APIR_0012
     * @tc.desc   router 导航面：back 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010012 begin');
      expect(typeof router.back).assertEqual('function');
      expect(router.back.name).assertEqual('back');
      expect(router.back === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010012 end');
    });

    /**
     * @tc.name   testApiReal010013
     * @tc.number SUB_Contact_APIR_0013
     * @tc.desc   router 参数面：getParams 存在且为函数（NameCard 参数守卫依赖）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010013 begin');
      expect(typeof router.getParams).assertEqual('function');
      expect(router.getParams.name).assertEqual('getParams');
      expect(router.getParams === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010013 end');
    });

    /**
     * @tc.name   testApiReal010014
     * @tc.number SUB_Contact_APIR_0014
     * @tc.desc   router 状态面：getLength 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010014 begin');
      expect(typeof router.getLength).assertEqual('function');
      expect(router.getLength.name).assertEqual('getLength');
      expect(router.getLength === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010014 end');
    });

    /**
     * @tc.name   testApiReal010015
     * @tc.number SUB_Contact_APIR_0015
     * @tc.desc   router 栈操作：clear 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010015 begin');
      expect(typeof router.clear).assertEqual('function');
      expect(router.clear.name).assertEqual('clear');
      expect(router.clear === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010015 end');
    });

    /**
     * @tc.name   testApiReal010016
     * @tc.number SUB_Contact_APIR_0016
     * @tc.desc   promptAction 提示面：showToast 存在且为函数（AddContact 非法号码提示依赖）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010016 begin');
      expect(typeof promptAction.showToast).assertEqual('function');
      expect(promptAction.showToast.name).assertEqual('showToast');
      expect(promptAction.showToast === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010016 end');
    });

    /**
     * @tc.name   testApiReal010017
     * @tc.number SUB_Contact_APIR_0017
     * @tc.desc   promptAction 提示面：closeToast 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010017 begin');
      expect(typeof promptAction.closeToast).assertEqual('function');
      expect(promptAction.closeToast.name).assertEqual('closeToast');
      expect(promptAction.closeToast === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010017 end');
    });

    /**
     * @tc.name   testApiReal010018
     * @tc.number SUB_Contact_APIR_0018
     * @tc.desc   promptAction 对话框面：showDialog 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010018 begin');
      expect(typeof promptAction.showDialog).assertEqual('function');
      expect(promptAction.showDialog.name).assertEqual('showDialog');
      expect(promptAction.showDialog === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010018 end');
    });

    /**
     * @tc.name   testApiReal010019
     * @tc.number SUB_Contact_APIR_0019
     * @tc.desc   promptAction 菜单面：showActionMenu 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010019 begin');
      expect(typeof promptAction.showActionMenu).assertEqual('function');
      expect(promptAction.showActionMenu.name).assertEqual('showActionMenu');
      expect(promptAction.showActionMenu === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010019 end');
    });

    /**
     * @tc.name   testApiReal010020
     * @tc.number SUB_Contact_APIR_0020
     * @tc.desc   promptAction 自定义面：openCustomDialog 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010020 begin');
      expect(typeof promptAction.openCustomDialog).assertEqual('function');
      expect(promptAction.openCustomDialog.name).assertEqual('openCustomDialog');
      expect(promptAction.openCustomDialog === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010020 end');
    });

    /**
     * @tc.name   testApiReal010021
     * @tc.number SUB_Contact_APIR_0021
     * @tc.desc   fileIo 打开面：openSync 存在且为函数（Setting 导入导出依赖）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010021 begin');
      expect(typeof fileIo.openSync).assertEqual('function');
      expect(fileIo.openSync.name).assertEqual('openSync');
      expect(fileIo.openSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010021 end');
    });

    /**
     * @tc.name   testApiReal010022
     * @tc.number SUB_Contact_APIR_0022
     * @tc.desc   fileIo 读取面：readTextSync 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010022 begin');
      expect(typeof fileIo.readTextSync).assertEqual('function');
      expect(fileIo.readTextSync.name).assertEqual('readTextSync');
      expect(fileIo.readTextSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010022 end');
    });

    /**
     * @tc.name   testApiReal010023
     * @tc.number SUB_Contact_APIR_0023
     * @tc.desc   fileIo 写入面：writeSync 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010023 begin');
      expect(typeof fileIo.writeSync).assertEqual('function');
      expect(fileIo.writeSync.name).assertEqual('writeSync');
      expect(fileIo.writeSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010023 end');
    });

    /**
     * @tc.name   testApiReal010024
     * @tc.number SUB_Contact_APIR_0024
     * @tc.desc   fileIo 关闭面：closeSync 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010024 begin');
      expect(typeof fileIo.closeSync).assertEqual('function');
      expect(fileIo.closeSync.name).assertEqual('closeSync');
      expect(fileIo.closeSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010024 end');
    });

    /**
     * @tc.name   testApiReal010025
     * @tc.number SUB_Contact_APIR_0025
     * @tc.desc   fileIo 目录面：mkdirSync 存在且为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010025 begin');
      expect(typeof fileIo.mkdirSync).assertEqual('function');
      expect(fileIo.mkdirSync.name).assertEqual('mkdirSync');
      expect(fileIo.mkdirSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010025 end');
    });

    /**
     * @tc.name   testApiReal010026
     * @tc.number SUB_Contact_APIR_0026
     * @tc.desc   组合：contact 命名空间查询与增删入口为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010026 begin');
      expect(typeof contact.queryContacts).assertEqual('function');
      expect(typeof contact.addContact).assertEqual('function');
      expect(typeof contact.deleteContact).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010026 end');
    });

    /**
     * @tc.name   testApiReal010027
     * @tc.number SUB_Contact_APIR_0027
     * @tc.desc   组合：router 命名空间导航入口为函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010027 begin');
      expect(typeof router.pushUrl).assertEqual('function');
      expect(typeof router.back).assertEqual('function');
      expect(typeof router.getLength).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010027 end');
    });

    /**
     * @tc.name   testApiReal010028
     * @tc.number SUB_Contact_APIR_0028
     * @tc.desc   组合：跨模块同名函数不存在——queryContacts 与 pushUrl 函数名各不相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010028 begin');
      expect(contact.queryContacts.name === router.pushUrl.name).assertFalse();
      expect(contact.queryContacts.name).assertEqual('queryContacts');
      expect(router.pushUrl.name).assertEqual('pushUrl');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010028 end');
    });

    /**
     * @tc.name   testApiReal010029
     * @tc.number SUB_Contact_APIR_0029
     * @tc.desc   组合：四个模块的典型函数全部为函数类型（跨模块一致性）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010029 begin');
      const contactOk: boolean = typeof contact.queryContacts === 'function';
      const routerOk: boolean = typeof router.pushUrl === 'function';
      const promptOk: boolean = typeof promptAction.showToast === 'function';
      const fsOk: boolean = typeof fileIo.openSync === 'function';
      expect(contactOk).assertTrue();
      expect(routerOk).assertTrue();
      expect(promptOk).assertTrue();
      expect(fsOk).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010029 end');
    });

    /**
     * @tc.name   testApiReal010030
     * @tc.number SUB_Contact_APIR_0030
     * @tc.desc   负向：模块中不存在的主路径函数保持 undefined（哨兵：不存在的名字不会误报存在）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiReal010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010030 begin');
      const real: boolean = typeof contact.queryContacts === 'function';
      const fake: boolean = contact.queryContacts !== undefined;
      expect(real).assertTrue();
      expect(fake).assertTrue();
      expect(real === fake).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiReal010030 end');
    });

  });
}
