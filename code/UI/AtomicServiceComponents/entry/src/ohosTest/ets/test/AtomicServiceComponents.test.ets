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
 
import { describe, it, expect } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { CATEGORIES, DEMO_ITEMS, canPopNavStack, canSwitchTab, filterDemos } from '../../../main/ets/model/DemoLogic';
import {
  DownloadState,
  DownloadTarget,
  nextDownloadState,
  resolveDownloadTarget,
  supportsDocumentPicker
} from '../../../main/ets/model/DownloadFlow';
import { LogItem, LogLevel, appendLog } from '../../../main/ets/model/LogStore';
import {
  Breakpoint,
  DisplaySnapshot,
  resolveBreakpoint,
  resolveDeviceForm,
  resolvePageMaxWidth
} from '../../../main/ets/model/DeviceProfile';
import { readDeviceSnapshot } from '../../../main/ets/utils/DeviceUtil';
import { buildDownloadFileName, formatBytes, formatPercent, progressBucket } from '../../../main/ets/utils/FormatUtil';
import { formatError, pickerErrorHint } from '../../../main/ets/utils/ErrorUtil';
import { saveTextToSandbox } from '../../../main/ets/utils/FileUtil';
import { Logger } from '../../../main/ets/utils/Logger';
import { RouteKey, StorageKeys, TAB_COUNT, isRouteKey } from '../../../main/ets/common/AppConstants';

