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
import { identifier } from '@kit.AdsKit';
import { abilityAccessCtrl, bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidApiMatrixTest(): void {
  describe('OaidApiMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_OAID_API_0001
     * @tc.name      oaidApiMatrix0001
     * @tc.desc      getOAID promise 形态返回 36 位带连字符的标识
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0001 begin');
      const oaid: string = await identifier.getOAID();
      const actual1: string = typeof oaid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 oaid.length=${oaid.length}`);
      expect(oaid.length).assertEqual(36);
      const actual3: number = oaid.split('-').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(5);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_API_0002
     * @tc.name      oaidApiMatrix0002
     * @tc.desc      连续两次 getOAID 返回一致的标识
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0002 begin');
      const first: string = await identifier.getOAID();
      const second: string = await identifier.getOAID();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 first=${first}`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 first.length=${first.length}`);
      expect(first.length).assertEqual(36);
      const actual3: number = first.split('-')[0].length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(8);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_API_0003
     * @tc.name      oaidApiMatrix0003
     * @tc.desc      getOAID callback 形态回调首个入参为 BusinessError
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0003 begin');
      let callbackOaid: string = '';
      identifier.getOAID((err: BusinessError, data: string) => {
        hilog.info(DOMAIN, TAG, '%{public}s', `callback code=${err.code}`);
        callbackOaid = data;
      });
      for (let i = 0; i < 20 && callbackOaid.length === 0; i++) {
        await new Promise<void>((resolve: () => void) => {
          setTimeout(resolve, 200);
        });
      }
      const actual1: string = typeof callbackOaid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 callbackOaid.length=${callbackOaid.length}`);
      expect(callbackOaid.length).assertEqual(36);
      const actual3: number = callbackOaid.split('-').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(5);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_API_0004
     * @tc.name      oaidApiMatrix0004
     * @tc.desc      callback 与 promise 两种形态拿到同一个标识
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0004 begin');
      let callbackValue: string = '';
      identifier.getOAID((err: BusinessError, data: string) => {
        callbackValue = data;
      });
      const promiseValue: string = await identifier.getOAID();
      for (let i = 0; i < 20 && callbackValue.length === 0; i++) {
        await new Promise<void>((resolve: () => void) => {
          setTimeout(resolve, 200);
        });
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 callbackValue=${callbackValue}`);
      expect(callbackValue).assertEqual(promiseValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 callbackValue.length=${callbackValue.length}`);
      expect(callbackValue.length).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 promiseValue.length=${promiseValue.length}`);
      expect(promiseValue.length).assertEqual(36);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_API_0005
     * @tc.name      oaidApiMatrix0005
     * @tc.desc      未授权场景返回的全零标识结构合法
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0005 begin');
      const zeroText: string = '00000000-0000-0000-0000-000000000000';
      const sections: Array<string> = zeroText.split('-');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 sections.length=${sections.length}`);
      expect(sections.length).assertEqual(5);
      const actual2: boolean = sections.every((s: string) => s.length === 4 || s.length === 8 || s.length === 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 zeroText.length=${zeroText.length}`);
      expect(zeroText.length).assertEqual(36);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_API_0006
     * @tc.name      oaidApiMatrix0006
     * @tc.desc      APP_TRACKING_CONSENT 授权状态与 getOAID 结果同时可取
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0006 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus =
        atManager.checkAccessTokenSync(info.appInfo.accessTokenId, 'ohos.permission.APP_TRACKING_CONSENT');
      const oaid: string = await identifier.getOAID();
      const actual1: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: string = typeof oaid;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 oaid.length=${oaid.length}`);
      expect(oaid.length).assertEqual(36);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_API_0007
     * @tc.name      oaidApiMatrix0007
     * @tc.desc      getOAID 返回值符合 8-4-4-4-12 分段
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('oaidApiMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0007 begin');
      const oaid: string = await identifier.getOAID();
      const parts: Array<string> = oaid.split('-');
      const actual1: number = parts[0].length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(8);
      const actual2: number = parts[1].length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(4);
      const actual3: number = parts[2].length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      const actual4: number = parts[3].length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(4);
      const actual5: number = parts[4].length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual(12);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidApiMatrix0007 end');
    })
  })
}
