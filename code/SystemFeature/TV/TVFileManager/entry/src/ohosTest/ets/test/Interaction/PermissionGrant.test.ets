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

import { describe, beforeAll, beforeEach, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  isDriverAvailable,
  isPermissionDialogVisible,
  grantAppPermissions,
  launchEntryAbility,
  hasComponentId,
  hasText,
  readAllTexts,
  componentCount,
  countByType,
  pressKey,
  clickById,
  serializedDelay,
  runSerializedUiOperation,
  KEY_BACK,
  DELAY_PAGE_SWITCH
} from '../Shared/TestDriver';
import { TABS } from '../../../../main/ets/common/Constants';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

/*
 * Real strings rendered by the file manager home page
 * (entry/src/main/resources/base/element/string.json).
 */
const TEXT_HOME_TITLE: string = '文件管理器';
const TEXT_STORAGE_PREFIX: string = '存储';
const TEXT_DEVICE_ENTRY_PREFIX: string = '本机目录';
const MEDIA_ENTRY_TEXTS: string[] = ['视频', '图片', '文档', '音频'];

/*
 * Home page entries are the five Column containers whose component ids are
 * 0..4: 0 video, 1 image, 2 document, 3 audio, 4 local device.
 */
const COLUMN_VIDEO: string = '0';
const COLUMN_DEVICE: string = '4';

/*
 * Page types written into the breadcrumb / ListItem ids by the application.
 */
const PAGE_TYPE_VIDEO: string = 'VIDEO_PAGE';
const PAGE_TYPE_ROOT: string = 'ROOT_PAGE';
const LIST_ID: string = 'list_def';
const ITEM_ID_SEPARATOR: string = '-fileItem-';
const MEDIA_URI_PREFIX: string = 'file://media/';
const ROOT_URI_PREFIX: string = 'file://docs/';
const SIZE_TEXT_PATTERN: string = '^\\d+(\\.\\d+)?(B|KB|MB|GB|TB)$';

/*
 * Sub pages render their PageType (VIDEO_PAGE, ROOT_PAGE, ...) in the
 * breadcrumb. The home page never does, therefore the presence of such a text
 * is the signal that the back key has to be used to normalize the stack.
 */
const PAGE_TYPE_PATTERN: string = '^[A-Z]+(_[A-Z]+)*_PAGE$';

/*
 * Empty state of a media category page (see resources: no_files).
 */
const TEXT_NO_FILES: string = '没有文件';

/*
 * Representative media suffixes used to prove that a local device row is a
 * directory and not a media file.
 */
const ENTRY_MEDIA_NAME_SUFFIXES: string[] = ['.mp4', '.jpg', '.png', '.txt', '.pdf', '.mp3', '.wav'];

/*
 * The five home page entries and their real page behaviour. The four media
 * categories read the media library (file://media URIs, rows show a readable
 * size), the local device entry reads the public directories of the current
 * user (file://docs URIs, rows are directories without a size).
 */
interface HomeEntryExpectation {
  title: string;
  columnId: string;
  pageType: string;
  uriPrefix: string;
  suffixes: string[];
  showsSize: boolean;
}

const ENTRY_VIDEO: HomeEntryExpectation = {
  title: '视频',
  columnId: COLUMN_VIDEO,
  pageType: PAGE_TYPE_VIDEO,
  uriPrefix: MEDIA_URI_PREFIX,
  suffixes: ['.mp4', '.mkv', '.mov', '.avi', '.ts', '.flv', '.f4v', '.wmv', '.webm', '.3gp', '.m4v',
    '.mpeg', '.mpg', '.rmvb'],
  showsSize: true
};

const ENTRY_IMAGE: HomeEntryExpectation = {
  title: '图片',
  columnId: '1',
  pageType: 'IMAGE_PAGE',
  uriPrefix: MEDIA_URI_PREFIX,
  suffixes: ['.jpg', '.jpeg', '.png', '.bmp', '.gif', '.webp', '.heif', '.svg'],
  showsSize: true
};

