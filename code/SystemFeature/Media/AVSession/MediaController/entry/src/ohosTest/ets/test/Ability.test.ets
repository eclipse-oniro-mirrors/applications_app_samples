/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import AVSessionManager from '@ohos.multimedia.avsession';
import { getTestAbilityContext } from '../testability/AbilityContextStore';
import Log from './Logger';

const BUNDLE_NAME: string = 'com.samples.mediacontroller';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'MediaControllerTest';
const QUEUE_TITLE: string = 'Test Queue';
const LYRIC_LINE: string = 'Test lyric line';

const TRACKS: string[] = ['Track One', 'Track Two', 'Track Three'];
const ARTISTS: string[] = ['Artist One', 'Artist Two', 'Artist Three'];

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver = Driver.create();
let provider: AVSessionManager.AVSession | undefined = undefined;
let currentIndex: number = 0;
let providerState: AVSessionManager.PlaybackState =
  AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
let lastLyricFlag: boolean | undefined = undefined;
let sawLyricOff: boolean = false;
let playCount: number = 0;
let pauseCount: number = 0;
let nextCount: number = 0;
let previousCount: number = 0;
let skipCount: number = 0;
let lyricCount: number = 0;
let currentLyricLine: string = LYRIC_LINE;

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

function createMetadata(index: number): AVSessionManager.AVMetadata {
  return {
    assetId: 'asset-' + index,
    title: TRACKS[index],
    artist: ARTISTS[index]
  };
}

function createQueueItems(): Array<AVSessionManager.AVQueueItem> {
  let items: Array<AVSessionManager.AVQueueItem> = [];
  for (let i = 0; i < TRACKS.length; i++) {
    items.push({
      itemId: i,
      description: {
        assetId: 'asset-' + i,
        title: TRACKS[i]
      }
    });
  }
  return items;
}

function createQueueItemsFrom(titles: string[]): Array<AVSessionManager.AVQueueItem> {
  let items: Array<AVSessionManager.AVQueueItem> = [];
  for (let i = 0; i < titles.length; i++) {
    items.push({
      itemId: i,
      description: {
        assetId: 'asset-' + i,
        title: titles[i]
      }
    });
  }
  return items;
}

async function publishMetadata(index: number): Promise<void> {
  currentIndex = index;
  if (provider) {
    await provider.setAVMetadata(createMetadata(index));
  }
}

async function publishState(state: AVSessionManager.PlaybackState): Promise<void> {
  providerState = state;
  if (provider) {
    await provider.setAVPlaybackState({ state: state });
  }
}

async function waitForId(id: string, timeout: number): Promise<boolean> {
  try {
    let component: Component = await driver.waitForComponent(ON.id(id), timeout);
    return component !== undefined && component !== null;
  } catch (error) {
    Log.info(TAG, 'waitForId ' + id + ' failed : ' + JSON.stringify(error));
    return false;
  }
}

async function waitForText(id: string, expected: string, timeout: number): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  let lastText: string = '';
  while (Date.now() < deadline) {
    try {
      let component: Component = await driver.findComponent(ON.id(id));
      if (component) {
        let text: string = await component.getText();
        if (text === expected) {
          return true;
        }
        if (text !== lastText) {
          lastText = text;
          Log.info(TAG, 'waitForText ' + id + ' now [' + text + '] expected [' + expected + ']');
        }
      }
    } catch (error) {
      Log.info(TAG, 'waitForText ' + id + ' failed : ' + JSON.stringify(error));
    }
    await sleep(200);
  }
  return false;
}

async function clickById(id: string, timeout: number): Promise<boolean> {
  try {
    let component: Component = await driver.waitForComponent(ON.id(id), timeout);
    if (!component) {
      return false;
    }
    await component.click();
    return true;
  } catch (error) {
    Log.info(TAG, 'clickById ' + id + ' failed : ' + JSON.stringify(error));
    return false;
  }
}

async function waitCondition(condition: () => boolean, timeout: number): Promise<boolean> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    if (condition()) {
      return true;
    }
    await sleep(100);
  }
  return condition();
}

async function startApp(): Promise<boolean> {
  try {
    await delegator.startAbility({
      bundleName: BUNDLE_NAME,
      abilityName: ABILITY_NAME
    });
    return await waitForId('Title', 5000);
  } catch (error) {
    Log.info(TAG, 'startApp failed : ' + JSON.stringify(error));
    return false;
  }
}

