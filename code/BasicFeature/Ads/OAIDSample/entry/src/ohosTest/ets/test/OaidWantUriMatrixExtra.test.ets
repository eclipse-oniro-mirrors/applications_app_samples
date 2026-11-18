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
const TAG: string = '[Sample_OAID]';

export default function oaidWantUriMatrixExtraTest(): void {
  describe('OaidWantUriMatrixExtraTest', () => {
    /**
     * @tc.number    SUB_OAID_WANT_URI_0161
     * @tc.name      oaidWantUriMatrix0161
     * @tc.desc      Want(oaid + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0161 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0161 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0162
     * @tc.name      oaidWantUriMatrix0162
     * @tc.desc      Want(file + viewData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0162 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0162 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0163
     * @tc.name      oaidWantUriMatrix0163
     * @tc.desc      Want(https + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0163 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0163 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0164
     * @tc.name      oaidWantUriMatrix0164
     * @tc.desc      Want(oaid + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0164 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0164 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0165
     * @tc.name      oaidWantUriMatrix0165
     * @tc.desc      Want(http + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0165 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0165 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0166
     * @tc.name      oaidWantUriMatrix0166
     * @tc.desc      Want(https + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0166 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'https://example.com/oaid/detail';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0166 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0167
     * @tc.name      oaidWantUriMatrix0167
     * @tc.desc      Want(oaid + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0167 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0167 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0168
     * @tc.name      oaidWantUriMatrix0168
     * @tc.desc      Want(file + viewData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0168 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0168 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0169
     * @tc.name      oaidWantUriMatrix0169
     * @tc.desc      Want(https + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0169 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0169 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0170
     * @tc.name      oaidWantUriMatrix0170
     * @tc.desc      Want(oaid + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0170 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0170 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0171
     * @tc.name      oaidWantUriMatrix0171
     * @tc.desc      Want(http + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0171 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0171 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0172
     * @tc.name      oaidWantUriMatrix0172
     * @tc.desc      Want(https + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0172 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid/detail';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0172 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0173
     * @tc.name      oaidWantUriMatrix0173
     * @tc.desc      Want(oaid + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0173 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0173 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0174
     * @tc.name      oaidWantUriMatrix0174
     * @tc.desc      Want(file + sendData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0174 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0174 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0175
     * @tc.name      oaidWantUriMatrix0175
     * @tc.desc      Want(https + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0175 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0175 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0176
     * @tc.name      oaidWantUriMatrix0176
     * @tc.desc      Want(oaid + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0176 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0176 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0177
     * @tc.name      oaidWantUriMatrix0177
     * @tc.desc      Want(http + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0177 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0177 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0178
     * @tc.name      oaidWantUriMatrix0178
     * @tc.desc      Want(https + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0178 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid/detail';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0178 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0179
     * @tc.name      oaidWantUriMatrix0179
     * @tc.desc      Want(oaid + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0179 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0179 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0180
     * @tc.name      oaidWantUriMatrix0180
     * @tc.desc      Want(file + sendData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0180 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0180 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0181
     * @tc.name      oaidWantUriMatrix0181
     * @tc.desc      Want(https + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0181 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0181 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0182
     * @tc.name      oaidWantUriMatrix0182
     * @tc.desc      Want(oaid + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0182 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0182 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0183
     * @tc.name      oaidWantUriMatrix0183
     * @tc.desc      Want(http + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0183 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0183 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0184
     * @tc.name      oaidWantUriMatrix0184
     * @tc.desc      Want(https + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0184 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid/detail';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0184 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0185
     * @tc.name      oaidWantUriMatrix0185
     * @tc.desc      Want(oaid + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0185 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0185 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0186
     * @tc.name      oaidWantUriMatrix0186
     * @tc.desc      Want(file + sendData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0186 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0186 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0187
     * @tc.name      oaidWantUriMatrix0187
     * @tc.desc      Want(https + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0187 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0187 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0188
     * @tc.name      oaidWantUriMatrix0188
     * @tc.desc      Want(oaid + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0188 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0188 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0189
     * @tc.name      oaidWantUriMatrix0189
     * @tc.desc      Want(http + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0189 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0189 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0190
     * @tc.name      oaidWantUriMatrix0190
     * @tc.desc      Want(https + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0190 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid/detail';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0190 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0191
     * @tc.name      oaidWantUriMatrix0191
     * @tc.desc      Want(oaid + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0191 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0191 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0192
     * @tc.name      oaidWantUriMatrix0192
     * @tc.desc      Want(file + sendData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0192 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0192 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0193
     * @tc.name      oaidWantUriMatrix0193
     * @tc.desc      Want(https + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0193 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0193 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0194
     * @tc.name      oaidWantUriMatrix0194
     * @tc.desc      Want(oaid + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0194 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0194 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0195
     * @tc.name      oaidWantUriMatrix0195
     * @tc.desc      Want(http + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0195 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0195 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0196
     * @tc.name      oaidWantUriMatrix0196
     * @tc.desc      Want(https + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0196 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid/detail';
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
      expect(parsedPath).assertEqual('/oaid/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0196 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0197
     * @tc.name      oaidWantUriMatrix0197
     * @tc.desc      Want(oaid + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0197 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0197 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0198
     * @tc.name      oaidWantUriMatrix0198
     * @tc.desc      Want(file + sendToData + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0198 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
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
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0198 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0199
     * @tc.name      oaidWantUriMatrix0199
     * @tc.desc      Want(https + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0199 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid?from=test';
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
      expect(parsedPath).assertEqual('/oaid');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0199 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0200
     * @tc.name      oaidWantUriMatrix0200
     * @tc.desc      Want(oaid + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0200 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples/page?index=1';
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
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0200 end');
    })
  })
}