const ENTRY_DOCUMENT: HomeEntryExpectation = {
  title: '文档',
  columnId: '2',
  pageType: 'DOC_PAGE',
  uriPrefix: MEDIA_URI_PREFIX,
  suffixes: ['.doc', '.docx', '.ppt', '.pptx', '.xls', '.xlsx', '.pdf', '.txt'],
  showsSize: true
};

const ENTRY_AUDIO: HomeEntryExpectation = {
  title: '音频',
  columnId: '3',
  pageType: 'AUDIO_PAGE',
  uriPrefix: MEDIA_URI_PREFIX,
  suffixes: ['.mp3', '.wav', '.ogg', '.flac', '.aac', '.m4a', '.wma', '.mka', '.ape'],
  showsSize: true
};

const ENTRY_LOCAL_DEVICE: HomeEntryExpectation = {
  title: '本机目录',
  columnId: COLUMN_DEVICE,
  pageType: PAGE_TYPE_ROOT,
  uriPrefix: ROOT_URI_PREFIX,
  // Public directories only: no media suffix and no size for these rows.
  suffixes: [],
  showsSize: false
};

const HOME_ENTRY_EXPECTATIONS: HomeEntryExpectation[] = [ENTRY_VIDEO, ENTRY_IMAGE, ENTRY_DOCUMENT,
  ENTRY_AUDIO, ENTRY_LOCAL_DEVICE];

/**
 * Contains check for a text that must be rendered exactly.
 */
function hasExactText(texts: string[], expected: string): boolean {
  return texts.some((text: string) => text === expected);
}

/**
 * Checks whether one of the rendered texts ends with one of the suffixes of a
 * media category (file names are rendered verbatim by the list rows).
 */
function hasAnySuffix(texts: string[], suffixes: string[]): boolean {
  return texts.some((text: string) =>
  suffixes.some((suffix: string) => text.toLowerCase().endsWith(suffix)));
}

/**
 * Home page signal: the four media categories and the dynamically created
 * local device entry are rendered together only on the home page. The tab ids
 * (index_0 / index_1) are NOT a home page signal because they stay visible on
 * every sub page, and the device entry is added asynchronously after the
 * storage manager returns the device list.
 */
async function isHomePageShown(driver: Driver): Promise<boolean> {
  const texts: string[] = await readAllTexts(driver);
  const hasMediaEntries: boolean = MEDIA_ENTRY_TEXTS.every((entry: string) =>
  texts.some((text: string) => text === entry));
  const hasDeviceEntry: boolean = texts.some((text: string) =>
  text.startsWith(TEXT_DEVICE_ENTRY_PREFIX));
  return hasMediaEntries && hasDeviceEntry;
}

/**
 * Checks whether the breadcrumb of a sub page is rendered.
 */
function hasPageTypeText(texts: string[]): boolean {
  const pattern: RegExp = new RegExp(PAGE_TYPE_PATTERN);
  return texts.some((text: string) => pattern.test(text));
}

/**
 * Polls the home page signal until it is rendered or the budget is exhausted.
 */
async function waitForHomePage(driver: Driver, timeoutMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await isHomePageShown(driver)) {
      return true;
    }
    await serializedDelay(driver, 200);
  }
  const finalCheck: boolean = await isHomePageShown(driver);
  if (!finalCheck) {
    const texts: string[] = await readAllTexts(driver);
    hilog.warn(DOMAIN, TAG, '%{public}s', 'home page not rendered, texts: ' + texts.join('|'));
  }
  return finalCheck;
}

/**
 * Starts the application, accepts the whole permission panel and normalizes the
 * navigation stack to the home page. Every UI case of this suite starts from
 * that business entry point.
 *
 * The back key is only pressed when a sub page is really displayed: pressing it
 * blindly would leave the application (the TV launcher returns to the last used
 * application) and every later assertion would run against the wrong window.
 */
