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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Want, OpenLinkOptions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkObservation,
  observeOpenLinkRaw
} from './LinkHelper';
import { ENTRY_ABILITY, launchAbility } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';

export default function openLinkErrorMatrixTest(): void {
  describe('UniversalLinkOpenLinkErrorMatrixTest', () => {
    beforeAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await launchAbility(ENTRY_ABILITY);
      done();
    })

    afterAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await closeOpenLinkAbility();
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0001
     * @tc.name      testOpenLinkErrorMatrix0001
     * @tc.desc      openLink 的 link 为 undefined 时同步抛参数错误
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0001 begin');
      const badLink: ESObject = undefined;
      let code: number = 0;
      try {
        await observeOpenLinkRaw(badLink);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0002
     * @tc.name      testOpenLinkErrorMatrix0002
     * @tc.desc      openLink 的 link 为 null 时同步抛参数错误
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0002 begin');
      const badLink: ESObject = null;
      let code: number = 0;
      try {
        await observeOpenLinkRaw(badLink);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0003
     * @tc.name      testOpenLinkErrorMatrix0003
     * @tc.desc      openLink 的 link 为 number 时同步抛参数错误
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0003 begin');
      const badLink: ESObject = 123;
      let code: number = 0;
      try {
        await observeOpenLinkRaw(badLink);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0004
     * @tc.name      testOpenLinkErrorMatrix0004
     * @tc.desc      openLink 的 link 为 object 时同步抛参数错误
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0004 begin');
      const badLink: ESObject = JSON.parse('{}');
      let code: number = 0;
      try {
        await observeOpenLinkRaw(badLink);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0005
     * @tc.name      testOpenLinkErrorMatrix0005
     * @tc.desc      openLink 的 link 为 空串 时同步抛参数错误
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0005 begin');
      const badLink: ESObject = '';
      let code: number = 0;
      try {
        await observeOpenLinkRaw(badLink);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0006
     * @tc.name      testOpenLinkErrorMatrix0006
     * @tc.desc      openLink 的 openLinkOptions appId 类型错误 时未知字段被忽略，拉起行为不受影响
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0006 begin');
      const badOptions: ESObject = JSON.parse('{"appId":123}');
      let code: number = 0;
      try {
        await observeOpenLinkRaw('http://docs.openharmony.cn', badOptions);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0007
     * @tc.name      testOpenLinkErrorMatrix0007
     * @tc.desc      openLink 的 openLinkOptions appId 空串 时未知字段被忽略，拉起行为不受影响
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0007 begin');
      const badOptions: ESObject = JSON.parse('{"appId":""}');
      let code: number = 0;
      try {
        await observeOpenLinkRaw('http://docs.openharmony.cn', badOptions);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0008
     * @tc.name      testOpenLinkErrorMatrix0008
     * @tc.desc      openLink 的 openLinkOptions preferPkg 类型错误 时未知字段被忽略，拉起行为不受影响
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0008 begin');
      const badOptions: ESObject = JSON.parse('{"preferPkg":123}');
      let code: number = 0;
      try {
        await observeOpenLinkRaw('http://docs.openharmony.cn', badOptions);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0009
     * @tc.name      testOpenLinkErrorMatrix0009
     * @tc.desc      openLink 的 openLinkOptions forceOpenBrowser 类型错误 时未知字段被忽略，拉起行为不受影响
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0009 begin');
      const badOptions: ESObject = JSON.parse('{"forceOpenBrowser":"yes"}');
      let code: number = 0;
      try {
        await observeOpenLinkRaw('http://docs.openharmony.cn', badOptions);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_ERROR_0010
     * @tc.name      testOpenLinkErrorMatrix0010
     * @tc.desc      openLink 的 openLinkOptions options 字段类型错误 时未知字段被忽略，拉起行为不受影响
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkErrorMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0010 begin');
      const badOptions: ESObject = JSON.parse('{"options":"bad"}');
      let code: number = 0;
      try {
        await observeOpenLinkRaw('http://docs.openharmony.cn', badOptions);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(0);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkErrorMatrix0010 end');
    })
  })
}
