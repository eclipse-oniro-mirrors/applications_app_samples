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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF812;
const TAG: string = 'NdkRawfileUiStateTest';
const BUNDLE: string = 'com.samples.ndkrawfile';
const ABILITY: string = 'EntryAbility';
const LIST_TEXT: string = 'file list: ["rawfile.txt","rawfile1.txt","subrawfile"]';
const CONTENT_TEXT: string = 'rawfile.txt content: rawfile1 content';
const OFFSET_TEXT_PREFIX: string = 'rawfile.txt content with offset: ';
const FD_PREFIX: string = 'rawfile.txt fd: ';
const FD_OFFSET_PREFIX: string = 'rawfile.txt fd.offset: ';
const FD_LENGTH_TEXT: string = 'rawfile.txt fd.length: 16';
const CONTENT64_TEXT: string = 'rawfile.txt content64: rawfile content for 64';
const OFFSET64_PREFIX: string = 'rawfile.txt content with offset64: ';
const FD64_PREFIX: string = 'rawfile.txt fd64: ';
const FD_OFFSET64_PREFIX: string = 'rawfile.txt fd.offset64: ';
const FD_LENGTH64_TEXT: string = 'rawfile.txt fd.length64: 22';
const ALL_IDS: Array<string> = ['raw_file_list', 'raw_file_content', 'raw_file_content_offset', 'raw_file_fd',
  'raw_file_fd_offset', 'raw_file_fd_length', 'raw_file_content64', 'raw_file_content_offset64', 'raw_file_fd64',
  'raw_file_fd_offset64', 'raw_file_fd_length64'];

const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function getTextById(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  return await component.getText();
}

async function launchMainPage(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function ensurePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'raw_file_list')) {
      return true;
    }
    await launchMainPage();
  }
  return await exists(driver, 'raw_file_list');
}

async function prepare(driver: Driver): Promise<boolean> {
  await launchMainPage();
  const ready: boolean = await ensurePage(driver);
  if (!ready) {
    log('prepare: rawfile page is not available');
  }
  return ready;
}

