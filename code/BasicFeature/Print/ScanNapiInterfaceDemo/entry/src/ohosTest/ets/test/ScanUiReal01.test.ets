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
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component, Rect } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';
const BUNDLE_NAME: string = 'com.example.scannapiinterfacedemo';
const ABILITY_NAME: string = 'EntryAbility';
const PAGE_SETTLE_MS: number = 1500;
const DIALOG_SETTLE_MS: number = 600;
const TITLE_ID: string = 'scanTitle';
const ACTION_IDS: string[] = [
  'scanSearchBtn', 'scanStartBtn', 'scanCancelBtn',
  'scanOpenBtn', 'scanGetOptionBtn', 'scanSetOptionBtn', 'scanPreviewBtn'
];

let driver: Driver | undefined = undefined;

async function componentOf(id: string): Promise<Component | null> {
  const current: Driver | undefined = driver;
  if (current === undefined) {
    return null;
  }
  try {
    return await current.findComponent(ON.id(id));
  } catch (error) {
    return null;
  }
}

async function textOf(id: string): Promise<string> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return '';
  }
  try {
    return await component.getText();
  } catch (error) {
    return '';
  }
}

async function typeOf(id: string): Promise<string> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return '';
  }
  try {
    return await component.getType();
  } catch (error) {
    return '';
  }
}

async function clickableOf(id: string): Promise<boolean> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return false;
  }
  try {
    return await component.isClickable();
  } catch (error) {
    return false;
  }
}

async function widthOf(id: string): Promise<number> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return 0;
  }
  try {
    const bounds: Rect = await component.getBounds();
    return bounds.right - bounds.left;
  } catch (error) {
    return 0;
  }
}

async function heightOf(id: string): Promise<number> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return 0;
  }
  try {
    const bounds: Rect = await component.getBounds();
    return bounds.bottom - bounds.top;
  } catch (error) {
    return 0;
  }
}

async function topOf(id: string): Promise<number> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return -1;
  }
  try {
    const bounds: Rect = await component.getBounds();
    return bounds.top;
  } catch (error) {
    return -1;
  }
}

async function tapId(id: string): Promise<boolean> {
  const component: Component | null = await componentOf(id);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    return true;
  } catch (error) {
    return false;
  }
}

async function settle(milliseconds: number): Promise<void> {
  const current: Driver | undefined = driver;
  if (current === undefined) {
    return;
  }
  await current.delayMs(milliseconds);
}

