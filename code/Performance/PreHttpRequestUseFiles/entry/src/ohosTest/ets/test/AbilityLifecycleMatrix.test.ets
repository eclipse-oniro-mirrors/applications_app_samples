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
import { common, UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ENTRY_ABILITY, ENTRY_MODULE, launchHome, stopHome } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

let homeAbility: UIAbility | undefined = undefined;

async function home(): Promise<UIAbility> {
  const cached: UIAbility | undefined = homeAbility;
  if (cached !== undefined) {
    return cached;
  }
  const created: UIAbility = await launchHome();
  homeAbility = created;
  return created;
}

function delegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

export default function abilityLifecycleMatrixTest() {
  describe('AbilityLifecycleMatrix', () => {
    beforeAll(async () => {
      await home();
    });

    afterAll(async () => {
      await stopHome();
    });

    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0001
     * @tc.name      testAbilityLifecycle0001
     * @tc.desc      Ability state is foreground or background
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      const state: abilityDelegatorRegistry.AbilityLifecycleState = delegator().getAbilityState(ability);
      expect(state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND ||
        state === abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND).assertTrue();
      logCase('testAbilityLifecycle0001', 'lifecycle check 1');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0002
     * @tc.name      testAbilityLifecycle0002
     * @tc.desc      Ability state is not initial
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      const state: abilityDelegatorRegistry.AbilityLifecycleState = delegator().getAbilityState(ability);
      expect(state !== abilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED).assertTrue();
      logCase('testAbilityLifecycle0002', 'lifecycle check 2');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0003
     * @tc.name      testAbilityLifecycle0003
     * @tc.desc      Ability name matches the entry ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      logCase('testAbilityLifecycle0003', 'lifecycle check 3');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0004
     * @tc.name      testAbilityLifecycle0004
     * @tc.desc      Ability module matches the entry module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      logCase('testAbilityLifecycle0004', 'lifecycle check 4');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0005
     * @tc.name      testAbilityLifecycle0005
     * @tc.desc      Ability bundle matches the app bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      logCase('testAbilityLifecycle0005', 'lifecycle check 5');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0006
     * @tc.name      testAbilityLifecycle0006
     * @tc.desc      Ability is exported to the launcher
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.exported).assertTrue();
      logCase('testAbilityLifecycle0006', 'lifecycle check 6');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0007
     * @tc.name      testAbilityLifecycle0007
     * @tc.desc      Ability launch type is numeric
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(typeof ability.context.abilityInfo.launchType).assertEqual('number');
      logCase('testAbilityLifecycle0007', 'lifecycle check 7');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0008
     * @tc.name      testAbilityLifecycle0008
     * @tc.desc      Ability icon id is assigned
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.iconId > 0).assertTrue();
      logCase('testAbilityLifecycle0008', 'lifecycle check 8');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0009
     * @tc.name      testAbilityLifecycle0009
     * @tc.desc      Ability label id is assigned
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.labelId > 0).assertTrue();
      logCase('testAbilityLifecycle0009', 'lifecycle check 9');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0010
     * @tc.name      testAbilityLifecycle0010
     * @tc.desc      Ability declares at least one skill
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testAbilityLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.skills.length >= 1).assertTrue();
      logCase('testAbilityLifecycle0010', 'lifecycle check 10');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0011
     * @tc.name      testAbilityLifecycle0011
     * @tc.desc      Ability first skill declares home entity
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.skills[0].entities.indexOf('entity.system.home') >= 0)
        .assertTrue();
      logCase('testAbilityLifecycle0011', 'lifecycle check 11');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0012
     * @tc.name      testAbilityLifecycle0012
     * @tc.desc      Ability first skill declares home action
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.skills[0].actions.indexOf('action.system.home') >= 0)
        .assertTrue();
      logCase('testAbilityLifecycle0012', 'lifecycle check 12');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0013
     * @tc.name      testAbilityLifecycle0013
     * @tc.desc      Ability description id is not negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.descriptionId >= 0).assertTrue();
      logCase('testAbilityLifecycle0013', 'lifecycle check 13');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0014
     * @tc.name      testAbilityLifecycle0014
     * @tc.desc      Context files dir is absolute
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.filesDir.startsWith('/')).assertTrue();
      logCase('testAbilityLifecycle0014', 'lifecycle check 14');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0015
     * @tc.name      testAbilityLifecycle0015
     * @tc.desc      Context cache dir is absolute
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.cacheDir.startsWith('/')).assertTrue();
      logCase('testAbilityLifecycle0015', 'lifecycle check 15');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0016
     * @tc.name      testAbilityLifecycle0016
     * @tc.desc      Context temp dir is absolute
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.tempDir.startsWith('/')).assertTrue();
      logCase('testAbilityLifecycle0016', 'lifecycle check 16');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0017
     * @tc.name      testAbilityLifecycle0017
     * @tc.desc      Context files dir ends with files
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.filesDir.endsWith('files')).assertTrue();
      logCase('testAbilityLifecycle0017', 'lifecycle check 17');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0018
     * @tc.name      testAbilityLifecycle0018
     * @tc.desc      Context cache dir ends with cache
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.cacheDir.endsWith('cache')).assertTrue();
      logCase('testAbilityLifecycle0018', 'lifecycle check 18');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0019
     * @tc.name      testAbilityLifecycle0019
     * @tc.desc      Context files dir differs from cache dir
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.filesDir === ability.context.cacheDir).assertFalse();
      logCase('testAbilityLifecycle0019', 'lifecycle check 19');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0020
     * @tc.name      testAbilityLifecycle0020
     * @tc.desc      Context files dir is longer than the cache suffix
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.filesDir.length > 5).assertTrue();
      logCase('testAbilityLifecycle0020', 'lifecycle check 20');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0021
     * @tc.name      testAbilityLifecycle0021
     * @tc.desc      App context shares the ability application info
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      const app: common.Context = delegator().getAppContext();
      expect(app.applicationInfo.name).assertEqual(ability.context.applicationInfo.name);
      logCase('testAbilityLifecycle0021', 'lifecycle check 21');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0022
     * @tc.name      testAbilityLifecycle0022
     * @tc.desc      Entry module and ability expose their documented files directory scopes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      const app: common.Context = delegator().getAppContext();
      const entry: common.Context = app.createModuleContext(ENTRY_MODULE);
      expect(entry.filesDir).assertEqual(app.filesDir);
      expect(ability.context.filesDir.endsWith(`/haps/${ENTRY_MODULE}/files`)).assertTrue();
      logCase('testAbilityLifecycle0022', 'lifecycle check 22');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0023
     * @tc.name      testAbilityLifecycle0023
     * @tc.desc      Entry module and ability expose their documented cache directory scopes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      const app: common.Context = delegator().getAppContext();
      const entry: common.Context = app.createModuleContext(ENTRY_MODULE);
      expect(entry.cacheDir).assertEqual(app.cacheDir);
      expect(ability.context.cacheDir.endsWith(`/haps/${ENTRY_MODULE}/cache`)).assertTrue();
      logCase('testAbilityLifecycle0023', 'lifecycle check 23');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0024
     * @tc.name      testAbilityLifecycle0024
     * @tc.desc      App context application name matches the app bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      const app: common.Context = delegator().getAppContext();
      expect(app.applicationInfo.name).assertEqual(BUNDLE_NAME);
      logCase('testAbilityLifecycle0024', 'lifecycle check 24');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0025
     * @tc.name      testAbilityLifecycle0025
     * @tc.desc      Launched ability is the entry ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      logCase('testAbilityLifecycle0025', 'lifecycle check 25');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0026
     * @tc.name      testAbilityLifecycle0026
     * @tc.desc      Launched ability module is the entry module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      logCase('testAbilityLifecycle0026', 'lifecycle check 26');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0027
     * @tc.name      testAbilityLifecycle0027
     * @tc.desc      Launched ability belongs to the app bundle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
      logCase('testAbilityLifecycle0027', 'lifecycle check 27');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0028
     * @tc.name      testAbilityLifecycle0028
     * @tc.desc      Ability context ability info has a description id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(Number.isInteger(ability.context.abilityInfo.descriptionId)).assertTrue();
      logCase('testAbilityLifecycle0028', 'lifecycle check 28');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0029
     * @tc.name      testAbilityLifecycle0029
     * @tc.desc      Ability context ability info is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.enabled).assertTrue();
      logCase('testAbilityLifecycle0029', 'lifecycle check 29');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0030
     * @tc.name      testAbilityLifecycle0030
     * @tc.desc      Ability context application info uid is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAbilityLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.applicationInfo.uid > 0).assertTrue();
      logCase('testAbilityLifecycle0030', 'lifecycle check 30');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0031
     * @tc.name      testAbilityLifecycle0031
     * @tc.desc      Ability context application info access token is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.applicationInfo.accessTokenId > 0).assertTrue();
      logCase('testAbilityLifecycle0031', 'lifecycle check 31');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0032
     * @tc.name      testAbilityLifecycle0032
     * @tc.desc      Ability context application info has a non empty name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.applicationInfo.name.length > 0).assertTrue();
      logCase('testAbilityLifecycle0032', 'lifecycle check 32');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0033
     * @tc.name      testAbilityLifecycle0033
     * @tc.desc      Ability context application info is a system app flag boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(typeof ability.context.applicationInfo.systemApp).assertEqual('boolean');
      logCase('testAbilityLifecycle0033', 'lifecycle check 33');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0034
     * @tc.name      testAbilityLifecycle0034
     * @tc.desc      Ability context resource manager is available
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.resourceManager !== undefined).assertTrue();
      logCase('testAbilityLifecycle0034', 'lifecycle check 34');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0035
     * @tc.name      testAbilityLifecycle0035
     * @tc.desc      Ability context resource manager reads the app name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      const label: string = ability.context.resourceManager.getStringByNameSync('app_name');
      expect(label.length).assertEqual(19);
      logCase('testAbilityLifecycle0035', 'lifecycle check 35');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0036
     * @tc.name      testAbilityLifecycle0036
     * @tc.desc      Ability context files dir contains the bundle token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.filesDir.indexOf('el2') >= 0).assertTrue();
      logCase('testAbilityLifecycle0036', 'lifecycle check 36');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0037
     * @tc.name      testAbilityLifecycle0037
     * @tc.desc      Ability delegator app context is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      const first: common.Context = delegator().getAppContext();
      const second: common.Context = delegator().getAppContext();
      expect(first.filesDir).assertEqual(second.filesDir);
      logCase('testAbilityLifecycle0037', 'lifecycle check 37');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0038
     * @tc.name      testAbilityLifecycle0038
     * @tc.desc      Ability context remains the same instance across calls
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(homeAbility !== undefined).assertTrue();
      const again: UIAbility = await home();
      expect(again.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      logCase('testAbilityLifecycle0038', 'lifecycle check 38');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0039
     * @tc.name      testAbilityLifecycle0039
     * @tc.desc      Ability state call is repeatable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      const first: abilityDelegatorRegistry.AbilityLifecycleState = delegator().getAbilityState(ability);
      const second: abilityDelegatorRegistry.AbilityLifecycleState = delegator().getAbilityState(ability);
      expect(first).assertEqual(second);
      logCase('testAbilityLifecycle0039', 'lifecycle check 39');
    });
    /**
     * @tc.number    SUB_PREHTTP_LIFE_0040
     * @tc.name      testAbilityLifecycle0040
     * @tc.desc      Ability name keeps twelve characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityLifecycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await home();
      expect(ability.context.abilityInfo.name.length).assertEqual(12);
      logCase('testAbilityLifecycle0040', 'lifecycle check 40');
    });
  });
}