async function prepareHomePage(driver: Driver): Promise<boolean> {
  if (await waitForHomePage(driver, 0)) {
    return true;
  }
  for (let attempt = 0; attempt < 2; attempt++) {
    const texts: string[] = await readAllTexts(driver);
    if (hasPageTypeText(texts)) {
      for (let step = 0; step < 2; step++) {
        await pressKey(driver, KEY_BACK);
        if (await waitForHomePage(driver, 1000)) {
          return true;
        }
      }
    }
    // Not inside the application (first launch, other ability in front or the
    // application terminated itself after a partial permission grant): start it,
    // accept the panel and wait for the home page again.
    await launchEntryAbility();
    if (await waitForHomePage(driver, 4000)) {
      return true;
    }
  }
  const finalTexts: string[] = await readAllTexts(driver);
  hilog.warn(DOMAIN, TAG, '%{public}s', 'home page not reached, driver texts: ' + finalTexts.join('|'));
  return false;
}

/**
 * Clicks one of the five home page entries by its Column component id.
 */
async function clickHomeEntry(driver: Driver, columnId: string): Promise<boolean> {
  try {
    const clicked: boolean = await runSerializedUiOperation(async () => {
      const component: Component | null = await driver.findComponent(ON.id(columnId).type('Column'));
      if (component === null) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_PAGE_SWITCH);
      return true;
    });
    hilog.info(DOMAIN, TAG, '%{public}s', 'clickHomeEntry ' + columnId + ' = ' + clicked);
    return clicked;
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'clickHomeEntry failed: ' + JSON.stringify(error));
    return false;
  }
}

/**
 * Reads the component ids of every list row currently rendered. The file
 * manager encodes "<PAGE_TYPE>-fileItem-<uri>" into the row id, therefore the
 * id is the cheapest business level signal about the page that is displayed.
 *
 * An empty category still renders one placeholder row for the "没有文件" hint:
 * that row has an empty id, so only non empty ids are returned.
 */
async function readListItemIds(driver: Driver): Promise<string[]> {
  try {
    const items: Component[] = await runSerializedUiOperation(async () => {
      return await driver.findComponents(ON.type('ListItem')) ?? [];
    });
    const ids: string[] = [];
    for (const item of items) {
      try {
        const id: string = await item.getId();
        if (id && id.length > 0) {
          ids.push(id);
        }
      } catch (innerError) {
        continue;
      }
    }
    return ids;
  } catch (error) {
    hilog.warn(DOMAIN, TAG, '%{public}s', 'readListItemIds failed: ' + JSON.stringify(error));
    return [];
  }
}

/**
 * Reads the rendered texts and retries while the page is still painting, so a
 * transient "single scroll indicator frame" never fails an assertion.
 */
async function readRenderedTexts(driver: Driver, minCount: number = 5,
  timeoutMs: number = 2000): Promise<string[]> {
  const deadline: number = Date.now() + timeoutMs;
  let texts: string[] = await readAllTexts(driver);
  while (Date.now() < deadline && texts.length < minCount) {
    await serializedDelay(driver, 200);
    texts = await readAllTexts(driver);
  }
  return texts;
}

/**
 * Opens one home page entry from a normalized home page.
 */
async function openHomeEntry(driver: Driver, entry: HomeEntryExpectation): Promise<void> {
  await prepareHomePage(driver);
  await clickHomeEntry(driver, entry.columnId);
  await serializedDelay(driver, DELAY_PAGE_SWITCH);
}

/**
 * The breadcrumb of the opened page must show the page type of the entry.
 */
async function entryBreadcrumbVisible(driver: Driver, entry: HomeEntryExpectation): Promise<boolean> {
  const texts: string[] = await readRenderedTexts(driver, 5, 1500);
  return hasExactText(texts, entry.pageType);
}

/**
 * The list container must exist and either list rows or show the empty hint.
 */
