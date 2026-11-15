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

import hilog from '@ohos.hilog';
import { describe, beforeEach, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { Want } from '@kit.AbilityKit';

const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver = Driver.create();
const DELAY_MS: number = 300;
const START_TEXT: string = '全部开始';
const PAUSE_TEXT: string = '全部暂停';
const TAG: string = 'MultipleFilesDownload_Test';

async function ensureIdle(): Promise<void> {
  const button = await driver.findComponent(ON.id('download'));
  if (button !== undefined && await button.getText() === PAUSE_TEXT) {
    await button.click();
    await driver.delayMs(DELAY_MS);
  }
}

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    beforeAll(async (done: Function) => {
      const want: Want = {
        bundleName: 'com.samples.multiplefilesdownload',
        abilityName: 'EntryAbility'
      };
      abilityDelegator.startAbility(want, (err) => {
        if (err) {
          hilog.error(0xFF00, TAG, '%{public}s', `start ability failed: ${JSON.stringify(err)}`);
        }
      });
      await driver.waitForComponent(ON.id('download'), 10000);
      await driver.delayMs(500);
      done();
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_ABILITY_0100
     * @tc.name      testMainPageReady0001
     * @tc.desc      Verify the download page shows one start button and five file rows.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMainPageReady0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const button = await driver.waitForComponent(ON.id('download'), 5000);
      expect(await button.getText()).assertEqual(START_TEXT);
      const files = await driver.findComponents(ON.id('fileName'));
      expect(files.length).assertEqual(5);
      expect(await files[0].getText()).assertEqual('favor_list_tea.png');
      expect(await files[4].getText()).assertEqual('banner_movie4.png');
      done();
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_ABILITY_0200
     * @tc.name      testStartPauseToggle0002
     * @tc.desc      Verify the start button toggles between start and pause.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartPauseToggle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      await ensureIdle();
      const button = await driver.waitForComponent(ON.id('download'), 5000);
      await button.click();
      await driver.waitForComponent(ON.text(PAUSE_TEXT), 2000);
      const pauseButton = await driver.findComponent(ON.id('download'));
      expect(await pauseButton!.getText()).assertEqual(PAUSE_TEXT);
      await pauseButton!.click();
      await driver.waitForComponent(ON.text(START_TEXT), 3000);
      const startButton = await driver.findComponent(ON.id('download'));
      expect(await startButton!.getText()).assertEqual(START_TEXT);
      done();
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_ABILITY_0300
     * @tc.name      testHistoryShowsCompleted0003
     * @tc.desc      Verify completed downloads appear on the history page.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHistoryShowsCompleted0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      await ensureIdle();
      const button = await driver.waitForComponent(ON.id('download'), 5000);
      await button.click();
      await driver.delayMs(2000);
      const historyTab = await driver.waitForComponent(ON.text('下载历史'), 3000);
      await historyTab.click();
      await driver.waitForComponent(ON.id('favor_list_tea.pngdelete'), 8000);
      const historyFiles = await driver.findComponents(ON.id('fileName'));
      expect(historyFiles.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_ABILITY_0400
     * @tc.name      testDeleteHistoryFile0004
     * @tc.desc      Verify deleting a history item removes its cached file.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDeleteHistoryFile0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const deleteButton = await driver.waitForComponent(ON.id('favor_list_tea.pngdelete'), 5000);
      await deleteButton.click();
      await driver.delayMs(1000);
      let exists: boolean = true;
      try {
        exists = fs.accessSync(getContext().cacheDir + '/favor_list_tea.png');
      } catch (error) {
        exists = false;
      }
      expect(exists).assertFalse();
      done();
    })
  })
}