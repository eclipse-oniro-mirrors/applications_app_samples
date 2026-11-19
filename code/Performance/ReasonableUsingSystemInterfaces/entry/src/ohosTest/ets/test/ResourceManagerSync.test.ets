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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { common } from '@kit.AbilityKit';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';

const RAW_FILE_NAME: string = 'sanguo.txt';
const MISSING_RAW_FILE_NAME: string = 'not_exist_raw_file.txt';
const TEST_STRING_NAME: string = 'test';
const ENTRY_ABILITY_LABEL: string = 'Reasonable_Using_System_Interfaces';
const INVALID_RESOURCE_ID: number = 0x7FFFFFFF;
const REPEAT_TIMES: number = 5;

export default function resourceManagerSyncTest(): void {
  describe('ResourceManagerSyncTest', (): void => {
    let resMgr: resourceManager.ResourceManager;

    beforeAll((): void => {
      const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      resMgr = appContext.resourceManager;
    });

    /**
     * @tc.name   testGetStringSyncByResource0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0100
     * @tc.desc   Test that getStringSync returns a non-empty string when a Resource object is passed in.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStringSyncByResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testGetStringSyncByResource0001';
      InterfaceTestLog.begin(name, 'resource=app.string.test');
      const value: string = resMgr.getStringSync($r('app.string.test'));
      InterfaceTestLog.value(name, 'valueType', 'string', typeof value);
      expect(typeof value).assertEqual('string');
      InterfaceTestLog.flag(name, 'valueNonEmpty expected=true', value.length > 0);
      expect(value.length > 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetStringByNameSync0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0200
     * @tc.desc   Test that getStringByNameSync returns a non-empty string for the resource name that the demo reads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStringByNameSync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testGetStringByNameSync0001';
      InterfaceTestLog.begin(name, `resourceName=${TEST_STRING_NAME}`);
      const value: string = resMgr.getStringByNameSync(TEST_STRING_NAME);
      InterfaceTestLog.value(name, 'valueType', 'string', typeof value);
      expect(typeof value).assertEqual('string');
      InterfaceTestLog.flag(name, 'valueNonEmpty expected=true', value.length > 0);
      expect(value.length > 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetStringByResourceAndNameEqual0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0300
     * @tc.desc   Test that the Resource parameter and the resource name parameter return the same string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStringByResourceAndNameEqual0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testGetStringByResourceAndNameEqual0001';
      InterfaceTestLog.begin(name, `resource=app.string.test,resourceName=${TEST_STRING_NAME}`);
      const byResource: string = resMgr.getStringSync($r('app.string.test'));
      const byName: string = resMgr.getStringByNameSync(TEST_STRING_NAME);
      InterfaceTestLog.value(name, 'resourceAndNameResult', byResource, byName);
      expect(byName).assertEqual(byResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetStringSyncRepeatCall0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0400
     * @tc.desc   Test that repeated calls of the sync interface return a stable result without cache differences.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStringSyncRepeatCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testGetStringSyncRepeatCall0001';
      InterfaceTestLog.begin(name, `resource=app.string.test,repeatTimes=${REPEAT_TIMES}`);
      const firstValue: string = resMgr.getStringSync($r('app.string.test'));
      const values: Array<string> = [];
      for (let i: number = 0; i < REPEAT_TIMES; i++) {
        values.push(resMgr.getStringSync($r('app.string.test')));
      }
      InterfaceTestLog.number(name, 'resultCount', REPEAT_TIMES, values.length);
      expect(values.length).assertEqual(REPEAT_TIMES);
      for (let i: number = 0; i < values.length; i++) {
        InterfaceTestLog.value(name, `repeatResult[${i}]`, firstValue, values[i]);
        expect(values[i]).assertEqual(firstValue);
      }
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetStringSyncAnotherResource0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0500
     * @tc.desc   Test that getStringSync resolves a second app string to the configured module string value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStringSyncAnotherResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testGetStringSyncAnotherResource0001';
      InterfaceTestLog.begin(name, 'resource=app.string.EntryAbility_label');
      const label: string = resMgr.getStringSync($r('app.string.EntryAbility_label'));
      InterfaceTestLog.value(name, 'entryAbilityLabel', ENTRY_ABILITY_LABEL, label);
      expect(label).assertEqual(ENTRY_ABILITY_LABEL);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testResourceIdValid0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0600
     * @tc.desc   Test that the id field of the $r resource object is a valid positive number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceIdValid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testResourceIdValid0001';
      InterfaceTestLog.begin(name, 'resource=app.string.test');
      const resId: number = $r('app.string.test').id;
      InterfaceTestLog.value(name, 'resourceIdType', 'number', typeof resId);
      expect(typeof resId).assertEqual('number');
      InterfaceTestLog.flag(name, 'resourceIdPositive expected=true', resId > 0);
      expect(resId > 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetRawFileContent0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0700
     * @tc.desc   Test that the asynchronous interface reads the rawfile asset that the word break demo depends on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRawFileContent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const name: string = 'testGetRawFileContent0001';
      InterfaceTestLog.begin(name, `rawfile=${RAW_FILE_NAME}`);
      const content: Uint8Array = await resMgr.getRawFileContent(RAW_FILE_NAME);
      InterfaceTestLog.flag(name, 'rawContentNonEmpty expected=true', content.length > 0);
      expect(content.length > 0).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetRawFileContentSync0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0800
     * @tc.desc   Test that the synchronous and the asynchronous rawfile interfaces return the same byte length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRawFileContentSync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const name: string = 'testGetRawFileContentSync0001';
      InterfaceTestLog.begin(name, `rawfile=${RAW_FILE_NAME}`);
      const asyncContent: Uint8Array = await resMgr.getRawFileContent(RAW_FILE_NAME);
      const syncContent: Uint8Array = resMgr.getRawFileContentSync(RAW_FILE_NAME);
      InterfaceTestLog.number(name, 'rawContentLength', asyncContent.length, syncContent.length);
      expect(syncContent.length).assertEqual(asyncContent.length);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetRawFileContentMissingFile0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_0900
     * @tc.desc   Test that reading a missing rawfile throws an exception instead of returning empty data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRawFileContentMissingFile0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const name: string = 'testGetRawFileContentMissingFile0001';
      InterfaceTestLog.begin(name, `rawfile=${MISSING_RAW_FILE_NAME}`);
      let isFailed: boolean = false;
      try {
        await resMgr.getRawFileContent(MISSING_RAW_FILE_NAME);
      } catch (err) {
        isFailed = true;
      }
      InterfaceTestLog.flag(name, 'missingFileRejected expected=true', isFailed);
      expect(isFailed).assertTrue();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testGetStringSyncInvalidId0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_RESOURCEMANAGERSYNC_1000
     * @tc.desc   Test that getStringSync throws an exception when the resource ID does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStringSyncInvalidId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testGetStringSyncInvalidId0001';
      InterfaceTestLog.begin(name, `resourceId=${INVALID_RESOURCE_ID}`);
      let isFailed: boolean = false;
      try {
        resMgr.getStringSync(INVALID_RESOURCE_ID);
      } catch (err) {
        isFailed = true;
      }
      InterfaceTestLog.flag(name, 'invalidResourceIdRejected expected=true', isFailed);
      expect(isFailed).assertTrue();
      InterfaceTestLog.end(name);
    });
  });
}