async function entryListRendered(driver: Driver, entry: HomeEntryExpectation): Promise<boolean> {
  const hasList: boolean = await hasComponentId(driver, LIST_ID);
  const rows: number = await countByType(driver, 'ListItem');
  const texts: string[] = await readRenderedTexts(driver, 5, 1500);
  const emptyState: boolean = texts.some((text: string) => text === TEXT_NO_FILES);
  hilog.info(DOMAIN, TAG, '%{public}s', entry.pageType + ' rows=' + rows + ' empty=' + emptyState);
  return hasList && (rows > 0 || emptyState);
}

/**
 * Every row id must carry the page type and the URI scheme of the entry.
 */
async function entryRowsBelongToPage(driver: Driver, entry: HomeEntryExpectation): Promise<boolean> {
  const ids: string[] = await readListItemIds(driver);
  if (ids.length === 0) {
    const texts: string[] = await readRenderedTexts(driver, 5, 1500);
    return texts.some((text: string) => text === TEXT_NO_FILES);
  }
  const expectedPrefix: string = entry.pageType + ITEM_ID_SEPARATOR + entry.uriPrefix;
  hilog.info(DOMAIN, TAG, '%{public}s', 'firstRow=' + ids[0]);
  return ids.every((id: string) => id.startsWith(expectedPrefix));
}

/**
 * Row names must belong to the category: media pages show file names with the
 * category suffix, the local device page lists directories only.
 */
async function entryRowContentMatches(driver: Driver, entry: HomeEntryExpectation): Promise<boolean> {
  const ids: string[] = await readListItemIds(driver);
  const texts: string[] = await readRenderedTexts(driver, 5, 1500);
  if (ids.length === 0) {
    return texts.some((text: string) => text === TEXT_NO_FILES);
  }
  if (entry.suffixes.length > 0) {
    return hasAnySuffix(texts, entry.suffixes);
  }
  return !hasAnySuffix(texts, ENTRY_MEDIA_NAME_SUFFIXES);
}

/**
 * Media rows show a readable size, directory rows do not.
 */
async function entryRowSizeState(driver: Driver, entry: HomeEntryExpectation): Promise<boolean> {
  const ids: string[] = await readListItemIds(driver);
  const texts: string[] = await readRenderedTexts(driver, 5, 1500);
  if (ids.length === 0) {
    return texts.some((text: string) => text === TEXT_NO_FILES);
  }
  const sizePattern: RegExp = new RegExp(SIZE_TEXT_PATTERN);
  const sizeShown: boolean = texts.some((text: string) => sizePattern.test(text));
  hilog.info(DOMAIN, TAG, '%{public}s', entry.pageType + ' sizeShown=' + sizeShown);
  return entry.showsSize === sizeShown;
}

/**
 * The back key returns from the category page to the home page.
 */
async function backReturnsHome(driver: Driver): Promise<boolean> {
  await pressKey(driver, KEY_BACK);
  await serializedDelay(driver, DELAY_PAGE_SWITCH);
  return await waitForHomePage(driver, 3000);
}

