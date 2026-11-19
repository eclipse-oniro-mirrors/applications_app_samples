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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import {
  ENTRY_MODULE,
  entryContext,
  ERR_RES_ID_INVALID,
  ERR_RES_NAME_INVALID,
  errorCode,
  findModule,
  selfBundle
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// Expectation table read from entry/src/main/resources/base/element/string.json and from
// AppScope/resources/base/element/string.json. Both qualifier folders below base are absent from the
// project (only base and dark exist), so the en_US and zh_CN expectations are the base values that a
// qualifier fallback has to return. index_title and hint_gc_page carry Chinese characters inside the
// json files; those characters are rebuilt from their code points so this file holds no literal.
const INDEX_TITLE_PREFIX: string = 'ArkTS GC';
const HINT_GC_PREFIX: string = 'ArkTools.hintGC() ';
const INDEX_TITLE_CJK: number[] = [0x5783, 0x573E, 0x56DE, 0x6536];
const HINT_GC_CJK: number[] = [0x4F7F, 0x7528, 0x793A, 0x4F8B];
const EN_US_LOCALE: string = 'en_US';
const ZH_CN_LOCALE: string = 'zh_CN';
const REPEAT_ROUNDS: number = 5;
const LONG_NAME_PADDING: string = 'x'.repeat(512);
const BAD_ID_ONE: number = 1;
const BAD_ID_TWO: number = 2;
const BAD_ID_MEDIA: number = 16777215;
const BAD_ID_MAX: number = 0x7fffffff;
const BAD_ID_LARGE: number = 999999;
const BAD_ID_HUGE: number = 123456789;
const BAD_ID_ZERO: number = 0;
const BAD_ID_NEGATIVE: number = -1;

// one row of the expectation table: the name and value copied from string.json plus the numbers the
// json file implies, so every length and character check has an independent oracle
class StringSpec {
  name: string;
  value: string;
  asciiUnits: number;
  cjkUnits: number;
  spaces: number;
  origin: string;

  constructor(name: string, value: string, asciiUnits: number, cjkUnits: number, spaces: number,
    origin: string) {
    this.name = name;
    this.value = value;
    this.asciiUnits = asciiUnits;
    this.cjkUnits = cjkUnits;
    this.spaces = spaces;
    this.origin = origin;
  }
}

// the four string ids the bundle configuration of the app publishes, used for the id based lookups
class StringIds {
  appLabel: number;
  moduleDesc: number;
  abilityDesc: number;
  abilityLabel: number;

  constructor(appLabel: number, moduleDesc: number, abilityDesc: number, abilityLabel: number) {
    this.appLabel = appLabel;
    this.moduleDesc = moduleDesc;
    this.abilityDesc = abilityDesc;
    this.abilityLabel = abilityLabel;
  }
}

function cjkText(codes: number[]): string {
  let text: string = '';
  for (const code of codes) {
    text += String.fromCharCode(code);
  }
  return text;
}

const APP_NAME: StringSpec = new StringSpec('app_name', 'ArkTSGC', 7, 0, 0, 'AppScope');
const MODULE_DESC: StringSpec = new StringSpec('module_desc', 'module description', 18, 0, 1, 'entry');
const ABILITY_DESC: StringSpec = new StringSpec('EntryAbility_desc', 'description', 11, 0, 0, 'entry');
const ABILITY_LABEL: StringSpec = new StringSpec('EntryAbility_label', 'ArkTSGC', 7, 0, 0, 'entry');
const INDEX_TITLE: StringSpec =
  new StringSpec('index_title', INDEX_TITLE_PREFIX + cjkText(INDEX_TITLE_CJK), 8, 4, 1, 'entry');
const HINT_GC_PAGE: StringSpec =
  new StringSpec('hint_gc_page', HINT_GC_PREFIX + cjkText(HINT_GC_CJK), 18, 4, 1, 'entry');

const STRING_SPECS: StringSpec[] = [APP_NAME, MODULE_DESC, ABILITY_DESC, ABILITY_LABEL, INDEX_TITLE, HINT_GC_PAGE];

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function appResources(): resourceManager.ResourceManager {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
}

function overrideWithLocale(locale: string): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.locale = locale;
  return manager.getOverrideResourceManager(config);
}

function overrideWithColorMode(mode: resourceManager.ColorMode): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = mode;
  return manager.getOverrideResourceManager(config);
}

function overrideWithLocaleAndColorMode(locale: string,
  mode: resourceManager.ColorMode): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.locale = locale;
  config.colorMode = mode;
  return manager.getOverrideResourceManager(config);
}

function overrideWithDeviceType(deviceType: resourceManager.DeviceType): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.deviceType = deviceType;
  return manager.getOverrideResourceManager(config);
}

// one override manager per flavour is created and kept so the override budget of the runtime is never
// exhausted by the hundred lookups below
let enUsCache: resourceManager.ResourceManager | null = null;
let zhCnCache: resourceManager.ResourceManager | null = null;
let darkCache: resourceManager.ResourceManager | null = null;
let lightCache: resourceManager.ResourceManager | null = null;
let darkEnUsCache: resourceManager.ResourceManager | null = null;
let phoneCache: resourceManager.ResourceManager | null = null;

function enUsResources(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = enUsCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager = overrideWithLocale(EN_US_LOCALE);
  enUsCache = created;
  return created;
}

function zhCnResources(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = zhCnCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager = overrideWithLocale(ZH_CN_LOCALE);
  zhCnCache = created;
  return created;
}

function darkResources(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = darkCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager = overrideWithColorMode(resourceManager.ColorMode.DARK);
  darkCache = created;
  return created;
}

function lightResources(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = lightCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager = overrideWithColorMode(resourceManager.ColorMode.LIGHT);
  lightCache = created;
  return created;
}

function darkEnUsResources(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = darkEnUsCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithLocaleAndColorMode(EN_US_LOCALE, resourceManager.ColorMode.DARK);
  darkEnUsCache = created;
  return created;
}