export default function scanUiRealTest() {
  describe('ScanUiFlow', () => {
    beforeAll(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ScanUiFlow beforeAll begin');
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };
      const delegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      await delegator.startAbility(want);
      driver = Driver.create();
      await settle(PAGE_SETTLE_MS);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ScanUiFlow beforeAll end');
    });

    /**
     * @tc.name   testUiReal0001
     * @tc.number SUB_SCAN_UI_02_0001
     * @tc.desc   the entry page renders its fixed title text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0001 begin');
      const title: string = await textOf(TITLE_ID);
      expect(title).assertEqual('Scanner Interface Demo');
      expect(await typeOf(TITLE_ID)).assertEqual('Text');
      expect((await widthOf(TITLE_ID)) > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0001 end');
    });

    /**
     * @tc.name   testUiReal0002
     * @tc.number SUB_SCAN_UI_02_0002
     * @tc.desc   the title is a passive label, not a clickable control
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0002 begin');
      const clickable: boolean = await clickableOf(TITLE_ID);
      expect(clickable).assertFalse();
      expect(await textOf(TITLE_ID)).assertEqual('Scanner Interface Demo');
      expect((await heightOf(TITLE_ID)) > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0002 end');
    });

    /**
     * @tc.name   testUiReal0003
     * @tc.number SUB_SCAN_UI_02_0003
     * @tc.desc   the discovery button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0003 begin');
      expect(await textOf('scanSearchBtn')).assertEqual('Searching Scanner');
      expect(await typeOf('scanSearchBtn')).assertEqual('Button');
      expect(await clickableOf('scanSearchBtn')).assertTrue();
      expect((await widthOf('scanSearchBtn')) > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0003 end');
    });

    /**
     * @tc.name   testUiReal0004
     * @tc.number SUB_SCAN_UI_02_0004
     * @tc.desc   the start scan button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0004 begin');
      expect(await textOf('scanStartBtn')).assertEqual('Start Scan');
      expect(await typeOf('scanStartBtn')).assertEqual('Button');
      expect(await clickableOf('scanStartBtn')).assertTrue();
      expect((await heightOf('scanStartBtn')) > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0004 end');
    });

    /**
     * @tc.name   testUiReal0005
     * @tc.number SUB_SCAN_UI_02_0005
     * @tc.desc   the cancel scan button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0005 begin');
      expect(await textOf('scanCancelBtn')).assertEqual('Cancel Scan');
      expect(await typeOf('scanCancelBtn')).assertEqual('Button');
      expect(await clickableOf('scanCancelBtn')).assertTrue();
      expect(await textOf('scanCancelBtn') !== await textOf('scanStartBtn')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0005 end');
    });

    /**
     * @tc.name   testUiReal0006
     * @tc.number SUB_SCAN_UI_02_0006
     * @tc.desc   the open scanner button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0006 begin');
      expect(await textOf('scanOpenBtn')).assertEqual('open Scanner');
      expect(await typeOf('scanOpenBtn')).assertEqual('Button');
      expect(await clickableOf('scanOpenBtn')).assertTrue();
      expect(await clickableOf('scanOpenBtn')).assertEqual(await clickableOf('scanPreviewBtn'));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0006 end');
    });

    /**
     * @tc.name   testUiReal0007
     * @tc.number SUB_SCAN_UI_02_0007
     * @tc.desc   the get options button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0007 begin');
      expect(await textOf('scanGetOptionBtn')).assertEqual('get options');
      expect(await typeOf('scanGetOptionBtn')).assertEqual('Button');
      expect(await clickableOf('scanGetOptionBtn')).assertTrue();
      expect((await textOf('scanGetOptionBtn')).length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0007 end');
    });

    /**
     * @tc.name   testUiReal0008
     * @tc.number SUB_SCAN_UI_02_0008
     * @tc.desc   the set option button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0008 begin');
      expect(await textOf('scanSetOptionBtn')).assertEqual('set option');
      expect(await typeOf('scanSetOptionBtn')).assertEqual('Button');
      expect(await clickableOf('scanSetOptionBtn')).assertTrue();
      expect((await textOf('scanSetOptionBtn')).startsWith('set ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0008 end');
    });

    /**
     * @tc.name   testUiReal0009
     * @tc.number SUB_SCAN_UI_02_0009
     * @tc.desc   the picture preview button keeps its label and button type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0009 begin');
      expect(await textOf('scanPreviewBtn')).assertEqual('picture preview');
      expect(await typeOf('scanPreviewBtn')).assertEqual('Button');
      expect(await clickableOf('scanPreviewBtn')).assertTrue();
      expect(await typeOf('scanPreviewBtn')).assertEqual(await typeOf('scanOpenBtn'));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0009 end');
    });

    /**
     * @tc.name   testUiReal0010
     * @tc.number SUB_SCAN_UI_02_0010
     * @tc.desc   every action control is rendered as a button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0010 begin');
      let buttons: number = 0;
      for (let index = 0; index < ACTION_IDS.length; index++) {
        if (await typeOf(ACTION_IDS[index]) === 'Button') {
          buttons++;
        }
      }
      expect(buttons).assertEqual(ACTION_IDS.length);
      expect(ACTION_IDS.length).assertEqual(7);
      expect(await typeOf('scanPreviewBtn')).assertEqual('Button');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0010 end');
    });

    /**
     * @tc.name   testUiReal0011
     * @tc.number SUB_SCAN_UI_02_0011
     * @tc.desc   all eight identified controls can be resolved on the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0011 begin');
      let resolved: number = 0;
      const allIds: string[] = [TITLE_ID].concat(ACTION_IDS);
      for (let index = 0; index < allIds.length; index++) {
        if (await componentOf(allIds[index]) !== null) {
          resolved++;
        }
      }
      expect(resolved).assertEqual(8);
      expect(allIds.length).assertEqual(8);
      expect(resolved).assertEqual(ACTION_IDS.length + 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0011 end');
    });

    /**
     * @tc.name   testUiReal0012
     * @tc.number SUB_SCAN_UI_02_0012
     * @tc.desc   every action control accepts taps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0012 begin');
      let clickable: number = 0;
      for (let index = 0; index < ACTION_IDS.length; index++) {
        if (await clickableOf(ACTION_IDS[index])) {
          clickable++;
        }
      }
      expect(clickable).assertEqual(7);
      expect(await clickableOf(TITLE_ID)).assertFalse();
      expect(clickable > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0012 end');
    });

    /**
     * @tc.name   testUiReal0013
     * @tc.number SUB_SCAN_UI_02_0013
     * @tc.desc   the square action buttons keep a non zero footprint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0013 begin');
      const searchWidth: number = await widthOf('scanSearchBtn');
      const searchHeight: number = await heightOf('scanSearchBtn');
      expect(searchWidth > 0).assertTrue();
      expect(searchHeight > 0).assertTrue();
      expect(searchWidth).assertEqual(searchHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0013 end');
    });

    /**
     * @tc.name   testUiReal0014
     * @tc.number SUB_SCAN_UI_02_0014
     * @tc.desc   the preview button spans a wider area than a square action button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0014 begin');
      const previewWidth: number = await widthOf('scanPreviewBtn');
      const actionWidth: number = await widthOf('scanStartBtn');
      expect(previewWidth > 0).assertTrue();
      expect(actionWidth > 0).assertTrue();
      expect(previewWidth > actionWidth).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0014 end');
    });

    /**
     * @tc.name   testUiReal0015
     * @tc.number SUB_SCAN_UI_02_0015
     * @tc.desc   the preview button opens the picture dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0015 begin');
      const opened: boolean = await tapId('scanPreviewBtn');
      await settle(DIALOG_SETTLE_MS);
      expect(opened).assertTrue();
      expect(await textOf('scanCloseDialogBtn')).assertEqual('Close');
      expect(await typeOf('scanCloseDialogBtn')).assertEqual('Text');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0015 end');
    });

    /**
     * @tc.name   testUiReal0016
     * @tc.number SUB_SCAN_UI_02_0016
     * @tc.desc   the dialog close control dismisses the dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0016 begin');
      const stale: Component | null = await componentOf('scanCloseDialogBtn');
      if (stale !== null) {
        await tapId('scanCloseDialogBtn');
        await settle(DIALOG_SETTLE_MS);
      }
      const reopened: boolean = await tapId('scanPreviewBtn');
      await settle(DIALOG_SETTLE_MS);
      expect(reopened).assertTrue();
      expect(await textOf('scanCloseDialogBtn')).assertEqual('Close');
      const closed: boolean = await tapId('scanCloseDialogBtn');
      await settle(DIALOG_SETTLE_MS);
      expect(closed).assertTrue();
      expect(await textOf('scanCloseDialogBtn')).assertEqual('');
      expect(await textOf(TITLE_ID)).assertEqual('Scanner Interface Demo');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0016 end');
    });

    /**
     * @tc.name   testUiReal0017
     * @tc.number SUB_SCAN_UI_02_0017
     * @tc.desc   tapping the discovery button leaves the page layout intact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0017 begin');
      const tapped: boolean = await tapId('scanSearchBtn');
      await settle(DIALOG_SETTLE_MS);
      expect(tapped).assertTrue();
      expect(await textOf('scanSearchBtn')).assertEqual('Searching Scanner');
      expect(await textOf('scanStartBtn')).assertEqual('Start Scan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0017 end');
    });

    /**
     * @tc.name   testUiReal0018
     * @tc.number SUB_SCAN_UI_02_0018
     * @tc.desc   each identifier matches exactly one component on the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0018 begin');
      const current: Driver | undefined = driver;
      expect(current !== undefined).assertTrue();
      expect(await textOf('scanStartBtn')).assertEqual('Start Scan');
      expect(await textOf('scanOpenBtn')).assertEqual('open Scanner');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0018 end');
    });

    /**
     * @tc.name   testUiReal0019
     * @tc.number SUB_SCAN_UI_02_0019
     * @tc.desc   the dialog round trip keeps every action control in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0019 begin');
      await tapId('scanPreviewBtn');
      await settle(DIALOG_SETTLE_MS);
      await tapId('scanCloseDialogBtn');
      await settle(DIALOG_SETTLE_MS);
      let survived: number = 0;
      for (let index = 0; index < ACTION_IDS.length; index++) {
        if (await componentOf(ACTION_IDS[index]) !== null) {
          survived++;
        }
      }
      expect(survived).assertEqual(7);
      expect(await textOf('scanPreviewBtn')).assertEqual('picture preview');
      expect(await componentOf(TITLE_ID) !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0019 end');
    });

    /**
     * @tc.name   testUiReal0020
     * @tc.number SUB_SCAN_UI_02_0020
     * @tc.desc   the title sits above the first action row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0020 begin');
      const titleTop: number = await topOf(TITLE_ID);
      const searchTop: number = await topOf('scanSearchBtn');
      const previewTop: number = await topOf('scanPreviewBtn');
      expect(titleTop >= 0).assertTrue();
      expect(searchTop > titleTop).assertTrue();
      expect(previewTop > searchTop).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiReal0020 end');
    });
  });
}