export default function permissionGrantTest(): void {
  describe('PermissionGrant', () => {
    let driver: Driver = getDriver();
    let homeReady: boolean = false;

    /*
     * First launch business flow: the application requests the media
     * permissions, the system panel shows one page per permission group and
     * every page must be confirmed with "允许" before the file list is usable.
     */
    describe('PermissionGrant_First_Launch', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          hilog.warn(DOMAIN, TAG, '%{public}s', 'driver unavailable, skip launch');
          return;
        }
        homeReady = await prepareHomePage(driver);
      });

      it('permission_panel_dismissed', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: permission_panel_dismissed');
        if (!isDriverAvailable()) {
          return;
        }
        const visible: boolean = await isPermissionDialogVisible(driver);
        expect(visible).assertFalse();
      });

      it('permission_grant_is_idempotent', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: permission_grant_is_idempotent');
        if (!isDriverAvailable()) {
          return;
        }
        // The panel must not come back once every page was accepted, otherwise a
        // later case would interact with the system window instead of the list.
        const pages: number = await grantAppPermissions(600);
        expect(pages).assertEqual(0);
      });

      it('home_page_ready_after_grant', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_page_ready_after_grant');
        if (!isDriverAvailable()) {
          return;
        }
        expect(homeReady).assertTrue();
      });

      it('home_page_components_rendered', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_page_components_rendered');
        if (!isDriverAvailable()) {
          return;
        }
        // The home page always renders the title, the two tabs, the storage
        // summary, the four media entries and the device entry.
        const texts: string[] = await readRenderedTexts(driver, 8, 2000);
        expect(texts.length >= 8).assertTrue();
      });

      it('home_page_tab_ids_present', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_page_tab_ids_present');
        if (!isDriverAvailable()) {
          return;
        }
        expect(await hasComponentId(driver, 'index_0')).assertTrue();
        expect(await hasComponentId(driver, 'index_1')).assertTrue();
      });
    });

    /*
     * Home page business content: title, the two storage tabs, the storage
     * summary, the four media categories and the local device entry.
     */
    describe('PermissionGrant_Home_Page_Content', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          return;
        }
        await prepareHomePage(driver);
      });

      it('home_title_visible', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_title_visible');
        if (!isDriverAvailable()) {
          return;
        }
        expect(await hasText(driver, TEXT_HOME_TITLE)).assertTrue();
      });

      it('local_tab_text_matches_constant', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: local_tab_text_matches_constant');
        if (!isDriverAvailable()) {
          return;
        }
        const texts: string[] = await readAllTexts(driver);
        expect(hasExactText(texts, TABS[0])).assertTrue();
      });

      it('external_tab_text_matches_constant', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: external_tab_text_matches_constant');
        if (!isDriverAvailable()) {
          return;
        }
        const texts: string[] = await readAllTexts(driver);
        expect(hasExactText(texts, TABS[1])).assertTrue();
      });

      it('storage_summary_visible', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: storage_summary_visible');
        if (!isDriverAvailable()) {
          return;
        }
        const texts: string[] = await readAllTexts(driver);
        const summary: boolean = texts.some((text: string) => text.startsWith(TEXT_STORAGE_PREFIX));
        expect(summary).assertTrue();
      });

      it('media_entries_visible', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: media_entries_visible');
        if (!isDriverAvailable()) {
          return;
        }
        const texts: string[] = await readAllTexts(driver);
        for (const entry of MEDIA_ENTRY_TEXTS) {
          expect(hasExactText(texts, entry)).assertTrue();
        }
      });

      it('local_device_entry_visible', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: local_device_entry_visible');
        if (!isDriverAvailable()) {
          return;
        }
        const texts: string[] = await readAllTexts(driver);
        const deviceEntry: boolean =
          texts.some((text: string) => text.startsWith(TEXT_DEVICE_ENTRY_PREFIX));
        expect(deviceEntry).assertTrue();
      });
    });

    /*
     * 媒体库视频分类页：行 id 形如 VIDEO_PAGE-fileItem-file://media/...，行为视频文件名 + 可读大小。
     */
    describe('HomeEntry_VIDEO_PAGE', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          return;
        }
        await openHomeEntry(driver, ENTRY_VIDEO);
      });

      it('video_breadcrumb_visible', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryBreadcrumbVisible(driver, ENTRY_VIDEO)).assertTrue();
      });

      it('video_list_rendered', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryListRendered(driver, ENTRY_VIDEO)).assertTrue();
      });

      it('video_rows_belong_to_page', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowsBelongToPage(driver, ENTRY_VIDEO)).assertTrue();
      });

      it('video_row_content_matches_category', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowContentMatches(driver, ENTRY_VIDEO)).assertTrue();
      });

      it('video_row_size_state', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowSizeState(driver, ENTRY_VIDEO)).assertTrue();
      });

      it('video_back_returns_home', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await backReturnsHome(driver)).assertTrue();
      });
    });

    /*
     * 媒体库图片分类页：行 id 形如 IMAGE_PAGE-fileItem-file://media/...，行为图片文件名 + 可读大小。
     */
    describe('HomeEntry_IMAGE_PAGE', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          return;
        }
        await openHomeEntry(driver, ENTRY_IMAGE);
      });

      it('image_breadcrumb_visible', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryBreadcrumbVisible(driver, ENTRY_IMAGE)).assertTrue();
      });

      it('image_list_rendered', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryListRendered(driver, ENTRY_IMAGE)).assertTrue();
      });

      it('image_rows_belong_to_page', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowsBelongToPage(driver, ENTRY_IMAGE)).assertTrue();
      });

      it('image_row_content_matches_category', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowContentMatches(driver, ENTRY_IMAGE)).assertTrue();
      });

      it('image_row_size_state', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowSizeState(driver, ENTRY_IMAGE)).assertTrue();
      });

      it('image_back_returns_home', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await backReturnsHome(driver)).assertTrue();
      });
    });

    /*
     * 媒体库文档分类页：有文档时展示文件名与大小，无文档时展示“没有文件”空态。
     */
    describe('HomeEntry_DOC_PAGE', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          return;
        }
        await openHomeEntry(driver, ENTRY_DOCUMENT);
      });

      it('doc_breadcrumb_visible', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryBreadcrumbVisible(driver, ENTRY_DOCUMENT)).assertTrue();
      });

      it('doc_list_rendered', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryListRendered(driver, ENTRY_DOCUMENT)).assertTrue();
      });

      it('doc_rows_belong_to_page', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowsBelongToPage(driver, ENTRY_DOCUMENT)).assertTrue();
      });

      it('doc_row_content_matches_category', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowContentMatches(driver, ENTRY_DOCUMENT)).assertTrue();
      });

      it('doc_row_size_state', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowSizeState(driver, ENTRY_DOCUMENT)).assertTrue();
      });

      it('doc_back_returns_home', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await backReturnsHome(driver)).assertTrue();
      });
    });

    /*
     * 媒体库音频分类页：有音频时展示文件名与大小，无音频时展示“没有文件”空态。
     */
    describe('HomeEntry_AUDIO_PAGE', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          return;
        }
        await openHomeEntry(driver, ENTRY_AUDIO);
      });

      it('audio_breadcrumb_visible', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryBreadcrumbVisible(driver, ENTRY_AUDIO)).assertTrue();
      });

      it('audio_list_rendered', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryListRendered(driver, ENTRY_AUDIO)).assertTrue();
      });

      it('audio_rows_belong_to_page', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowsBelongToPage(driver, ENTRY_AUDIO)).assertTrue();
      });

      it('audio_row_content_matches_category', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowContentMatches(driver, ENTRY_AUDIO)).assertTrue();
      });

      it('audio_row_size_state', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowSizeState(driver, ENTRY_AUDIO)).assertTrue();
      });

      it('audio_back_returns_home', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await backReturnsHome(driver)).assertTrue();
      });
    });

    /*
     * 本机目录页：列出当前用户公共目录（file://docs/...），目录行不展示文件大小。
     */
    describe('HomeEntry_ROOT_PAGE', () => {
      beforeAll(async () => {
        if (!isDriverAvailable()) {
          return;
        }
        await openHomeEntry(driver, ENTRY_LOCAL_DEVICE);
      });

      it('root_breadcrumb_visible', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryBreadcrumbVisible(driver, ENTRY_LOCAL_DEVICE)).assertTrue();
      });

      it('root_list_rendered', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryListRendered(driver, ENTRY_LOCAL_DEVICE)).assertTrue();
      });

      it('root_rows_belong_to_page', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowsBelongToPage(driver, ENTRY_LOCAL_DEVICE)).assertTrue();
      });

      it('root_row_content_matches_category', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowContentMatches(driver, ENTRY_LOCAL_DEVICE)).assertTrue();
      });

      it('root_row_size_state', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await entryRowSizeState(driver, ENTRY_LOCAL_DEVICE)).assertTrue();
      });

      it('root_back_returns_home', 0, async () => {
        if (!isDriverAvailable()) {
          return;
        }
        expect(await backReturnsHome(driver)).assertTrue();
      });
    });
  });
}
