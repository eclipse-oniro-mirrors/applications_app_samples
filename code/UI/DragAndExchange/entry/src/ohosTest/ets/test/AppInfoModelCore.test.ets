/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppInfo } from '../../../main/ets/bridge/DragAndExchangeBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'AppInfoModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * LazyForEach 键生成器在示例组件中使用 item.name.toString()，此处按同语义取键。
 */
function keyOf(item: AppInfo): string {
  return item.name.toString();
}

export default function appInfoModelCoreTest(): void {
  describe('AppInfoModelCoreTest', () => {
    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0001
     * @tc.name      testAppInfoModel0001
     * @tc.desc      Verify a default AppInfo keeps an empty icon.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0001 begin');
      const appInfo: AppInfo = new AppInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected=''`);
      expect(appInfo.icon).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof appInfo.icon=${typeof appInfo.icon}`);
      expect(typeof appInfo.icon).assertEqual('string');
      log('testAppInfoModel0001 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0002
     * @tc.name      testAppInfoModel0002
     * @tc.desc      Verify a default AppInfo keeps an empty name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0002 begin');
      const appInfo: AppInfo = new AppInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected=''`);
      expect(appInfo.name).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof appInfo.name=${typeof appInfo.name}`);
      expect(typeof appInfo.name).assertEqual('string');
      log('testAppInfoModel0002 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0003
     * @tc.name      testAppInfoModel0003
     * @tc.desc      Verify a default AppInfo is visible.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0003 begin');
      const appInfo: AppInfo = new AppInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof appInfo.visible=${typeof appInfo.visible}`);
      expect(typeof appInfo.visible).assertEqual('boolean');
      log('testAppInfoModel0003 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0004
     * @tc.name      testAppInfoModel0004
     * @tc.desc      Verify a one-arg constructor keeps the given icon and defaults the rest.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0004 begin');
      const appInfo: AppInfo = new AppInfo('icon_path');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='icon_path'`);
      expect(appInfo.icon).assertEqual('icon_path');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected=''`);
      expect(appInfo.name).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      log('testAppInfoModel0004 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0005
     * @tc.name      testAppInfoModel0005
     * @tc.desc      Verify a two-arg constructor defaults visible to true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0005 begin');
      const appInfo: AppInfo = new AppInfo('icon_path', 'App1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='icon_path'`);
      expect(appInfo.icon).assertEqual('icon_path');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App1'`);
      expect(appInfo.name).assertEqual('App1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      log('testAppInfoModel0005 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0006
     * @tc.name      testAppInfoModel0006
     * @tc.desc      Verify a three-arg constructor keeps every given field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0006 begin');
      const appInfo: AppInfo = new AppInfo('icon_path', 'App2', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='icon_path'`);
      expect(appInfo.icon).assertEqual('icon_path');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App2'`);
      expect(appInfo.name).assertEqual('App2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      log('testAppInfoModel0006 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0007
     * @tc.name      testAppInfoModel0007
     * @tc.desc      Verify a constructor keeps an explicit invisible state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0007 begin');
      const appInfo: AppInfo = new AppInfo('icon_path', 'App3', false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertFalse();
      log('testAppInfoModel0007 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0008
     * @tc.name      testAppInfoModel0008
     * @tc.desc      Verify the icon field round-trips a string assignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0008 begin');
      const appInfo: AppInfo = new AppInfo();
      appInfo.icon = 'drag_and_exchange_ic_public_app1.png';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}`);
      expect(appInfo.icon).assertEqual('drag_and_exchange_ic_public_app1.png');
      log('testAppInfoModel0008 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0009
     * @tc.name      testAppInfoModel0009
     * @tc.desc      Verify the name field round-trips a string assignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0009 begin');
      const appInfo: AppInfo = new AppInfo();
      appInfo.name = 'App15';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App15'`);
      expect(appInfo.name).assertEqual('App15');
      log('testAppInfoModel0009 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0010
     * @tc.name      testAppInfoModel0010
     * @tc.desc      Verify visible toggles true to false to true without losing state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0010 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      appInfo.visible = false;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertFalse();
      appInfo.visible = true;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      log('testAppInfoModel0010 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0011
     * @tc.name      testAppInfoModel0011
     * @tc.desc      Verify an invisible item restores visible like the List drag release flow.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0011 begin');
      const appInfo: AppInfo = new AppInfo('', 'Item1', false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertFalse();
      appInfo.visible = true;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      log('testAppInfoModel0011 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0012
     * @tc.name      testAppInfoModel0012
     * @tc.desc      Verify a Chinese name is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0012 begin');
      const appInfo: AppInfo = new AppInfo('', '应用一', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='应用一'`);
      expect(appInfo.name).assertEqual('应用一');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected='应用一'`);
      expect(keyOf(appInfo)).assertEqual('应用一');
      log('testAppInfoModel0012 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0013
     * @tc.name      testAppInfoModel0013
     * @tc.desc      Verify a 128-character name is preserved with full length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0013 begin');
      const longName: string = 'a'.repeat(128);
      const appInfo: AppInfo = new AppInfo('', longName, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected=longName`);
      expect(appInfo.name).assertEqual(longName);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longName.length=${longName.length}, expected=128`);
      expect(longName.length).assertEqual(128);
      log('testAppInfoModel0013 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0014
     * @tc.name      testAppInfoModel0014
     * @tc.desc      Verify a name with spaces and symbols is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0014 begin');
      const appInfo: AppInfo = new AppInfo('', 'App #1 - demo@2x', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App #1 - demo@2x'`);
      expect(appInfo.name).assertEqual('App #1 - demo@2x');
      log('testAppInfoModel0014 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0015
     * @tc.name      testAppInfoModel0015
     * @tc.desc      Verify a numeric string icon is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0015 begin');
      const appInfo: AppInfo = new AppInfo('50', 'App1', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='50'`);
      expect(appInfo.icon).assertEqual('50');
      log('testAppInfoModel0015 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0016
     * @tc.name      testAppInfoModel0016
     * @tc.desc      Verify name.toString produces the LazyForEach key for a grid item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0016 begin');
      const appInfo: AppInfo = new AppInfo('', 'App7', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected='App7'`);
      expect(keyOf(appInfo)).assertEqual('App7');
      log('testAppInfoModel0016 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0017
     * @tc.name      testAppInfoModel0017
     * @tc.desc      Verify name.toString on an empty name produces an empty key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0017 begin');
      const appInfo: AppInfo = new AppInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected=''`);
      expect(keyOf(appInfo)).assertEqual('');
      log('testAppInfoModel0017 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0018
     * @tc.name      testAppInfoModel0018
     * @tc.desc      Verify different names produce different LazyForEach keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0018 begin');
      const first: AppInfo = new AppInfo('', 'App1', true);
      const second: AppInfo = new AppInfo('', 'App2', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${keyOf(first) !== keyOf(second)}`);
      expect(keyOf(first) !== keyOf(second)).assertTrue();
      log('testAppInfoModel0018 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0019
     * @tc.name      testAppInfoModel0019
     * @tc.desc      Verify identical names produce identical LazyForEach keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0019 begin');
      const first: AppInfo = new AppInfo('', 'Item1', true);
      const second: AppInfo = new AppInfo('', 'Item1', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(first)=${keyOf(first)}, expected=keyOf(second)`);
      expect(keyOf(first)).assertEqual(keyOf(second));
      log('testAppInfoModel0019 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0020
     * @tc.name      testAppInfoModel0020
     * @tc.desc      Verify repeated reads of the same field return the same value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0020 begin');
      const appInfo: AppInfo = new AppInfo('', 'App3', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected=appInfo.name`);
      expect(appInfo.name).assertEqual(appInfo.name);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.visible=${appInfo.visible}, expected=appInfo.visible`);
      expect(appInfo.visible).assertEqual(appInfo.visible);
      log('testAppInfoModel0020 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0021
     * @tc.name      testAppInfoModel0021
     * @tc.desc      Verify the model class is instantiated as AppInfo.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0021 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo instanceof AppInfo=${appInfo instanceof AppInfo}`);
      expect(appInfo instanceof AppInfo).assertTrue();
      log('testAppInfoModel0021 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0022
     * @tc.name      testAppInfoModel0022
     * @tc.desc      Verify two instances keep independent field states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0022 begin');
      const first: AppInfo = new AppInfo('', 'App1', true);
      const second: AppInfo = new AppInfo('', 'App2', true);
      first.visible = false;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first.visible=${first.visible}`);
      expect(first.visible).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second.visible=${second.visible}`);
      expect(second.visible).assertTrue();
      log('testAppInfoModel0022 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0023
     * @tc.name      testAppInfoModel0023
     * @tc.desc      Verify direct field writes keep the observed model writable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0023 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      appInfo.name = 'App2';
      appInfo.icon = 'icon2';
      appInfo.visible = false;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App2'`);
      expect(appInfo.name).assertEqual('App2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='icon2'`);
      expect(appInfo.icon).assertEqual('icon2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertFalse();
      log('testAppInfoModel0023 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0024
     * @tc.name      testAppInfoModel0024
     * @tc.desc      Verify a mixed empty icon and non-empty name model is stored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0024 begin');
      const appInfo: AppInfo = new AppInfo('', 'App4', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected=''`);
      expect(appInfo.icon).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App4'`);
      expect(appInfo.name).assertEqual('App4');
      log('testAppInfoModel0024 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0025
     * @tc.name      testAppInfoModel0025
     * @tc.desc      Verify a non-empty icon with an empty name model is stored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0025 begin');
      const appInfo: AppInfo = new AppInfo('icon.png', '', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='icon.png'`);
      expect(appInfo.icon).assertEqual('icon.png');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected=''`);
      expect(appInfo.name).assertEqual('');
      log('testAppInfoModel0025 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0026
     * @tc.name      testAppInfoModel0026
     * @tc.desc      Verify assigning a new name overwrites the previous one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0026 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      appInfo.name = 'App2';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App2'`);
      expect(appInfo.name).assertEqual('App2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.name !== 'App1'=${appInfo.name !== 'App1'}`);
      expect(appInfo.name !== 'App1').assertTrue();
      log('testAppInfoModel0026 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0027
     * @tc.name      testAppInfoModel0027
     * @tc.desc      Verify the LazyForEach key follows the overwritten name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0027 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      appInfo.name = 'App9';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected='App9'`);
      expect(keyOf(appInfo)).assertEqual('App9');
      log('testAppInfoModel0027 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0028
     * @tc.name      testAppInfoModel0028
     * @tc.desc      Verify assigning the same visible value twice is idempotent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0028 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      appInfo.visible = true;
      appInfo.visible = true;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertTrue();
      log('testAppInfoModel0028 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0029
     * @tc.name      testAppInfoModel0029
     * @tc.desc      Verify the largest grid item name App15 is stored as-is.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0029 begin');
      const appInfo: AppInfo = new AppInfo('', 'App15', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App15'`);
      expect(appInfo.name).assertEqual('App15');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected='App15'`);
      expect(keyOf(appInfo)).assertEqual('App15');
      log('testAppInfoModel0029 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0030
     * @tc.name      testAppInfoModel0030
     * @tc.desc      Verify the largest list item name Item4 is stored as-is.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0030 begin');
      const appInfo: AppInfo = new AppInfo('', 'Item4', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='Item4'`);
      expect(appInfo.name).assertEqual('Item4');
      log('testAppInfoModel0030 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0031
     * @tc.name      testAppInfoModel0031
     * @tc.desc      Verify grid and list items share the same model class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0031 begin');
      const gridItem: AppInfo = new AppInfo('', 'App1', true);
      const listItem: AppInfo = new AppInfo('', 'Item1', true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue gridItem instanceof AppInfo=${gridItem instanceof AppInfo}`);
      expect(gridItem instanceof AppInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue listItem instanceof AppInfo=${listItem instanceof AppInfo}`);
      expect(listItem instanceof AppInfo).assertTrue();
      log('testAppInfoModel0031 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0032
     * @tc.name      testAppInfoModel0032
     * @tc.desc      Verify 100 instances keep independent visible states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0032 begin');
      const items: AppInfo[] = [];
      for (let i: number = 0; i < 100; i++) {
        items.push(new AppInfo('', 'App' + String(i), true));
      }
      items[0].visible = false;
      items[99].visible = false;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue items[1].visible=${items[1].visible}`);
      expect(items[1].visible).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse items[0].visible=${items[0].visible}`);
      expect(items[0].visible).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse items[99].visible=${items[99].visible}`);
      expect(items[99].visible).assertFalse();
      log('testAppInfoModel0032 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0033
     * @tc.name      testAppInfoModel0033
     * @tc.desc      Verify triple name overwrites keep only the last value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0033 begin');
      const appInfo: AppInfo = new AppInfo('', 'App1', true);
      appInfo.name = 'App2';
      appInfo.name = 'App3';
      appInfo.name = 'App4';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App4'`);
      expect(appInfo.name).assertEqual('App4');
      log('testAppInfoModel0033 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0034
     * @tc.name      testAppInfoModel0034
     * @tc.desc      Verify constructor argument order keeps icon first and name second.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0034 begin');
      const appInfo: AppInfo = new AppInfo('ic', 'App2', false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.icon=${appInfo.icon}, expected='ic'`);
      expect(appInfo.icon).assertEqual('ic');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual appInfo.name=${appInfo.name}, expected='App2'`);
      expect(appInfo.name).assertEqual('App2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse appInfo.visible=${appInfo.visible}`);
      expect(appInfo.visible).assertFalse();
      log('testAppInfoModel0034 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0035
     * @tc.name      testAppInfoModel0035
     * @tc.desc      Verify a default instance key is empty before any assignment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0035 begin');
      const appInfo: AppInfo = new AppInfo();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected=''`);
      expect(keyOf(appInfo)).assertEqual('');
      appInfo.name = 'Item2';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keyOf(appInfo)=${keyOf(appInfo)}, expected='Item2'`);
      expect(keyOf(appInfo)).assertEqual('Item2');
      log('testAppInfoModel0035 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_APPINFOMODEL_0036
     * @tc.name      testAppInfoModel0036
     * @tc.desc      Verify icon and name fields keep string types after round trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAppInfoModel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAppInfoModel0036 begin');
      const appInfo: AppInfo = new AppInfo('icon1', 'App1', true);
      const iconAfter: ResourceStr = appInfo.icon;
      const nameAfter: ResourceStr = appInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof iconAfter=${typeof iconAfter}, expected='string'`);
      expect(typeof iconAfter).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof nameAfter=${typeof nameAfter}, expected='string'`);
      expect(typeof nameAfter).assertEqual('string');
      log('testAppInfoModel0036 end');
    })
  })
}
