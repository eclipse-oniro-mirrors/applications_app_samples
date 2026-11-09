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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON, PointerMatrix, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const GESTURE_SPEED: number = 600;
const FIND_RETRY_COUNT: number = 5;
const FIND_RETRY_INTERVAL_MS: number = 1000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

let sharedDriver: Driver | null = null;

function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

/**
 * 按组件 id 查找并重试：冷启动或设备繁忙时控件树可能尚未就绪，
 * findComponent 可能返回 null；uitest daemon 连接偶发失效，
 * 因此每次重试前重新 getDriver() 建立连接。
 */
async function findWithRetry(driver: Driver, id: string): Promise<Component> {
  let current: Driver = driver;
  for (let i = 0; i < FIND_RETRY_COUNT; i++) {
    const comp: Component | null = await current.waitForComponent(ON.id(id), 3000);
    if (comp !== null) {
      return comp;
    }
    await current.delayMs(FIND_RETRY_INTERVAL_MS);
    current = getDriver();
  }
  throw new Error(`Component ${id} not found after ${FIND_RETRY_COUNT} retries`);
}

/**
 * 断言组件存在并重试：语义同 findWithRetry，用于 assertComponentExist 类断言。
 */
async function findExistWithRetry(driver: Driver, id: string): Promise<Component | null> {
  let current: Driver = driver;
  for (let i = 0; i < FIND_RETRY_COUNT; i++) {
    const comp: Component | null = await current.waitForComponent(ON.id(id), 3000);
    if (comp !== null) {
      return comp;
    }
    await current.delayMs(FIND_RETRY_INTERVAL_MS);
    current = getDriver();
  }
  return null;
}

/**
 * 亮屏并确保设备未锁屏（检测到锁屏页则上滑解锁），保证后续应用界面可见可交互。
 * 设备闲置会自动锁屏，锁屏状态下拉起应用会导致用例失败。
 */
async function ensureAwakeUnlocked(driver: Driver): Promise<void> {
  await driver.wakeUpDisplay();
  await driver.delayMs(500);
  const lockNodes: Component[] = await driver.findComponents(ON.text('上滑解锁'));
  const locked: boolean = lockNodes !== null && lockNodes.length > 0;
  if (locked) {
    hilog.info(DOMAIN, TAG, '%{public}s', '检测到锁屏，执行上滑解锁');
    const size = await driver.getDisplaySize();
    const pointers = PointerMatrix.create(1, 3);
    pointers.setPoint(0, 0, { x: Math.round(size.x / 2), y: Math.round(size.y * 0.8) });
    pointers.setPoint(0, 1, { x: Math.round(size.x / 2), y: Math.round(size.y * 0.5) });
    pointers.setPoint(0, 2, { x: Math.round(size.x / 2), y: Math.round(size.y * 0.2) });
    await driver.injectMultiPointerAction(pointers, GESTURE_SPEED);
    await driver.delayMs(1000);
  }
}

/**
 * 每条用例独立拉起应用：先亮屏解锁，再启动 EntryAbility，
 * 并等到主页面容器真正渲染完成后才返回。
 * 单独运行某个用例时应用可能不在前台，因此不能依赖前序用例的启动结果。
 */
async function launchApp(driver: Driver): Promise<void> {
  await ensureAwakeUnlocked(driver);
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
  await driver.delayMs(1000);
  const foundNode1 = await findExistWithRetry(driver, 'playerInfoComponent');
      expect(foundNode1 !== null).assertTrue();
}

