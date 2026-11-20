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
import { OpenLinkOptions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkObservation,
  observeOpenLink
} from './LinkHelper';
import { ENTRY_ABILITY, launchAbility } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';
const PARSE_FAILED: string = 'Parse param link or openLinkOptions failed, ' +
  'link must be string, openLinkOptions must be options.';

export default function openLinkMatrixTailTest(): void {
  describe('UniversalLinkOpenLinkMatrixTailTest', () => {
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
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0072
     * @tc.name      testOpenLinkMatrix0072
     * @tc.desc      openLink "abc"，空 options：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0072 begin');
      const link: string = 'abc';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0072 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0073
     * @tc.name      testOpenLinkMatrix0073
     * @tc.desc      openLink "abc"，appLinkingOnly=false：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0073 begin');
      const link: string = 'abc';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0073 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0074
     * @tc.name      testOpenLinkMatrix0074
     * @tc.desc      openLink "abc"，appLinkingOnly=true：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0074 begin');
      const link: string = 'abc';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0074 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0075
     * @tc.name      testOpenLinkMatrix0075
     * @tc.desc      openLink "abc"，带 parameters：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0075 begin');
      const link: string = 'abc';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0075 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0076
     * @tc.name      testOpenLinkMatrix0076
     * @tc.desc      openLink 空串，不传 options：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0076 begin');
      const link: string = '';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0076 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0077
     * @tc.name      testOpenLinkMatrix0077
     * @tc.desc      openLink 空串，空 options：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0077 begin');
      const link: string = '';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0077 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0078
     * @tc.name      testOpenLinkMatrix0078
     * @tc.desc      openLink 空串，appLinkingOnly=false：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0078 begin');
      const link: string = '';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0078 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0079
     * @tc.name      testOpenLinkMatrix0079
     * @tc.desc      openLink 空串，appLinkingOnly=true：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0079 begin');
      const link: string = '';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0079 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0080
     * @tc.name      testOpenLinkMatrix0080
     * @tc.desc      openLink 空串，带 parameters：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0080 begin');
      const link: string = '';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0080 end');
    })
  })
}
