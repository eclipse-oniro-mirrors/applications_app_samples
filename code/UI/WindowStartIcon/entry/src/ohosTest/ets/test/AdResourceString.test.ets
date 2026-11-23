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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF812;
const TAG: string = 'WindowStartIconAdStringTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * Resolves a string resource through the application resource manager.
 */
function getString(resource: Resource): string {
  return delegator.getAppContext().resourceManager.getStringSync(resource);
}

/**
 * Reports whether a resource read completes without throwing.
 */
function safeRead(reader: () => void): boolean {
  try {
    reader();
    return true;
  } catch (error) {
    log('safeRead failed: ' + String(error));
    return false;
  }
}

export default function adResourceStringTest(): void {
  describe('AdResourceStringTest', () => {
    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0101
     * @tc.name      testWindowStartIconAdString0101
     * @tc.desc      Verify the skip string resource carries the Chinese skip label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0101 begin');
      const actual: string = getString($r('app.string.skip'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='跳过'`);
      expect(actual).assertEqual('跳过');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.length=${actual.length}, expected=2`);
      expect(actual.length).assertEqual(2);
      log('testWindowStartIconAdString0101 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0103
     * @tc.name      testWindowStartIconAdString0103
     * @tc.desc      Verify the advertising page title resource equals the sample title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0103 begin');
      const actual: string = getString($r('app.string.Implementation_case_of_startup_page'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='启动页实现案例'`);
      expect(actual).assertEqual('启动页实现案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.length=${actual.length}, expected=7`);
      expect(actual.length).assertEqual(7);
      log('testWindowStartIconAdString0103 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0104
     * @tc.name      testWindowStartIconAdString0104
     * @tc.desc      Verify the advertising description resource equals the full sample description.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0104 begin');
      const actual: string = getString($r('app.string.advertising_description'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='不同分辨率冷启动应用图标适配和启动广告页的实现'`);
      expect(actual).assertEqual('不同分辨率冷启动应用图标适配和启动广告页的实现');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.length=${actual.length}, expected=23`);
      expect(actual.length).assertEqual(23);
      log('testWindowStartIconAdString0104 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0106
     * @tc.name      testWindowStartIconAdString0106
     * @tc.desc      Verify the ability description resource keeps its template value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0106 begin');
      const actual: string = getString($r('app.string.EntryAbility_desc'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='description'`);
      expect(actual).assertEqual('description');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.length=${actual.length}, expected=11`);
      expect(actual.length).assertEqual(11);
      log('testWindowStartIconAdString0106 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0107
     * @tc.name      testWindowStartIconAdString0107
     * @tc.desc      Verify the translucent background string resource equals its rgba declaration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0107 begin');
      const actual: string = getString($r('app.string.advertising_description_backgroundColor'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='rgba(0,0,0,0.3)'`);
      expect(actual).assertEqual('rgba(0,0,0,0.3)');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.length=${actual.length}, expected=15`);
      expect(actual.length).assertEqual(15);
      log('testWindowStartIconAdString0107 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0108
     * @tc.name      testWindowStartIconAdString0108
     * @tc.desc      Verify the translucent background string follows rgba syntax with four components.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0108 begin');
      const actual: string = getString($r('app.string.advertising_description_backgroundColor'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual.startsWith('rgba(')=${actual.startsWith('rgba(')}`);
      expect(actual.startsWith('rgba(')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual.endsWith(')')=${actual.endsWith(')')}`);
      expect(actual.endsWith(')')).assertTrue();
      const parts: string[] = actual.substring(5, actual.length - 1).split(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual parts.length=${parts.length}, expected=4`);
      expect(parts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Number(parts[3])=${Number(parts[3])}, expected=0.3`);
      expect(Number(parts[3])).assertEqual(0.3);
      log('testWindowStartIconAdString0108 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0109
     * @tc.name      testWindowStartIconAdString0109
     * @tc.desc      Verify all seven declared string resources resolve without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0109 begin');
      let allOk: boolean = true;
      allOk = allOk && safeRead(() => { getString($r('app.string.module_desc')); });
      allOk = allOk && safeRead(() => { getString($r('app.string.EntryAbility_desc')); });
      allOk = allOk && safeRead(() => { getString($r('app.string.EntryAbility_label')); });
      allOk = allOk && safeRead(() => { getString($r('app.string.Implementation_case_of_startup_page')); });
      allOk = allOk && safeRead(() => { getString($r('app.string.advertising_description')); });
      allOk = allOk && safeRead(() => { getString($r('app.string.skip')); });
      allOk = allOk && safeRead(() => { getString($r('app.string.advertising_description_backgroundColor')); });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual allOk=${allOk}, expected=true`);
      expect(allOk).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof allOk=${typeof allOk}, expected='boolean'`);
      expect(typeof allOk).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${getString($r('app.string.skip'))}, expected='跳过'`);
      expect(getString($r('app.string.skip'))).assertEqual('跳过');
      log('testWindowStartIconAdString0109 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0110
     * @tc.name      testWindowStartIconAdString0110
     * @tc.desc      Verify the skip and title resources hold distinct non-empty values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0110 begin');
      const skipValue: string = getString($r('app.string.skip'));
      const titleValue: string = getString($r('app.string.Implementation_case_of_startup_page'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger skipValue.length=${skipValue.length}, expected=0`);
      expect(skipValue.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger titleValue.length=${titleValue.length}, expected=0`);
      expect(titleValue.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse skipValue === titleValue=${skipValue === titleValue}`);
      expect(skipValue === titleValue).assertFalse();
      log('testWindowStartIconAdString0110 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0111
     * @tc.name      testWindowStartIconAdString0111
     * @tc.desc      Verify the label and module description resources hold distinct values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0111 begin');
      const labelValue: string = getString($r('app.string.EntryAbility_label'));
      const moduleValue: string = getString($r('app.string.module_desc'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse labelValue === moduleValue=${labelValue === moduleValue}`);
      expect(labelValue === moduleValue).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger labelValue.length=${labelValue.length}, expected=0`);
      expect(labelValue.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger moduleValue.length=${moduleValue.length}, expected=0`);
      expect(moduleValue.length).assertLarger(0);
      log('testWindowStartIconAdString0111 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0112
     * @tc.name      testWindowStartIconAdString0112
     * @tc.desc      Verify the title and description resources stay distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0112 begin');
      const titleValue: string = getString($r('app.string.Implementation_case_of_startup_page'));
      const descValue: string = getString($r('app.string.advertising_description'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse titleValue === descValue=${titleValue === descValue}`);
      expect(titleValue === descValue).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess titleValue.length=${titleValue.length}`);
      expect(titleValue.length).assertLess(descValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof titleValue=${typeof titleValue}, expected='string'`);
      expect(typeof titleValue).assertEqual('string');
      log('testWindowStartIconAdString0112 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0113
     * @tc.name      testWindowStartIconAdString0113
     * @tc.desc      Verify the description is longer than the skip label for layout hierarchy.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0113 begin');
      const descValue: string = getString($r('app.string.advertising_description'));
      const skipValue: string = getString($r('app.string.skip'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger descValue.length=${descValue.length}`);
      expect(descValue.length).assertLarger(skipValue.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger descValue.length=${descValue.length}, expected=10`);
      expect(descValue.length).assertLarger(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger skipValue.length=${skipValue.length}, expected=0`);
      expect(skipValue.length).assertLarger(0);
      log('testWindowStartIconAdString0113 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0114
     * @tc.name      testWindowStartIconAdString0114
     * @tc.desc      Verify async getStringValue matches the sync value for the title resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0114 begin');
      const syncValue: string = getString($r('app.string.Implementation_case_of_startup_page'));
      const asyncValue: string = await delegator.getAppContext().resourceManager
        .getStringValue($r('app.string.Implementation_case_of_startup_page'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue=${asyncValue}, expected=syncValue`);
      expect(asyncValue).assertEqual(syncValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue=${asyncValue}, expected='启动页实现案例'`);
      expect(asyncValue).assertEqual('启动页实现案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof asyncValue=${typeof asyncValue}, expected='string'`);
      expect(typeof asyncValue).assertEqual('string');
      log('testWindowStartIconAdString0114 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0115
     * @tc.name      testWindowStartIconAdString0115
     * @tc.desc      Verify repeated reads of the skip resource return an identical value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0115 begin');
      const first: string = getString($r('app.string.skip'));
      const second: string = getString($r('app.string.skip'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=2`);
      expect(first.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof first=${typeof first}, expected='string'`);
      expect(typeof first).assertEqual('string');
      log('testWindowStartIconAdString0115 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0116
     * @tc.name      testWindowStartIconAdString0116
     * @tc.desc      Verify repeated reads of the title resource are idempotent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0116 begin');
      const first: string = getString($r('app.string.Implementation_case_of_startup_page'));
      const second: string = getString($r('app.string.Implementation_case_of_startup_page'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected='启动页实现案例'`);
      expect(first).assertEqual('启动页实现案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof second=${typeof second}, expected='string'`);
      expect(typeof second).assertEqual('string');
      log('testWindowStartIconAdString0116 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0117
     * @tc.name      testWindowStartIconAdString0117
     * @tc.desc      Verify async getStringValue matches the sync value for the skip resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0117 begin');
      const syncValue: string = getString($r('app.string.skip'));
      const asyncValue: string = await delegator.getAppContext().resourceManager
        .getStringValue($r('app.string.skip'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue=${asyncValue}, expected=syncValue`);
      expect(asyncValue).assertEqual(syncValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue=${asyncValue}, expected='跳过'`);
      expect(asyncValue).assertEqual('跳过');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof asyncValue=${typeof asyncValue}, expected='string'`);
      expect(typeof asyncValue).assertEqual('string');
      log('testWindowStartIconAdString0117 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0118
     * @tc.name      testWindowStartIconAdString0118
     * @tc.desc      Verify async getStringValue matches the sync value for the description resource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0118 begin');
      const syncValue: string = getString($r('app.string.advertising_description'));
      const asyncValue: string = await delegator.getAppContext().resourceManager
        .getStringValue($r('app.string.advertising_description'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue=${asyncValue}, expected=syncValue`);
      expect(asyncValue).assertEqual(syncValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue=${asyncValue}, expected='不同分辨率冷启动应用图标适配和启动广告页的实现'`);
      expect(asyncValue).assertEqual('不同分辨率冷启动应用图标适配和启动广告页的实现');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual asyncValue.length=${asyncValue.length}, expected=23`);
      expect(asyncValue.length).assertEqual(23);
      log('testWindowStartIconAdString0118 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0119
     * @tc.name      testWindowStartIconAdString0119
     * @tc.desc      Verify the skip label contains no leading or trailing whitespace.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0119 begin');
      const skipValue: string = getString($r('app.string.skip'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual skipValue=${skipValue}, expected=skipValue.trim()`);
      expect(skipValue).assertEqual(skipValue.trim());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse skipValue === ''=${skipValue === ''}`);
      expect(skipValue === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger skipValue.charCodeAt(0)=${skipValue.charCodeAt(0)}`);
      expect(skipValue.charCodeAt(0)).assertLarger(127);
      log('testWindowStartIconAdString0119 end');
    })

    /**
     * @tc.number    SUB_WINDOW_START_ICON_ADSTRING_0120
     * @tc.name      testWindowStartIconAdString0120
     * @tc.desc      Verify the background rgba string alpha component stays below full opacity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowStartIconAdString0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowStartIconAdString0120 begin');
      const actual: string = getString($r('app.string.advertising_description_backgroundColor'));
      const parts: string[] = actual.substring(5, actual.length - 1).split(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual parts.length=${parts.length}, expected=4`);
      expect(parts.length).assertEqual(4);
      const alpha: number = Number(parts[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger alpha=${alpha}, expected=0`);
      expect(alpha).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess alpha=${alpha}, expected=1`);
      expect(alpha).assertLess(1);
      log('testWindowStartIconAdString0120 end');
    })
  })
}