export default function abilityTest() {
  describe('MediaControllerTest', () => {
    beforeAll(async () => {
      Log.info(TAG, 'beforeAll create provider session');
      driver = Driver.create();
      let context = getTestAbilityContext();
      if (!context) {
        throw new Error('test ability context is not ready');
      }
      provider = await AVSessionManager.createAVSession(context, 'MediaControllerTestProvider', 'audio');
      await provider.setAVMetadata(createMetadata(0));
      await provider.setAVQueueTitle(QUEUE_TITLE);
      await provider.setAVQueueItems(createQueueItems());
      await provider.setAVPlaybackState({
        state: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE
      });
      await provider.setExtras({ 'lyricsLineNumber': 1 });
      provider.on('play', async () => {
        playCount++;
        await publishState(AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
      });
      provider.on('pause', async () => {
        pauseCount++;
        await publishState(AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE);
      });
      provider.on('playNext', async () => {
        nextCount++;
        await publishMetadata((currentIndex + 1) % TRACKS.length);
      });
      provider.on('playPrevious', async () => {
        previousCount++;
        await publishMetadata((currentIndex + TRACKS.length - 1) % TRACKS.length);
      });
      provider.on('skipToQueueItem', async (itemId: number) => {
        skipCount++;
        await publishMetadata(itemId % TRACKS.length);
      });
      provider.on('commonCommand', async (command: string, args: Record<string, Object>) => {
        if (command === 'lyrics') {
          lyricCount++;
          lastLyricFlag = args['lyrics'] === true;
          if (!lastLyricFlag) {
            sawLyricOff = true;
          }
          if (lastLyricFlag && provider) {
            await provider.setExtras({ 'lyricsLineNumber': 1 });
            await provider.dispatchSessionEvent('lyrics', { 'lyrics': currentLyricLine });
          }
        }
      });
      await provider.activate();
      Log.info(TAG, 'provider session ready : ' + provider.sessionId);
    });

    afterAll(async () => {
      if (provider) {
        await provider.destroy();
        provider = undefined;
      }
    });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0100
     * @tc.name      testMediaControllerStartAbility0001
     * @tc.desc      Start MediaController with a valid media provider session and verify the page appears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerStartAbility0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerStartAbility0001 begin');
        let started: boolean = await startApp();
        expect(started).assertTrue();
        Log.info(TAG, 'testMediaControllerStartAbility0001 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0200
     * @tc.name      testMediaControllerPageElement0002
     * @tc.desc      Verify the controller page shows cover, title, artist and all control buttons.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerPageElement0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerPageElement0002 begin');
        expect(await waitForId('Title', 3000)).assertTrue();
        expect(await waitForId('Artist', 3000)).assertTrue();
        expect(await waitForId('CurrentImage', 3000)).assertTrue();
        expect(await waitForId('Previous', 3000)).assertTrue();
        expect(await waitForId('Next', 3000)).assertTrue();
        expect(await waitForId('ShowQueue', 3000)).assertTrue();
        expect(await waitForId('Lyric', 3000)).assertTrue();
        expect(await waitForId('PlayOrPause:false', 3000)).assertTrue();
        Log.info(TAG, 'testMediaControllerPageElement0002 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0300
     * @tc.name      testMediaControllerMetadata0003
     * @tc.desc      Verify metadata published by the provider is displayed by the controller.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerMetadata0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerMetadata0003 begin');
        await publishMetadata(0);
        expect(await waitForText('Title', TRACKS[0], 5000)).assertTrue();
        expect(await waitForText('Artist', ARTISTS[0], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerMetadata0003 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0400
     * @tc.name      testMediaControllerPlay0004
     * @tc.desc      Click play, verify the provider receives the command and the button turns into pause.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerPlay0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerPlay0004 begin');
        await publishState(AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE);
        expect(await waitForId('PlayOrPause:false', 3000)).assertTrue();
        expect(await clickById('PlayOrPause:false', 3000)).assertTrue();
        expect(await waitCondition(() => playCount > 0, 3000)).assertTrue();
        expect(providerState).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
        expect(await waitForId('PlayOrPause:true', 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerPlay0004 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0500
     * @tc.name      testMediaControllerPause0005
     * @tc.desc      Click pause, verify the provider receives the command and the button turns into play.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerPause0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerPause0005 begin');
        expect(await waitForId('PlayOrPause:true', 3000)).assertTrue();
        expect(await clickById('PlayOrPause:true', 3000)).assertTrue();
        expect(await waitCondition(() => pauseCount > 0, 3000)).assertTrue();
        expect(providerState).assertEqual(AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE);
        expect(await waitForId('PlayOrPause:false', 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerPause0005 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0600
     * @tc.name      testMediaControllerNext0006
     * @tc.desc      Click next, verify the provider switches track and the title updates.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerNext0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerNext0006 begin');
        await publishMetadata(0);
        expect(await waitForText('Title', TRACKS[0], 5000)).assertTrue();
        expect(await clickById('Next', 3000)).assertTrue();
        expect(await waitCondition(() => nextCount > 0, 3000)).assertTrue();
        expect(await waitForText('Title', TRACKS[1], 5000)).assertTrue();
        expect(await waitForText('Artist', ARTISTS[1], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerNext0006 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0700
     * @tc.name      testMediaControllerPrevious0007
     * @tc.desc      Click previous, verify the provider switches back and the title updates.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerPrevious0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerPrevious0007 begin');
        expect(await clickById('Previous', 3000)).assertTrue();
        expect(await waitCondition(() => previousCount > 0, 3000)).assertTrue();
        expect(await waitForText('Title', TRACKS[0], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerPrevious0007 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0800
     * @tc.name      testMediaControllerShowQueue0008
     * @tc.desc      Click the queue button and verify all three provider queue items are shown.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerShowQueue0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerShowQueue0008 begin');
        let showQueueClicked: boolean = await clickById('ShowQueue', 3000);
        Log.info(TAG, 'showQueueClicked : ' + showQueueClicked);
        expect(showQueueClicked).assertTrue();
        let panelVisible: boolean = await waitForId('SecondPanel', 3000);
        Log.info(TAG, 'panelVisible : ' + panelVisible);
        expect(panelVisible).assertTrue();
        expect(await waitForText('FirstMusicInQueue', TRACKS[0], 5000)).assertTrue();
        expect(await waitForText('SecondMusicInQueue', TRACKS[1], 5000)).assertTrue();
        expect(await waitForText('ThirdMusicInQueue', TRACKS[2], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerShowQueue0008 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_0900
     * @tc.name      testMediaControllerSkipQueueItem0009
     * @tc.desc      Click the second queue item, verify the provider switches to that item.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerSkipQueueItem0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerSkipQueueItem0009 begin');
        expect(await clickById('SecondMusicInQueue', 3000)).assertTrue();
        expect(await waitCondition(() => skipCount > 0, 3000)).assertTrue();
        expect(await waitForText('Title', TRACKS[1], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerSkipQueueItem0009 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1000
     * @tc.name      testMediaControllerLyricOn0010
     * @tc.desc      Click the lyric button, verify the provider receives the common command and dispatches lyric data.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerLyricOn0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerLyricOn0010 begin');
        expect(await waitForId('Lyric', 3000)).assertTrue();
        expect(await clickById('Lyric', 3000)).assertTrue();
        expect(await waitCondition(() => lastLyricFlag === true, 5000)).assertTrue();
        expect(lastLyricFlag).assertTrue();
        expect(await waitForText('LyricText', '1 : ' + LYRIC_LINE, 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerLyricOn0010 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1100
     * @tc.name      testMediaControllerLyricOff0011
     * @tc.desc      Click the lyric button again, verify the provider receives the disable command.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerLyricOff0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerLyricOff0011 begin');
        sawLyricOff = false;
        expect(await clickById('Lyric', 3000)).assertTrue();
        expect(await waitCondition(() => sawLyricOff, 3000)).assertTrue();
        Log.info(TAG, 'testMediaControllerLyricOff0011 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1200
     * @tc.name      testMediaControllerMetadataChange0012
     * @tc.desc      Change metadata on the provider side and verify the controller refreshes the title.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerMetadataChange0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerMetadataChange0012 begin');
        if (provider) {
          await provider.setAVMetadata({
            assetId: 'external',
            title: 'External Track',
            artist: 'External Artist'
          });
        }
        expect(await waitForText('Title', 'External Track', 5000)).assertTrue();
        expect(await waitForText('Artist', 'External Artist', 5000)).assertTrue();
        await publishMetadata(0);
        expect(await waitForText('Title', TRACKS[0], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerMetadataChange0012 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1300
     * @tc.name      testMediaControllerPlaybackStateChange0013
     * @tc.desc      Change playback state on the provider side and verify the play button state follows.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerPlaybackStateChange0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerPlaybackStateChange0013 begin');
        await publishState(AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY);
        expect(await waitForId('PlayOrPause:true', 5000)).assertTrue();
        await publishState(AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE);
        expect(await waitForId('PlayOrPause:false', 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerPlaybackStateChange0013 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1400
     * @tc.name      testMediaControllerPreviousWrap0014
     * @tc.desc      At the first track, click previous and verify the provider wraps to the last track.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerPreviousWrap0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerPreviousWrap0014 begin');
        await publishMetadata(0);
        expect(await waitForText('Title', TRACKS[0], 5000)).assertTrue();
        expect(await clickById('Previous', 3000)).assertTrue();
        expect(await waitForText('Title', TRACKS[2], 5000)).assertTrue();
        await publishMetadata(0);
        Log.info(TAG, 'testMediaControllerPreviousWrap0014 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1500
     * @tc.name      testMediaControllerQueueItemsChange0015
     * @tc.desc      Change queue items on the provider side and verify the open queue panel refreshes.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerQueueItemsChange0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerQueueItemsChange0015 begin');
        if (!(await waitForId('SecondPanel', 1000))) {
          expect(await clickById('ShowQueue', 3000)).assertTrue();
          expect(await waitForId('SecondPanel', 3000)).assertTrue();
        }
        if (provider) {
          await provider.setAVQueueItems(createQueueItemsFrom(['New Track A', 'New Track B', 'New Track C']));
        }
        expect(await waitForText('FirstMusicInQueue', 'New Track A', 5000)).assertTrue();
        expect(await waitForText('SecondMusicInQueue', 'New Track B', 5000)).assertTrue();
        expect(await waitForText('ThirdMusicInQueue', 'New Track C', 5000)).assertTrue();
        if (provider) {
          await provider.setAVQueueItems(createQueueItems());
        }
        expect(await waitForText('FirstMusicInQueue', TRACKS[0], 5000)).assertTrue();
        Log.info(TAG, 'testMediaControllerQueueItemsChange0015 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1600
     * @tc.name      testMediaControllerLyricInterval0016
     * @tc.desc      Enable lyric mode and verify the controller polls the provider periodically.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerLyricInterval0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerLyricInterval0016 begin');
        if (lastLyricFlag !== true) {
          expect(await clickById('Lyric', 3000)).assertTrue();
        }
        let countBefore: number = lyricCount;
        expect(await waitCondition(() => lyricCount >= countBefore + 2, 5000)).assertTrue();
        expect(lastLyricFlag).assertTrue();
        Log.info(TAG, 'testMediaControllerLyricInterval0016 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1700
     * @tc.name      testMediaControllerLyricContentChange0017
     * @tc.desc      Dispatch a new lyric line from the provider and verify the displayed lyric refreshes.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerLyricContentChange0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerLyricContentChange0017 begin');
        currentLyricLine = 'Dynamic lyric line';
        if (provider) {
          await provider.setExtras({ 'lyricsLineNumber': 1 });
          await provider.dispatchSessionEvent('lyrics', { 'lyrics': currentLyricLine });
        }
        expect(await waitForText('LyricText', '1 : Dynamic lyric line', 5000)).assertTrue();
        currentLyricLine = LYRIC_LINE;
        if (lastLyricFlag === true) {
          expect(await clickById('Lyric', 3000)).assertTrue();
        }
        Log.info(TAG, 'testMediaControllerLyricContentChange0017 end');
        done();
      });

    /**
     * @tc.number    SUB_MEDIA_CONTROLLER_UI_1800
     * @tc.name      testMediaControllerNoSession0018
     * @tc.desc      Destroy the provider, restart the page and verify the empty state plus no-session controls.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMediaControllerNoSession0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Log.info(TAG, 'testMediaControllerNoSession0018 begin');
        if (provider) {
          await provider.destroy();
          provider = undefined;
        }
        await driver.delayMs(500);
        await driver.click(20, 600);
        await sleep(1500);
        expect(await startApp()).assertTrue();
        expect(await waitForText('Title', '未在播放', 5000)).assertTrue();
        expect(await waitForId('PlayOrPause:false', 3000)).assertTrue();
        expect(await clickById('PlayOrPause:false', 3000)).assertTrue();
        expect(await clickById('Next', 3000)).assertTrue();
        expect(await waitForText('Title', '未在播放', 3000)).assertTrue();
        Log.info(TAG, 'testMediaControllerNoSession0018 end');
        done();
      });
  });
}
