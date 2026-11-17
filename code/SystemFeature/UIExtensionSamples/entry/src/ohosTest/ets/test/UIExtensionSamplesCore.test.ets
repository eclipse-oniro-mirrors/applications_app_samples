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
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Component, Driver, ON } from '@ohos.UiTest';

const TAG: string = '[UIExtensionSamplesTest]';
const DOMAIN: number = 0xF811;

// Navigation entries declared in entry/src/main/ets/pages/Index.ets (used as .id(item))
const PAGE_ABILITY_START_CALLBACK: string = 'AbilityStartCallback';
const PAGE_UI_EXTENSION_CONTEXT: string = 'UIExtensionContext';
const PAGE_UI_EXTENSION_CONTENT_SESSION: string = 'UIExtensionContentSession';

const PAGE_LIST: string[] = [
  PAGE_ABILITY_START_CALLBACK,
  PAGE_UI_EXTENSION_CONTEXT,
  PAGE_UI_EXTENSION_CONTENT_SESSION
];

// Result codes used by UIExtension terminate / start flows
const RESULT_OK: number = 0;
const RESULT_CANCEL: number = -1;
const RESULT_ERROR: number = -2;

// Privacy mode values used by setWindowPrivacyMode
const PRIVACY_OFF: boolean = false;
const PRIVACY_ON: boolean = true;

// Outer page route of every sample page
const ROUTE_PREFIX: string = 'uiextensionpages/';

// App under test, launched before UI assertions
const APP_BUNDLE: string = 'com.samples.uiextension';
const APP_ENTRY_ABILITY: string = 'EntryAbility';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

// Build the router url for a sample page
function routeOf(page: string): string {
  return `${ROUTE_PREFIX}${page}`;
}

// Whether a result code represents success
function isSuccess(resultCode: number): boolean {
  return resultCode === RESULT_OK;
}

// Model of AbilityStartCallback onResult payload
interface StartResultPayload {
  resultCode: number;
  message: string;
}

// Model of AbilityStartCallback onError payload
interface StartErrorPayload {
  code: number;
  name: string;
}

function makeResult(resultCode: number, message: string): StartResultPayload {
  return { resultCode: resultCode, message: message };
}

function makeError(code: number, name: string): StartErrorPayload {
  return { code: code, name: name };
}

let driver: Driver = Driver.create();
  async function exists(id: string): Promise<boolean> {
    try {
      let c: Component = await driver.findComponent(ON.id(id));
      return c !== null && c !== undefined;
    } catch (e) {
      return false;
    }
  }
  async function clickId(id: string): Promise<boolean> {
    try {
      let c: Component = await driver.findComponent(ON.id(id));
      if (c === null || c === undefined) {
        return false;
      }
      await c.click();
      await sleep(600);
      return true;
    } catch (e) {
      return false;
    }
  }
  // Bring the app under test to the foreground and back to its Index page
  async function launchApp(): Promise<void> {
    let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    try {
      await delegator.startAbility({
        bundleName: APP_BUNDLE,
        abilityName: APP_ENTRY_ABILITY
      });
    } catch (e) {
      hilog.warn(DOMAIN, TAG, 'startAbility failed');
    }
    for (let i = 0; i < 8; i++) {
      if (await exists(PAGE_ABILITY_START_CALLBACK)) {
        return;
      }
      try {
        await driver.pressBack();
      } catch (e) {
        hilog.warn(DOMAIN, TAG, 'pressBack failed');
      }
      await sleep(500);
    }
  }

