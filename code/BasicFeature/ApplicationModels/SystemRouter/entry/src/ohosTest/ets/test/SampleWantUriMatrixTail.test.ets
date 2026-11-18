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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';
import { uri } from '@kit.ArkTS';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemRouter]';

export default function sampleWantUriMatrixTailTest(): void {
  describe('SampleWantUriMatrixTailTest', () => {
    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0121
     * @tc.name      sampleWantUriMatrix0121
     * @tc.desc      Want(https + viewData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0121 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0121 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0122
     * @tc.name      sampleWantUriMatrix0122
     * @tc.desc      Want(sample + viewData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0122 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0122 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0123
     * @tc.name      sampleWantUriMatrix0123
     * @tc.desc      Want(http + viewData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0123 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0123 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0124
     * @tc.name      sampleWantUriMatrix0124
     * @tc.desc      Want(https + viewData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0124 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0124 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0125
     * @tc.name      sampleWantUriMatrix0125
     * @tc.desc      Want(sample + viewData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0125 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0125 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0126
     * @tc.name      sampleWantUriMatrix0126
     * @tc.desc      Want(file + viewData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0126 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0126 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0127
     * @tc.name      sampleWantUriMatrix0127
     * @tc.desc      Want(https + viewData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0127 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0127 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0128
     * @tc.name      sampleWantUriMatrix0128
     * @tc.desc      Want(sample + viewData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0128 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0128 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0129
     * @tc.name      sampleWantUriMatrix0129
     * @tc.desc      Want(http + viewData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0129 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0129 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0130
     * @tc.name      sampleWantUriMatrix0130
     * @tc.desc      Want(https + viewData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0130 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0130 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0131
     * @tc.name      sampleWantUriMatrix0131
     * @tc.desc      Want(sample + viewData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0131 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0131 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0132
     * @tc.name      sampleWantUriMatrix0132
     * @tc.desc      Want(file + viewData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0132 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0132 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0133
     * @tc.name      sampleWantUriMatrix0133
     * @tc.desc      Want(https + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0133 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0133 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0134
     * @tc.name      sampleWantUriMatrix0134
     * @tc.desc      Want(sample + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0134 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0134 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0135
     * @tc.name      sampleWantUriMatrix0135
     * @tc.desc      Want(http + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0135 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0135 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0136
     * @tc.name      sampleWantUriMatrix0136
     * @tc.desc      Want(https + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0136 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0136 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0137
     * @tc.name      sampleWantUriMatrix0137
     * @tc.desc      Want(sample + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0137 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0137 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0138
     * @tc.name      sampleWantUriMatrix0138
     * @tc.desc      Want(file + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0138 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0138 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0139
     * @tc.name      sampleWantUriMatrix0139
     * @tc.desc      Want(https + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0139 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0139 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0140
     * @tc.name      sampleWantUriMatrix0140
     * @tc.desc      Want(sample + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0140 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0140 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0141
     * @tc.name      sampleWantUriMatrix0141
     * @tc.desc      Want(http + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0141 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0141 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0142
     * @tc.name      sampleWantUriMatrix0142
     * @tc.desc      Want(https + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0142 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0142 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0143
     * @tc.name      sampleWantUriMatrix0143
     * @tc.desc      Want(sample + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0143 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0143 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0144
     * @tc.name      sampleWantUriMatrix0144
     * @tc.desc      Want(file + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0144 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0144 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0145
     * @tc.name      sampleWantUriMatrix0145
     * @tc.desc      Want(https + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0145 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0145 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0146
     * @tc.name      sampleWantUriMatrix0146
     * @tc.desc      Want(sample + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0146 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0146 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0147
     * @tc.name      sampleWantUriMatrix0147
     * @tc.desc      Want(http + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0147 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0147 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0148
     * @tc.name      sampleWantUriMatrix0148
     * @tc.desc      Want(https + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0148 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0148 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0149
     * @tc.name      sampleWantUriMatrix0149
     * @tc.desc      Want(sample + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0149 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0149 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0150
     * @tc.name      sampleWantUriMatrix0150
     * @tc.desc      Want(file + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0150 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0150 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0151
     * @tc.name      sampleWantUriMatrix0151
     * @tc.desc      Want(https + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0151 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0151 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0152
     * @tc.name      sampleWantUriMatrix0152
     * @tc.desc      Want(sample + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0152 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0152 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0153
     * @tc.name      sampleWantUriMatrix0153
     * @tc.desc      Want(http + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0153 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0153 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0154
     * @tc.name      sampleWantUriMatrix0154
     * @tc.desc      Want(https + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0154 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0154 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0155
     * @tc.name      sampleWantUriMatrix0155
     * @tc.desc      Want(sample + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0155 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0155 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0156
     * @tc.name      sampleWantUriMatrix0156
     * @tc.desc      Want(file + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0156 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0156 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0157
     * @tc.name      sampleWantUriMatrix0157
     * @tc.desc      Want(https + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0157 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0157 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0158
     * @tc.name      sampleWantUriMatrix0158
     * @tc.desc      Want(sample + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0158 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0158 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0159
     * @tc.name      sampleWantUriMatrix0159
     * @tc.desc      Want(http + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0159 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0159 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_WANT_URI_0160
     * @tc.name      sampleWantUriMatrix0160
     * @tc.desc      Want(https + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0160 begin');
      const wantBundle: string = 'com.samples.systemrouter.hara';
      const wantAbility: string = 'EntryAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0160 end');
    })
  })
}