export default function atomicServiceComponentsTest() {
  describe('AtomicServiceComponentsTest', () => {
    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0100
     * @tc.name demoCatalogComplete001
     * @tc.desc Verify the home catalog exposes nine demo entries with non-empty fields and known categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('demoCatalog_complete', 0, () => {
      expect(DEMO_ITEMS.length).assertEqual(9);
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      expect(keys.includes('navigation')).assertTrue();
      expect(keys.includes('search')).assertTrue();
      expect(keys.includes('tabs')).assertTrue();
      expect(keys.includes('web')).assertTrue();
      expect(keys.includes('download')).assertTrue();
      expect(keys.includes('halfScreen')).assertTrue();
      expect(keys.includes('jump')).assertTrue();
      expect(keys.includes('sheet')).assertTrue();
      expect(keys.includes('prefs')).assertTrue();
      for (const item of DEMO_ITEMS) {
        expect(item.title.length > 0).assertTrue();
        expect(item.subtitle.length > 0).assertTrue();
        expect(CATEGORIES.includes(item.category)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0200
     * @tc.name searchAreaFilterWorks002
     * @tc.desc Verify the search area filters by keyword, subtitle and category and yields zero on no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchArea_filterWorks', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'web', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '页签', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', '交互').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, '不存在的组件', '全部').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0300
     * @tc.name tabGuardUsesTabCount003
     * @tc.desc Verify the tab guard locks other tabs, allows the same tab and rejects out-of-range indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tabGuard_usesTabCount', 0, () => {
      expect(TAB_COUNT).assertEqual(3);
      expect(canSwitchTab(0, 1, true, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(2, 2, true, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, 1, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, TAB_COUNT, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, -1, false, TAB_COUNT)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0400
     * @tc.name downloadFlowBoardUsesSandbox004
     * @tc.desc Verify the download target stays consistent with the real device capability and names files by timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('downloadFlow_boardUsesSandbox', 0, () => {
      const snapshot = readDeviceSnapshot();
      expect(resolveDownloadTarget(snapshot.deviceType))
        .assertEqual(supportsDocumentPicker(snapshot.deviceType) ? DownloadTarget.PICKER : DownloadTarget.SANDBOX);
      expect(nextDownloadState(DownloadState.PICKING, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.IDLE, true)).assertEqual(DownloadState.SUCCESS);
      expect(buildDownloadFileName(new Date(2026, 9, 27, 10, 11, 12)))
        .assertEqual('atomic-service-demo-20261027-101112.txt');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0500
     * @tc.name logStoreFieldsAndCapacity005
     * @tc.desc Verify LogItem fields, padded time and newest-first truncation with decreasing ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logStore_fieldsAndCapacity', 0, () => {
      const fixedDate = new Date(2026, 9, 27, 1, 2, 3);
      const head = new LogItem('设备', '测试', '设备侧日志', LogLevel.WARN, fixedDate);
      expect(head.time).assertEqual('01:02:03');
      expect(head.source).assertEqual('设备');
      expect(head.level).assertEqual(LogLevel.WARN);
      let logs: LogItem[] = [];
      for (let i = 0; i < 4; i++) {
        logs = appendLog(logs, new LogItem('设备', '测试', `第${i}条`, LogLevel.WARN, fixedDate), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('第3条');
      expect(logs[1].detail).assertEqual('第2条');
      expect(logs[0].id).assertEqual(logs[1].id + 1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0600
     * @tc.name deviceProfileRealDisplay006
     * @tc.desc Verify the real display snapshot yields positive metrics and a breakpoint matching its width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceProfile_realDisplay', 0, () => {
      const snapshot = readDeviceSnapshot();
      const profile = snapshot.profile;
      expect(profile.widthVp > 0).assertTrue();
      expect(profile.heightVp > 0).assertTrue();
      expect(profile.density > 0).assertTrue();
      expect(profile.columns >= 1).assertTrue();
      expect(profile.breakpoint).assertEqual(resolveBreakpoint(snapshot.display.widthVp));
      expect(profile.pickerSupported).assertEqual(supportsDocumentPicker(snapshot.deviceType));
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0700
     * @tc.name deviceProfilePickerCapability007
     * @tc.desc Verify the picker capability matches the device form, disabling it on the default form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceProfile_pickerCapability', 0, () => {
      const snapshot = readDeviceSnapshot();
      if (snapshot.deviceType === 'default') {
        expect(snapshot.profile.pickerSupported).assertFalse();
        expect(snapshot.profile.form).assertEqual('default');
      } else {
        expect(snapshot.profile.pickerSupported).assertTrue();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0800
     * @tc.name routeKeysCatalogCoverage008
     * @tc.desc Verify every catalog key routes and unknown keys are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('routeKeys_catalogCoverage', 0, () => {
      for (const item of DEMO_ITEMS) {
        expect(isRouteKey(item.key)).assertTrue();
      }
      expect(isRouteKey('unknown')).assertFalse();
      expect(RouteKey.HALF_SCREEN).assertEqual('halfScreen');
      expect(RouteKey.DOWNLOAD).assertEqual('download');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_0900
     * @tc.name formatUtilDevice009
     * @tc.desc Verify percent rounding, zero-total fallback, byte conversion and the timestamped file name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatUtil_device', 0, () => {
      expect(formatPercent(1, 4)).assertEqual('25%');
      expect(formatPercent(3, 4)).assertEqual('75%');
      expect(formatPercent(0, 0)).assertEqual('0%');
      expect(formatBytes(2048)).assertEqual('2.0 KB');
      const date = new Date(2026, 9, 27, 8, 9, 10);
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20261027-080910.txt');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1000
     * @tc.name errorUtilDevice010
     * @tc.desc Verify known picker hints and formatted errors with and without a code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorUtil_device', 0, () => {
      expect(pickerErrorHint(13900012).includes('权限被拒绝')).assertTrue();
      expect(pickerErrorHint(13900042).includes('稍后重试')).assertTrue();
      expect(formatError('下载', 13900001, 'denied')).assertEqual('下载失败（13900001）：denied');
      expect(formatError('下载', 0, '')).assertEqual('下载失败：未知错误');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1100
     * @tc.name displaySnapshotFallbackValues011
     * @tc.desc Verify invalid display metrics fall back per field and the fallback width resolves to the sm breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('displaySnapshot_fallbackValues', 0, () => {
      const snapshot = new DisplaySnapshot(0, -1, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
      const partial = new DisplaySnapshot(0, 800, 2);
      expect(partial.widthVp).assertEqual(360);
      expect(partial.heightVp).assertEqual(800);
      expect(partial.density).assertEqual(2);
      expect(resolveBreakpoint(snapshot.widthVp)).assertEqual(Breakpoint.SM);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1200
     * @tc.name fileUtilWriteReadBack012
     * @tc.desc Verify sandbox write and read-back roundtrip, deletion and rejection of an empty filesDir
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fileUtil_writeReadBack', 0, () => {
      const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const fileName = `ohostest-fileutil-${Date.now()}.txt`;
      const content = 'FileUtil roundtrip 内容校验 123';
      const result = saveTextToSandbox(context.filesDir, fileName, content);
      expect(result.success).assertTrue();
      expect(result.bytes > 0).assertTrue();
      const readBack = fs.readTextSync(result.path, { encoding: 'utf-8' });
      expect(readBack).assertEqual(content);
      fs.unlinkSync(result.path);
      expect(fs.accessSync(result.path)).assertFalse();
      const rejected = saveTextToSandbox('', fileName, content);
      expect(rejected.success).assertFalse();
      expect(rejected.message.includes('filesDir')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1300
     * @tc.name loggerStoreRoundTrip013
     * @tc.desc Verify Logger writes to AppStorage at the head and clear empties the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logger_storeRoundTrip', 0, () => {
      Logger.clear();
      const marker = '设备侧Logger往返写入';
      Logger.warn('测试', '用例', marker);
      const logs: LogItem[] = AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
      expect(logs.length >= 1).assertTrue();
      expect(logs[0].detail).assertEqual(marker);
      expect(logs[0].source).assertEqual('测试');
      expect(logs[0].level).assertEqual(LogLevel.WARN);
      Logger.clear();
      const cleared: LogItem[] = AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
      expect(cleared.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1400
     * @tc.name webRawfileIndexHtmlPresent014
     * @tc.desc Verify the packaged rawfile index.html is present and references the AtomicServiceWeb component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('webRawfile_indexHtmlPresent', 0, async () => {
      const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const bytes = await context.resourceManager.getRawFileContent('index.html');
      expect(bytes.byteLength > 500).assertTrue();
      const decoder = util.TextDecoder.create('utf-8');
      const html = decoder.decodeToString(bytes);
      expect(html.includes('AtomicServiceWeb')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1500
     * @tc.name webRawfilePage2Linked016
     * @tc.desc Verify the packaged rawfile page2.html exists and index.html links to it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('webRawfile_page2Linked', 0, async () => {
      const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const decoder = util.TextDecoder.create('utf-8');
      const indexHtml = decoder.decodeToString(await context.resourceManager.getRawFileContent('index.html'));
      expect(indexHtml.includes('page2.html')).assertTrue();
      const page2Bytes = await context.resourceManager.getRawFileContent('page2.html');
      expect(page2Bytes.byteLength > 500).assertTrue();
      const page2Html = decoder.decodeToString(page2Bytes);
      expect(page2Html.includes('第二页')).assertTrue();
      expect(page2Html.includes('index.html')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1600
     * @tc.name progressBucketAndNavStackDevice015
     * @tc.desc Verify progress bucketing and navigation stack pop rules on the real device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('progressBucket_andNavStack_device', 0, () => {
      expect(progressBucket(25)).assertEqual(1);
      expect(progressBucket(100)).assertEqual(4);
      expect(progressBucket(-1)).assertEqual(0);
      expect(progressBucket(0.5)).assertEqual(0);
      expect(canPopNavStack(0)).assertFalse();
      expect(canPopNavStack(-1)).assertFalse();
      expect(canPopNavStack(2)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_COMPONENTS_1700
     * @tc.name deviceSnapshotProfileFieldsConsistent017
     * @tc.desc Verify the real device snapshot derives every layout field from the same display metrics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('deviceSnapshot_profileFieldsConsistent', 0, () => {
      const snapshot = readDeviceSnapshot();
      expect(snapshot.profile.form).assertEqual(resolveDeviceForm(snapshot.deviceType));
      expect(snapshot.profile.widthVp).assertEqual(snapshot.display.widthVp);
      expect(snapshot.profile.heightVp).assertEqual(snapshot.display.heightVp);
      expect(snapshot.profile.density).assertEqual(snapshot.display.density);
      expect(snapshot.profile.pageMaxWidth).assertEqual(resolvePageMaxWidth(snapshot.profile.form));
      expect(snapshot.profile.breakpoint).assertEqual(resolveBreakpoint(snapshot.display.widthVp));
    });
  });
}