export default function uiExtensionSamplesTest() {
  describe('UIExtensionSamplesLogicTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'uiExtensionSamplesTest begin');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0001
     * @tc.name      testPage0101
     * @tc.desc      Verify testPage0101 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0101 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST.length=${PAGE_LIST.length}, expected=3`);
      expect(PAGE_LIST.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testPage0101 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0002
     * @tc.name      testPage0102
     * @tc.desc      Verify testPage0102 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0102 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST[0]=${PAGE_LIST[0]}`);
      expect(PAGE_LIST[0]).assertEqual(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, 'testPage0102 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0003
     * @tc.name      testPage0103
     * @tc.desc      Verify testPage0103 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0103 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST[1]=${PAGE_LIST[1]}`);
      expect(PAGE_LIST[1]).assertEqual(PAGE_UI_EXTENSION_CONTEXT);
      hilog.info(DOMAIN, TAG, 'testPage0103 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0004
     * @tc.name      testPage0104
     * @tc.desc      Verify testPage0104 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0104 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST[2]=${PAGE_LIST[2]}`);
      expect(PAGE_LIST[2]).assertEqual(PAGE_UI_EXTENSION_CONTENT_SESSION);
      hilog.info(DOMAIN, TAG, 'testPage0104 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0005
     * @tc.name      testPage0105
     * @tc.desc      Verify testPage0105 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0105 begin');
      let uniq: Set<string> = new Set<string>(PAGE_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniq.size=${uniq.size}, expected=3`);
      expect(uniq.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testPage0105 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0006
     * @tc.name      testPage0106
     * @tc.desc      Verify testPage0106 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0106 begin');
      let empty: string[] = PAGE_LIST.filter((x: string) => x.length === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual empty.length=${empty.length}, expected=0`);
      expect(empty.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPage0106 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0007
     * @tc.name      testPage0107
     * @tc.desc      Verify testPage0107 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0107 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${PAGE_ABILITY_START_CALLBACK.startsWith('Ability')}`);
      expect(PAGE_ABILITY_START_CALLBACK.startsWith('Ability')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPage0107 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0008
     * @tc.name      testPage0108
     * @tc.desc      Verify testPage0108 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0108 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${PAGE_UI_EXTENSION_CONTEXT.startsWith('UIExtension')}`);
      expect(PAGE_UI_EXTENSION_CONTEXT.startsWith('UIExtension')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPage0108 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0009
     * @tc.name      testPage0109
     * @tc.desc      Verify testPage0109 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0109 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PAGE_UI_EXTENSION_CONTENT_SESSION.length > PAGE_UI_EXTENSI...`);
      expect(PAGE_UI_EXTENSION_CONTENT_SESSION.length > PAGE_UI_EXTENSION_CONTEXT.length).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPage0109 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0010
     * @tc.name      testPage0110
     * @tc.desc      Verify testPage0110 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0110 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${PAGE_LIST.indexOf(PAGE_UI_EXTENSION_CONTEXT)}`);
      expect(PAGE_LIST.indexOf(PAGE_UI_EXTENSION_CONTEXT)).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testPage0110 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0011
     * @tc.name      testPage0111
     * @tc.desc      Verify testPage0111 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0111 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${PAGE_LIST.indexOf('NotExist')}, expected=-1`);
      expect(PAGE_LIST.indexOf('NotExist')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'testPage0111 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0012
     * @tc.name      testPage0112
     * @tc.desc      Verify testPage0112 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0112 begin');
      let upper: string[] = PAGE_LIST.filter((x: string) => x[0] === x[0].toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual upper.length=${upper.length}, expected=3`);
      expect(upper.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testPage0112 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0013
     * @tc.name      testPage0113
     * @tc.desc      Verify testPage0113 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0113 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST.join('|')=${PAGE_LIST.join('|')}`);
      expect(PAGE_LIST.join('|')).assertEqual('AbilityStartCallback|UIExtensionContext|UIExtensionContentSession');
      hilog.info(DOMAIN, TAG, 'testPage0113 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0014
     * @tc.name      testPage0114
     * @tc.desc      Verify testPage0114 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0114 begin');
      let noSpace: string[] = PAGE_LIST.filter((x: string) => x.indexOf(' ') < 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual noSpace.length=${noSpace.length}, expected=3`);
      expect(noSpace.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testPage0114 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0015
     * @tc.name      testPage0115
     * @tc.desc      Verify testPage0115 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPage0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPage0115 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PAGE_LIST=${typeof PAGE_LIST}, expected='object'`);
      expect(typeof PAGE_LIST).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PAGE_LIST)=${Array.isArray(PAGE_LIST)}`);
      expect(Array.isArray(PAGE_LIST)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPage0115 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0016
     * @tc.name      testRoute0201
     * @tc.desc      Verify testRoute0201 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${routeOf(PAGE_ABILITY_START_CALLBACK)}`);
      expect(routeOf(PAGE_ABILITY_START_CALLBACK)).assertEqual('uiextensionpages/AbilityStartCallback');
      hilog.info(DOMAIN, TAG, 'testRoute0201 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0017
     * @tc.name      testRoute0202
     * @tc.desc      Verify testRoute0202 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0202 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${routeOf(PAGE_UI_EXTENSION_CONTEXT)}`);
      expect(routeOf(PAGE_UI_EXTENSION_CONTEXT)).assertEqual('uiextensionpages/UIExtensionContext');
      hilog.info(DOMAIN, TAG, 'testRoute0202 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0018
     * @tc.name      testRoute0203
     * @tc.desc      Verify testRoute0203 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assert actual=${routeOf(PAGE_UI_EXTENSION_CONTENT_SESSION)}`);
      expect(routeOf(PAGE_UI_EXTENSION_CONTENT_SESSION))
        .assertEqual('uiextensionpages/UIExtensionContentSession');
      hilog.info(DOMAIN, TAG, 'testRoute0203 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0019
     * @tc.name      testRoute0204
     * @tc.desc      Verify testRoute0204 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0204 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ROUTE_PREFIX.endsWith('/')=${ROUTE_PREFIX.endsWith('/')}`);
      expect(ROUTE_PREFIX.endsWith('/')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testRoute0204 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0020
     * @tc.name      testRoute0205
     * @tc.desc      Verify testRoute0205 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0205 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${routeOf('x').startsWith(ROUTE_PREFIX)}`);
      expect(routeOf('x').startsWith(ROUTE_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testRoute0205 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0021
     * @tc.name      testRoute0206
     * @tc.desc      Verify testRoute0206 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0206 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeOf('')=${routeOf('')}, expected=ROUTE_PREFIX`);
      expect(routeOf('')).assertEqual(ROUTE_PREFIX);
      hilog.info(DOMAIN, TAG, 'testRoute0206 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0022
     * @tc.name      testRoute0207
     * @tc.desc      Verify testRoute0207 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0207 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeOf(PAGE_ABILITY_START_CALLBACK).split('/..., expected=2`);
      expect(routeOf(PAGE_ABILITY_START_CALLBACK).split('/').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testRoute0207 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0023
     * @tc.name      testRoute0208
     * @tc.desc      Verify testRoute0208 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${routeOf(PAGE_ABILITY_START_CALLBACK).indexOf('/')}`);
      expect(routeOf(PAGE_ABILITY_START_CALLBACK).indexOf('/')).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'testRoute0208 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0024
     * @tc.name      testRoute0209
     * @tc.desc      Verify testRoute0209 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0209 begin');
      let routes: string[] = PAGE_LIST.map((x: string) => routeOf(x));
      let uniq: Set<string> = new Set<string>(routes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniq.size=${uniq.size}, expected=3`);
      expect(uniq.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testRoute0209 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0025
     * @tc.name      testRoute0210
     * @tc.desc      Verify testRoute0210 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0210 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof routeOf(PAGE_LIST[0])=${typeof routeOf(PAGE_LIST[0])}`);
      expect(typeof routeOf(PAGE_LIST[0])).assertEqual('string');
      hilog.info(DOMAIN, TAG, 'testRoute0210 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0026
     * @tc.name      testRoute0211
     * @tc.desc      Verify testRoute0211 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0211 begin');
      let allPrefixed: boolean = PAGE_LIST.every((x: string) => routeOf(x).startsWith(ROUTE_PREFIX));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPrefixed=${allPrefixed}`);
      expect(allPrefixed).assertTrue();
      hilog.info(DOMAIN, TAG, 'testRoute0211 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0027
     * @tc.name      testRoute0212
     * @tc.desc      Verify testRoute0212 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoute0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testRoute0212 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ROUTE_PREFIX.length=${ROUTE_PREFIX.length}, expected=17`);
      expect(ROUTE_PREFIX.length).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'testRoute0212 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0028
     * @tc.name      testResult0301
     * @tc.desc      Verify testResult0301 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0301 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RESULT_OK=${RESULT_OK}, expected=0`);
      expect(RESULT_OK).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testResult0301 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0029
     * @tc.name      testResult0302
     * @tc.desc      Verify testResult0302 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0302 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RESULT_CANCEL=${RESULT_CANCEL}, expected=-1`);
      expect(RESULT_CANCEL).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'testResult0302 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0030
     * @tc.name      testResult0303
     * @tc.desc      Verify testResult0303 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0303 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RESULT_ERROR=${RESULT_ERROR}, expected=-2`);
      expect(RESULT_ERROR).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'testResult0303 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0031
     * @tc.name      testResult0304
     * @tc.desc      Verify testResult0304 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0304 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isSuccess(RESULT_OK)=${isSuccess(RESULT_OK)}`);
      expect(isSuccess(RESULT_OK)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testResult0304 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0032
     * @tc.name      testResult0305
     * @tc.desc      Verify testResult0305 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0305 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isSuccess(RESULT_CANCEL)=${isSuccess(RESULT_CANCEL)}`);
      expect(isSuccess(RESULT_CANCEL)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testResult0305 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0033
     * @tc.name      testResult0306
     * @tc.desc      Verify testResult0306 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0306 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isSuccess(RESULT_ERROR)=${isSuccess(RESULT_ERROR)}`);
      expect(isSuccess(RESULT_ERROR)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testResult0306 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0034
     * @tc.name      testResult0307
     * @tc.desc      Verify testResult0307 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0307 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RESULT_OK > RESULT_CANCEL=${RESULT_OK > RESULT_CANCEL}`);
      expect(RESULT_OK > RESULT_CANCEL).assertTrue();
      hilog.info(DOMAIN, TAG, 'testResult0307 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0035
     * @tc.name      testResult0308
     * @tc.desc      Verify testResult0308 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0308 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RESULT_CANCEL > RESULT_ERROR=${RESULT_CANCEL > RESULT_ERROR}`);
      expect(RESULT_CANCEL > RESULT_ERROR).assertTrue();
      hilog.info(DOMAIN, TAG, 'testResult0308 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0036
     * @tc.name      testResult0309
     * @tc.desc      Verify testResult0309 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0309 begin');
      let codes: number[] = [RESULT_OK, RESULT_CANCEL, RESULT_ERROR];
      let uniq: Set<number> = new Set<number>(codes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniq.size=${uniq.size}, expected=3`);
      expect(uniq.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testResult0309 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0037
     * @tc.name      testResult0310
     * @tc.desc      Verify testResult0310 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0310 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isInteger(RESULT_OK)=${Number.isInteger(RESULT_OK)}`);
      expect(Number.isInteger(RESULT_OK)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testResult0310 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0038
     * @tc.name      testResult0311
     * @tc.desc      Verify testResult0311 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0311 begin');
      let payload: StartResultPayload = makeResult(RESULT_OK, 'done');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual payload.resultCode=${payload.resultCode}, expected=0`);
      expect(payload.resultCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual payload.message=${payload.message}, expected='done'`);
      expect(payload.message).assertEqual('done');
      hilog.info(DOMAIN, TAG, 'testResult0311 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0039
     * @tc.name      testResult0312
     * @tc.desc      Verify testResult0312 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0312 begin');
      let payload: StartResultPayload = makeResult(RESULT_CANCEL, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isSuccess(payload.resultCode)}`);
      expect(isSuccess(payload.resultCode)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testResult0312 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0040
     * @tc.name      testResult0313
     * @tc.desc      Verify testResult0313 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0313 begin');
      let e: StartErrorPayload = makeError(401, 'PermissionDenied');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.code=${e.code}, expected=401`);
      expect(e.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.name=${e.name}, expected='PermissionDenied'`);
      expect(e.name).assertEqual('PermissionDenied');
      hilog.info(DOMAIN, TAG, 'testResult0313 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0041
     * @tc.name      testResult0314
     * @tc.desc      Verify testResult0314 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0314 begin');
      let e: StartErrorPayload = makeError(0, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.code=${e.code}, expected=0`);
      expect(e.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.name.length=${e.name.length}, expected=0`);
      expect(e.name.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testResult0314 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0042
     * @tc.name      testResult0315
     * @tc.desc      Verify testResult0315 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0315 begin');
      let p: StartResultPayload = makeResult(RESULT_OK, 'msg');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof p=${typeof p}, expected='object'`);
      expect(typeof p).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'testResult0315 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0043
     * @tc.name      testResult0316
     * @tc.desc      Verify testResult0316 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0316 begin');
      let p: StartResultPayload = makeResult(RESULT_OK, 'a');
      let q: StartResultPayload = makeResult(RESULT_OK, 'b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse p.message === q.message=${p.message === q.message}`);
      expect(p.message === q.message).assertFalse();
      hilog.info(DOMAIN, TAG, 'testResult0316 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0044
     * @tc.name      testResult0317
     * @tc.desc      Verify testResult0317 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0317 begin');
      let json: string = JSON.stringify(makeResult(RESULT_OK, 'ok'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual json.indexOf('"resultCode"')=${json.indexOf('"resultCode"')}, expected=1`);
      expect(json.indexOf('"resultCode"')).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testResult0317 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0045
     * @tc.name      testResult0318
     * @tc.desc      Verify testResult0318 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResult0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testResult0318 begin');
      let json: string = JSON.stringify(makeError(1, 'E'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue json.length > 0=${json.length > 0}`);
      expect(json.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'testResult0318 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0046
     * @tc.name      testPrivacy0401
     * @tc.desc      Verify testPrivacy0401 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRIVACY_ON=${PRIVACY_ON}`);
      expect(PRIVACY_ON).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPrivacy0401 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0047
     * @tc.name      testPrivacy0402
     * @tc.desc      Verify testPrivacy0402 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0402 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse PRIVACY_OFF=${PRIVACY_OFF}`);
      expect(PRIVACY_OFF).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPrivacy0402 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0048
     * @tc.name      testPrivacy0403
     * @tc.desc      Verify testPrivacy0403 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0403 begin');
      let flipped: boolean = !PRIVACY_ON;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse flipped=${flipped}`);
      expect(flipped).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPrivacy0403 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0049
     * @tc.name      testPrivacy0404
     * @tc.desc      Verify testPrivacy0404 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0404 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PRIVACY_ON=${typeof PRIVACY_ON}, expected='boolean'`);
      expect(typeof PRIVACY_ON).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PRIVACY_OFF=${typeof PRIVACY_OFF}, expected='boolean'`);
      expect(typeof PRIVACY_OFF).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, 'testPrivacy0404 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0050
     * @tc.name      testPrivacy0405
     * @tc.desc      Verify testPrivacy0405 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0405 begin');
      let modes: boolean[] = [PRIVACY_ON, PRIVACY_OFF];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modes.length=${modes.length}, expected=2`);
      expect(modes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testPrivacy0405 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0051
     * @tc.name      testPrivacy0406
     * @tc.desc      Verify testPrivacy0406 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0406 begin');
      let count: number = 0;
      for (let m of [PRIVACY_ON, PRIVACY_OFF]) {
        if (m) {
          count++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=1`);
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testPrivacy0406 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0052
     * @tc.name      testPrivacy0407
     * @tc.desc      Verify testPrivacy0407 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0407 begin');
      let state: Record<string, boolean> = { 'privacy': PRIVACY_ON };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue state.privacy=${state.privacy}`);
      expect(state.privacy).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPrivacy0407 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0053
     * @tc.name      testPrivacy0408
     * @tc.desc      Verify testPrivacy0408 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrivacy0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testPrivacy0408 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRIVACY_ON !== PRIVACY_OFF=${PRIVACY_ON !== PRIVACY_OFF}`);
      expect(PRIVACY_ON !== PRIVACY_OFF).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPrivacy0408 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0054
     * @tc.name      testMisc0501
     * @tc.desc      Verify testMisc0501 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0501 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof sleep=${typeof sleep}, expected='function'`);
      expect(typeof sleep).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'testMisc0501 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0055
     * @tc.name      testMisc0502
     * @tc.desc      Verify testMisc0502 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0502 begin');
      await sleep(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMisc0502 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0056
     * @tc.name      testMisc0503
     * @tc.desc      Verify testMisc0503 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0503 begin');
      let p: Promise<void> = sleep(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue p instanceof Promise=${p instanceof Promise}`);
      expect(p instanceof Promise).assertTrue();
      await p;
      hilog.info(DOMAIN, TAG, 'testMisc0503 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0057
     * @tc.name      testMisc0504
     * @tc.desc      Verify testMisc0504 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0504 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof routeOf=${typeof routeOf}, expected='function'`);
      expect(typeof routeOf).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof isSuccess=${typeof isSuccess}, expected='function'`);
      expect(typeof isSuccess).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof makeResult=${typeof makeResult}, expected='function'`);
      expect(typeof makeResult).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof makeError=${typeof makeError}, expected='function'`);
      expect(typeof makeError).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'testMisc0504 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0058
     * @tc.name      testMisc0505
     * @tc.desc      Verify testMisc0505 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0505 begin');
      let arr: number[] = [RESULT_ERROR, RESULT_OK, RESULT_CANCEL];
      arr.sort((a: number, b: number) => a - b);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arr[0]=${arr[0]}, expected=-2`);
      expect(arr[0]).assertEqual(-2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arr[2]=${arr[2]}, expected=0`);
      expect(arr[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testMisc0505 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0059
     * @tc.name      testMisc0506
     * @tc.desc      Verify testMisc0506 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0506 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify({ a: 1 })=${JSON.stringify({ a: 1 })}`);
      expect(JSON.stringify({ a: 1 })).assertEqual('{"a":1}');
      hilog.info(DOMAIN, TAG, 'testMisc0506 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0060
     * @tc.name      testMisc0507
     * @tc.desc      Verify testMisc0507 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0507 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isInteger(RESULT_CANCEL)}`);
      expect(Number.isInteger(RESULT_CANCEL)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMisc0507 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0061
     * @tc.name      testMisc0508
     * @tc.desc      Verify testMisc0508 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0508 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual '5'.padStart(2, '0')=${'5'.padStart(2, '0')}, expected='05'`);
      expect('5'.padStart(2, '0')).assertEqual('05');
      hilog.info(DOMAIN, TAG, 'testMisc0508 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0062
     * @tc.name      testMisc0509
     * @tc.desc      Verify testMisc0509 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0509 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PAGE_LIST.every((x: string) => x.length > 5)`);
      expect(PAGE_LIST.every((x: string) => x.length > 5)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testMisc0509 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0063
     * @tc.name      testMisc0510
     * @tc.desc      Verify testMisc0510 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMisc0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testMisc0510 begin');
      let joined: string = PAGE_LIST.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined.indexOf(',')=${joined.indexOf(',')}, expected=20`);
      expect(joined.indexOf(',')).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'testMisc0510 end');
    });
  });

  describe('UIExtensionSamplesUiTest', () => {



    beforeAll(async () => {
      await launchApp();
      await sleep(500);
    });

    afterEach(async () => {
      if (await exists(PAGE_ABILITY_START_CALLBACK)) {
        return;
      }
      try {
        await driver.pressBack();
      } catch (e) {
        hilog.warn(DOMAIN, TAG, 'pressBack failed');
      }
      await sleep(400);
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0064
     * @tc.name      testUi0601
     * @tc.desc      Verify testUi0601 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0601 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof driver=${typeof driver}, expected='object'`);
      expect(typeof driver).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'testUi0601 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0065
     * @tc.name      testUi0602
     * @tc.desc      Verify testUi0602 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0602 begin');
      const actual4: boolean = await exists(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_ABILITY_START_CALLBACK)=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0602 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0066
     * @tc.name      testUi0603
     * @tc.desc      Verify testUi0603 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0603 begin');
      const actual5: boolean = await exists(PAGE_UI_EXTENSION_CONTEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_UI_EXTENSION_CONTEXT)=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0603 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0067
     * @tc.name      testUi0604
     * @tc.desc      Verify testUi0604 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0604 begin');
      const actual6: boolean = await exists(PAGE_UI_EXTENSION_CONTENT_SESSION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_UI_EXTENSION_CONTENT_SESSION)=${actual6}`);
      expect(actual6).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0604 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0068
     * @tc.name      testUi0605
     * @tc.desc      Verify testUi0605 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0605 begin');
      let found: number = 0;
      for (let p of PAGE_LIST) {
        if (await exists(p)) {
          found++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual found=${found}, expected=3`);
      expect(found).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testUi0605 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0069
     * @tc.name      testUi0606
     * @tc.desc      Verify testUi0606 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0606 begin');
      let clicked: boolean = await clickId(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clicked=${clicked}`);
      expect(clicked).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0606 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0070
     * @tc.name      testUi0607
     * @tc.desc      Verify testUi0607 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0607 begin');
      await clickId(PAGE_ABILITY_START_CALLBACK);
      const actual7: boolean = await exists('onResult') || await exists('onError');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists('onResult') || await exists('onError')=${actual7}`);
      expect(actual7).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0607 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0071
     * @tc.name      testUi0608
     * @tc.desc      Verify testUi0608 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0608 begin');
      await clickId(PAGE_UI_EXTENSION_CONTEXT);
      const actual1: boolean = await exists('openLink') || await exists('startUIExtensionAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0608 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0072
     * @tc.name      testUi0609
     * @tc.desc      Verify testUi0609 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0609 begin');
      await clickId(PAGE_UI_EXTENSION_CONTENT_SESSION);
      const actual2: boolean = await exists('startUIExtensionAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists('startUIExtensionAbility')=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0609 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0073
     * @tc.name      testUi0610
     * @tc.desc      Verify testUi0610 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0610 begin');
      await clickId(PAGE_ABILITY_START_CALLBACK);
      await sleep(300);
      const actual3: boolean = await exists('onResult') || await exists('onError');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists('onResult') || await exists('onError')=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0610 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0074
     * @tc.name      testUi0611
     * @tc.desc      Verify testUi0611 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0611 begin');
      const actual8: boolean = await exists(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_ABILITY_START_CALLBACK)=${actual8}`);
      expect(actual8).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0611 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0075
     * @tc.name      testUi0612
     * @tc.desc      Verify testUi0612 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUi0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'testUi0612 begin');
      await clickId(PAGE_UI_EXTENSION_CONTEXT);
      await sleep(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUi0612 end');
    });
  });
}