function phoneResources(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = phoneCache;
  if (cached !== null) {
    return cached;
  }
  const created: resourceManager.ResourceManager =
    overrideWithDeviceType(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
  phoneCache = created;
  return created;
}

async function stringIds(): Promise<StringIds> {
  const info: bundleManager.BundleInfo = await selfBundle();
  const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
  const ability: bundleManager.AbilityInfo = entry.abilitiesInfo[0];
  return new StringIds(info.appInfo.labelId, entry.descriptionId, ability.descriptionId, ability.labelId);
}

async function promiseErrorCode(action: () => Promise<string>): Promise<number> {
  try {
    await action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return 0;
}

async function arrayErrorCode(action: () => Promise<string[]>): Promise<number> {
  try {
    await action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return 0;
}

function countAsciiUnits(text: string): number {
  let count: number = 0;
  for (let index = 0; index < text.length; index++) {
    if (text.charCodeAt(index) < 0x80) {
      count++;
    }
  }
  return count;
}

function countCjkUnits(text: string): number {
  let count: number = 0;
  for (let index = 0; index < text.length; index++) {
    const unit: number = text.charCodeAt(index);
    if (unit >= 0x4E00 && unit <= 0x9FFF) {
      count++;
    }
  }
  return count;
}

function countSpaces(text: string): number {
  let count: number = 0;
  for (let index = 0; index < text.length; index++) {
    if (text.charCodeAt(index) === 0x20) {
      count++;
    }
  }
  return count;
}

function hasControlUnit(text: string): boolean {
  for (let index = 0; index < text.length; index++) {
    const unit: number = text.charCodeAt(index);
    if (unit < 0x20 || unit === 0x7F) {
      return true;
    }
  }
  return false;
}

function isTrimmedText(text: string): boolean {
  return text.length > 0 && text.trim() === text;
}

function mismatchNames(manager: resourceManager.ResourceManager): string[] {
  const wrong: string[] = [];
  for (const spec of STRING_SPECS) {
    if (manager.getStringByNameSync(spec.name) !== spec.value) {
      wrong.push(spec.name);
    }
  }
  return wrong;
}

function readAll(manager: resourceManager.ResourceManager): string[] {
  return STRING_SPECS.map((spec: StringSpec) => manager.getStringByNameSync(spec.name));
}

export default function resourceStringMatrixTest() {
  describe('ResourceStringMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0100
     * @tc.name      testResStringNameRead0001
     * @tc.desc      Read app_name by name and check the value declared by AppScope string.json is returned unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResStringNameRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const spec: StringSpec = APP_NAME;
      const actual: string = resources().getStringByNameSync(spec.name);
      const expected: string = spec.value;
      logCase('testResStringNameRead0001', `name=${spec.name} origin=${spec.origin} actual=${actual} ` +
        `expected=${expected}`);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(spec.asciiUnits + spec.cjkUnits);
      expect(actual).assertEqual(ABILITY_LABEL.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0200
     * @tc.name      testResStringNameRead0002
     * @tc.desc      Read module_desc by name and check the phrase, its first word and its single space
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResStringNameRead0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const spec: StringSpec = MODULE_DESC;
      const actual: string = resources().getStringByNameSync(spec.name);
      const expected: string = spec.value;
      const firstWord: string = 'module';
      logCase('testResStringNameRead0002', `name=${spec.name} origin=${spec.origin} actual=${actual} ` +
        `expected=${expected}`);
      expect(actual).assertEqual(expected);
      expect(actual.startsWith(firstWord)).assertTrue();
      expect(countSpaces(actual)).assertEqual(spec.spaces);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0300
     * @tc.name      testResStringNameRead0003
     * @tc.desc      Read EntryAbility_desc by name and check that it is the second word of module_desc
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResStringNameRead0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const spec: StringSpec = ABILITY_DESC;
      const actual: string = resources().getStringByNameSync(spec.name);
      const expected: string = spec.value;
      const moduleText: string = MODULE_DESC.value;
      logCase('testResStringNameRead0003', `name=${spec.name} actual=${actual} expected=${expected} ` +
        `moduleText=${moduleText}`);
      expect(actual).assertEqual(expected);
      expect(moduleText.indexOf(actual) >= 0).assertTrue();
      expect(actual.length).assertEqual(ABILITY_DESC.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0400
     * @tc.name      testResStringNameRead0004
     * @tc.desc      Read EntryAbility_label by name and check the label text is the product name ending in GC
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResStringNameRead0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const spec: StringSpec = ABILITY_LABEL;
      const actual: string = resources().getStringByNameSync(spec.name);
      const expected: string = spec.value;
      const suffix: string = 'GC';
      logCase('testResStringNameRead0004', `name=${spec.name} actual=${actual} expected=${expected} ` +
        `suffix=${suffix}`);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual(APP_NAME.value);
      expect(actual.endsWith(suffix)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0500
     * @tc.name      testResStringNameRead0005
     * @tc.desc      Read index_title by name and check the ascii prefix and the four Chinese characters that follow
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResStringNameRead0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const spec: StringSpec = INDEX_TITLE;
      const actual: string = resources().getStringByNameSync(spec.name);
      const expected: string = INDEX_TITLE_PREFIX + cjkText(INDEX_TITLE_CJK);
      logCase('testResStringNameRead0005', `name=${spec.name} actual=${actual} expected=${expected} ` +
        `cjkUnits=${countCjkUnits(actual)}`);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual(spec.value);
      expect(actual.startsWith(INDEX_TITLE_PREFIX)).assertTrue();
      expect(countCjkUnits(actual)).assertEqual(INDEX_TITLE_CJK.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0600
     * @tc.name      testResStringNameRead0006
     * @tc.desc      Read hint_gc_page by name and check the call text, the space and the trailing Chinese example
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResStringNameRead0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const spec: StringSpec = HINT_GC_PAGE;
      const actual: string = resources().getStringByNameSync(spec.name);
      const expected: string = HINT_GC_PREFIX + cjkText(HINT_GC_CJK);
      const tail: string = cjkText(HINT_GC_CJK);
      const call: string = 'hintGC()';
      logCase('testResStringNameRead0006', `name=${spec.name} actual=${actual} expected=${expected} ` +
        `tail=${tail}`);
      expect(actual).assertEqual(expected);
      expect(actual.endsWith(tail)).assertTrue();
      expect(actual.length).assertEqual(HINT_GC_PREFIX.length + tail.length);
      expect(actual.indexOf(call) > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0700
     * @tc.name      testResStringIdRead0007
     * @tc.desc      Read the application label by the id published by the bundle info and check it is app_name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdRead0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byId: string = resources().getStringSync(ids.appLabel);
      logCase('testResStringIdRead0007', `id=${ids.appLabel} value=${byId} expected=${APP_NAME.value}`);
      expect(byId).assertEqual(APP_NAME.value);
      expect(ids.appLabel > 0).assertTrue();
      expect(byId.length).assertEqual(APP_NAME.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0800
     * @tc.name      testResStringIdRead0008
     * @tc.desc      Read the entry module description by id and check length and space count
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdRead0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byId: string = resources().getStringSync(ids.moduleDesc);
      logCase('testResStringIdRead0008', `id=${ids.moduleDesc} value=${byId} length=${byId.length}`);
      expect(byId).assertEqual(MODULE_DESC.value);
      expect(byId.length).assertEqual(MODULE_DESC.asciiUnits);
      expect(countSpaces(byId)).assertEqual(MODULE_DESC.spaces);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_0900
     * @tc.name      testResStringIdRead0009
     * @tc.desc      Read the ability description by id and compare it with the same lookup by name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdRead0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byId: string = resources().getStringSync(ids.abilityDesc);
      const byName: string = resources().getStringByNameSync(ABILITY_DESC.name);
      logCase('testResStringIdRead0009', `id=${ids.abilityDesc} byId=${byId} byName=${byName}`);
      expect(byId).assertEqual(ABILITY_DESC.value);
      expect(byId).assertEqual(byName);
      expect(isTrimmedText(byId)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1000
     * @tc.name      testResStringIdRead0010
     * @tc.desc      Read the ability label and the application label by their ids and check both name the product
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdRead0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const ability: string = resources().getStringSync(ids.abilityLabel);
      const application: string = resources().getStringSync(ids.appLabel);
      logCase('testResStringIdRead0010', `abilityLabelId=${ids.abilityLabel} appLabelId=${ids.appLabel} ` +
        `ability=${ability} application=${application}`);
      expect(ability).assertEqual(ABILITY_LABEL.value);
      expect(ability).assertEqual(application);
      expect(ability.length).assertEqual(application.length);
      expect(countCjkUnits(ability)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1100
     * @tc.name      testResStringIdNameParity0011
     * @tc.desc      Compare the app_name lookup by name with the lookup by the application label id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdNameParity0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byName: string = resources().getStringByNameSync(APP_NAME.name);
      const byId: string = resources().getStringSync(ids.appLabel);
      logCase('testResStringIdNameParity0011', `name=${APP_NAME.name} id=${ids.appLabel} byName=${byName} ` +
        `byId=${byId}`);
      expect(byId).assertEqual(byName);
      expect(byId).assertEqual(APP_NAME.value);
      expect(byName.length).assertEqual(APP_NAME.value.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1200
     * @tc.name      testResStringIdNameParity0012
     * @tc.desc      Compare the module_desc lookup by name with the lookup by the module description id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdNameParity0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byName: string = resources().getStringByNameSync(MODULE_DESC.name);
      const byId: string = resources().getStringSync(ids.moduleDesc);
      logCase('testResStringIdNameParity0012', `name=${MODULE_DESC.name} id=${ids.moduleDesc} ` +
        `byName=${byName} byId=${byId}`);
      expect(byId).assertEqual(byName);
      expect(countAsciiUnits(byId)).assertEqual(countAsciiUnits(byName));
      expect(byId.length).assertEqual(MODULE_DESC.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1300
     * @tc.name      testResStringIdNameParity0013
     * @tc.desc      Compare the EntryAbility_desc lookup by name with the lookup by the ability description id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdNameParity0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byName: string = resources().getStringByNameSync(ABILITY_DESC.name);
      const byId: string = resources().getStringSync(ids.abilityDesc);
      logCase('testResStringIdNameParity0013', `name=${ABILITY_DESC.name} id=${ids.abilityDesc} ` +
        `byName=${byName} byId=${byId}`);
      expect(byId).assertEqual(byName);
      expect(hasControlUnit(byId)).assertFalse();
      expect(byId).assertEqual(ABILITY_DESC.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1400
     * @tc.name      testResStringIdNameParity0014
     * @tc.desc      Compare the EntryAbility_label lookup by name with the lookup by the ability label id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringIdNameParity0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const byName: string = resources().getStringByNameSync(ABILITY_LABEL.name);
      const byId: string = resources().getStringSync(ids.abilityLabel);
      logCase('testResStringIdNameParity0014', `name=${ABILITY_LABEL.name} id=${ids.abilityLabel} ` +
        `byName=${byName} byId=${byId}`);
      expect(byId).assertEqual(byName);
      expect(byName).assertEqual(APP_NAME.value);
      expect(countSpaces(byId)).assertEqual(ABILITY_LABEL.spaces);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1500
     * @tc.name      testResStringValueApi0015
     * @tc.desc      Compare getStringSync with getStringValue for the application label id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringValueApi0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const sync: string = resources().getStringSync(ids.appLabel);
      const value: string = await resources().getStringValue(ids.appLabel);
      logCase('testResStringValueApi0015', `id=${ids.appLabel} sync=${sync} value=${value}`);
      expect(value).assertEqual(sync);
      expect(value).assertEqual(APP_NAME.value);
      expect(value.length).assertEqual(sync.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1600
     * @tc.name      testResStringValueApi0016
     * @tc.desc      Compare getStringSync with getStringValue for the module description id and check the space count
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringValueApi0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const sync: string = resources().getStringSync(ids.moduleDesc);
      const value: string = await resources().getStringValue(ids.moduleDesc);
      logCase('testResStringValueApi0016', `id=${ids.moduleDesc} sync=${sync} value=${value} ` +
        `spaces=${countSpaces(value)}`);
      expect(value).assertEqual(sync);
      expect(value).assertEqual(MODULE_DESC.value);
      expect(countSpaces(value)).assertEqual(countSpaces(sync));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1700
     * @tc.name      testResStringValueApi0017
     * @tc.desc      Compare getStringSync with getStringValue for the ability description id and check trimming
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringValueApi0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const sync: string = resources().getStringSync(ids.abilityDesc);
      const value: string = await resources().getStringValue(ids.abilityDesc);
      logCase('testResStringValueApi0017', `id=${ids.abilityDesc} sync=${sync} value=${value}`);
      expect(value).assertEqual(sync);
      expect(isTrimmedText(sync)).assertTrue();
      expect(isTrimmedText(value)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1800
     * @tc.name      testResStringValueApi0018
     * @tc.desc      Compare getStringSync with getStringValue for the ability label id and check the character split
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringValueApi0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const sync: string = resources().getStringSync(ids.abilityLabel);
      const value: string = await resources().getStringValue(ids.abilityLabel);
      logCase('testResStringValueApi0018', `id=${ids.abilityLabel} sync=${sync} value=${value} ` +
        `ascii=${countAsciiUnits(value)} cjk=${countCjkUnits(value)}`);
      expect(value).assertEqual(sync);
      expect(value).assertEqual(APP_NAME.value);
      expect(countCjkUnits(value)).assertEqual(0);
      expect(countAsciiUnits(value)).assertEqual(ABILITY_LABEL.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_1900
     * @tc.name      testResStringAsyncName0019
     * @tc.desc      Read app_name and EntryAbility_label with the promise api and compare both with the sync reads
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringAsyncName0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncApp: string = await resources().getStringByName(APP_NAME.name);
      const asyncLabel: string = await resources().getStringByName(ABILITY_LABEL.name);
      const syncApp: string = resources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringAsyncName0019', `app=${asyncApp} label=${asyncLabel} syncApp=${syncApp}`);
      expect(asyncApp).assertEqual(APP_NAME.value);
      expect(asyncLabel).assertEqual(ABILITY_LABEL.value);
      expect(asyncApp).assertEqual(syncApp);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2000
     * @tc.name      testResStringAsyncName0020
     * @tc.desc      Read module_desc and EntryAbility_desc with the promise api and check the contained phrase
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringAsyncName0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncModule: string = await resources().getStringByName(MODULE_DESC.name);
      const asyncAbility: string = await resources().getStringByName(ABILITY_DESC.name);
      logCase('testResStringAsyncName0020', `module=${asyncModule} ability=${asyncAbility} ` +
        `position=${asyncModule.indexOf(asyncAbility)}`);
      expect(asyncModule).assertEqual(MODULE_DESC.value);
      expect(asyncAbility).assertEqual(ABILITY_DESC.value);
      expect(asyncModule.indexOf(asyncAbility) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2100
     * @tc.name      testResStringAsyncName0021
     * @tc.desc      Read index_title and hint_gc_page with the promise api and check the Chinese character counts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringAsyncName0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncTitle: string = await resources().getStringByName(INDEX_TITLE.name);
      const asyncHint: string = await resources().getStringByName(HINT_GC_PAGE.name);
      logCase('testResStringAsyncName0021', `title=${asyncTitle} hint=${asyncHint} ` +
        `titleCjk=${countCjkUnits(asyncTitle)} hintCjk=${countCjkUnits(asyncHint)}`);
      expect(asyncTitle).assertEqual(INDEX_TITLE.value);
      expect(asyncHint).assertEqual(HINT_GC_PAGE.value);
      expect(countCjkUnits(asyncTitle)).assertEqual(INDEX_TITLE.cjkUnits);
      expect(countCjkUnits(asyncHint)).assertEqual(HINT_GC_PAGE.cjkUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2200
     * @tc.name      testResStringAsyncId0022
     * @tc.desc      Read the application label with the promise getString api and compare it with the sync read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringAsyncId0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const asyncValue: string = await resources().getString(ids.appLabel);
      const syncValue: string = resources().getStringSync(ids.appLabel);
      logCase('testResStringAsyncId0022', `id=${ids.appLabel} asyncValue=${asyncValue} syncValue=${syncValue}`);
      expect(asyncValue).assertEqual(syncValue);
      expect(asyncValue).assertEqual(APP_NAME.value);
      expect(asyncValue.length).assertEqual(APP_NAME.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2300
     * @tc.name      testResStringAsyncId0023
     * @tc.desc      Read both description resources with the promise getString api and compare them with string.json
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringAsyncId0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const asyncModule: string = await resources().getString(ids.moduleDesc);
      const asyncAbility: string = await resources().getString(ids.abilityDesc);
      logCase('testResStringAsyncId0023', `moduleId=${ids.moduleDesc} abilityId=${ids.abilityDesc} ` +
        `module=${asyncModule} ability=${asyncAbility}`);
      expect(asyncModule).assertEqual(MODULE_DESC.value);
      expect(asyncAbility).assertEqual(ABILITY_DESC.value);
      expect(asyncModule.length > asyncAbility.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2400
     * @tc.name      testResStringAsyncId0024
     * @tc.desc      Read the ability label with getString and the app label with getStringValue and compare them
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringAsyncId0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ids: StringIds = await stringIds();
      const asyncAbility: string = await resources().getString(ids.abilityLabel);
      const asyncApplication: string = await resources().getStringValue(ids.appLabel);
      logCase('testResStringAsyncId0024', `abilityLabelId=${ids.abilityLabel} appLabelId=${ids.appLabel} ` +
        `ability=${asyncAbility} application=${asyncApplication}`);
      expect(asyncAbility).assertEqual(APP_NAME.value);
      expect(asyncApplication).assertEqual(APP_NAME.value);
      expect(asyncAbility).assertEqual(asyncApplication);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2500
     * @tc.name      testResStringLength0025
     * @tc.desc      Check the length, space count and trimming of app_name against the numbers implied by string.json
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLength0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const spec: StringSpec = APP_NAME;
      const actual: string = resources().getStringByNameSync(spec.name);
      const declaredLength: number = spec.asciiUnits + spec.cjkUnits;
      logCase('testResStringLength0025', `name=${spec.name} length=${actual.length} declared=${declaredLength} ` +
        `spaces=${countSpaces(actual)}`);
      expect(actual.length).assertEqual(declaredLength);
      expect(countSpaces(actual)).assertEqual(spec.spaces);
      expect(isTrimmedText(actual)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2600
     * @tc.name      testResStringLength0026
     * @tc.desc      Check the length, space count and control units of module_desc against string.json
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLength0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const spec: StringSpec = MODULE_DESC;
      const actual: string = resources().getStringByNameSync(spec.name);
      const declaredLength: number = spec.asciiUnits + spec.cjkUnits;
      logCase('testResStringLength0026', `name=${spec.name} length=${actual.length} declared=${declaredLength} ` +
        `control=${hasControlUnit(actual)}`);
      expect(actual.length).assertEqual(declaredLength);
      expect(hasControlUnit(actual)).assertFalse();
      expect(isTrimmedText(actual)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2700
     * @tc.name      testResStringLength0027
     * @tc.desc      Check the length and trimming of EntryAbility_desc and compare the trimmed text with itself
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLength0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const spec: StringSpec = ABILITY_DESC;
      const actual: string = resources().getStringByNameSync(spec.name);
      const trimmed: string = actual.trim();
      logCase('testResStringLength0027', `name=${spec.name} length=${actual.length} trimmedLength=${trimmed.length}`);
      expect(actual.length).assertEqual(spec.asciiUnits);
      expect(trimmed).assertEqual(actual);
      expect(countSpaces(actual)).assertEqual(spec.spaces);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2800
     * @tc.name      testResStringLength0028
     * @tc.desc      Check the length of EntryAbility_label and confirm the label has no padding characters
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLength0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const spec: StringSpec = ABILITY_LABEL;
      const actual: string = resources().getStringByNameSync(spec.name);
      const trimmed: string = actual.trim();
      logCase('testResStringLength0028', `name=${spec.name} length=${actual.length} trimmedLength=${trimmed.length} ` +
        `spaces=${countSpaces(actual)}`);
      expect(actual.length).assertEqual(spec.asciiUnits);
      expect(trimmed.length).assertEqual(actual.length);
      expect(countSpaces(actual)).assertEqual(0);
      expect(hasControlUnit(actual)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_2900
     * @tc.name      testResStringLength0029
     * @tc.desc      Check that index_title is eight ascii units plus four Chinese units with a single space between
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLength0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const spec: StringSpec = INDEX_TITLE;
      const actual: string = resources().getStringByNameSync(spec.name);
      const declaredLength: number = spec.asciiUnits + spec.cjkUnits;
      logCase('testResStringLength0029', `name=${spec.name} length=${actual.length} declared=${declaredLength} ` +
        `cjk=${countCjkUnits(actual)}`);
      expect(actual.length).assertEqual(declaredLength);
      expect(countCjkUnits(actual)).assertEqual(spec.cjkUnits);
      expect(countSpaces(actual)).assertEqual(spec.spaces);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3000
     * @tc.name      testResStringLength0030
     * @tc.desc      Check that hint_gc_page is the eighteen unit call text plus a space and four Chinese units
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLength0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const spec: StringSpec = HINT_GC_PAGE;
      const actual: string = resources().getStringByNameSync(spec.name);
      const declaredLength: number = spec.asciiUnits + spec.cjkUnits;
      logCase('testResStringLength0030', `name=${spec.name} length=${actual.length} declared=${declaredLength} ` +
        `prefixLength=${HINT_GC_PREFIX.length}`);
      expect(actual.length).assertEqual(declaredLength);
      expect(actual.length - HINT_GC_PREFIX.length).assertEqual(HINT_GC_CJK.length);
      expect(hasControlUnit(actual)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3100
     * @tc.name      testResStringCharset0031
     * @tc.desc      Split app_name into ascii and Chinese units and check the split adds up to the full length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCharset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(APP_NAME.name);
      const ascii: number = countAsciiUnits(actual);
      const cjk: number = countCjkUnits(actual);
      logCase('testResStringCharset0031', `name=${APP_NAME.name} ascii=${ascii} cjk=${cjk} total=${actual.length}`);
      expect(ascii).assertEqual(APP_NAME.asciiUnits);
      expect(cjk).assertEqual(APP_NAME.cjkUnits);
      expect(ascii + cjk).assertEqual(actual.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3200
     * @tc.name      testResStringCharset0032
     * @tc.desc      Split module_desc into ascii and Chinese units and check the phrase is pure ascii
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCharset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(MODULE_DESC.name);
      const ascii: number = countAsciiUnits(actual);
      const cjk: number = countCjkUnits(actual);
      logCase('testResStringCharset0032', `name=${MODULE_DESC.name} ascii=${ascii} cjk=${cjk} total=${actual.length}`);
      expect(ascii).assertEqual(MODULE_DESC.asciiUnits);
      expect(cjk).assertEqual(0);
      expect(ascii + cjk).assertEqual(actual.length);
      expect(hasControlUnit(actual)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3300
     * @tc.name      testResStringCharset0033
     * @tc.desc      Split EntryAbility_desc into ascii and Chinese units and check no unit leaves the ascii range
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCharset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(ABILITY_DESC.name);
      const ascii: number = countAsciiUnits(actual);
      const cjk: number = countCjkUnits(actual);
      logCase('testResStringCharset0033', `name=${ABILITY_DESC.name} ascii=${ascii} cjk=${cjk} ` +
        `total=${actual.length}`);
      expect(ascii).assertEqual(ABILITY_DESC.asciiUnits);
      expect(cjk).assertEqual(ABILITY_DESC.cjkUnits);
      expect(ascii).assertEqual(actual.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3400
     * @tc.name      testResStringCharset0034
     * @tc.desc      Split EntryAbility_label into ascii and Chinese units and check all seven units are ascii
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCharset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(ABILITY_LABEL.name);
      const ascii: number = countAsciiUnits(actual);
      const cjk: number = countCjkUnits(actual);
      logCase('testResStringCharset0034', `name=${ABILITY_LABEL.name} ascii=${ascii} cjk=${cjk} ` +
        `total=${actual.length}`);
      expect(ascii).assertEqual(ABILITY_LABEL.asciiUnits);
      expect(cjk).assertEqual(0);
      expect(ascii + cjk).assertEqual(ABILITY_LABEL.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3500
     * @tc.name      testResStringCharset0035
     * @tc.desc      Split index_title into ascii and Chinese units and check eight ascii and four Chinese units
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCharset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(INDEX_TITLE.name);
      const ascii: number = countAsciiUnits(actual);
      const cjk: number = countCjkUnits(actual);
      logCase('testResStringCharset0035', `name=${INDEX_TITLE.name} ascii=${ascii} cjk=${cjk} ` +
        `total=${actual.length}`);
      expect(ascii).assertEqual(INDEX_TITLE.asciiUnits);
      expect(cjk).assertEqual(INDEX_TITLE.cjkUnits);
      expect(ascii + cjk).assertEqual(actual.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3600
     * @tc.name      testResStringCharset0036
     * @tc.desc      Split hint_gc_page into ascii and Chinese units and check the trailing Chinese example block
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCharset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(HINT_GC_PAGE.name);
      const ascii: number = countAsciiUnits(actual);
      const cjk: number = countCjkUnits(actual);
      const tail: string = actual.substring(HINT_GC_PREFIX.length);
      logCase('testResStringCharset0036', `name=${HINT_GC_PAGE.name} ascii=${ascii} cjk=${cjk} tail=${tail}`);
      expect(ascii).assertEqual(HINT_GC_PAGE.asciiUnits);
      expect(cjk).assertEqual(HINT_GC_PAGE.cjkUnits);
      expect(tail).assertEqual(cjkText(HINT_GC_CJK));
      expect(ascii + cjk).assertEqual(actual.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3700
     * @tc.name      testResStringRepeat0037
     * @tc.desc      Read app_name five times and check every reading is the same single value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringRepeat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const readings: string[] = [];
      for (let round = 0; round < REPEAT_ROUNDS; round++) {
        readings.push(resources().getStringByNameSync(APP_NAME.name));
      }
      const distinct: number = new Set<string>(readings).size;
      logCase('testResStringRepeat0037', `rounds=${readings.length} distinct=${distinct} first=${readings[0]}`);
      expect(readings.length).assertEqual(REPEAT_ROUNDS);
      expect(distinct).assertEqual(1);
      expect(readings[readings.length - 1]).assertEqual(APP_NAME.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3800
     * @tc.name      testResStringRepeat0038
     * @tc.desc      Read module_desc five times and check the space count stays stable on every reading
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringRepeat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const readings: string[] = [];
      for (let round = 0; round < REPEAT_ROUNDS; round++) {
        readings.push(resources().getStringByNameSync(MODULE_DESC.name));
      }
      const spaceCounts: number[] = readings.map((text: string) => countSpaces(text));
      logCase('testResStringRepeat0038', `rounds=${readings.length} spaces=${spaceCounts.join(',')} ` +
        `last=${readings[readings.length - 1]}`);
      expect(new Set<string>(readings).size).assertEqual(1);
      expect(spaceCounts.every((value: number) => value === MODULE_DESC.spaces)).assertTrue();
      expect(readings[0]).assertEqual(MODULE_DESC.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_3900
     * @tc.name      testResStringRepeat0039
     * @tc.desc      Read EntryAbility_desc five times and check the length never drifts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringRepeat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const readings: string[] = [];
      for (let round = 0; round < REPEAT_ROUNDS; round++) {
        readings.push(resources().getStringByNameSync(ABILITY_DESC.name));
      }
      const lengths: number[] = readings.map((text: string) => text.length);
      logCase('testResStringRepeat0039', `rounds=${readings.length} lengths=${lengths.join(',')}`);
      expect(new Set<string>(readings).size).assertEqual(1);
      expect(lengths.every((value: number) => value === ABILITY_DESC.asciiUnits)).assertTrue();
      expect(readings[readings.length - 1]).assertEqual(ABILITY_DESC.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4000
     * @tc.name      testResStringRepeat0040
     * @tc.desc      Read EntryAbility_label five times and check it always equals app_name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringRepeat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const readings: string[] = [];
      for (let round = 0; round < REPEAT_ROUNDS; round++) {
        readings.push(resources().getStringByNameSync(ABILITY_LABEL.name));
      }
      const appName: string = resources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringRepeat0040', `rounds=${readings.length} appName=${appName} ` +
        `last=${readings[readings.length - 1]}`);
      expect(new Set<string>(readings).size).assertEqual(1);
      expect(readings.every((text: string) => text === appName)).assertTrue();
      expect(readings[readings.length - 1]).assertEqual(ABILITY_LABEL.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4100
     * @tc.name      testResStringRepeat0041
     * @tc.desc      Read index_title five times and check the Chinese unit count never drifts
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringRepeat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const readings: string[] = [];
      for (let round = 0; round < REPEAT_ROUNDS; round++) {
        readings.push(resources().getStringByNameSync(INDEX_TITLE.name));
      }
      const cjkCounts: number[] = readings.map((text: string) => countCjkUnits(text));
      logCase('testResStringRepeat0041', `rounds=${readings.length} cjk=${cjkCounts.join(',')}`);
      expect(new Set<string>(readings).size).assertEqual(1);
      expect(cjkCounts.every((value: number) => value === INDEX_TITLE.cjkUnits)).assertTrue();
      expect(readings[0]).assertEqual(INDEX_TITLE.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4200
     * @tc.name      testResStringRepeat0042
     * @tc.desc      Read hint_gc_page five times and check the trailing Chinese tail is repeated identically
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringRepeat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const readings: string[] = [];
      for (let round = 0; round < REPEAT_ROUNDS; round++) {
        readings.push(resources().getStringByNameSync(HINT_GC_PAGE.name));
      }
      const tails: string[] = readings.map((text: string) => text.substring(HINT_GC_PREFIX.length));
      logCase('testResStringRepeat0042', `rounds=${readings.length} tails=${tails.join(',')}`);
      expect(new Set<string>(readings).size).assertEqual(1);
      expect(new Set<string>(tails).size).assertEqual(1);
      expect(tails[0]).assertEqual(cjkText(HINT_GC_CJK));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4300
     * @tc.name      testResStringEnUs0043
     * @tc.desc      Read app_name through an en_US override manager and check the base value is used as fallback
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringEnUs0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(APP_NAME.name);
      const english: string = enUsResources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringEnUs0043', `name=${APP_NAME.name} locale=${EN_US_LOCALE} base=${base} ` +
        `english=${english}`);
      expect(english).assertEqual(base);
      expect(english).assertEqual(APP_NAME.value);
      expect(english.length).assertEqual(base.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4400
     * @tc.name      testResStringEnUs0044
     * @tc.desc      Read module_desc through an en_US override manager and check the base value is used as fallback
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringEnUs0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(MODULE_DESC.name);
      const english: string = enUsResources().getStringByNameSync(MODULE_DESC.name);
      logCase('testResStringEnUs0044', `name=${MODULE_DESC.name} locale=${EN_US_LOCALE} base=${base} ` +
        `english=${english}`);
      expect(english).assertEqual(base);
      expect(countSpaces(english)).assertEqual(MODULE_DESC.spaces);
      expect(hasControlUnit(english)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4500
     * @tc.name      testResStringEnUs0045
     * @tc.desc      Read EntryAbility_desc through an en_US override manager and check the ascii split is unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringEnUs0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(ABILITY_DESC.name);
      const english: string = enUsResources().getStringByNameSync(ABILITY_DESC.name);
      logCase('testResStringEnUs0045', `name=${ABILITY_DESC.name} locale=${EN_US_LOCALE} base=${base} ` +
        `english=${english}`);
      expect(english).assertEqual(base);
      expect(countAsciiUnits(english)).assertEqual(ABILITY_DESC.asciiUnits);
      expect(english.length).assertEqual(ABILITY_DESC.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4600
     * @tc.name      testResStringEnUs0046
     * @tc.desc      Read EntryAbility_label through an en_US override manager and check it still equals app_name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringEnUs0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(ABILITY_LABEL.name);
      const english: string = enUsResources().getStringByNameSync(ABILITY_LABEL.name);
      const englishApp: string = enUsResources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringEnUs0046', `name=${ABILITY_LABEL.name} locale=${EN_US_LOCALE} base=${base} ` +
        `english=${english} englishApp=${englishApp}`);
      expect(english).assertEqual(base);
      expect(english).assertEqual(englishApp);
      expect(countSpaces(english)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4700
     * @tc.name      testResStringEnUs0047
     * @tc.desc      Read index_title through an en_US override manager and check the four Chinese units survive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringEnUs0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(INDEX_TITLE.name);
      const english: string = enUsResources().getStringByNameSync(INDEX_TITLE.name);
      logCase('testResStringEnUs0047', `name=${INDEX_TITLE.name} locale=${EN_US_LOCALE} base=${base} ` +
        `english=${english} cjk=${countCjkUnits(english)}`);
      expect(english).assertEqual(base);
      expect(countCjkUnits(english)).assertEqual(INDEX_TITLE.cjkUnits);
      expect(english.startsWith(INDEX_TITLE_PREFIX)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4800
     * @tc.name      testResStringEnUs0048
     * @tc.desc      Read hint_gc_page through an en_US override manager and check the call text and tail survive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringEnUs0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const english: string = await enUsResources().getStringByName(HINT_GC_PAGE.name);
      const base: string = resources().getStringByNameSync(HINT_GC_PAGE.name);
      logCase('testResStringEnUs0048', `name=${HINT_GC_PAGE.name} locale=${EN_US_LOCALE} base=${base} ` +
        `english=${english}`);
      expect(english).assertEqual(base);
      expect(english.startsWith(HINT_GC_PREFIX)).assertTrue();
      expect(english.length).assertEqual(HINT_GC_PAGE.asciiUnits + HINT_GC_PAGE.cjkUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_4900
     * @tc.name      testResStringZhCn0049
     * @tc.desc      Read app_name through a zh_CN override manager and check the base value is used as fallback
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringZhCn0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(APP_NAME.name);
      const chinese: string = zhCnResources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringZhCn0049', `name=${APP_NAME.name} locale=${ZH_CN_LOCALE} base=${base} ` +
        `chinese=${chinese}`);
      expect(chinese).assertEqual(base);
      expect(chinese).assertEqual(APP_NAME.value);
      expect(chinese.length).assertEqual(APP_NAME.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5000
     * @tc.name      testResStringZhCn0050
     * @tc.desc      Read module_desc through a zh_CN override manager and check the phrase is not translated
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringZhCn0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(MODULE_DESC.name);
      const chinese: string = zhCnResources().getStringByNameSync(MODULE_DESC.name);
      logCase('testResStringZhCn0050', `name=${MODULE_DESC.name} locale=${ZH_CN_LOCALE} base=${base} ` +
        `chinese=${chinese}`);
      expect(chinese).assertEqual(base);
      expect(chinese).assertEqual(MODULE_DESC.value);
      expect(countCjkUnits(chinese)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5100
     * @tc.name      testResStringZhCn0051
     * @tc.desc      Read EntryAbility_desc through a zh_CN override manager and check the length is unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringZhCn0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(ABILITY_DESC.name);
      const chinese: string = zhCnResources().getStringByNameSync(ABILITY_DESC.name);
      logCase('testResStringZhCn0051', `name=${ABILITY_DESC.name} locale=${ZH_CN_LOCALE} base=${base} ` +
        `chinese=${chinese}`);
      expect(chinese).assertEqual(base);
      expect(chinese.length).assertEqual(base.length);
      expect(isTrimmedText(chinese)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5200
     * @tc.name      testResStringZhCn0052
     * @tc.desc      Read EntryAbility_label through a zh_CN override manager and check it matches app_name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringZhCn0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(ABILITY_LABEL.name);
      const chinese: string = zhCnResources().getStringByNameSync(ABILITY_LABEL.name);
      const chineseApp: string = zhCnResources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringZhCn0052', `name=${ABILITY_LABEL.name} locale=${ZH_CN_LOCALE} base=${base} ` +
        `chinese=${chinese} chineseApp=${chineseApp}`);
      expect(chinese).assertEqual(base);
      expect(chinese).assertEqual(chineseApp);
      expect(chinese.length).assertEqual(APP_NAME.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5300
     * @tc.name      testResStringZhCn0053
     * @tc.desc      Read index_title through a zh_CN override manager and check the Chinese block is untouched
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringZhCn0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const chinese: string = await zhCnResources().getStringByName(INDEX_TITLE.name);
      const base: string = resources().getStringByNameSync(INDEX_TITLE.name);
      logCase('testResStringZhCn0053', `name=${INDEX_TITLE.name} locale=${ZH_CN_LOCALE} base=${base} ` +
        `chinese=${chinese}`);
      expect(chinese).assertEqual(base);
      expect(chinese).assertEqual(INDEX_TITLE.value);
      expect(countCjkUnits(chinese)).assertEqual(INDEX_TITLE.cjkUnits);
      expect(chinese.endsWith(cjkText(INDEX_TITLE_CJK))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5400
     * @tc.name      testResStringZhCn0054
     * @tc.desc      Read hint_gc_page through a zh_CN override manager and check the call text is unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringZhCn0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(HINT_GC_PAGE.name);
      const chinese: string = zhCnResources().getStringByNameSync(HINT_GC_PAGE.name);
      logCase('testResStringZhCn0054', `name=${HINT_GC_PAGE.name} locale=${ZH_CN_LOCALE} base=${base} ` +
        `chinese=${chinese}`);
      expect(chinese).assertEqual(base);
      expect(chinese.startsWith(HINT_GC_PREFIX)).assertTrue();
      expect(chinese.length).assertEqual(base.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5500
     * @tc.name      testResStringLocaleParity0055
     * @tc.desc      Compare base, en_US and zh_CN managers for app_name and check all three agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLocaleParity0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(APP_NAME.name);
      const english: string = enUsResources().getStringByNameSync(APP_NAME.name);
      const chinese: string = zhCnResources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringLocaleParity0055', `name=${APP_NAME.name} base=${base} en=${english} zh=${chinese}`);
      expect(english).assertEqual(chinese);
      expect(chinese).assertEqual(base);
      expect(countCjkUnits(english)).assertEqual(APP_NAME.cjkUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5600
     * @tc.name      testResStringLocaleParity0056
     * @tc.desc      Compare base, en_US and zh_CN managers for module_desc and check all three agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLocaleParity0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(MODULE_DESC.name);
      const english: string = enUsResources().getStringByNameSync(MODULE_DESC.name);
      const chinese: string = zhCnResources().getStringByNameSync(MODULE_DESC.name);
      logCase('testResStringLocaleParity0056', `name=${MODULE_DESC.name} base=${base} en=${english} zh=${chinese}`);
      expect(english).assertEqual(chinese);
      expect(chinese).assertEqual(base);
      expect(countSpaces(english)).assertEqual(MODULE_DESC.spaces);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5700
     * @tc.name      testResStringLocaleParity0057
     * @tc.desc      Compare base, en_US and zh_CN managers for index_title and check the Chinese units agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLocaleParity0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(INDEX_TITLE.name);
      const english: string = enUsResources().getStringByNameSync(INDEX_TITLE.name);
      const chinese: string = zhCnResources().getStringByNameSync(INDEX_TITLE.name);
      logCase('testResStringLocaleParity0057', `name=${INDEX_TITLE.name} base=${base} en=${english} zh=${chinese}`);
      expect(english).assertEqual(chinese);
      expect(chinese).assertEqual(base);
      expect(countCjkUnits(english)).assertEqual(INDEX_TITLE.cjkUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5800
     * @tc.name      testResStringLocaleParity0058
     * @tc.desc      Compare base, en_US and zh_CN managers for hint_gc_page and check all three agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringLocaleParity0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base: string = resources().getStringByNameSync(HINT_GC_PAGE.name);
      const english: string = enUsResources().getStringByNameSync(HINT_GC_PAGE.name);
      const chinese: string = zhCnResources().getStringByNameSync(HINT_GC_PAGE.name);
      logCase('testResStringLocaleParity0058', `name=${HINT_GC_PAGE.name} base=${base} en=${english} zh=${chinese}`);
      expect(english).assertEqual(chinese);
      expect(chinese).assertEqual(base);
      expect(countAsciiUnits(chinese)).assertEqual(HINT_GC_PAGE.asciiUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_5900
     * @tc.name      testResStringContains0059
     * @tc.desc      Check the prefix, the suffix and the start position of app_name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringContains0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(APP_NAME.name);
      const head: string = 'ArkTS';
      const tail: string = 'GC';
      const start: number = actual.indexOf(head);
      logCase('testResStringContains0059', `actual=${actual} head=${head} tail=${tail} start=${start}`);
      expect(actual.startsWith(head)).assertTrue();
      expect(actual.endsWith(tail)).assertTrue();
      expect(start).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6000
     * @tc.name      testResStringContains0060
     * @tc.desc      Check module_desc holds the word description and is exactly two tokens split by one space
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringContains0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(MODULE_DESC.name);
      const word: string = 'description';
      const tokens: string[] = actual.split(' ');
      const position: number = actual.indexOf(word);
      logCase('testResStringContains0060', `actual=${actual} position=${position} tokens=${tokens.length}`);
      expect(position > 0).assertTrue();
      expect(tokens.length).assertEqual(MODULE_DESC.spaces + 1);
      expect(tokens[tokens.length - 1]).assertEqual(word);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6100
     * @tc.name      testResStringContains0061
     * @tc.desc      Check EntryAbility_desc sits inside module_desc at the position the space count implies
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringContains0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(ABILITY_DESC.name);
      const moduleText: string = resources().getStringByNameSync(MODULE_DESC.name);
      const position: number = moduleText.indexOf(actual);
      const expectedPosition: number = 7;
      const stem: string = 'script';
      logCase('testResStringContains0061', `actual=${actual} moduleText=${moduleText} position=${position} ` +
        `stemPosition=${actual.indexOf(stem)}`);
      expect(position).assertEqual(expectedPosition);
      expect(moduleText.length - actual.length).assertEqual(expectedPosition);
      expect(actual.indexOf(stem) > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6200
     * @tc.name      testResStringContains0062
     * @tc.desc      Check EntryAbility_label starts with the product short name and equals the whole text
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringContains0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(ABILITY_LABEL.name);
      const head: string = 'ArkT';
      const last: string = 'GC';
      const whole: string = actual;
      logCase('testResStringContains0062', `actual=${actual} head=${head} wholeLength=${whole.length} ` +
        `last=${actual.lastIndexOf(last)}`);
      expect(actual.startsWith(head)).assertTrue();
      expect(actual.indexOf(whole)).assertEqual(0);
      expect(actual.lastIndexOf(last)).assertEqual(ABILITY_LABEL.asciiUnits - last.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6300
     * @tc.name      testResStringContains0063
     * @tc.desc      Check index_title begins with the ascii title and ends with the four Chinese characters
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringContains0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(INDEX_TITLE.name);
      const tail: string = cjkText(INDEX_TITLE_CJK);
      const marker: string = 'GC';
      const gcPosition: number = 6;
      logCase('testResStringContains0063', `actual=${actual} tail=${tail} marker=${actual.indexOf(marker)}`);
      expect(actual.startsWith(INDEX_TITLE_PREFIX)).assertTrue();
      expect(actual.endsWith(tail)).assertTrue();
      expect(actual.indexOf(marker)).assertEqual(gcPosition);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6400
     * @tc.name      testResStringContains0064
     * @tc.desc      Check hint_gc_page holds the hintGC call, the bracket pair and the Chinese example tail
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringContains0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const actual: string = resources().getStringByNameSync(HINT_GC_PAGE.name);
      const call: string = 'hintGC';
      const brackets: string = '()';
      const tail: string = cjkText(HINT_GC_CJK);
      const tools: string = 'ArkTools';
      logCase('testResStringContains0064', `actual=${actual} callPosition=${actual.indexOf(call)} ` +
        `bracketPosition=${actual.indexOf(brackets)}`);
      expect(actual.startsWith(tools)).assertTrue();
      expect(actual.indexOf(call) > 0).assertTrue();
      expect(actual.indexOf(brackets) > actual.indexOf(call)).assertTrue();
      expect(actual.endsWith(tail)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6500
     * @tc.name      testResStringCrossLink0065
     * @tc.desc      Check app_name and EntryAbility_label carry the same text although they come from different folders
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCrossLink0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const app: string = resources().getStringByNameSync(APP_NAME.name);
      const label: string = resources().getStringByNameSync(ABILITY_LABEL.name);
      const sameText: boolean = app === label;
      const differentOrigin: boolean = APP_NAME.origin !== ABILITY_LABEL.origin;
      logCase('testResStringCrossLink0065', `app=${app} label=${label} sameText=${sameText} ` +
        `appOrigin=${APP_NAME.origin} labelOrigin=${ABILITY_LABEL.origin}`);
      expect(sameText).assertTrue();
      expect(app.length).assertEqual(label.length);
      expect(differentOrigin).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6600
     * @tc.name      testResStringCrossLink0066
     * @tc.desc      Check the ability description is the second token of the module description
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCrossLink0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const moduleText: string = resources().getStringByNameSync(MODULE_DESC.name);
      const abilityText: string = resources().getStringByNameSync(ABILITY_DESC.name);
      const tokens: string[] = moduleText.split(' ');
      const position: number = moduleText.indexOf(abilityText);
      logCase('testResStringCrossLink0066', `moduleText=${moduleText} abilityText=${abilityText} ` +
        `position=${position} tokens=${tokens.join(',')}`);
      expect(tokens.length).assertEqual(2);
      expect(tokens[1]).assertEqual(abilityText);
      expect(position).assertEqual(tokens[0].length + 1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6700
     * @tc.name      testResStringCrossLink0067
     * @tc.desc      Check the page title and the page hint differ in both text and length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCrossLink0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const title: string = resources().getStringByNameSync(INDEX_TITLE.name);
      const hint: string = resources().getStringByNameSync(HINT_GC_PAGE.name);
      const differ: boolean = title !== hint;
      logCase('testResStringCrossLink0067', `title=${title} hint=${hint} differ=${differ}`);
      expect(differ).assertTrue();
      expect(title.length).assertEqual(INDEX_TITLE.asciiUnits + INDEX_TITLE.cjkUnits);
      expect(hint.length).assertEqual(HINT_GC_PAGE.asciiUnits + HINT_GC_PAGE.cjkUnits);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6800
     * @tc.name      testResStringCrossLink0068
     * @tc.desc      Read all six declared strings and check the six names resolve to five distinct values
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResStringCrossLink0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: string[] = readAll(resources());
      const distinct: number = new Set<string>(values).size;
      logCase('testResStringCrossLink0068', `count=${values.length} distinct=${distinct} values=${values.join('|')}`);
      expect(values.length).assertEqual(STRING_SPECS.length);
      expect(distinct).assertEqual(STRING_SPECS.length - 1);
      expect(new Set<string>(values).has(APP_NAME.value)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_6900
     * @tc.name      testResStringConfig0069
     * @tc.desc      Read all strings through a dark color mode override and check every value is unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringConfig0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const manager: resourceManager.ResourceManager = darkResources();
      const wrong: string[] = mismatchNames(manager);
      logCase('testResStringConfig0069', `colorMode=DARK checked=${STRING_SPECS.length} ` +
        `wrongCount=${wrong.length} wrong=${wrong.join(',')}`);
      expect(wrong.length).assertEqual(0);
      expect(manager.getStringByNameSync(APP_NAME.name)).assertEqual(APP_NAME.value);
      expect(manager.getStringByNameSync(INDEX_TITLE.name)).assertEqual(INDEX_TITLE.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7000
     * @tc.name      testResStringConfig0070
     * @tc.desc      Read all strings through a light color mode override and check every value is unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringConfig0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const manager: resourceManager.ResourceManager = lightResources();
      const wrong: string[] = mismatchNames(manager);
      logCase('testResStringConfig0070', `colorMode=LIGHT checked=${STRING_SPECS.length} ` +
        `wrongCount=${wrong.length} wrong=${wrong.join(',')}`);
      expect(wrong.length).assertEqual(0);
      expect(manager.getStringByNameSync(HINT_GC_PAGE.name)).assertEqual(HINT_GC_PAGE.value);
      expect(manager.getStringByNameSync(ABILITY_DESC.name)).assertEqual(ABILITY_DESC.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7100
     * @tc.name      testResStringConfig0071
     * @tc.desc      Read all strings through a dark plus en_US override and check every value is unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringConfig0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const manager: resourceManager.ResourceManager = darkEnUsResources();
      const wrong: string[] = mismatchNames(manager);
      const englishValues: string[] = readAll(manager);
      logCase('testResStringConfig0071', `colorMode=DARK locale=${EN_US_LOCALE} ` +
        `wrongCount=${wrong.length} english=${englishValues.join('|')}`);
      expect(wrong.length).assertEqual(0);
      expect(englishValues.length).assertEqual(STRING_SPECS.length);
      expect(manager.getStringByNameSync(MODULE_DESC.name)).assertEqual(MODULE_DESC.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7200
     * @tc.name      testResStringConfig0072
     * @tc.desc      Read all strings through an override that pins the phone device type and check the value it reports
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringConfig0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const manager: resourceManager.ResourceManager = phoneResources();
      const config: resourceManager.Configuration = manager.getOverrideConfiguration();
      const wrong: string[] = mismatchNames(manager);
      logCase('testResStringConfig0072', `deviceType=${config.deviceType} colorMode=${config.colorMode} ` +
        `wrongCount=${wrong.length} wrong=${wrong.join(',')}`);
      expect(wrong.length).assertEqual(0);
      expect(config.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
      expect(manager.getStringByNameSync(APP_NAME.name)).assertEqual(APP_NAME.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7300
     * @tc.name      testResStringManager0073
     * @tc.desc      Compare two independently created module managers and the application manager for the same values
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringManager0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const first: resourceManager.ResourceManager = resources();
      const second: resourceManager.ResourceManager = resources();
      const mismatch: string[] = [];
      for (const spec of STRING_SPECS) {
        if (first.getStringByNameSync(spec.name) !== second.getStringByNameSync(spec.name)) {
          mismatch.push(spec.name);
        }
      }
      const appName: string = appResources().getStringByNameSync(APP_NAME.name);
      logCase('testResStringManager0073', `checked=${STRING_SPECS.length} mismatchCount=${mismatch.length} ` +
        `mismatch=${mismatch.join(',')} appName=${appName}`);
      expect(mismatch.length).assertEqual(0);
      expect(appName).assertEqual(APP_NAME.value);
      expect(second.getStringByNameSync(ABILITY_LABEL.name)).assertEqual(ABILITY_LABEL.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7400
     * @tc.name      testResStringManager0074
     * @tc.desc      Check four cached override managers and the base manager all return the table values
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringManager0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const managers: resourceManager.ResourceManager[] =
        [enUsResources(), zhCnResources(), darkResources(), lightResources()];
      const wrongTotal: number = managers
        .map((manager: resourceManager.ResourceManager) => mismatchNames(manager).length)
        .reduce((total: number, count: number) => total + count, 0);
      logCase('testResStringManager0074', `managers=${managers.length} wrongTotal=${wrongTotal} ` +
        `baseAppName=${resources().getStringByNameSync(APP_NAME.name)}`);
      expect(wrongTotal).assertEqual(0);
      expect(managers.length).assertEqual(4);
      expect(appResources().getStringByNameSync(APP_NAME.name)).assertEqual(APP_NAME.value);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7500
     * @tc.name      testResStringBadName0075
     * @tc.desc      Ask for a string with an empty name and check both the sync and the promise api answer 9001003
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringBadName0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const badName: string = '';
      const syncCode: number = errorCode(() => resources().getStringByNameSync(badName));
      const asyncCode: number = await promiseErrorCode(() => resources().getStringByName(badName));
      const controlCode: number = errorCode(() => resources().getStringByNameSync(APP_NAME.name));
      logCase('testResStringBadName0075', `badNameLength=${badName.length} syncCode=${syncCode} ` +
        `asyncCode=${asyncCode} controlCode=${controlCode}`);
      expect(syncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(asyncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(controlCode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7600
     * @tc.name      testResStringBadName0076
     * @tc.desc      Ask for a string that was never declared and check the name error is reported
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringBadName0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const badName: string = 'app_name_missing';
      const syncCode: number = errorCode(() => resources().getStringByNameSync(badName));
      const asyncCode: number = await promiseErrorCode(() => resources().getStringByName(badName));
      const arrayCode: number = await arrayErrorCode(() => resources().getStringArrayByName(badName));
      logCase('testResStringBadName0076', `badName=${badName} syncCode=${syncCode} asyncCode=${asyncCode} ` +
        `arrayCode=${arrayCode}`);
      expect(syncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(asyncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(arrayCode !== 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7700
     * @tc.name      testResStringBadName0077
     * @tc.desc      Ask for a truncated app_name and check the near miss is not resolved leniently
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringBadName0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const badName: string = 'app_nam';
      const syncCode: number = errorCode(() => resources().getStringByNameSync(badName));
      const asyncCode: number = await promiseErrorCode(() => resources().getStringByName(badName));
      const controlCode: number = errorCode(() => resources().getStringByNameSync(MODULE_DESC.name));
      logCase('testResStringBadName0077', `badName=${badName} syncCode=${syncCode} asyncCode=${asyncCode} ` +
        `controlCode=${controlCode}`);
      expect(syncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(asyncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(controlCode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESSTRING_7800
     * @tc.name      testResStringBadName0078
     * @tc.desc      Ask for APP_NAME in upper case and check only the lower case spelling resolves
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResStringBadName0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const badName: string = 'APP_NAME';
      const lowerName: string = badName.toLowerCase();
      const syncCode: number = errorCode(() => resources().getStringByNameSync(badName));
      const asyncCode: number = await promiseErrorCode(() => resources().getStringByName(badName));
      const lowerCode: number = errorCode(() => resources().getStringByNameSync(lowerName));
      logCase('testResStringBadName0078', `badName=${badName} syncCode=${syncCode} asyncCode=${asyncCode} ` +
        `lowerName=${lowerName} lowerCode=${lowerCode}`);
      expect(syncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(asyncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(lowerCode).assertEqual(0);
    });

