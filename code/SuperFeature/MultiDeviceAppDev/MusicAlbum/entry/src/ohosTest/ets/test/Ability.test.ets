/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BUNDLE_NAME,
  WAIT_MS,
  clickId,
  countId,
  displaySize,
  expectedText,
  existsId,
  launchApp,
  listInViewport,
  pressBack,
  resetToHome,
  textOfId,
  unlockIfNeeded,
  waitId
} from '../util/UiEnv';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function abilityTest(): void {
  describe('AbilityTest', () => {
    beforeAll(async () => {
      await unlockIfNeeded();
      await launchApp();
    });

    /*
     * @tc.number: SUB_ABILITY_0100
     * @tc.name: testAbility0001
     * @tc.desc: Verify the launched main ability renders the header root and the playlist title
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAbility0001', 0, async (done: Function) => {
      await runCase('testAbility0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0001 begin');
        const launch: string = await launchApp();
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(launch), 'ok');
        logAssertion(DOMAIN, TAG, String(launch), String('ok'));
        expect(launch).assertEqual('ok');
        const rootFound: boolean = await waitId('header_root', WAIT_MS);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(rootFound), 'true');
        logAssertion(DOMAIN, TAG, String(rootFound), 'true');
        expect(rootFound).assertTrue();
        const title: string = await textOfId('header_title');
        const titleExpected: string = 'ok:' + expectedText('play_list');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', title, titleExpected);
        logAssertion(DOMAIN, TAG, String(title), String(titleExpected));
        expect(title).assertEqual(titleExpected);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_ABILITY_0200
     * @tc.name: testAbility0002
     * @tc.desc: Verify the home page exposes cover, the list column when it fits and the player after launch
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAbility0002', 0, async (done: Function) => {
      await runCase('testAbility0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0002 begin');
        const cover: boolean = await existsId('cover_album');
        const reachable: boolean = await listInViewport();
        const listCount: number = await countId('song_list');
        const player: boolean = await existsId('player_root');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cover), 'true');
        logAssertion(DOMAIN, TAG, String(cover), 'true');
        expect(cover).assertTrue();
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(player), 'true');
        logAssertion(DOMAIN, TAG, String(player), 'true');
        expect(player).assertTrue();
        // the list column is mounted once when it fits the band and not at all
        // when the square cover pushes it out of the compact window
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s listCount=%{public}d', String(reachable), listCount);
        logAssertion(DOMAIN, TAG, String(listCount), String(reachable ? 1 : 0));
        expect(listCount).assertEqual(reachable ? 1 : 0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_ABILITY_0300
     * @tc.name: testAbility0003
     * @tc.desc: Verify the display snapshot is well formed and keeps a positive width and height
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAbility0003', 0, async (done: Function) => {
      await runCase('testAbility0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0003 begin');
        const snapshot: string = await displaySize();
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', snapshot, 'ok:<w>,<h>');
        logAssertion(DOMAIN, TAG, String(snapshot.startsWith('ok:')), 'true');
        expect(snapshot.startsWith('ok:')).assertTrue();
        const parts: string[] = snapshot.split(',');
        const width: number = parts.length === 2 ? Number(parts[0].substring(3)) : -1;
        const height: number = parts.length === 2 ? Number(parts[1]) : -1;
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(width), '>0');
        logAssertion(DOMAIN, TAG, String(width > 0), 'true');
        expect(width > 0).assertTrue();
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(height), '>0');
        logAssertion(DOMAIN, TAG, String(height > 0), 'true');
        expect(height > 0).assertTrue();
        const back: string = await pressBack();
        logAssertion(DOMAIN, TAG, String(back), String('ok'));
        expect(back).assertEqual('ok');
        // the sample owns a single page, so back leaves the ability instead of
        // popping one; the page has to be brought back before the header is usable
        const relaunch: string = await launchApp();
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', relaunch, 'ok');
        logAssertion(DOMAIN, TAG, String(relaunch), String('ok'));
        expect(relaunch).assertEqual('ok');
        const header: boolean = await waitId('header_root', WAIT_MS);
        logAssertion(DOMAIN, TAG, String(header), 'true');
        expect(header).assertTrue();
        const click: string = await clickId('header_more');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', click, 'ok');
        logAssertion(DOMAIN, TAG, String(click), String('ok'));
        expect(click).assertEqual('ok');
        await resetToHome();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0003 end');
      }, done);
    });
  })
}
