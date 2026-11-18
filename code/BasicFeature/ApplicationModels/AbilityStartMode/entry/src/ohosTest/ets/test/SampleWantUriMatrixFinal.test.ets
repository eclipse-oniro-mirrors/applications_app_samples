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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';
import { uri } from '@kit.ArkTS';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function sampleWantUriMatrixFinalTest(): void {
  describe('SampleWantUriMatrixFinalTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0241
     * @tc.name      sampleWantUriMatrix0241
     * @tc.desc      Want(https + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0241 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0241 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0242
     * @tc.name      sampleWantUriMatrix0242
     * @tc.desc      Want(sample + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0242 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0242 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0243
     * @tc.name      sampleWantUriMatrix0243
     * @tc.desc      Want(http + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0243 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0243 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0244
     * @tc.name      sampleWantUriMatrix0244
     * @tc.desc      Want(https + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0244 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0244 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0245
     * @tc.name      sampleWantUriMatrix0245
     * @tc.desc      Want(sample + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0245 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0245 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0246
     * @tc.name      sampleWantUriMatrix0246
     * @tc.desc      Want(file + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0246 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0246 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0247
     * @tc.name      sampleWantUriMatrix0247
     * @tc.desc      Want(https + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0247 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0247 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0248
     * @tc.name      sampleWantUriMatrix0248
     * @tc.desc      Want(sample + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0248 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0248 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0249
     * @tc.name      sampleWantUriMatrix0249
     * @tc.desc      Want(http + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0249 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0249 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0250
     * @tc.name      sampleWantUriMatrix0250
     * @tc.desc      Want(https + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0250 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0250 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0251
     * @tc.name      sampleWantUriMatrix0251
     * @tc.desc      Want(sample + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0251 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0251 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0252
     * @tc.name      sampleWantUriMatrix0252
     * @tc.desc      Want(file + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0252 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0252 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0253
     * @tc.name      sampleWantUriMatrix0253
     * @tc.desc      Want(https + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0253 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0253 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0254
     * @tc.name      sampleWantUriMatrix0254
     * @tc.desc      Want(sample + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0254 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0254 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0255
     * @tc.name      sampleWantUriMatrix0255
     * @tc.desc      Want(http + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0255 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0255 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0256
     * @tc.name      sampleWantUriMatrix0256
     * @tc.desc      Want(https + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0256 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0256 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0257
     * @tc.name      sampleWantUriMatrix0257
     * @tc.desc      Want(sample + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0257 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0257 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0258
     * @tc.name      sampleWantUriMatrix0258
     * @tc.desc      Want(file + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0258 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0258 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0259
     * @tc.name      sampleWantUriMatrix0259
     * @tc.desc      Want(https + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0259 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0259 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0260
     * @tc.name      sampleWantUriMatrix0260
     * @tc.desc      Want(sample + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0260 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0260 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0261
     * @tc.name      sampleWantUriMatrix0261
     * @tc.desc      Want(http + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0261 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0261 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0262
     * @tc.name      sampleWantUriMatrix0262
     * @tc.desc      Want(https + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0262 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0262 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0263
     * @tc.name      sampleWantUriMatrix0263
     * @tc.desc      Want(sample + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0263 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0263 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0264
     * @tc.name      sampleWantUriMatrix0264
     * @tc.desc      Want(file + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0264 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0264 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0265
     * @tc.name      sampleWantUriMatrix0265
     * @tc.desc      Want(https + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0265 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0265 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0266
     * @tc.name      sampleWantUriMatrix0266
     * @tc.desc      Want(sample + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0266 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0266 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0267
     * @tc.name      sampleWantUriMatrix0267
     * @tc.desc      Want(http + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0267 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0267 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0268
     * @tc.name      sampleWantUriMatrix0268
     * @tc.desc      Want(https + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0268 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0268 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0269
     * @tc.name      sampleWantUriMatrix0269
     * @tc.desc      Want(sample + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0269 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0269 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0270
     * @tc.name      sampleWantUriMatrix0270
     * @tc.desc      Want(file + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0270 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0270 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0271
     * @tc.name      sampleWantUriMatrix0271
     * @tc.desc      Want(https + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0271 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0271 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0272
     * @tc.name      sampleWantUriMatrix0272
     * @tc.desc      Want(sample + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0272 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0272 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0273
     * @tc.name      sampleWantUriMatrix0273
     * @tc.desc      Want(http + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0273 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0273 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0274
     * @tc.name      sampleWantUriMatrix0274
     * @tc.desc      Want(https + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0274 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0274 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0275
     * @tc.name      sampleWantUriMatrix0275
     * @tc.desc      Want(sample + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0275 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0275 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0276
     * @tc.name      sampleWantUriMatrix0276
     * @tc.desc      Want(file + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0276 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0276 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0277
     * @tc.name      sampleWantUriMatrix0277
     * @tc.desc      Want(https + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0277 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0277 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0278
     * @tc.name      sampleWantUriMatrix0278
     * @tc.desc      Want(sample + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0278 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0278 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0279
     * @tc.name      sampleWantUriMatrix0279
     * @tc.desc      Want(http + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0279 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0279 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0280
     * @tc.name      sampleWantUriMatrix0280
     * @tc.desc      Want(https + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0280 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample/detail';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/sample/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0280 end');
    })
  })
}