export default function ndkRawfileUiStateTest(): void {
  describe('NdkRawfileUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await launchMainPage();
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      if (!await ensurePage(driver)) {
        log('afterEach: page restore failed');
      }
      const actual1: boolean = await exists(driver, 'raw_file_list');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'raw_file_list')=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0501
     * @tc.name      testRawfilePageUi0501
     * @tc.desc      Verify the page exposes the rawfile list and content anchors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0501 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'raw_file_list');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'raw_file_list')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'raw_file_content');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'raw_file_content')=${actual4}`);
      expect(actual4).assertTrue();
      log('testRawfilePageUi0501 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0502
     * @tc.name      testRawfilePageUi0502
     * @tc.desc      Verify the list text matches the packaged rawfile entries exactly.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0502 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_list');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=LIST_TEXT`);
      expect(text).assertEqual(LIST_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('file list: ')}`);
      expect(text.startsWith('file list: ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.length=${text.length}, expected=10`);
      expect(text.length).assertLarger(10);
      log('testRawfilePageUi0502 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0503
     * @tc.name      testRawfilePageUi0503
     * @tc.desc      Verify the page shows the full rawfile.txt content text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0503 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_content');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=CONTENT_TEXT`);
      expect(text).assertEqual(CONTENT_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('rawfile.txt content: ')}`);
      expect(text.startsWith('rawfile.txt content: ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${text.indexOf('rawfile1 content')}, expected=-1`);
      expect(text.indexOf('rawfile1 content')).assertLarger(-1);
      log('testRawfilePageUi0503 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0504
     * @tc.name      testRawfilePageUi0504
     * @tc.desc      Verify the page shows the offset read text for rawfile.txt.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0504 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_content_offset');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${text.indexOf('file1 content')}, expected=-1`);
      expect(text.indexOf('file1 content')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith(OFFSET_TEXT_PREFIX)}`);
      expect(text.startsWith(OFFSET_TEXT_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.length=${text.length}`);
      expect(text.length).assertLarger(OFFSET_TEXT_PREFIX.length);
      log('testRawfilePageUi0504 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0505
     * @tc.name      testRawfilePageUi0505
     * @tc.desc      Verify the page shows the descriptor length sixteen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0505 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_fd_length');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=FD_LENGTH_TEXT`);
      expect(text).assertEqual(FD_LENGTH_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.indexOf('16')=${text.indexOf('16')}, expected=-1`);
      expect(text.indexOf('16')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('rawfile.txt fd.length: ')}`);
      expect(text.startsWith('rawfile.txt fd.length: ')).assertTrue();
      log('testRawfilePageUi0505 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0506
     * @tc.name      testRawfilePageUi0506
     * @tc.desc      Verify fd and offset texts carry numeric tails after the labels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0506 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const fdText: string = await getTextById(driver, 'raw_file_fd');
      const offsetText: string = await getTextById(driver, 'raw_file_fd_offset');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue fdText.startsWith(FD_PREFIX)=${fdText.startsWith(FD_PREFIX)}`);
      expect(fdText.startsWith(FD_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger fdText.length=${fdText.length}, expected=FD_PREFIX.length`);
      expect(fdText.length).assertLarger(FD_PREFIX.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${offsetText.startsWith(FD_OFFSET_PREFIX)}`);
      expect(offsetText.startsWith(FD_OFFSET_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger offsetText.length=${offsetText.length}`);
      expect(offsetText.length).assertLarger(FD_OFFSET_PREFIX.length);
      log('testRawfilePageUi0506 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0507
     * @tc.name      testRawfilePageUi0507
     * @tc.desc      Verify the page shows the 64-bit content text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0507 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_content64');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=CONTENT64_TEXT`);
      expect(text).assertEqual(CONTENT64_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.indexOf('for 64')=${text.indexOf('for 64')}`);
      expect(text.indexOf('for 64')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('rawfile.txt content64: ')}`);
      expect(text.startsWith('rawfile.txt content64: ')).assertTrue();
      log('testRawfilePageUi0507 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0508
     * @tc.name      testRawfilePageUi0508
     * @tc.desc      Verify the page shows the 64-bit offset read text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0508 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_content_offset64');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${text.indexOf('content for 64')}, expected=-1`);
      expect(text.indexOf('content for 64')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith(OFFSET64_PREFIX)}`);
      expect(text.startsWith(OFFSET64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.length=${text.length}, expected=OFFSET64_PREFIX.length`);
      expect(text.length).assertLarger(OFFSET64_PREFIX.length);
      log('testRawfilePageUi0508 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0509
     * @tc.name      testRawfilePageUi0509
     * @tc.desc      Verify the page shows the 64-bit descriptor length twenty-two.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0509 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_fd_length64');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=FD_LENGTH64_TEXT`);
      expect(text).assertEqual(FD_LENGTH64_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.indexOf('22')=${text.indexOf('22')}, expected=-1`);
      expect(text.indexOf('22')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith('rawfile.txt fd.length64: ')}`);
      expect(text.startsWith('rawfile.txt fd.length64: ')).assertTrue();
      log('testRawfilePageUi0509 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0510
     * @tc.name      testRawfilePageUi0510
     * @tc.desc      Verify 64-bit fd and offset texts carry numeric tails.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0510 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const fdText: string = await getTextById(driver, 'raw_file_fd64');
      const offsetText: string = await getTextById(driver, 'raw_file_fd_offset64');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${fdText.startsWith(FD64_PREFIX)}`);
      expect(fdText.startsWith(FD64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger fdText.length=${fdText.length}, expected=FD64_PREFIX.length`);
      expect(fdText.length).assertLarger(FD64_PREFIX.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${offsetText.startsWith(FD_OFFSET64_PREFIX)}`);
      expect(offsetText.startsWith(FD_OFFSET64_PREFIX)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger offsetText.length=${offsetText.length}`);
      expect(offsetText.length).assertLarger(FD_OFFSET64_PREFIX.length);
      log('testRawfilePageUi0510 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0511
     * @tc.name      testRawfilePageUi0511
     * @tc.desc      Verify all eleven result components exist on the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0511 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      for (let i: number = 0; i < ALL_IDS.length; i++) {
        const actual15: boolean = await exists(driver, ALL_IDS[i]);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, ALL_IDS[i])=${actual15}`);
        expect(actual15).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ALL_IDS.length=${ALL_IDS.length}, expected=11`);
      expect(ALL_IDS.length).assertEqual(11);
      log('testRawfilePageUi0511 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0512
     * @tc.name      testRawfilePageUi0512
     * @tc.desc      Verify relaunching keeps the rawfile results stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0512 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      await launchMainPage();
      await sleep(600);
      const actual17: boolean = await exists(driver, 'raw_file_list');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'raw_file_list')=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: string = await getTextById(driver, 'raw_file_list');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual getTextById(driver, 'raw_file_list')=${actual18}`);
      expect(actual18).assertEqual(LIST_TEXT);
      const actual19: string = await getTextById(driver, 'raw_file_content');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual getTextById(driver, 'raw_file_content')=${actual19}`);
      expect(actual19).assertEqual(CONTENT_TEXT);
      log('testRawfilePageUi0512 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0513
     * @tc.name      testRawfilePageUi0513
     * @tc.desc      Verify the page list never leaks the nested rawfile2 entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0513 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const text: string = await getTextById(driver, 'raw_file_list');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text.indexOf('rawfile2.txt')=${text.indexOf('rawfile2.txt')}`);
      expect(text.indexOf('rawfile2.txt')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.indexOf('rawfile.txt')=${text.indexOf('rawfile.txt')}`);
      expect(text.indexOf('rawfile.txt')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.indexOf('subrawfile')=${text.indexOf('subrawfile')}`);
      expect(text.indexOf('subrawfile')).assertLarger(-1);
      log('testRawfilePageUi0513 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_PAGEUI_0514
     * @tc.name      testRawfilePageUi0514
     * @tc.desc      Verify both descriptor fd rows render non-empty numeric tails.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testRawfilePageUi0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testRawfilePageUi0514 begin');
      const driver: Driver = Driver.create();
      const actual21: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const fdText: string = await getTextById(driver, 'raw_file_fd');
      const fd64Text: string = await getTextById(driver, 'raw_file_fd64');
      const offset64Text: string = await getTextById(driver, 'raw_file_fd_offset64');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger fdText.length=${fdText.length}, expected=FD_PREFIX.length`);
      expect(fdText.length).assertLarger(FD_PREFIX.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger fd64Text.length=${fd64Text.length}`);
      expect(fd64Text.length).assertLarger(FD64_PREFIX.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger offset64Text.length=${offset64Text.length}`);
      expect(offset64Text.length).assertLarger(FD_OFFSET64_PREFIX.length);
      log('testRawfilePageUi0514 end');
    })
  })
}
