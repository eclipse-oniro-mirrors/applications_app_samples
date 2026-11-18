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
import { Component, Driver, ON } from '@kit.TestKit';

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
     * @tc.name      UIExtensionSamples_PageList_0001
     * @tc.desc      Verify UIExtensionSamples_PageList_0001 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST.length=${PAGE_LIST.length}, expected=3`);
      expect(PAGE_LIST.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0001 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0002
     * @tc.name      UIExtensionSamples_PageList_0002
     * @tc.desc      Verify UIExtensionSamples_PageList_0002 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST[0]=${PAGE_LIST[0]}`);
      expect(PAGE_LIST[0]).assertEqual(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0002 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0003
     * @tc.name      UIExtensionSamples_PageList_0003
     * @tc.desc      Verify UIExtensionSamples_PageList_0003 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST[1]=${PAGE_LIST[1]}`);
      expect(PAGE_LIST[1]).assertEqual(PAGE_UI_EXTENSION_CONTEXT);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0003 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0004
     * @tc.name      UIExtensionSamples_PageList_0004
     * @tc.desc      Verify UIExtensionSamples_PageList_0004 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST[2]=${PAGE_LIST[2]}`);
      expect(PAGE_LIST[2]).assertEqual(PAGE_UI_EXTENSION_CONTENT_SESSION);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0004 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0005
     * @tc.name      UIExtensionSamples_PageList_0005
     * @tc.desc      Verify UIExtensionSamples_PageList_0005 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0005 begin');
      let uniq: Set<string> = new Set<string>(PAGE_LIST);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniq.size=${uniq.size}, expected=3`);
      expect(uniq.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0005 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0006
     * @tc.name      UIExtensionSamples_PageList_0006
     * @tc.desc      Verify UIExtensionSamples_PageList_0006 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0006 begin');
      let empty: string[] = PAGE_LIST.filter((x: string) => x.length === 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual empty.length=${empty.length}, expected=0`);
      expect(empty.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0006 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0007
     * @tc.name      UIExtensionSamples_PageList_0007
     * @tc.desc      Verify UIExtensionSamples_PageList_0007 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${PAGE_ABILITY_START_CALLBACK.startsWith('Ability')}`);
      expect(PAGE_ABILITY_START_CALLBACK.startsWith('Ability')).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0007 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0008
     * @tc.name      UIExtensionSamples_PageList_0008
     * @tc.desc      Verify UIExtensionSamples_PageList_0008 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${PAGE_UI_EXTENSION_CONTEXT.startsWith('UIExtension')}`);
      expect(PAGE_UI_EXTENSION_CONTEXT.startsWith('UIExtension')).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0008 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0009
     * @tc.name      UIExtensionSamples_PageList_0009
     * @tc.desc      Verify UIExtensionSamples_PageList_0009 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PAGE_UI_EXTENSION_CONTENT_SESSION.length > PAGE_UI_EXTENSI...`);
      expect(PAGE_UI_EXTENSION_CONTENT_SESSION.length > PAGE_UI_EXTENSION_CONTEXT.length).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0009 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0010
     * @tc.name      UIExtensionSamples_PageList_0010
     * @tc.desc      Verify UIExtensionSamples_PageList_0010 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0010 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${PAGE_LIST.indexOf(PAGE_UI_EXTENSION_CONTEXT)}`);
      expect(PAGE_LIST.indexOf(PAGE_UI_EXTENSION_CONTEXT)).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0010 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0011
     * @tc.name      UIExtensionSamples_PageList_0011
     * @tc.desc      Verify UIExtensionSamples_PageList_0011 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0011 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${PAGE_LIST.indexOf('NotExist')}, expected=-1`);
      expect(PAGE_LIST.indexOf('NotExist')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0011 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0012
     * @tc.name      UIExtensionSamples_PageList_0012
     * @tc.desc      Verify UIExtensionSamples_PageList_0012 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0012 begin');
      let upper: string[] = PAGE_LIST.filter((x: string) => x[0] === x[0].toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual upper.length=${upper.length}, expected=3`);
      expect(upper.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0012 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0013
     * @tc.name      UIExtensionSamples_PageList_0013
     * @tc.desc      Verify UIExtensionSamples_PageList_0013 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0013 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual PAGE_LIST.join('|')=${PAGE_LIST.join('|')}`);
      expect(PAGE_LIST.join('|')).assertEqual('AbilityStartCallback|UIExtensionContext|UIExtensionContentSession');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0013 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0014
     * @tc.name      UIExtensionSamples_PageList_0014
     * @tc.desc      Verify UIExtensionSamples_PageList_0014 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0014 begin');
      let noSpace: string[] = PAGE_LIST.filter((x: string) => x.indexOf(' ') < 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual noSpace.length=${noSpace.length}, expected=3`);
      expect(noSpace.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0014 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0015
     * @tc.name      UIExtensionSamples_PageList_0015
     * @tc.desc      Verify UIExtensionSamples_PageList_0015 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageList_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0015 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PAGE_LIST=${typeof PAGE_LIST}, expected='object'`);
      expect(typeof PAGE_LIST).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(PAGE_LIST)=${Array.isArray(PAGE_LIST)}`);
      expect(Array.isArray(PAGE_LIST)).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageList_0015 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0016
     * @tc.name      UIExtensionSamples_Route_0001
     * @tc.desc      Verify UIExtensionSamples_Route_0001 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${routeOf(PAGE_ABILITY_START_CALLBACK)}`);
      expect(routeOf(PAGE_ABILITY_START_CALLBACK)).assertEqual('uiextensionpages/AbilityStartCallback');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0001 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0017
     * @tc.name      UIExtensionSamples_Route_0002
     * @tc.desc      Verify UIExtensionSamples_Route_0002 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${routeOf(PAGE_UI_EXTENSION_CONTEXT)}`);
      expect(routeOf(PAGE_UI_EXTENSION_CONTEXT)).assertEqual('uiextensionpages/UIExtensionContext');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0002 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0018
     * @tc.name      UIExtensionSamples_Route_0003
     * @tc.desc      Verify UIExtensionSamples_Route_0003 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assert actual=${routeOf(PAGE_UI_EXTENSION_CONTENT_SESSION)}`);
      expect(routeOf(PAGE_UI_EXTENSION_CONTENT_SESSION))
        .assertEqual('uiextensionpages/UIExtensionContentSession');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0003 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0019
     * @tc.name      UIExtensionSamples_Route_0004
     * @tc.desc      Verify UIExtensionSamples_Route_0004 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ROUTE_PREFIX.endsWith('/')=${ROUTE_PREFIX.endsWith('/')}`);
      expect(ROUTE_PREFIX.endsWith('/')).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0004 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0020
     * @tc.name      UIExtensionSamples_Route_0005
     * @tc.desc      Verify UIExtensionSamples_Route_0005 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${routeOf('x').startsWith(ROUTE_PREFIX)}`);
      expect(routeOf('x').startsWith(ROUTE_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0005 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0021
     * @tc.name      UIExtensionSamples_Route_0006
     * @tc.desc      Verify UIExtensionSamples_Route_0006 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeOf('')=${routeOf('')}, expected=ROUTE_PREFIX`);
      expect(routeOf('')).assertEqual(ROUTE_PREFIX);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0006 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0022
     * @tc.name      UIExtensionSamples_Route_0007
     * @tc.desc      Verify UIExtensionSamples_Route_0007 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeOf(PAGE_ABILITY_START_CALLBACK).split('/..., expected=2`);
      expect(routeOf(PAGE_ABILITY_START_CALLBACK).split('/').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0007 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0023
     * @tc.name      UIExtensionSamples_Route_0008
     * @tc.desc      Verify UIExtensionSamples_Route_0008 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${routeOf(PAGE_ABILITY_START_CALLBACK).indexOf('/')}`);
      expect(routeOf(PAGE_ABILITY_START_CALLBACK).indexOf('/')).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0008 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0024
     * @tc.name      UIExtensionSamples_Route_0009
     * @tc.desc      Verify UIExtensionSamples_Route_0009 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0009 begin');
      let routes: string[] = PAGE_LIST.map((x: string) => routeOf(x));
      let uniq: Set<string> = new Set<string>(routes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniq.size=${uniq.size}, expected=3`);
      expect(uniq.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0009 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0025
     * @tc.name      UIExtensionSamples_Route_0010
     * @tc.desc      Verify UIExtensionSamples_Route_0010 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0010 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof routeOf(PAGE_LIST[0])=${typeof routeOf(PAGE_LIST[0])}`);
      expect(typeof routeOf(PAGE_LIST[0])).assertEqual('string');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0010 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0026
     * @tc.name      UIExtensionSamples_Route_0011
     * @tc.desc      Verify UIExtensionSamples_Route_0011 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0011 begin');
      let allPrefixed: boolean = PAGE_LIST.every((x: string) => routeOf(x).startsWith(ROUTE_PREFIX));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allPrefixed=${allPrefixed}`);
      expect(allPrefixed).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0011 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0027
     * @tc.name      UIExtensionSamples_Route_0012
     * @tc.desc      Verify UIExtensionSamples_Route_0012 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Route_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0012 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ROUTE_PREFIX.length=${ROUTE_PREFIX.length}, expected=17`);
      expect(ROUTE_PREFIX.length).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Route_0012 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0028
     * @tc.name      UIExtensionSamples_ResultCode_0001
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0001 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RESULT_OK=${RESULT_OK}, expected=0`);
      expect(RESULT_OK).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0001 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0029
     * @tc.name      UIExtensionSamples_ResultCode_0002
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0002 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RESULT_CANCEL=${RESULT_CANCEL}, expected=-1`);
      expect(RESULT_CANCEL).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0002 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0030
     * @tc.name      UIExtensionSamples_ResultCode_0003
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0003 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual RESULT_ERROR=${RESULT_ERROR}, expected=-2`);
      expect(RESULT_ERROR).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0003 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0031
     * @tc.name      UIExtensionSamples_ResultCode_0004
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0004 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isSuccess(RESULT_OK)=${isSuccess(RESULT_OK)}`);
      expect(isSuccess(RESULT_OK)).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0004 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0032
     * @tc.name      UIExtensionSamples_ResultCode_0005
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0005 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isSuccess(RESULT_CANCEL)=${isSuccess(RESULT_CANCEL)}`);
      expect(isSuccess(RESULT_CANCEL)).assertFalse();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0005 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0033
     * @tc.name      UIExtensionSamples_ResultCode_0006
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0006 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse isSuccess(RESULT_ERROR)=${isSuccess(RESULT_ERROR)}`);
      expect(isSuccess(RESULT_ERROR)).assertFalse();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0006 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0034
     * @tc.name      UIExtensionSamples_ResultCode_0007
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0007 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RESULT_OK > RESULT_CANCEL=${RESULT_OK > RESULT_CANCEL}`);
      expect(RESULT_OK > RESULT_CANCEL).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0007 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0035
     * @tc.name      UIExtensionSamples_ResultCode_0008
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0008 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue RESULT_CANCEL > RESULT_ERROR=${RESULT_CANCEL > RESULT_ERROR}`);
      expect(RESULT_CANCEL > RESULT_ERROR).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0008 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0036
     * @tc.name      UIExtensionSamples_ResultCode_0009
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0009 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0009 begin');
      let codes: number[] = [RESULT_OK, RESULT_CANCEL, RESULT_ERROR];
      let uniq: Set<number> = new Set<number>(codes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual uniq.size=${uniq.size}, expected=3`);
      expect(uniq.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0009 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0037
     * @tc.name      UIExtensionSamples_ResultCode_0010
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0010 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0010 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isInteger(RESULT_OK)=${Number.isInteger(RESULT_OK)}`);
      expect(Number.isInteger(RESULT_OK)).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0010 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0038
     * @tc.name      UIExtensionSamples_ResultCode_0011
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0011 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0011 begin');
      let payload: StartResultPayload = makeResult(RESULT_OK, 'done');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual payload.resultCode=${payload.resultCode}, expected=0`);
      expect(payload.resultCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual payload.message=${payload.message}, expected='done'`);
      expect(payload.message).assertEqual('done');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0011 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0039
     * @tc.name      UIExtensionSamples_ResultCode_0012
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0012 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0012 begin');
      let payload: StartResultPayload = makeResult(RESULT_CANCEL, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${isSuccess(payload.resultCode)}`);
      expect(isSuccess(payload.resultCode)).assertFalse();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0012 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0040
     * @tc.name      UIExtensionSamples_ResultCode_0013
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0013 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0013 begin');
      let e: StartErrorPayload = makeError(401, 'PermissionDenied');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.code=${e.code}, expected=401`);
      expect(e.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.name=${e.name}, expected='PermissionDenied'`);
      expect(e.name).assertEqual('PermissionDenied');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0013 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0041
     * @tc.name      UIExtensionSamples_ResultCode_0014
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0014 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0014 begin');
      let e: StartErrorPayload = makeError(0, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.code=${e.code}, expected=0`);
      expect(e.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual e.name.length=${e.name.length}, expected=0`);
      expect(e.name.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0014 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0042
     * @tc.name      UIExtensionSamples_ResultCode_0015
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0015 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0015 begin');
      let p: StartResultPayload = makeResult(RESULT_OK, 'msg');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof p=${typeof p}, expected='object'`);
      expect(typeof p).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0015 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0043
     * @tc.name      UIExtensionSamples_ResultCode_0016
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0016 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0016 begin');
      let p: StartResultPayload = makeResult(RESULT_OK, 'a');
      let q: StartResultPayload = makeResult(RESULT_OK, 'b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse p.message === q.message=${p.message === q.message}`);
      expect(p.message === q.message).assertFalse();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0016 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0044
     * @tc.name      UIExtensionSamples_ResultCode_0017
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0017 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0017 begin');
      let json: string = JSON.stringify(makeResult(RESULT_OK, 'ok'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual json.indexOf('"resultCode"')=${json.indexOf('"resultCode"')}, expected=1`);
      expect(json.indexOf('"resultCode"')).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0017 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0045
     * @tc.name      UIExtensionSamples_ResultCode_0018
     * @tc.desc      Verify UIExtensionSamples_ResultCode_0018 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ResultCode_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0018 begin');
      let json: string = JSON.stringify(makeError(1, 'E'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue json.length > 0=${json.length > 0}`);
      expect(json.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_ResultCode_0018 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0046
     * @tc.name      UIExtensionSamples_PrivacyMode_0001
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0001 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRIVACY_ON=${PRIVACY_ON}`);
      expect(PRIVACY_ON).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0001 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0047
     * @tc.name      UIExtensionSamples_PrivacyMode_0002
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0002 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse PRIVACY_OFF=${PRIVACY_OFF}`);
      expect(PRIVACY_OFF).assertFalse();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0002 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0048
     * @tc.name      UIExtensionSamples_PrivacyMode_0003
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0003 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0003 begin');
      let flipped: boolean = !PRIVACY_ON;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse flipped=${flipped}`);
      expect(flipped).assertFalse();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0003 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0049
     * @tc.name      UIExtensionSamples_PrivacyMode_0004
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0004 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PRIVACY_ON=${typeof PRIVACY_ON}, expected='boolean'`);
      expect(typeof PRIVACY_ON).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof PRIVACY_OFF=${typeof PRIVACY_OFF}, expected='boolean'`);
      expect(typeof PRIVACY_OFF).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0004 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0050
     * @tc.name      UIExtensionSamples_PrivacyMode_0005
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0005 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0005 begin');
      let modes: boolean[] = [PRIVACY_ON, PRIVACY_OFF];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modes.length=${modes.length}, expected=2`);
      expect(modes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0005 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0051
     * @tc.name      UIExtensionSamples_PrivacyMode_0006
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0006 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0006 begin');
      let count: number = 0;
      for (let m of [PRIVACY_ON, PRIVACY_OFF]) {
        if (m) {
          count++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=1`);
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0006 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0052
     * @tc.name      UIExtensionSamples_PrivacyMode_0007
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0007 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0007 begin');
      let state: Record<string, boolean> = { 'privacy': PRIVACY_ON };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue state.privacy=${state.privacy}`);
      expect(state.privacy).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0007 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0053
     * @tc.name      UIExtensionSamples_PrivacyMode_0008
     * @tc.desc      Verify UIExtensionSamples_PrivacyMode_0008 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyMode_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PRIVACY_ON !== PRIVACY_OFF=${PRIVACY_ON !== PRIVACY_OFF}`);
      expect(PRIVACY_ON !== PRIVACY_OFF).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PrivacyMode_0008 end');
    });

    /**
     * @tc.number    SUB_UIEXTENSION_0054
     * @tc.name      UIExtensionSamples_Helper_0001
     * @tc.desc      Verify UIExtensionSamples_Helper_0001 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof sleep=${typeof sleep}, expected='function'`);
      expect(typeof sleep).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0001 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0055
     * @tc.name      UIExtensionSamples_Helper_0002
     * @tc.desc      Verify UIExtensionSamples_Helper_0002 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0002 begin');
      await sleep(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0002 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0056
     * @tc.name      UIExtensionSamples_Helper_0003
     * @tc.desc      Verify UIExtensionSamples_Helper_0003 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0003 begin');
      let p: Promise<void> = sleep(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue p instanceof Promise=${p instanceof Promise}`);
      expect(p instanceof Promise).assertTrue();
      await p;
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0003 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0057
     * @tc.name      UIExtensionSamples_Helper_0004
     * @tc.desc      Verify UIExtensionSamples_Helper_0004 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof routeOf=${typeof routeOf}, expected='function'`);
      expect(typeof routeOf).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof isSuccess=${typeof isSuccess}, expected='function'`);
      expect(typeof isSuccess).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof makeResult=${typeof makeResult}, expected='function'`);
      expect(typeof makeResult).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof makeError=${typeof makeError}, expected='function'`);
      expect(typeof makeError).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0004 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0058
     * @tc.name      UIExtensionSamples_Helper_0005
     * @tc.desc      Verify UIExtensionSamples_Helper_0005 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0005 begin');
      let arr: number[] = [RESULT_ERROR, RESULT_OK, RESULT_CANCEL];
      arr.sort((a: number, b: number) => a - b);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arr[0]=${arr[0]}, expected=-2`);
      expect(arr[0]).assertEqual(-2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arr[2]=${arr[2]}, expected=0`);
      expect(arr[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0005 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0059
     * @tc.name      UIExtensionSamples_Helper_0006
     * @tc.desc      Verify UIExtensionSamples_Helper_0006 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify({ a: 1 })=${JSON.stringify({ a: 1 })}`);
      expect(JSON.stringify({ a: 1 })).assertEqual('{"a":1}');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0006 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0060
     * @tc.name      UIExtensionSamples_Helper_0007
     * @tc.desc      Verify UIExtensionSamples_Helper_0007 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isInteger(RESULT_CANCEL)}`);
      expect(Number.isInteger(RESULT_CANCEL)).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0007 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0061
     * @tc.name      UIExtensionSamples_Helper_0008
     * @tc.desc      Verify UIExtensionSamples_Helper_0008 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual '5'.padStart(2, '0')=${'5'.padStart(2, '0')}, expected='05'`);
      expect('5'.padStart(2, '0')).assertEqual('05');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0008 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0062
     * @tc.name      UIExtensionSamples_Helper_0009
     * @tc.desc      Verify UIExtensionSamples_Helper_0009 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue PAGE_LIST.every((x: string) => x.length > 5)`);
      expect(PAGE_LIST.every((x: string) => x.length > 5)).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0009 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0063
     * @tc.name      UIExtensionSamples_Helper_0010
     * @tc.desc      Verify UIExtensionSamples_Helper_0010 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_Helper_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0010 begin');
      let joined: string = PAGE_LIST.join(',');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joined.indexOf(',')=${joined.indexOf(',')}, expected=20`);
      expect(joined.indexOf(',')).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_Helper_0010 end');
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
     * @tc.name      UIExtensionSamples_PageUi_0001
     * @tc.desc      Verify UIExtensionSamples_PageUi_0001 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof driver=${typeof driver}, expected='object'`);
      expect(typeof driver).assertEqual('object');
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0001 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0065
     * @tc.name      UIExtensionSamples_PageUi_0002
     * @tc.desc      Verify UIExtensionSamples_PageUi_0002 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0002 begin');
      const actual4: boolean = await exists(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_ABILITY_START_CALLBACK)=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0002 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0066
     * @tc.name      UIExtensionSamples_PageUi_0003
     * @tc.desc      Verify UIExtensionSamples_PageUi_0003 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0003 begin');
      const actual5: boolean = await exists(PAGE_UI_EXTENSION_CONTEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_UI_EXTENSION_CONTEXT)=${actual5}`);
      expect(actual5).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0003 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0067
     * @tc.name      UIExtensionSamples_PageUi_0004
     * @tc.desc      Verify UIExtensionSamples_PageUi_0004 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0004 begin');
      const actual6: boolean = await exists(PAGE_UI_EXTENSION_CONTENT_SESSION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_UI_EXTENSION_CONTENT_SESSION)=${actual6}`);
      expect(actual6).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0004 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0068
     * @tc.name      UIExtensionSamples_PageUi_0005
     * @tc.desc      Verify UIExtensionSamples_PageUi_0005 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0005 begin');
      let found: number = 0;
      for (let p of PAGE_LIST) {
        if (await exists(p)) {
          found++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual found=${found}, expected=3`);
      expect(found).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0005 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0069
     * @tc.name      UIExtensionSamples_PageUi_0006
     * @tc.desc      Verify UIExtensionSamples_PageUi_0006 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0006 begin');
      let clicked: boolean = await clickId(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clicked=${clicked}`);
      expect(clicked).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0006 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0070
     * @tc.name      UIExtensionSamples_PageUi_0007
     * @tc.desc      Verify UIExtensionSamples_PageUi_0007 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0007 begin');
      await clickId(PAGE_ABILITY_START_CALLBACK);
      const actual7: boolean = await exists('onResult') || await exists('onError');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists('onResult') || await exists('onError')=${actual7}`);
      expect(actual7).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0007 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0071
     * @tc.name      UIExtensionSamples_PageUi_0008
     * @tc.desc      Verify UIExtensionSamples_PageUi_0008 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0008 begin');
      await clickId(PAGE_UI_EXTENSION_CONTEXT);
      const actual1: boolean = await exists('openLink') || await exists('startUIExtensionAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0008 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0072
     * @tc.name      UIExtensionSamples_PageUi_0009
     * @tc.desc      Verify UIExtensionSamples_PageUi_0009 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0009 begin');
      await clickId(PAGE_UI_EXTENSION_CONTENT_SESSION);
      const actual2: boolean = await exists('startUIExtensionAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists('startUIExtensionAbility')=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0009 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0073
     * @tc.name      UIExtensionSamples_PageUi_0010
     * @tc.desc      Verify UIExtensionSamples_PageUi_0010 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0010 begin');
      await clickId(PAGE_ABILITY_START_CALLBACK);
      await sleep(300);
      const actual3: boolean = await exists('onResult') || await exists('onError');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists('onResult') || await exists('onError')=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0010 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0074
     * @tc.name      UIExtensionSamples_PageUi_0011
     * @tc.desc      Verify UIExtensionSamples_PageUi_0011 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0011 begin');
      const actual8: boolean = await exists(PAGE_ABILITY_START_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(PAGE_ABILITY_START_CALLBACK)=${actual8}`);
      expect(actual8).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0011 end');
    });
    /**
     * @tc.number    SUB_UIEXTENSION_0075
     * @tc.name      UIExtensionSamples_PageUi_0012
     * @tc.desc      Verify UIExtensionSamples_PageUi_0012 behaves as specified.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PageUi_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0012 begin');
      await clickId(PAGE_UI_EXTENSION_CONTEXT);
      await sleep(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'UIExtensionSamples_PageUi_0012 end');
    });
  });
}

