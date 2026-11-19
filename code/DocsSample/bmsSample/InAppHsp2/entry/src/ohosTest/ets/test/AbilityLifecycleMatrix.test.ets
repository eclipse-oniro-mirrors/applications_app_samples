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
import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { UIAbility, bundleManager } from '@kit.AbilityKit';
import { ENTRY_ABILITY, ENTRY_MODULE, BUNDLE_NAME, launchHome, stopHome, topAbility } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

let launched: UIAbility | undefined = undefined;

export default function abilityLifecycleTest() {
  describe('AbilityLifecycle', () => {
    beforeAll(async () => {
      launched = await launchHome();
    });
    afterAll(async () => {
      await stopHome();
    });
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0001
     * @tc.name      testLifecycle0001
     * @tc.desc      Entry ability name matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0001', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.name).assertEqual(ENTRY_ABILITY);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0002
     * @tc.name      testLifecycle0002
     * @tc.desc      Entry ability name keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0002', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.name.length).assertEqual(12);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0003
     * @tc.name      testLifecycle0003
     * @tc.desc      Entry ability moduleName matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0003', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.moduleName).assertEqual(ENTRY_MODULE);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0004
     * @tc.name      testLifecycle0004
     * @tc.desc      Entry ability moduleName keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0004', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.moduleName.length).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0005
     * @tc.name      testLifecycle0005
     * @tc.desc      Entry ability bundleName matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0005', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.bundleName).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0006
     * @tc.name      testLifecycle0006
     * @tc.desc      Entry ability bundleName keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0006', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.bundleName.length).assertEqual(26);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0007
     * @tc.name      testLifecycle0007
     * @tc.desc      Entry ability exported matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0007', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.exported).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0008
     * @tc.name      testLifecycle0008
     * @tc.desc      Entry ability exported keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0008', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.exported === true).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0009
     * @tc.name      testLifecycle0009
     * @tc.desc      Entry ability enabled matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0009', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.enabled).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0010
     * @tc.name      testLifecycle0010
     * @tc.desc      Entry ability enabled keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0010', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.enabled === true).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0011
     * @tc.name      testLifecycle0011
     * @tc.desc      Entry ability labelId matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0011', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.labelId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0012
     * @tc.name      testLifecycle0012
     * @tc.desc      Entry ability labelId keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0012', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number.isInteger(info.labelId)).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0013
     * @tc.name      testLifecycle0013
     * @tc.desc      Entry ability descriptionId matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0013', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.descriptionId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0014
     * @tc.name      testLifecycle0014
     * @tc.desc      Entry ability descriptionId keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0014', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number.isInteger(info.descriptionId)).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0015
     * @tc.name      testLifecycle0015
     * @tc.desc      Entry ability iconId matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0015', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.iconId >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0016
     * @tc.name      testLifecycle0016
     * @tc.desc      Entry ability iconId keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0016', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number.isInteger(info.iconId)).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0017
     * @tc.name      testLifecycle0017
     * @tc.desc      Entry ability permissions matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0017', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.permissions.length <= 32).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0018
     * @tc.name      testLifecycle0018
     * @tc.desc      Entry ability permissions keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0018', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      let clean: boolean = true;
      for (let i: number = 0; i < info.permissions.length; i++) {
        if (info.permissions[i].length === 0) {
          clean = false;
        }
      }
      expect(clean).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0019
     * @tc.name      testLifecycle0019
     * @tc.desc      Entry ability orientation matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0019', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number(info.orientation) >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0020
     * @tc.name      testLifecycle0020
     * @tc.desc      Entry ability orientation keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0020', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number(info.orientation) <= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0021
     * @tc.name      testLifecycle0021
     * @tc.desc      Entry ability launchType matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0021', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number(info.launchType) >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0022
     * @tc.name      testLifecycle0022
     * @tc.desc      Entry ability launchType keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0022', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(Number(info.launchType) <= 3).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0023
     * @tc.name      testLifecycle0023
     * @tc.desc      Entry ability appIndex matches manifest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0023', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.appIndex).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0024
     * @tc.name      testLifecycle0024
     * @tc.desc      Entry ability appIndex keeps type shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0024', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(info.appIndex >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0025
     * @tc.name      testLifecycle0025
     * @tc.desc      Entry ability context points at entry module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0025', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.context.bundleCodeDir.length > 0).assertTrue();
      expect(ability.context.filesDir.length > 0).assertTrue();
      expect(ability.context.filesDir.endsWith('files')).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0026
     * @tc.name      testLifecycle0026
     * @tc.desc      Entry ability application info names the bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0026', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      const app: bundleManager.ApplicationInfo = ability.context.applicationInfo;
      expect(app.name).assertEqual(BUNDLE_NAME);
      expect(app.uid >= 0).assertTrue();
      expect(app.enabled).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0027
     * @tc.name      testLifecycle0027
     * @tc.desc      Entry ability application is a debug app bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0027', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      const app: bundleManager.ApplicationInfo = ability.context.applicationInfo;
      expect(Number(app.bundleType)).assertEqual(0);
      expect(app.debug === true || app.debug === false).assertTrue();
      expect(app.codePath.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0028
     * @tc.name      testLifecycle0028
     * @tc.desc      Top ability reports the entry ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const top: UIAbility | undefined = await topAbility();
      logCase('testLifecycle0028', 'top ability name');
      expect(top !== undefined).assertTrue();
      if (top === undefined) {
        return;
      }
      expect(top.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(top.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      expect(top.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0029
     * @tc.name      testLifecycle0029
     * @tc.desc      Top ability context shares the launched dirs
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const top: UIAbility | undefined = await topAbility();
      const base: UIAbility | undefined = launched;
      logCase('testLifecycle0029', 'top ability dirs');
      expect(top !== undefined && base !== undefined).assertTrue();
      if (top === undefined || base === undefined) {
        return;
      }
      expect(top.context.filesDir).assertEqual(base.context.filesDir);
      expect(top.context.cacheDir).assertEqual(base.context.cacheDir);
      expect(top.context.bundleCodeDir).assertEqual(base.context.bundleCodeDir);
    });
    /**
     * @tc.number    SUB_IHSP_LIFE_0030
     * @tc.name      testLifecycle0030
     * @tc.desc      Launched ability keeps a stable identity
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility | undefined = launched;
      if (ability === undefined) {
        logCase('testLifecycle0030', 'ability not launched');
        return;
      }
      const info: bundleManager.AbilityInfo = ability.context.abilityInfo;
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(ability.context.abilityInfo.enabled).assertTrue();
      expect(ability.context.abilityInfo.exported).assertTrue();
      expect(ability.context.abilityInfo.enabled).assertTrue();
    });
;
  });
}