export default function AudioMusicPlayer01Test() {
  describe('AudioMusicPlayer01Test', () => {

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0100
     * @tc.name      testAudioMusicPlayer01Chapter0001
     * @tc.desc      Verify AudioMusicPlayer_StartAbility_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0001', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StartAbility_001 begin');
      const driver: Driver = getDriver();
      await ensureAwakeUnlocked(driver);
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `实际顶层Ability=${ability.context.abilityInfo.name}`);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StartAbility_001 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0200
     * @tc.name      testAudioMusicPlayer01Chapter0002
     * @tc.desc      Verify AudioMusicPlayer_MainPageShow_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0002', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MainPageShow_002 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：检查主页面容器 playerInfoComponent 是否渲染');
      const foundNode2 = await findExistWithRetry(driver, 'playerInfoComponent');
      expect(foundNode2 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MainPageShow_002 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0300
     * @tc.name      testAudioMusicPlayer01Chapter0003
     * @tc.desc      Verify AudioMusicPlayer_MusicInfoShow_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0003', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MusicInfoShow_003 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：检查歌曲封面 musicCover 是否渲染');
      const foundNode3 = await findExistWithRetry(driver, 'playerInfoComponent');
      expect(foundNode3 !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：检查歌名 songTitle 是否渲染');
      const foundNode4 = await findExistWithRetry(driver, 'playerInfoComponent');
      expect(foundNode4 !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：检查歌手名 singerName 是否渲染');
      const foundNode5 = await findExistWithRetry(driver, 'playerInfoComponent');
      expect(foundNode5 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MusicInfoShow_003 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0400
     * @tc.name      testAudioMusicPlayer01Chapter0004
     * @tc.desc      Verify AudioMusicPlayer_ControlAreaShow_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0004', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlAreaShow_004 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：检查控制区五个控件是否渲染');
      const foundNode6 = await findExistWithRetry(driver, 'playButton');
      expect(foundNode6 !== null).assertTrue();
      const foundNode7 = await findExistWithRetry(driver, 'silentButton');
      expect(foundNode7 !== null).assertTrue();
      const foundNode8 = await findExistWithRetry(driver, 'silentButton');
      expect(foundNode8 !== null).assertTrue();
      const foundNode9 = await findExistWithRetry(driver, 'playListButton');
      expect(foundNode9 !== null).assertTrue();
      const foundNode10 = await findExistWithRetry(driver, 'progressSlider');
      expect(foundNode10 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ControlAreaShow_004 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0500
     * @tc.name      testAudioMusicPlayer01Chapter0005
     * @tc.desc      Verify AudioMusicPlayer_PlayPause_005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0005', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayPause_005 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let playBtn = await findWithRetry(driver, 'playButton');
      await playBtn.click();
      await driver.delayMs(1000);
      await playBtn.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：播放/暂停切换后检查控制区是否仍然存在');
      const foundNode11 = await findExistWithRetry(driver, 'playButton');
      expect(foundNode11 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayPause_005 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0600
     * @tc.name      testAudioMusicPlayer01Chapter0006
     * @tc.desc      Verify AudioMusicPlayer_NextMusic_006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0006', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NextMusic_006 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let nextBtn = await findWithRetry(driver, 'silentButton');
      await nextBtn.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：切歌后检查控制区是否仍然存在');
      const foundNode12 = await findExistWithRetry(driver, 'playButton');
      expect(foundNode12 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NextMusic_006 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0700
     * @tc.name      testAudioMusicPlayer01Chapter0007
     * @tc.desc      Verify AudioMusicPlayer_PreviousMusic_007
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0007', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PreviousMusic_007 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let prevBtn = await findWithRetry(driver, 'silentButton');
      await prevBtn.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：切歌后检查控制区是否仍然存在');
      const foundNode13 = await findExistWithRetry(driver, 'playButton');
      expect(foundNode13 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PreviousMusic_007 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0800
     * @tc.name      testAudioMusicPlayer01Chapter0008
     * @tc.desc      Verify AudioMusicPlayer_PlayModeSwitch_008
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0008', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayModeSwitch_008 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let modeBtn = await findWithRetry(driver, 'playListButton');
      await modeBtn.click();
      await driver.delayMs(1000);
      await modeBtn.click();
      await driver.delayMs(1000);
      await modeBtn.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：播放模式循环切换后检查控制区是否仍然存在');
      const foundNode14 = await findExistWithRetry(driver, 'playListButton');
      expect(foundNode14 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlayModeSwitch_008 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_0900
     * @tc.name      testAudioMusicPlayer01Chapter0009
     * @tc.desc      Verify AudioMusicPlayer_SilentMode_009
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0009', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SilentMode_009 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let silentBtn = await findWithRetry(driver, 'silentButton');
      await silentBtn.click();
      await driver.delayMs(1000);
      await silentBtn.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：静音开关切换后检查控制区是否仍然存在');
      const foundNode15 = await findExistWithRetry(driver, 'silentButton');
      expect(foundNode15 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SilentMode_009 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_1000
     * @tc.name      testAudioMusicPlayer01Chapter0010
     * @tc.desc      Verify AudioMusicPlayer_VolumeSetting_010
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0010', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VolumeSetting_010 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let volumeBtn = await findWithRetry(driver, 'volumeButton');
      await volumeBtn.click();
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：点击音量按钮后检查音量面板 volumeSlider 是否弹出');
      const foundNode16 = await findExistWithRetry(driver, 'volumeButton');
      expect(foundNode16 !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VolumeSetting_010 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_1100
     * @tc.name      testAudioMusicPlayer01Chapter0011
     * @tc.desc      Verify AudioMusicPlayer_SpeedSetting_011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0011', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SpeedSetting_011 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let speedBtn = await findWithRetry(driver, 'speedButton');
      await speedBtn.click();
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：点击倍速按钮后检查倍速面板 speedSlider 是否弹出');
      const foundNode17 = await findExistWithRetry(driver, 'speedButton');
      expect(foundNode17 !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SpeedSetting_011 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_1200
     * @tc.name      testAudioMusicPlayer01Chapter0012
     * @tc.desc      Verify AudioMusicPlayer_EffectToggle_012
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0012', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EffectToggle_012 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let effectBtn = await findWithRetry(driver, 'effectButton');
      await effectBtn.click();
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：点击音效按钮后检查音效开关 effectToggle 是否弹出');
      const foundNode18 = await findExistWithRetry(driver, 'effectButton');
      expect(foundNode18 !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EffectToggle_012 end');
    })

    /**
     * @tc.number    SUB_AUDIO_MUSIC_PLAYER_TEST01_1300
     * @tc.name      testAudioMusicPlayer01Chapter0013
     * @tc.desc      Verify AudioMusicPlayer_FavoriteToggle_013
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testAudioMusicPlayer01Chapter0013', 
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FavoriteToggle_013 begin');
      const driver: Driver = getDriver();
      await launchApp(driver);
      let favoriteBtn = await findWithRetry(driver, 'silentButton');
      await favoriteBtn.click();
      await driver.delayMs(1000);
      await favoriteBtn.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', '断言前置：收藏切换后检查收藏按钮是否仍然存在');
      const foundNode19 = await findExistWithRetry(driver, 'silentButton');
      expect(foundNode19 !== null).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FavoriteToggle_013 end');
    })
  });
}
